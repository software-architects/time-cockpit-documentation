---
title: MCP-Server - Einrichtung in Visual Studio Code
description: "Den MCP-Server von time cockpit in VS Code für den Copilot-Agent-Modus per mcp.json einrichten: OAuth-Client-ID, Header-Inputs, Anmeldung, Fehler."
en_page: doc/mcp/vscode.md
---
# Visual Studio Code (GitHub Copilot Agent Mode)

> [!WARNING]
> Im Aufbau: Der MCP-Server von time cockpit und diese Dokumentation werden aktiv weiterentwickelt, inkompatible Änderungen sind möglich. Tools können umbenannt, geändert oder entfernt werden, und Dialogbeschriftungen sowie Konfigurationsschritte können sich ohne Ankündigung ändern. Prüfen Sie diese Seite auf Aktualisierungen, bevor Sie die Einrichtung für Ihre Benutzer ausrollen, und rechnen Sie damit, Ihre Konfiguration, Skills und Prompts nach einem Update anpassen zu müssen.

VS Code konfiguriert MCP-Server in `mcp.json` – entweder im Workspace (`.vscode/mcp.json`, teilbar) oder im Benutzerprofil (Befehl **MCP: Open User Configuration**). Seit **VS Code 1.123 (Juni 2026)** lässt sich pro Server eine eigene OAuth-Client-ID angeben (`oauth.clientId`). Die folgende Konfiguration wurde gegen den MCP-Server von time cockpit verifiziert.

## mcp.json

Beispiel für `.vscode/mcp.json` mit einem Header-Input und Ihrer Client-ID (VS Code zeigt über `oauth` eine CodeLens *Set Client Secret* an, die für diesen Public Client nicht benötigt wird):

```json
{
  "inputs": [
    { "type": "promptString", "id": "tc-tenant-id", "description": "time cockpit tenant id (GUID)" }
  ],
  "servers": {
    "timecockpit": {
      "type": "http",
      "url": "https://mcp.timecockpit.com",
      "headers": { "X-tc-tenant-id": "${input:tc-tenant-id}" },
      "oauth": { "clientId": "<client-id>" }
    }
  }
}
```

- `type: "http"` – VS Code versucht Streamable HTTP und weicht auf SSE aus.
- `headers` werden an jede Anfrage angehängt, auch an den Abruf von `/.well-known/oauth-protected-resource`. Setzen Sie keinen eigenen `Authorization`-Header – darum kümmert sich OAuth. Lassen Sie `headers` (und `inputs`) weg, wenn Ihr Entra-Mandant genau einem time cockpit Mandanten zugeordnet ist.
- `inputs` (`promptString`, optional `password: true`) hält Werte aus der geteilten Datei heraus; VS Code fragt beim ersten Start danach. `envFile` gibt es nur für stdio-Server.
- `oauth.clientId`: Ohne diese Angabe verwendet VS Code seine eigene Microsoft-Client-ID (`aebc6443-996d-45c2-90f0-388ff96faa56`), die für die Ressourcenanwendung von time cockpit autorisiert werden müsste. Mit Ihrer eigenen Client-ID ist das nicht nötig.

## Über Befehl oder CLI hinzufügen

**Command Palette → MCP: Add Server → HTTP** → URL → Server-ID → Ziel *Global* oder *Workspace*. Der Assistent fragt weder nach Headern noch nach einer Client-ID – ergänzen Sie diese anschließend in der Datei. Oder über die Befehlszeile (schreibt in die Benutzer-`mcp.json`):

```powershell
code --add-mcp '{"name":"timecockpit","type":"http","url":"https://mcp.timecockpit.com","oauth":{"clientId":"<client-id>"}}'
```

VS Code öffnet sich (oder erhält den Fokus) und fügt den Server zur `mcp.json` des Benutzerprofils hinzu.

## Authentifizierung

VS Code erkennt den Autorisierungsserver (`login.microsoftonline.com/*`) und verwendet statt eines generischen OAuth-Ablaufs seinen integrierten **Microsoft-Authentifizierungsanbieter** (MSAL) – es findet keine Dynamic Client Registration statt. Beim ersten Start des Servers erscheint der Dialog *The MCP Server Definition 'timecockpit' wants to authenticate to Microsoft* → **Allow**; bei mehreren Microsoft-Konten folgt eine Kontoauswahl. Die Anmeldung läuft über den Browser (MSAL-Loopback `http://localhost:<port>`) oder, je nach Umgebung, über `https://vscode.dev/redirect` oder den Windows-Broker (WAM).

Verwaltung: **Accounts-Menü (unten links) → Microsoft-Konto → Manage Trusted MCP Servers** oder **Sign Out**; Befehl **MCP: List Servers** → Server → *Start Server / Stop Server / Restart Server / Show Output / Show Configuration / Manage MCP Server Account Preferences*. Der Befehl *Authentication: Remove Dynamic Authentication Providers* ist hier nicht relevant, weil kein dynamischer Anbieter verwendet wird.

## Prüfen

Aktivieren Sie in Copilot Chat (Agent Mode) den Server über das Tools-Symbol und stellen Sie eine Frage. Tool-Aufrufe erscheinen als *Ran \<tool\> (MCP Server: timecockpit)*:

```text
You
An welchen Projekten habe ich laut time cockpit diese Woche gearbeitet?

GitHub Copilot
▸ Ran get_timesheets (MCP Server: timecockpit)
  { "from": "2026-09-14", "to": "2026-09-20" }
▸ Ran execute_tcql_query (MCP Server: timecockpit)

Diese Woche haben Sie Zeit auf drei Projekte gebucht:
  • Project Alpha – 14 h 30 min
  • Customer Portal – 6 h 00 min
  • Internal / MCP documentation – 3 h 15 min
```

Folgen Sie danach [Verbindung prüfen](~/doc/mcp/verbindung-pruefen.md).

## Installationslink

Für interne Portale unterstützt VS Code Installationslinks: `vscode:mcp/install?<url-encoded JSON>` oder `https://insiders.vscode.dev/redirect/mcp/install?name=timecockpit&config=<url-encoded JSON>` als Badge „Install in VS Code".

## Fehlerbehebung und Einstellungen

| Symptom | Ursache / Lösung |
|---------|------------------|
| `AADSTS9010010` / `invalid_target` beim Start | VS Code sendet `resource=<MCP URL>`; Entra verlangt, dass Application ID URI und Scope übereinstimmen. Die Einstellung `microsoft-authentication.implementation = msal-no-broker` macht den Fehler sichtbar. Wenden Sie sich an den Support, wenn er bestehen bleibt. |
| Kein Anmeldedialog, Server *failed to start* | Lesen Sie **MCP: List Servers → Show Output**; prüfen Sie die Ermittlung der Protected Resource (401 mit `resource_metadata`). |
| Falsches Konto | **Accounts → Manage MCP Server Account Preferences** / **Sign Out**. |
| MCP deaktiviert (Unternehmen) | Richtlinie `chat.mcp.access` (`all` / `registry` / `none`), `chat.mcp.allowedServers`. |
| Server aus anderen Apps erscheinen | `chat.mcp.discovery.enabled` (liest z. B. die Konfiguration von Claude Desktop). |

## Verwandte Seiten

- [Überblick über den MCP-Server](~/doc/mcp/ueberblick.md)
- [GitHub Copilot CLI](~/doc/mcp/copilot-cli.md)
- [Zuordnung der Konfigurationsfelder](~/doc/mcp/verbindung-pruefen.md#zuordnung-der-konfigurationsfelder)
- [Referenz zur MCP-Konfiguration in VS Code](https://code.visualstudio.com/docs/agents/reference/mcp-configuration)
