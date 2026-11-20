---
title: MCP-Server - Einrichtung in Microsoft 365 Copilot
description: "Drei Wege, den MCP-Server von time cockpit in Microsoft 365 Copilot zu nutzen: Copilot-Studio-Agents, deklarative Agents mit MCP-Plugin, Connectors."
en_page: doc/mcp/microsoft-365-copilot.md
---
# Microsoft 365 Copilot

> [!WARNING]
> Im Aufbau: Der MCP-Server von time cockpit und diese Dokumentation werden aktiv weiterentwickelt, inkompatible Änderungen sind möglich. Tools können umbenannt, geändert oder entfernt werden, und Dialogbeschriftungen sowie Konfigurationsschritte können sich ohne Ankündigung ändern. Prüfen Sie diese Seite auf Aktualisierungen, bevor Sie die Einrichtung für Ihre Benutzer ausrollen, und rechnen Sie damit, Ihre Konfiguration, Skills und Prompts nach einem Update anpassen zu müssen.

Endbenutzer können im Copilot-Chat keine MCP-URL eingeben. MCP-Server gelangen über **Agents oder Connectors** in Microsoft 365 Copilot – auf drei Wegen, an denen jeweils ein Maker oder ein Administrator beteiligt ist. Der Consumer-Copilot (copilot.microsoft.com) unterstützt keine eigenen MCP-Server.

> [!WARNING]
> Prüfung erforderlich: Die Wege A und C wurden bisher nicht durchgängig mit dem MCP-Server von time cockpit verifiziert. Die Schritte folgen der Microsoft-Dokumentation; Dialogbeschriftungen können abweichen. Weg B wurde im November 2026 mit dem Microsoft 365 Agents Toolkit 6.20 verifiziert.

| Weg | Wer | Anmeldeoptionen | Header | Status |
|-------|-----|--------------|---------|--------|
| A) Copilot Studio – MCP-Tool in einem Agent, Agent in M365 Copilot veröffentlicht | Maker (Copilot-Studio-Lizenz), Administrator genehmigt die Veröffentlichung | OAuth 2.0 (DCR / Dynamic / **Manual** mit Client-ID **und Secret**), API-Schlüssel, None | nur über die Custom-Connector-Richtlinie „Set HTTP header“ – URL-Segmente sind vorzuziehen | GA |
| B) Deklarativer Agent mit MCP-Plugin (M365 Agents Toolkit) | Entwickler, Administrator veröffentlicht | OAuth 2.0 mit statischer Registrierung (Client-ID **und Secret**); das Toolkit bietet außerdem Entra SSO, dynamische Registrierung und None an | nein | GA |
| C) Custom Federated Connector (M365 Admin Center → Copilot → Connectors) | Global / AI Administrator | Entra SSO, OAuth 2.0, None | nein | Preview, nur lesende Tools |

Da keiner dieser Wege eigene Header unterstützt, übergeben Sie Mandant und Modi als [URL-Segmente](~/doc/mcp/ueberblick.md#verbindungseinstellungen-header-oder-url-segment).

## Weg A: Copilot Studio

1. Copilot Studio → Agent → **Tools** → **Add a tool** → **New tool** → **Model Context Protocol**.
2. *Server name*, *Server description*, *Server URL* `https://mcp.timecockpit.com` (mit URL-Segmenten für Mandant/Modi, da es kein Header-Feld gibt).
3. Authentifizierung **OAuth 2.0 → Manual**: *Client ID* und *Client secret* Ihrer vertraulichen App-Registrierung (siehe unten), *Authorization URL* `https://login.microsoftonline.com/<your-entra-tenant>/oauth2/v2.0/authorize`, *Token URL template* und *Refresh URL* `https://login.microsoftonline.com/<your-entra-tenant>/oauth2/v2.0/token`, *Scopes* `https://mcp.timecockpit.com/mcp.access offline_access`. Der MCP-Assistent hat keine eigene Entra-Option.
4. **Create** → die angezeigte **Redirect URL** (`https://global.consent.azure-apim.net/redirect/<id>`) muss als Umleitungs-URI vom Plattformtyp **Web** in Ihrer App-Registrierung eingetragen werden. Das letzte Pfadsegment wird pro Tool erzeugt – kopieren Sie genau den angezeigten Wert.
5. **Create a new connection** → Entra-Anmeldung → **Add to agent**. Testen Sie den Agent, dann **Channels → Teams and Microsoft 365 Copilot → Make agent available in Microsoft 365 Copilot** und, falls erforderlich, **Submit for admin approval**.

> [!NOTE]
> Copilot Studio verlangt im manuellen Modus ein **Client Secret** und benötigt daher einen **vertraulichen Client**. Legen Sie für Copilot Studio eine eigene App-Registrierung an (Plattform *Web*, Client Secret, Berechtigung `mcp.access`), statt der Public-Client-Registrierung, die Claude Code und Codex verwenden, ein Secret hinzuzufügen – siehe [Einrichtung in Entra ID](~/doc/mcp/entra-id-einrichtung.md).

Technisch ist das MCP-Tool ein Custom Connector der Power Platform, daher gelten die Data-Loss-Prevention-Richtlinien Ihres Mandanten. Wenn ein statischer Header unvermeidbar ist, ist die Alternative **Custom connector → Import OpenAPI** (mit `x-ms-agentic-protocol: mcp-streamable-1.0`) und die Richtlinie **Set HTTP header** – deutlich aufwendiger als ein URL-Segment.

## Weg B: Deklarativer Agent mit MCP-Plugin

Mit dem Microsoft 365 Agents Toolkit (≥ 6.12) in Visual Studio Code erstellen Sie einen deklarativen Agent, dessen Plugin-Manifest (`appPackage/ai-plugin.json`, Schema v2.4) eine Runtime `"type": "RemoteMCPServer"` mit `spec.url` enthält. Header werden im Manifest nicht unterstützt – verwenden Sie URL-Segmente.

### Voraussetzungen

- Ein Microsoft-365-Konto mit Microsoft-365-Copilot-Lizenz und der Berechtigung, eigene Apps hochzuladen (Sideloading). Nach der Anmeldung zeigt die Ansicht **Accounts** des Toolkits, ob Custom App Upload und Copilot-Zugriff aktiviert sind.
- Eine App-Registrierung in Ihrem Entra-Mandanten, eingerichtet als **vertraulicher Client**:
  - Plattform **Web** mit der Umleitungs-URI `https://teams.microsoft.com/api/platform/v1.0/oAuthRedirect`
  - ein Client Secret
  - die delegierte Berechtigung `mcp.access` der MCP-API von time cockpit, mit Administratorzustimmung

  Wie bei Copilot Studio ist eine eigene Registrierung vorzuziehen, statt der Public-Client-Registrierung Ihrer Entwicklerwerkzeuge ein Secret hinzuzufügen – siehe [Einrichtung in Entra ID](~/doc/mcp/entra-id-einrichtung.md).

### Agent anlegen

1. Im Toolkit: **Build Declarative Agent** → **Add an Action** → **Start with an MCP Server**.
2. MCP-Server-URL: `https://mcp.timecockpit.com`, bei Bedarf mit [URL-Segmenten](~/doc/mcp/ueberblick.md#verbindungseinstellungen-header-oder-url-segment), zum Beispiel `https://mcp.timecockpit.com/access/readonly`.
3. Authentifizierungstyp **OAuth (with static registration)**: Client-ID, Client Secret und die Scopes `https://mcp.timecockpit.com/mcp.access offline_access`. Geben Sie den **Value** des Secrets ein, nicht die Secret ID. Das Toolkit speichert die Client-ID in `env/.env.dev` und das Secret in `env/.env.dev.user`, das von Git ausgeschlossen ist.
4. Setzen Sie in `m365agents.yml` `authorizationUrl` und `tokenUrl` des Schritts `oauth/register` auf die Entra-Endpunkte Ihres Mandanten:

   ```yaml
   authorizationUrl: https://login.microsoftonline.com/<your-entra-tenant>/oauth2/v2.0/authorize
   tokenUrl: https://login.microsoftonline.com/<your-entra-tenant>/oauth2/v2.0/token
   ```

   Das Toolkit trägt aus den Server-Metadaten `https://mcp.timecockpit.com/authorize` und `/token` vor. Die verifizierte Einrichtung verwendete die Entra-Endpunkte.

### Tool-Definitionen hinzufügen

Das Toolkit legt das Plugin mit einer leeren Liste `functions` an und verlässt sich auf die dynamische Tool-Erkennung zur Laufzeit. Mit dem MCP-Server von time cockpit fand Copilot das Plugin, aber keine Tools. Tragen Sie die Tool-Definitionen stattdessen in das Manifest ein:

1. Öffnen Sie `.vscode/mcp.json` im Agent-Projekt und starten Sie den Server über die CodeLens über dem Servereintrag in VS Code. VS Code meldet sich mit eigenen Umleitungs-URIs beim MCP-Server an; siehe [Visual Studio Code](~/doc/mcp/vscode.md) und die [Redirect-URIs pro Client](~/doc/mcp/entra-id-einrichtung.md#redirect-uris-pro-client).
2. Rufen Sie über die CodeLens des Toolkits die Aktionen vom MCP-Server ab und wählen Sie die Tools aus, die der Agent verwenden darf. Das Toolkit schreibt sie in `functions` und `run_for_functions` in `ai-plugin.json` und die Tool-Beschreibungen in `appPackage/mcp-tools.json`.
3. Prüfen Sie die abgerufenen Beschreibungen. Beginnen sie mit „Sign-in to time cockpit was refused:“, hat der Server nur `ping` und `entra_whoami` aufgelistet; siehe [Verbindung prüfen](~/doc/mcp/verbindung-pruefen.md).

Um ein Tool später zu entfernen, löschen Sie es aus `functions`, `run_for_functions` und `mcp-tools.json`. Ein erneuter Abruf stellt die vollständige Auswahl wieder her.

> [!TIP]
> Optional: Ist Ihr Entra-Mandant mehreren time cockpit Mandanten zugeordnet, enden die abgerufenen Beschreibungen mit `AmbiguousTenantMapping`. Ergänzen Sie dann das Mandanten-Segment in der URL in `.vscode/mcp.json`, in `spec.url` von `ai-plugin.json` und in `baseUrl` von `m365agents.yml` (zum Beispiel `https://mcp.timecockpit.com/tcTenantId/<tenant-id>/access/readonly`) und rufen Sie die Aktionen erneut ab.

### Anweisungen schreiben

Ersetzen Sie die Platzhalter-Anweisungen in `appPackage/instruction.txt` und die Beschreibung in `declarativeAgent.json`. Mit den erzeugten Platzhaltern beantwortete der Agent Fragen zu time cockpit aus den E-Mails des Benutzers, statt die MCP-Tools aufzurufen. Legen Sie fest, welche Fragen der Agent mit den Tools von time cockpit beantwortet und dass er sie nicht aus E-Mails, Chats oder Dateien beantworten darf.

### Bereitstellen und testen

1. Führen Sie im Toolkit **Provision** aus. Es registriert den OAuth-Client im Teams Developer Portal, erstellt das App-Paket und lädt es für Ihr Konto hoch.
2. Öffnen Sie den Microsoft-365-Copilot-Chat, wählen Sie den Agent und stellen Sie eine Frage, die Daten aus time cockpit braucht. Beim ersten Tool-Aufruf zeigt Copilot eine Anmelde-Schaltfläche.

- Erhöhen Sie vor jeder weiteren Bereitstellung `version` in `appPackage/manifest.json`. Andernfalls schlägt die Bereitstellung mit „New title must have a higher version than the existing title.“ fehl.
- Leeren Sie nach einer Änderung der URL, der Autorisierungs-Endpunkte oder des Secrets `MCP_DA_AUTH_ID_<namespace>` in `env/.env.dev`, damit die Bereitstellung eine neue OAuth-Konfiguration registriert.
- Zeigt das Anmeldefenster „Something went wrong. Please try again.“, prüfen Sie das Client Secret (Value, nicht Secret ID) und die Token-URL.

> [!WARNING]
> Prüfung erforderlich: Die Veröffentlichung für andere Benutzer (**Publish** im Toolkit, danach Freigabe durch einen Administrator unter **Integrated apps** im Microsoft 365 Admin Center) wurde noch nicht verifiziert.

## Weg C: Custom Federated Connector (Preview)

Microsoft 365 Admin Center → **Copilot → Connectors → Gallery → Create a new connector → Custom connector → Connect to MCP server**: *Display name*, *Base URL*, Authentifizierung **Microsoft Entra SSO** (Client-ID der Entra-Anwendung) oder OAuth 2.0 (Client im Teams Developer Portal registriert, Redirect `https://teams.microsoft.com/api/platform/v1.0/oAuthRedirect`). Erfordert **Global Administrator** oder **AI Administrator**. Nur lesende Tools (Suche, Abruf, abfrageartige Tools) werden unterstützt – schreibende time cockpit Tools stehen auf diesem Weg nicht zur Verfügung. Oberflächen: Copilot Chat, Copilot in Excel, Researcher, Cowork.

## Empfehlung

- Für einen ersten Pilotversuch: Weg A (Copilot Studio), weil Maker ihn ohne Entwicklung konfigurieren können; Mandant und Modi als URL-Segmente; eine eigene vertrauliche App-Registrierung für Copilot Studio.
- Weg C nur für reine Rechercheszenarien (nur lesend), sobald er die Preview-Phase verlässt.

## Verwandte Seiten

- [Überblick über den MCP-Server](~/doc/mcp/ueberblick.md)
- [Einrichtung in Entra ID](~/doc/mcp/entra-id-einrichtung.md)
- [Microsoft Learn: Add an existing MCP server in Copilot Studio](https://learn.microsoft.com/en-us/microsoft-copilot-studio/mcp-add-existing-server-to-agent)
