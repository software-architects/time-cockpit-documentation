---
title: MCP-Server - Einrichtung in Claude Code
description: "Den MCP-Server von time cockpit in Claude Code registrieren, mit Entra ID anmelden, die Verbindung prüfen und die Einrichtung per .mcp.json teilen."
en_page: doc/mcp/claude-code.md
---
# Claude Code (CLI)

> [!WARNING]
> Im Aufbau: Der MCP-Server von time cockpit und diese Dokumentation werden aktiv weiterentwickelt, inkompatible Änderungen sind möglich. Tools können umbenannt, geändert oder entfernt werden, und Dialogbeschriftungen sowie Konfigurationsschritte können sich ohne Ankündigung ändern. Prüfen Sie diese Seite auf Aktualisierungen, bevor Sie die Einrichtung für Ihre Benutzer ausrollen, und rechnen Sie damit, Ihre Konfiguration, Skills und Prompts nach einem Update anpassen zu müssen.

Claude Code ist der Terminal-Agent von Anthropic. MCP-Server werden in Konfigurationsdateien gespeichert und mit `claude mcp …` verwaltet. Die folgenden Schritte wurden unter Windows 11 mit PowerShell verifiziert.

> [!NOTE]
> Die auf dieser Seite gezeigten Terminalausgaben dienen der Veranschaulichung. Versionsnummern, Anzahl der Tools und Beispielbuchungen können abweichen.

## Installation

Wenn `claude` in Ihrer Shell nicht erkannt wird, installieren Sie Claude Code:

```powershell
irm https://claude.ai/install.ps1 | iex
```

```text
Downloading Claude Code...
✔ Claude Code installed successfully.
Restart your terminal so the new PATH entry takes effect, then run 'claude' to get started.
```

Alternativen: `winget install Anthropic.ClaudeCode` oder `npm install -g @anthropic-ai/claude-code`. **Öffnen Sie danach ein neues Terminal**, führen Sie `claude --version` aus, starten Sie `claude` einmal und melden Sie sich mit Ihrem Anthropic-Konto an.

## Server registrieren (Benutzerbereich)

Mit `--scope user` steht der Server in allen Ihren Projekten zur Verfügung (`%USERPROFILE%\.claude.json`). Die JSON-Form setzt Header und OAuth in einem Schritt. Geben Sie den Befehl in einer einzigen Zeile ein:

```powershell
claude mcp add-json timecockpit --scope user '{"type":"http","url":"https://mcp.timecockpit.com","headers":{"X-tc-tenant-id":"<tenant-id>"},"oauth":{"clientId":"<client-id>","callbackPort":64485}}'
```

```text
Added HTTP MCP server timecockpit with URL: https://mcp.timecockpit.com to user config
File modified: C:\Users\<you>\.claude.json
```

Wenn Ihr Entra-Mandant genau einem time cockpit Mandanten zugeordnet ist, lassen Sie den Block `headers` weg. Für einen vorsichtigen Einstieg verwenden Sie stattdessen `"headers":{"X-access":"readonly","X-scope":"owndata"}` – siehe [Verbindungseinstellungen](~/doc/mcp/ueberblick.md#verbindungseinstellungen-header-oder-url-segment).

Alternativ mit einzelnen Optionen. **Name und URL müssen vor den Optionen stehen**, sonst meldet Claude Code `error: missing required argument 'name'`:

```powershell
claude mcp add timecockpit https://mcp.timecockpit.com --scope user --transport http `
  --client-id <client-id> --callback-port 64485 `
  --header "X-tc-tenant-id: <tenant-id>"
```

> [!NOTE]
> Einfache Anführungszeichen um das JSON funktionieren in PowerShell und Bash, nicht aber in `cmd.exe`. Meldet Ihre Version `unknown option` für `--client-id` oder `--callback-port`, führen Sie `claude update` aus.

## Anmelden (Entra ID)

```powershell
claude mcp login timecockpit
```

```text
Discovering authorization server for https://mcp.timecockpit.com ...
Opening your browser to sign in with Microsoft Entra ID...
If the browser does not open, visit:
https://login.microsoftonline.com/organizations/oauth2/v2.0/authorize?client_id=<client-id>&redirect_uri=http%3A%2F%2Flocalhost%3A64485%2Fcallback&response_type=code&code_challenge_method=S256...

✔ Authentication successful. Tokens saved for timecockpit.
```

Der Browser öffnet die Anmeldung von Entra ID. Nach der Anmeldung werden Sie zu `http://localhost:64485/callback` weitergeleitet und die Tokens werden lokal gespeichert. Alternativ führen Sie in einer Sitzung `/mcp` aus, wählen den Server und dann **Authenticate**.

## Prüfen

```powershell
claude mcp list
```

```text
Checking MCP server health...

timecockpit: https://mcp.timecockpit.com (HTTP) - ✔ Connected
```

Innerhalb einer Claude-Code-Sitzung listet `/mcp` die konfigurierten Server mit ihrem Status und den Speicherorten der Konfiguration auf:

```text
Manage MCP servers

❯ 1. timecockpit   ✔ connected · Enter to view details

MCP Config locations (by scope):
 • User config (available in all your projects):
   • C:\Users\<you>\.claude.json
 • Project config (shared via .mcp.json):
   • C:\Repos\my-project\.mcp.json
```

Die Auswahl des Servers zeigt seine Details und bietet **View tools**, **Reconnect**, **Clear authentication** und **Disable** an:

```text
timecockpit MCP Server

Status: ✔ connected
URL: https://mcp.timecockpit.com
Config location: C:\Users\<you>\.claude.json (user)
Capabilities: tools
Tools: 16 tools
Authentication: ✔ Authenticated (OAuth)
```

Eine erste Abfrage sieht dann so aus:

```text
> Als wer bin ich verbunden, und was habe ich heute gebucht?

● timecockpit - get_current_user
● timecockpit - get_timesheets (from: 2026-09-15, to: 2026-09-15)
  └ 3 timesheet entries returned

● Sie sind als Jane Doe (jane.doe@example.com) verbunden.
  Heute haben Sie 3 Einträge mit insgesamt 6 h 30 min gebucht:
  • 09:00–11:30  Project Alpha – Sprint planning
  • 12:30–15:00  Project Alpha – Implementation
  • 15:00–16:30  Internal – MCP documentation
```

Rufen Sie danach die Diagnose-Tools wie unter [Verbindung prüfen](~/doc/mcp/verbindung-pruefen.md) beschrieben auf.

## Alternative: Projektbereich über .mcp.json

Der Server kann in `.mcp.json` im Stammverzeichnis des Repositorys deklariert und mit dem Team geteilt werden. Claude Code fragt beim ersten Start, ob die Server des Projekts verwendet werden dürfen. Haben ein Eintrag im Benutzerbereich und einer im Projektbereich denselben Namen, gilt der Projekteintrag. `apm install software-architects/timecockpit-agents` schreibt einen solchen Eintrag (ohne Client-ID), nachdem Sie die Vertrauensabfrage bestätigt haben – siehe [Companion Skills](~/doc/mcp/begleitende-skills.md).

```json
{
  "mcpServers": {
    "timecockpit": {
      "type": "http",
      "url": "https://mcp.timecockpit.com",
      "headers": {
        "X-tc-tenant-id": "<tenant-id>"
      },
      "oauth": {
        "clientId": "<client-id>",
        "callbackPort": 64485
      }
    }
  }
}
```

> [!NOTE]
> Tragen Sie eine Mandanten-ID nur dann in die geteilte `.mcp.json` ein, wenn alle mit demselben time cockpit Mandanten arbeiten. Andernfalls verwenden Sie `"X-tc-tenant-id": "${TC_TENANT_ID}"` – Claude Code ersetzt `${VAR}` in `url` und `headers`.

## Fehlerbehebung

| Meldung | Ursache / Lösung |
|---------|------------------|
| `The term 'claude' is not recognized …` | Nicht installiert, oder das Terminal wurde nach der Installation nicht neu geöffnet. |
| `error: missing required argument 'name'` | Name und URL stehen nach den Optionen. Ändern Sie die Reihenfolge oder verwenden Sie `add-json`. |
| `does not support dynamic client registration` | Keine Client-ID konfiguriert (`oauth.clientId`). |
| `AADSTS50011: redirect URI … does not match` | `http://localhost:64485/callback` ist in Ihrer App-Registrierung nicht eingetragen. Siehe [Einrichtung in Entra ID](~/doc/mcp/entra-id-einrichtung.md). |
| `AADSTS9010010` | Die URL des MCP-Servers ist nicht als Application ID URI der Ressourcenanwendung registriert. Wenden Sie sich an den Support. |
| `/mcp` zeigt *needs authentication* | Führen Sie `claude mcp login timecockpit` aus oder wählen Sie **Authenticate** in `/mcp`. |
| Falsche Daten / falscher Mandant | Rufen Sie das Tool `entra_whoami` auf – es zeigt Identität, ermittelten Mandanten, Sandbox, Zugriff und Bereich. |

## Verwandte Seiten

- [Überblick über den MCP-Server](~/doc/mcp/ueberblick.md)
- [Claude App, claude.ai und Cowork](~/doc/mcp/claude-app.md)
- [Zuordnung der Konfigurationsfelder](~/doc/mcp/verbindung-pruefen.md#zuordnung-der-konfigurationsfelder)
- [Dokumentation von Claude Code zu MCP](https://code.claude.com/docs/en/mcp)
