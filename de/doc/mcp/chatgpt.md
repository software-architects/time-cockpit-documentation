---
title: MCP-Server - Einrichtung in ChatGPT (Business, Enterprise)
description: "Den time cockpit MCP-Server als Custom App im ChatGPT-Business- oder Enterprise-Workspace registrieren, mit Entra ID anmelden und Skills importieren."
en_page: doc/mcp/chatgpt.md
---
# ChatGPT (Web, Business- und Enterprise-Workspaces)

> [!WARNING]
> Im Aufbau: Der MCP-Server von time cockpit und diese Dokumentation werden aktiv weiterentwickelt, inkompatible Änderungen sind möglich. Tools können umbenannt, geändert oder entfernt werden, und Dialogbeschriftungen sowie Konfigurationsschritte können sich ohne Ankündigung ändern. Prüfen Sie diese Seite auf Aktualisierungen, bevor Sie die Einrichtung für Ihre Benutzer ausrollen, und rechnen Sie damit, Ihre Konfiguration, Skills und Prompts nach einem Update anpassen zu müssen.

In ChatGPT werden Remote-MCP-Server von einem Owner oder Administrator des Workspace in der Admin-Konsole von ChatGPT (`chatgpt.com/admin`) als **Custom Apps** registriert. Die App wird einmal für den ganzen Workspace angelegt und für dessen Mitglieder veröffentlicht. Jedes Mitglied verbindet sich anschließend einzeln mit der App und meldet sich mit seinem eigenen Microsoft-Entra-ID-Geschäftskonto an. Die folgende Konfiguration wurde mit einem ChatGPT-Business-Workspace eingerichtet und verwendet; Dialogbeschriftungen können je nach ChatGPT-Version und Plan leicht abweichen.

> [!NOTE]
> Die Weboberfläche von ChatGPT kann bei der Arbeit mit eigenen MCP-Apps **sehr langsam** sein. Das Ermitteln der Tools, das Veröffentlichen und selbst einfache Prompts dauern mitunter lange, laufen in Timeouts oder schlagen mit **HTTP 429 (Too Many Requests)** fehl. Diese Verzögerungen und Fehler entstehen auf der Seite von ChatGPT, nicht im MCP-Server von time cockpit. Versuchen Sie es nach kurzer Zeit erneut; wenn ein Dialog zu hängen scheint, laden Sie die Seite neu und prüfen Sie die App-Liste, bevor Sie einen zweiten Entwurf anlegen.

## Apps, Plugins, Skills und Marketplaces

OpenAI verwendet mehrere Begriffe, die für diese Einrichtung wichtig sind. Kurz gesagt: Der MCP-Server wird zu einer **App**; die Companion Skills kommen als **Plugin** über einen **Marketplace**.

| Begriff | Bedeutung | Wo er verwaltet wird |
|------|---------|---------------------|
| **App** (auch *Connector*, *MCP-Server*) | Eine Verbindung zu einem externen System, hier der MCP-Server von time cockpit mit seinen Tools, seiner Authentifizierung und seinen Berechtigungen. Früher *Connector* genannt. | Admin-Konsole → **Apps** |
| **Plugin** | Ein installierbares Paket, das **Skills**, **Apps** (MCP-Server) und App-Vorlagen enthalten kann. Seit Juli 2026 hat das Plugin-Verzeichnis (`chatgpt.com/plugins`) das frühere App-Verzeichnis abgelöst; eine veröffentlichte App erscheint auch als Plugin. | Admin-Konsole → **Plugins**; Benutzer unter **Plugins** in der Seitenleiste |
| **Skill** | Wiederverwendbare Anweisungen, die ChatGPT bei Bedarf für eine Aufgabe lädt, z. B. wie man in time cockpit korrekt Zeit bucht. Benutzer können einen Skill mit `@` ausdrücklich ansprechen. | Admin-Konsole → **Skills** oder gebündelt in einem Plugin |
| **Marketplace** | Ein JSON-Katalog in einem GitHub-Repository (`.claude-plugin/marketplace.json` oder `.agents/plugins/marketplace.json`), der Plugins auflistet. Ein Workspace importiert ihn einmal und synchronisiert ihn täglich. | Admin-Konsole → **Marketplaces** |

Weiterführende Informationen: [Apps in ChatGPT](https://help.openai.com/en/articles/11487775-connectors-in-chatgpt), [Developer Mode und MCP-Apps in ChatGPT](https://help.openai.com/en/articles/12584461-developer-mode-and-mcp-apps-in-chatgpt), [Plugins in ChatGPT und Codex](https://help.openai.com/en/articles/20001256-plugins-in-chatgpt-and-codex), [Plugin-Marketplaces von GitHub importieren und synchronisieren](https://help.openai.com/en/articles/20001504-importing-and-syncing-plugin-marketplaces-from-github).

## Was Sie brauchen

- Einen ChatGPT-**Business-, Enterprise- oder Edu-Workspace** und ein Konto mit der Rolle **Owner oder Admin**. Eigene MCP-Apps werden in der Admin-Konsole angelegt, nicht in den persönlichen Einstellungen.
- **Developer Mode / eigene MCP-Apps für den Workspace aktiviert**: **Admin → Permissions & roles → Connected data** (Beschriftung variiert: *Developer mode*, *Create custom MCP connectors*). Ohne diese Einstellung fehlt die Schaltfläche **Create** unter **Apps**.
- Eine **App-Registrierung in Ihrem Entra-Mandanten** für den MCP-Server, der die Berechtigung `mcp.access` erteilt wurde, siehe [Einrichtung in Entra ID](~/doc/mcp/entra-id-einrichtung.md). ChatGPT ist ein **gehosteter Client**: Die Redirect-URI muss unter der Plattform **Web** eingetragen sein, und die getestete Konfiguration verwendet ein **Client Secret** (`client_secret_post`). Verwenden Sie für ChatGPT – wie für Copilot Studio empfohlen – eine eigene App-Registrierung, damit das Secret Ihre nativen Clients nicht beeinflusst.
- Die **Client-ID** und das **Client Secret** dieser App-Registrierung.
- Optional die **Mandanten-ID** Ihres time cockpit Mandanten – nur wenn Ihr Entra-Mandant mehreren time cockpit Mandanten zugeordnet ist (siehe [Verbindungseinstellungen](~/doc/mcp/ueberblick.md#verbindungseinstellungen-header-oder-url-segment)).

> [!NOTE]
> Entra ID unterstützt weder Dynamic Client Registration (DCR) noch Client ID Metadata Documents (CIMD). Der Dialog **New App** zeigt dazu zwei orangefarbene Warnungen. Das ist zu erwarten – wählen Sie wie unten beschrieben **User-Defined OAuth Client**.

## Schritt 1: App anlegen (Administrator)

1. Öffnen Sie `https://chatgpt.com/admin/apps` (oder **Workspace settings → Apps**) und klicken Sie auf **Create**.
2. **Name**: z. B. `time cockpit`. **Description** und **Icon** sind optional; als Icon funktioniert ein PNG mit 256 × 256 px.
3. **Connection**: Behalten Sie **Server URL** bei und geben Sie `https://mcp.timecockpit.com` ein. Hängen Sie bei Bedarf [URL-Segmente](~/doc/mcp/ueberblick.md#verbindungseinstellungen-header-oder-url-segment) an, z. B. `https://mcp.timecockpit.com/tcTenantId/<tenant-id>` oder `…/access/readonly/scope/owndata`. ChatGPT bietet für Custom Apps keine Header-Konfiguration, daher sind URL-Segmente der einzige Weg, Mandant, Sandbox, Zugriff und Bereich zu übergeben.
4. **Authentication**: **OAuth**. Klappen Sie **Advanced OAuth settings** auf; ChatGPT ermittelt die Entra-Endpunkte und den Scope aus den Metadaten des Servers.
5. Wählen Sie unter **Client registration → Registration method** die Option **User-Defined OAuth Client**.
6. Kopieren Sie die **Callback URL** (`https://chatgpt.com/connector/oauth/<callback-id>`). Die Callback-ID ist für diesen App-Entwurf eindeutig. **Tragen Sie genau diese URL als Redirect-URI vom Plattformtyp Web** in Ihrer Entra-App-Registrierung ein, bevor sich jemand verbindet. Schließen Sie danach den Dialog nicht, löschen Sie den Entwurf nicht und legen Sie keinen zweiten Entwurf an – ein neuer Entwurf erhält eine neue Callback-ID.
7. Geben Sie die **Client-ID** und das **Client Secret** Ihrer App-Registrierung ein. **Token endpoint auth method**: `client_secret_post`.
8. **Scopes**: Lassen Sie den ermittelten Standard-Scope `https://mcp.timecockpit.com/mcp.access` ausgewählt. **Base scopes** kann leer bleiben.
9. Lesen Sie den Risikohinweis, aktivieren Sie **I understand and want to continue** und klicken Sie auf **Create**.

![Dialog New App in ChatGPT mit Server-URL, OAuth und den Einstellungen für User-Defined OAuth Client](/doc/mcp/images/chatgpt-new-app-dialog.png)

Die App erscheint nun unter **Apps → Drafts**. ChatGPT kontaktiert den Server und liest seine Tool-Liste („Actions"); das kann eine Weile dauern.

## Schritt 2: App im Workspace veröffentlichen (Administrator)

1. Klicken Sie unter **Apps → Drafts** neben der App auf **Publish**.

   ![App-Entwurf mit der Schaltfläche Publish in der Admin-Konsole von ChatGPT](/doc/mcp/images/chatgpt-app-draft-publish.png)

2. Der Dialog **Publish … to <workspace>** fordert Sie auf, zwei mögliche Risiken zu prüfen (*Unauthorized data access*, *Malicious app*). Klappen Sie beide auf, aktivieren Sie **I trust this app** und **I have reviewed the parameters being sent to each action …** und klicken Sie dann auf **Publish**.

   ![Dialog Publish mit Kontrollkästchen zur Risikoprüfung](/doc/mcp/images/chatgpt-publish-dialog.png)

3. Die App wechselt zu **Apps → Enabled** und ist nun für alle Mitglieder im Plugin-Verzeichnis des Workspace sichtbar. Klicken Sie auf die App, um ihre Details zu sehen; **Show in directory** öffnet die Seite, die Mitglieder sehen werden, mit **Edit** ändern Sie Name, Beschreibung und Icon.

   ![Details der veröffentlichten App mit Server-URL und dem Link Show in directory](/doc/mcp/images/chatgpt-app-details.png)

Hinweise für Administratoren:

- **Für alle installiert:** In der Admin-Konsole können Sie die App (oder das Plugin, das sie enthält) für den Workspace als **Installed** statt nur als *Available* markieren. Installierte Apps erscheinen bei jedem Mitglied, ohne dass es das Verzeichnis durchsuchen muss; jedes Mitglied muss aber weiterhin sein eigenes Konto verbinden (Schritt 3). Der Zugriff lässt sich außerdem unter **Permissions & roles** nach Rolle einschränken; siehe [Plugin controls](https://learn.chatgpt.com/docs/enterprise/apps-and-connectors).
- **Eingefrorene Actions-Liste:** ChatGPT friert die Liste der Actions (Tools) beim Veröffentlichen ein. Wenn time cockpit Tools hinzufügt oder umbenennt, muss ein Administrator die App-Details öffnen und die Actions manuell **aktualisieren** (refresh).
- **Bestätigungsabfragen:** Unter **Apps** können Sie pro Action festlegen, ob ChatGPT den Benutzer vor dem Aufruf fragt. Das ist unabhängig vom serverseitigen [Bestätigungsablauf](~/doc/mcp/zugriff-umfang-und-bestaetigung.md) für schreibende Tools, der weiterhin gilt.

## Schritt 3: Eigenes Konto verbinden (jedes Mitglied)

Durch das Veröffentlichen wird niemand angemeldet. Jedes Mitglied verbindet sich einzeln und authentifiziert sich mit seinem eigenen Entra-ID-Konto:

1. Öffnen Sie in ChatGPT **Plugins** in der Seitenleiste und wählen Sie **time cockpit** (oder öffnen Sie den Link aus **Show in directory**).
2. Klicken Sie auf **Connect**.

   ![Plugin-Seite der time cockpit App mit der Schaltfläche Connect](/doc/mcp/images/chatgpt-plugin-connect.png)

3. Der Dialog **Connect time cockpit** erklärt, wie ChatGPT mit Berechtigungen und Daten umgeht. Klicken Sie auf **Continue to time cockpit**.

   ![Dialog Connect mit der Schaltfläche Continue to time cockpit](/doc/mcp/images/chatgpt-connect-dialog.png)

4. Melden Sie sich mit Ihrem Microsoft-Geschäftskonto an und akzeptieren Sie die angeforderte Berechtigung `mcp.access` (sofern Ihr Administrator nicht bereits die Administratorzustimmung für den ganzen Mandanten erteilt hat). Entra leitet Sie zurück zu `https://chatgpt.com/connector/oauth/…`.
5. Starten Sie einen **neuen Chat**. Die App ist über das Menü **+** oder durch Erwähnen verfügbar; ein erster Test ist *„Verwende time cockpit, führe ping aus und sag mir dann, wer ich bin"*. Siehe [Verbindung prüfen](~/doc/mcp/verbindung-pruefen.md).

Es gelten dieselben Regeln wie bei Claude Code, Codex oder VS Code: Der MCP-Server handelt mit **Ihren** Berechtigungen in time cockpit, die Einstellungen `access` und `scope` der URL schränken diese weiter ein, und schreibende Tools erfordern eine Bestätigung. Siehe [Zugriff, Bereich und Bestätigung](~/doc/mcp/zugriff-umfang-und-bestaetigung.md) und [Limits und Kürzung](~/doc/mcp/grenzen-und-kuerzung.md). ChatGPT speichert die Tokens pro Benutzer; **Disconnect** auf der Plugin-Seite entfernt sie.

## Schritt 4: Companion Skills importieren (Administrator)

Die [Companion Skills](~/doc/mcp/begleitende-skills.md) aus dem GitHub-Repository **software-architects/timecockpit-agents** bringen ChatGPT bei, wie es mit time cockpit arbeitet (TCQL, Buchungsmuster, Berichte). Für ChatGPT werden sie als **Plugin-Marketplace** bereitgestellt:

1. Öffnen Sie **Admin → Marketplaces** und klicken Sie auf **Add** (**Import marketplace from GitHub**).
2. **Source**: `https://github.com/software-architects/timecockpit-agents`. **Path**: leer lassen (das Stammverzeichnis des Repositorys enthält die Kataloge `.claude-plugin` und `.agents/plugins`). **Branch, tag, or commit**: Legen Sie für Kunden-Workspaces ein Release-Tag wie `v0.1.7` fest oder lassen Sie das Feld leer, um dem Standard-Branch zu folgen.
3. Klicken Sie auf **Import marketplace**. Der erste Import kann bis zu einer Stunde dauern; danach synchronisiert ChatGPT täglich, und **Sync now** löst eine Aktualisierung bei Bedarf aus.

![Dialog Import marketplace from GitHub](/doc/mcp/images/chatgpt-import-marketplace.png)

Nach dem Import erscheint das Plugin unter **Admin → Plugins**. Setzen Sie es auf **Installed** (oder **Available**) und erteilen Sie bei Bedarf über **Manage access** den Zugriff. Zwei Punkte sind zu beachten:

- Die Marketplace-Synchronisierung importiert nur Skills und den *Verweis* auf die App. Sie legt die MCP-App **nicht** an und verbindet kein Konto. Die App aus Schritt 1 muss im Workspace existieren und veröffentlicht sein, und jedes Mitglied verbindet sie weiterhin selbst.
- Skills werden in neuen Chats aktiv. Benutzer können einen Skill mit `@timecockpit-tcql` und ähnlichen Namen ausdrücklich ansprechen.

## Ausblick: time cockpit im Plugin-Verzeichnis von OpenAI

Derzeit muss die App in jedem Workspace als eigene MCP-App angelegt werden, weshalb OpenAI die Warnungen *„OpenAI hasn't reviewed this app"* anzeigt. Wir arbeiten daran, time cockpit als **verifiziertes Plugin im öffentlichen Plugin-Verzeichnis von OpenAI** anzubieten, sodass ein Workspace es direkt installieren kann und die manuelle App-Registrierung in ChatGPT entfällt. Die App-Registrierung in Entra ID in Ihrem Mandanten bleibt weiterhin erforderlich, da sich ChatGPT gegen Ihren Entra-Mandanten authentifiziert. Zum Prüfprozess von OpenAI siehe [Submit plugins](https://developers.openai.com/plugins/deploy/submission).

## Fehlerbehebung

| Symptom | Ursache / Lösung |
|---------|------------------|
| Dialoge hängen, Prompts laufen in Timeouts, `429 Too Many Requests` | Last- und Ratenbegrenzung auf der Seite von ChatGPT; hat nichts mit dem MCP-Server zu tun. Warten Sie und versuchen Sie es erneut; laden Sie die Admin-Seite neu, bevor Sie einen zweiten Entwurf anlegen. |
| `AADSTS50011: redirect URI … does not match` bei **Connect** | Die Callback-URL *dieser* App (`https://chatgpt.com/connector/oauth/<callback-id>`) ist in der Entra-App-Registrierung nicht eingetragen oder unter *Mobile and desktop* statt unter **Web** eingetragen. Kopieren Sie sie aus **Edit → Advanced OAuth settings**. |
| `AADSTS7000218` / *client_assertion or client_secret required* | Die App-Registrierung erwartet ein Secret, es wurde aber keines eingegeben, oder **Token endpoint auth method** ist nicht `client_secret_post`. Geben Sie das Secret ein; ist es abgelaufen, legen Sie in Entra ein neues an und aktualisieren Sie die App. |
| `AADSTS650052` / Berechtigung kann nicht erteilt werden | Die MCP-API hat noch keinen Service Principal in Ihrem Mandanten, siehe [Die MCP-API von time cockpit in Ihrem Mandanten verfügbar machen](~/doc/mcp/entra-id-einrichtung.md#die-mcp-api-von-time-cockpit-in-ihrem-mandanten-verfügbar-machen). |
| Schaltfläche **Create** fehlt unter **Apps** | Developer Mode / eigene MCP-Apps sind für den Workspace deaktiviert, oder Ihre Rolle ist nicht Owner/Admin. |
| Mitglieder sehen die App nicht | Die App ist noch ein Entwurf, ist nur *Available* und nicht *Installed*, oder der rollenbasierte Zugriff schließt sie aus. |
| Tools fehlen nach einem Server-Update | Die Actions-Liste wird beim Veröffentlichen eingefroren; aktualisieren Sie sie in den App-Details. |
| Der Assistent verwendet die App nicht | Starten Sie einen neuen Chat und wählen Sie die App im Menü **+** aus oder erwähnen Sie sie namentlich. |

## Verwandte Seiten

- [Überblick über den MCP-Server](~/doc/mcp/ueberblick.md)
- [Einrichtung in Entra ID](~/doc/mcp/entra-id-einrichtung.md) – Redirect-URIs und Client Secret für gehostete Clients
- [Verbindung prüfen](~/doc/mcp/verbindung-pruefen.md)
- [Companion Skills & APM](~/doc/mcp/begleitende-skills.md)
- [Anwendungsfälle und Prompts](~/doc/ki-assistenten/anwendungsfaelle-und-prompts.md)
- OpenAI: [Apps in ChatGPT](https://help.openai.com/en/articles/11487775-connectors-in-chatgpt), [Developer Mode und MCP-Apps](https://help.openai.com/en/articles/12584461-developer-mode-and-mcp-apps-in-chatgpt), [Plugins in ChatGPT und Codex](https://help.openai.com/en/articles/20001256-plugins-in-chatgpt-and-codex), [Plugin-Marketplaces von GitHub importieren](https://help.openai.com/en/articles/20001504-importing-and-syncing-plugin-marketplaces-from-github), [Plugin-Verwaltung](https://learn.chatgpt.com/docs/enterprise/plugin-management), [Authentifizierung für Plugins](https://developers.openai.com/plugins/build/auth), [Submit plugins](https://developers.openai.com/plugins/deploy/submission)
