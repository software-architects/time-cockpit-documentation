---
title: MCP-Server - KI-Assistenten mit time cockpit verbinden
description: "Überblick über den MCP-Server von time cockpit: Endpunkte, Anmeldung mit Entra ID, Verbindungseinstellungen und unterstützte KI-Clients (Public Preview)."
en_page: doc/mcp/overview.md
---
# Der MCP-Server von time cockpit

> [!WARNING]
> Im Aufbau: Der MCP-Server von time cockpit und diese Dokumentation werden aktiv weiterentwickelt, inkompatible Änderungen sind möglich. Tools können umbenannt, geändert oder entfernt werden, und Dialogbeschriftungen sowie Konfigurationsschritte können sich ohne Ankündigung ändern. Prüfen Sie diese Seite auf Aktualisierungen, bevor Sie die Einrichtung für Ihre Benutzer ausrollen, und rechnen Sie damit, Ihre Konfiguration, Skills und Prompts nach einem Update anpassen zu müssen.

> [!NOTE]
> Verfügbarkeit: Der MCP-Server von time cockpit befindet sich derzeit in der Public Preview. Bei Fragen oder Feedback erreichen Sie uns gerne unter [support@timecockpit.com](mailto:support@timecockpit.com).

Der MCP-Server von time cockpit stellt Daten und Funktionen von time cockpit (Projekte, Kunden, Aufgaben, Zeitbuchungen, benannte Listen) über das [Model Context Protocol](https://modelcontextprotocol.io/) (MCP) für KI-Assistenten bereit. Es handelt sich um einen Remote-Server, den Clients über Streamable HTTP erreichen. Jeder Benutzer meldet sich mit seinem eigenen Microsoft-Entra-ID-Geschäftskonto an, sodass der Assistent nur sieht, was dieser Benutzer in time cockpit sehen darf. Aktionen aus dem Datenmodell sind über den MCP-Server nicht verfügbar; führen Sie diese in der Oberfläche von time cockpit aus.

Für Administratoren und Anpasser, die IronPython-Scripting gegen den Live-Datenkontext benötigen, gibt es einen lokalen stdio-Server (`OnCockpit.Admin.exe --mcp`, nur Windows); siehe [OnCockpit Admin: lokaler MCP-Server](/doc/mcp/oncockpit-admin-local.html). Der Rest dieses Abschnitts behandelt den Remote-Server.

## Eckdaten des Servers

| Eigenschaft | Wert |
|----------|-------|
| Server-URL | `https://mcp.timecockpit.com` (Produktion; zur Preview siehe [Umgebungen](#umgebungen)) |
| Transport | Streamable HTTP (`http`) – nicht SSE, nicht stdio |
| Authentifizierung | OAuth 2.1 Authorization Code + PKCE (S256) gegen Microsoft Entra ID, pro Benutzer |
| OAuth-Client | Eine App-Registrierung **in Ihrem eigenen Entra-Mandanten** – Sie legen sie an und geben ihre Client-ID an Ihre Benutzer weiter. Keine Dynamic Client Registration; Public Client für native Werkzeuge, Confidential Client (mit Secret) für gehostete Clients wie ChatGPT und Copilot Studio. Siehe [Einrichtung in Entra ID](/doc/mcp/entra-id-setup.html). |
| OAuth-Scope | `https://mcp.timecockpit.com/mcp.access` (pro Umgebung, siehe unten). Wird vom Server über seine Protected-Resource-Metadaten bekanntgegeben; muss in der Regel nicht konfiguriert werden. |
| Metadaten | `/.well-known/oauth-protected-resource` und `/.well-known/oauth-authorization-server` auf dem Server. Clients ermitteln Entra ID aus diesen Dokumenten – nicht aber die Client-ID. |

## Umgebungen

Der MCP-Server steht in einer Produktions- und einer Preview-Umgebung zur Verfügung. Er wird unabhängig vom Web-Client bereitgestellt, sobald ein Update nötig ist, und folgt keinem festen Release-Zeitplan. Jede Umgebung hat ihre eigene Server-URL und ihren eigenen OAuth-Scope. Ihrer App-Registrierung kann die Berechtigung `mcp.access` mehrerer Umgebungen erteilt werden, sodass eine Client-ID für beide genügt – siehe [Einrichtung in Entra ID](/doc/mcp/entra-id-setup.html).

| Umgebung | Server-URL | OAuth-Scope | Verwendung |
|-------------|------------|-------------|---------|
| Prod | `https://mcp.timecockpit.com` | `https://mcp.timecockpit.com/mcp.access` | Tägliche Arbeit. |
| Preview | `https://mcp-preview.timecockpit.com` | `https://mcp-preview.timecockpit.com/mcp.access` | Kommende Änderungen testen, bevor sie die Produktion erreichen. |

Alle Client-Seiten in diesem Abschnitt verwenden die Produktions-URL. Um eine Verbindung zu einer anderen Umgebung herzustellen, ersetzen Sie die Server-URL in der Client-Konfiguration. Client-ID, Callback-Port und Verbindungseinstellungen bleiben gleich, eine geänderte Server-URL hat aber drei Folgen:

- **Sie müssen sich erneut anmelden.** Jeder Client speichert seine OAuth-Tokens pro Server-URL. Eine neue URL – ob eine andere Umgebung oder zusätzliche [URL-Segmente](#verbindungseinstellungen-header-oder-url-segment) – beginnt ohne Token, daher verlangt der Client eine neue Entra-Anmeldung, obwohl Sie bei der anderen URL bereits angemeldet waren. Das ist erwartetes Verhalten und kein Fehler.
- **Die App-Registrierung benötigt die Berechtigung dieser Umgebung.** Jede Umgebung hat ihren eigenen Scope (`https://mcp-preview.timecockpit.com/mcp.access` für Preview). Wurde Ihrer App-Registrierung nur `mcp.access` der Produktions-API erteilt, schlägt die Anmeldung bei Preview mit einem Zustimmungsfehler fehl. Siehe [Einrichtung in Entra ID](/doc/mcp/entra-id-setup.html).
- **Codex benötigt eventuell eine weitere Redirect-URI.** Codex leitet die Callback-ID in seiner Redirect-URI (`http://127.0.0.1:<port>/callback/<id>`) aus der vollständigen Server-URL einschließlich der Pfadsegmente ab. Ein Wechsel zu Preview oder zusätzliche URL-Segmente ergeben daher eine **neue Callback-ID**, die ebenfalls in Ihrer App-Registrierung eingetragen werden muss. `codex mcp add` gibt den neuen Wert aus; siehe [Besonderheiten der Callback-URL](/doc/mcp/codex.html#callback-url-specifics). Claude Code, die Claude App, VS Code, Cursor und ChatGPT verwenden feste Redirect-URIs, die nicht von der Server-URL abhängen.

Da Tokens pro URL gespeichert werden, können Sie mehrere Umgebungen unter verschiedenen Namen nebeneinander registrieren (zum Beispiel `timecockpit` und `timecockpit-preview`) und zwischen ihnen wechseln, ohne sich jedes Mal neu anzumelden.

> [!NOTE]
> Die Umgebung ist unabhängig von der [Sandbox-Einstellung](#verbindungseinstellungen-header-oder-url-segment): `sandboxEnvironment=test` wählt die Test-Sandbox Ihres Mandanten auf dem Server, mit dem Sie gerade verbunden sind, während die Umgebung den Release-Stand des Servers bestimmt.

## Verbindungseinstellungen: Header oder URL-Segment

Der Server kennt fünf optionale Einstellungen pro Verbindung. Jede kann **entweder** als HTTP-Header **oder** als Segment im URL-Pfad übergeben werden – nie beides für dieselbe Einstellung (der Server antwortet dann mit 404). Verwenden Sie Header, wo der Client sie unterstützt, und URL-Segmente, wo nicht (zum Beispiel in der Claude App oder in Copilot Studio).

| Einstellung | Header | URL-Segment | Werte | Wann nötig |
|---------|--------|-------------|--------|-------------|
| Mandant | `X-tc-tenant-id` | `/tcTenantId/{id}` | Mandanten-GUID | **Nur**, wenn Ihr Entra-Mandant mehreren time cockpit Mandanten zugeordnet ist; sonst weglassen |
| Sandbox | `X-sandbox-environment` | `/sandboxEnvironment/test` | `test` | Um mit der Test-Sandbox zu arbeiten; ohne diese Einstellung Produktion |
| Profil | `X-profile` | `/profile/{name}` | Profilname | Nur bei benannten Profilen |
| Zugriff | `X-access` | `/access/readonly` | `readonly`, `default` | Blendet alle schreibenden Tools aus |
| Bereich | `X-scope` | `/scope/owndata` | `owndata`, `default` | Beschränkt die Ergebnisse auf die eigenen Daten des Benutzers |

Beispiel für die URL-Form: `https://mcp.timecockpit.com/tcTenantId/<tenant-id>/access/readonly/scope/owndata`. Groß- und Kleinschreibung der Werte spielt keine Rolle. Einen Wert `readwrite` gibt es nicht – lassen Sie die Einstellung weg oder verwenden Sie `default`.

> [!NOTE]
> Im häufigen Fall, dass ein Entra-Mandant genau einem time cockpit Mandanten zugeordnet ist, genügt die reine Server-URL. Der Mandant wird aus Ihrer Entra-ID-Anmeldung ermittelt. Die Mandanten-Einstellung benötigen Sie nur, wenn Ihnen der Support mitgeteilt hat, dass Ihr Entra-Mandant mehreren time cockpit Mandanten zugeordnet ist.

## Welcher Client, welche Konfiguration?

Jeder Client hat seine eigene Konfiguration. Ein in Claude Code registrierter Server ist in der Claude App nicht sichtbar und umgekehrt.

| Client | Konfiguration | Eigene Client-ID | Header | Status |
|--------|---------------|---------------|---------|--------|
| [Claude Code (CLI)](/doc/mcp/claude-code.html) | `%USERPROFILE%\.claude.json` oder `.mcp.json` im Projekt | ja (`oauth.clientId`) | ja | getestet |
| [Claude App / claude.ai / Cowork](/doc/mcp/claude-app.html) | Custom Connector in den App-Einstellungen | ja (eigener OAuth-Client) | nur Standard-Header (Beta) – URL-Segmente verwenden | getestet |
| [OpenAI Codex (CLI, App, IDE)](/doc/mcp/codex.html) | `codex mcp add … --oauth-client-id` (schreibt `%USERPROFILE%\.codex\config.toml`) | ja | nur über TOML – URL-Segmente verwenden | getestet |
| [Visual Studio Code (Copilot-Agent-Modus)](/doc/mcp/vscode.html) | `.vscode/mcp.json` oder Benutzer-`mcp.json` | ja seit VS Code 1.123 (`oauth.clientId`) | ja | getestet |
| [GitHub Copilot CLI](~/doc/mcp/copilot-cli.md) | `%USERPROFILE%\.copilot\mcp-config.json` | unklar (Client-ID wird Berichten zufolge ignoriert) | ja | nicht verifiziert |
| [Microsoft 365 Copilot](~/doc/mcp/microsoft-365-copilot.md) | Copilot Studio, M365 Admin Center oder deklarativer Agent | ja, Copilot Studio erfordert aber ein Client Secret | nein – URL-Segmente verwenden | noch nicht verifiziert |
| [Cursor (Editor, CLI)](/doc/mcp/cursor.html) | `.cursor/mcp.json` oder `%USERPROFILE%\.cursor\mcp.json` (`auth.CLIENT_ID`) | ja | ja | noch nicht getestet |
| [ChatGPT (Web, Business-/Enterprise-Workspace)](/doc/mcp/chatgpt.html) | Custom App in der Admin-Konsole (`chatgpt.com/admin/apps`), für den Workspace veröffentlicht | ja (User-Defined OAuth Client, mit Client Secret) | nein – URL-Segmente verwenden | getestet |
| Microsoft Copilot (Consumer) | – | – | – | keine Unterstützung für eigene MCP-Server |

## Was Sie brauchen

- Ein Microsoft-Entra-ID-Geschäftskonto mit Zugriff auf time cockpit. Sie melden sich beim MCP-Server mit demselben Konto an, das Sie für time cockpit verwenden.
- Die **OAuth-Client-ID** der App-Registrierung, die Ihr Entra-Administrator für den MCP-Server angelegt hat. Das ist der eine Wert, den jeder Client benötigt und den kein Client selbst ermitteln kann. Siehe [Einrichtung in Entra ID](/doc/mcp/entra-id-setup.html).
- Optional die **Mandanten-ID** (GUID) Ihres time cockpit Mandanten – nur wenn Ihr Entra-Mandant mehreren time cockpit Mandanten zugeordnet ist.

## Erste Schritte

1. Lassen Sie Ihren Entra-Administrator die unter [Einrichtung in Entra ID](/doc/mcp/entra-id-setup.html) beschriebene App-Registrierung anlegen und sich deren Client-ID geben.
2. Konfigurieren Sie Ihren Client: [Claude Code](/doc/mcp/claude-code.html), [Claude App](/doc/mcp/claude-app.html), [Codex](/doc/mcp/codex.html), [ChatGPT](/doc/mcp/chatgpt.html), [VS Code](/doc/mcp/vscode.html), [Cursor](/doc/mcp/cursor.html) (nicht getestet), [Copilot CLI](~/doc/mcp/copilot-cli.md) oder [Microsoft 365 Copilot](~/doc/mcp/microsoft-365-copilot.md).
3. [Prüfen Sie die Verbindung](/doc/mcp/verify-connection.html) mit den Diagnose-Tools des Servers.
4. Installieren Sie die [Companion Skills](/doc/mcp/companion-skills.html), damit Ihr Assistent weiß, wie er mit time cockpit arbeitet.
5. Probieren Sie die [Anwendungsfälle und Prompts](~/doc/ki-assistenten/anwendungsfaelle-und-prompts.md) aus.

## Was der Server nicht durchsetzen kann: Ihre Daten gehen an den KI-Anbieter

> [!IMPORTANT]
> Alles, was ein Assistent über den MCP-Server liest – Kunden, Projekte, Aufgaben, Zeitbuchungen, Namen, Stundensätze, Notizen –, wird an den KI-Anbieter (Anthropic, OpenAI, Microsoft, …) gesendet und nach dessen Bedingungen verarbeitet. Berechtigungen, `readonly` und `owndata` begrenzen, **was** ein Benutzer sehen kann, nicht aber, **wohin** die Daten gehen, sobald der Assistent sie hat.
>
> Klären Sie den Einsatz von KI-Assistenten mit time cockpit vorab mit Ihrer IT, Ihrem Datenschutzbeauftragten oder Ihrem Compliance-Team. Prüfen Sie die Einstellungen des Anbieters für den Plan Ihrer Organisation: Datenaufbewahrung, Chat-Gedächtnis, Teilen von Unterhaltungen und ob Ihre Daten für das Training von Modellen verwendet werden dürfen. Gehostete Clients wie ChatGPT und claude.ai können zusätzlich Chat-Kontext und Erinnerungen mit der verbundenen App teilen. time cockpit hat keinen Einfluss auf diese Einstellungen.

## Was der Server durchsetzt

- **Ihre Berechtigungen gelten immer.** Jeder Aufruf wird gegen das Berechtigungsmodell des Mandanten mit den Rollen des angemeldeten Benutzers autorisiert. Was Sie im Web-Client nicht sehen können, bleibt auch für den Assistenten unsichtbar und lässt sich nicht durch Erraten eines technischen Namens erreichen. System- und interne Entitäten sind für alle Tools ausgeblendet.
- **Zugriff und Bereich** schränken eine Verbindung weiter ein: `readonly` blendet alle schreibenden Tools aus, `owndata` blendet alles aus, was sich nicht auf Ihre eigenen Daten beschränken lässt. **Bestätigung** ist eine Betreibereinstellung: Standardmäßig muss jede generische Objektänderung (`create_object`, `update_object`, `delete_object`) mit `confirmed=true` wiederholt werden, nachdem der Assistent Ihnen mitgeteilt hat, was sich ändern wird. Siehe [Zugriff, Bereich und Bestätigung](/doc/mcp/access-and-confirmation.html).
- **Ergebnisse sind begrenzt.** Lesezugriffe sind in Zeilenzahl und Größe beschränkt und weisen darauf mit `truncated: true` hin. Siehe [Limits und Kürzung](/doc/mcp/limits.html).
- **Jeder Tool-Aufruf wird protokolliert.** Der Server zeichnet pro versuchtem Aufruf ein operatives Audit-Ereignis mit Mandant, handelndem Benutzer, Host, Tool, ob Daten geändert werden, Ergebnis und Dauer auf. Abgelehnte, fehlgeschlagene und abgebrochene Versuche werden ebenfalls erfasst. Das Ereignis enthält keine Argumente, keinen Abfragetext, keine Datensatzinhalte und keine Ergebnisse.

## Verwandte Seiten

- [Zugriff, Bereich und Bestätigung](/doc/mcp/access-and-confirmation.html) und [Limits und Kürzung](/doc/mcp/limits.html)
- [Web API](~/doc/web-api/ueberblick.md) – REST-/OData-Zugriff ohne KI-Assistenten
- [Integration von Azure Active Directory (AAD)](~/doc/enterprise/azure-active-directory.md)
- [KI-Assistenten für Benutzer](~/doc/ki-assistenten/ueberblick.md)
