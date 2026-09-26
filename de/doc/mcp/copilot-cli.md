---
title: MCP-Server - GitHub Copilot CLI
description: "Status des MCP-Servers von time cockpit mit der GitHub Copilot CLI und dem Copilot Coding Agent: Konfigurationsorte und bekannte Grenzen der Anmeldung."
en_page: doc/mcp/copilot-cli.md
---
# GitHub Copilot CLI

> [!WARNING]
> Im Aufbau: Der MCP-Server von time cockpit und diese Dokumentation werden aktiv weiterentwickelt, inkompatible Änderungen sind möglich. Tools können umbenannt, geändert oder entfernt werden, und Dialogbeschriftungen sowie Konfigurationsschritte können sich ohne Ankündigung ändern. Prüfen Sie diese Seite auf Aktualisierungen, bevor Sie die Einrichtung für Ihre Benutzer ausrollen, und rechnen Sie damit, Ihre Konfiguration, Skills und Prompts nach einem Update anpassen zu müssen.

Der Terminal-Agent `copilot` speichert MCP-Server in `%USERPROFILE%\.copilot\mcp-config.json`; pro Projekt zusätzlich in `.mcp.json` oder `.github\mcp.json` (die Datei, die dem Arbeitsverzeichnis am nächsten liegt, gewinnt). `apm install` kann den Eintrag `timecockpit` in `.github/mcp.json` schreiben – siehe [Begleitende Skills](~/doc/mcp/begleitende-skills.md).

> [!WARNING]
> Prüfung erforderlich: Die Anmeldung der Copilot CLI bei Microsoft Entra ID ist derzeit **nicht verifiziert**. Die Copilot CLI verwendet standardmäßig Dynamic Client Registration, und eine konfigurierte `oauth.clientId` wird Berichten zufolge ignoriert, was mit Entra ID fehlschlägt. Solange kein Test mit einer aktuellen Version erfolgreich ist, betrachten Sie diesen Client als *nicht unterstützt / in Evaluierung* und verwenden Sie stattdessen [Visual Studio Code](~/doc/mcp/vscode.md).

## Server hinzufügen

Interaktiv in einer Sitzung mit `/mcp add`: Felder *Server Name*, *Server Type* (HTTP/SSE), *URL*, *HTTP Headers* (Format `Key: value`), *Tools* (`*` für alle); speichern mit **STRG+S**.

```text
Add MCP Server

Server Name:   timecockpit
Server Type:   ○ Local/STDIO   ● HTTP/SSE
URL:           https://mcp.timecockpit.com
HTTP Headers:  X-tc-tenant-id: <tenant-id>
Tools:         *

Ctrl+S to save · Esc to cancel
```

Der resultierende Eintrag in `%USERPROFILE%\.copilot\mcp-config.json`:

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
      },
      "tools": ["*"]
    }
  }
}
```

## Status der Anmeldung

Die Copilot CLI unterstützt OAuth für Remote-Server, verwendet aber standardmäßig **Dynamic Client Registration**, die Entra ID nicht unterstützt. Neuere Versionen (1.0.68, 1.0.81) enthalten Entra-spezifische Verbesserungen (Vanity-Domains, WAM-Broker unter Windows), eine Bestätigung für statische Client-IDs fehlt jedoch noch.

## Verwandt: GitHub Copilot Coding Agent

Der Cloud-Agent auf github.com (**Repository settings → Copilot → MCP servers**) unterstützt HTTP-Server mit Headern und `COPILOT_MCP_*`-Secrets, laut GitHub-Dokumentation aber **kein OAuth** für Remote-Server. Ohne statisches Token auf dem time cockpit Server kann er derzeit nicht verwendet werden.

## Verwandte Seiten

- [Überblick über den MCP-Server](~/doc/mcp/ueberblick.md)
- [Visual Studio Code (Copilot-Agent-Modus)](~/doc/mcp/vscode.md)
- [GitHub: Add MCP servers to Copilot CLI](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-mcp-servers)
