---
title: MCP-Server - Verbindung prüfen
description: "Eine MCP-Verbindung zu time cockpit mit den Tools ping, get_environment, get_current_user und entra_whoami prüfen und fehlende Tools verstehen."
en_page: doc/mcp/verify-connection.md
---
# Verbindung prüfen

> [!WARNING]
> Im Aufbau: Der MCP-Server von time cockpit und diese Dokumentation werden aktiv weiterentwickelt, inkompatible Änderungen sind möglich. Tools können umbenannt, geändert oder entfernt werden, und Dialogbeschriftungen sowie Konfigurationsschritte können sich ohne Ankündigung ändern. Prüfen Sie diese Seite auf Aktualisierungen, bevor Sie die Einrichtung für Ihre Benutzer ausrollen, und rechnen Sie damit, Ihre Konfiguration, Skills und Prompts nach einem Update anpassen zu müssen.

Rufen Sie nach dem Konfigurieren eines Clients die Diagnose-Tools des Servers in dieser Reihenfolge auf. Je nach Client können die Tool-Namen das Präfix `timecockpit__` tragen.

1. `ping` – der Server ist erreichbar und die Anfrage ist authentifiziert.
2. `get_environment` – Sie sind bei einem echten Mandanten angemeldet (`currentUser`, `globalSettings`, `namedSets`).
3. `get_current_user` – der Assistent handelt als die richtige Person.
4. `entra_whoami` (nur Remote-Server) – Entra-Identität plus der **ermittelte** Mandant, Sandbox, Zugriff und Umfang. Das belegt, dass Header oder URL-Segmente beim Server angekommen sind.

Ein Prompt wie *„Rufe ping, get_environment, get_current_user und entra_whoami auf dem time cockpit Server auf und fasse das Ergebnis zusammen“* funktioniert in jedem Client.

## Fehlende Tools

Fehlende Tools sind meist eine Frage der Konfiguration:

- `access=readonly` blendet alle schreibenden Tools aus.
- `scope=owndata` blendet alles aus, was sich nicht auf den aktuellen Benutzer einschränken lässt.
- Die Tools für benannte Listen (`get_lists`, `describe_list`, `execute_list`) hängen von optionalen Serverfunktionen ab und können in einer Bereitstellung fehlen.
- Modellaktionen sind über den MCP-Server nicht verfügbar; führen Sie sie in der Oberfläche von time cockpit aus.

Wie diese Werte übergeben werden, lesen Sie unter [Verbindungseinstellungen](~/doc/mcp/ueberblick.md#verbindungseinstellungen-header-oder-url-segment).

## Zuordnung der Konfigurationsfelder

Dieselbe Einstellung hat in jedem Client einen anderen Namen:

| Bedeutung | Codex `config.toml` | Claude Code `.mcp.json` | VS Code `mcp.json` | Copilot CLI `mcp-config.json` | Cursor `mcp.json` (nicht getestet) |
|---------|--------------------|-------------------------|--------------------|-------------------------------|--------------------------------|
| Servereintrag | `[mcp_servers.<name>]` | `mcpServers.<name>` | `servers.<name>` | `mcpServers.<name>` | `mcpServers.<name>` |
| Transport | `url` | `"type":"http"`, `url` | `"type":"http"`, `url` | `"type":"http"`, `url` | `url` |
| Statische Header | `http_headers = { }` | `headers` | `headers` | `headers` | `headers` |
| Header aus Umgebungsvariable/Eingabe | `env_http_headers` | `"${VAR}"` in `headers` | `"${input:id}"` + `inputs` | — | `"${env:VAR}"` in `headers` |
| Client-ID | `oauth.client_id` / `--oauth-client-id` | `oauth.clientId` / `--client-id` | `oauth.clientId` | `oauth.clientId` (Berichten zufolge ignoriert) | `auth.CLIENT_ID` |
| Callback-Port | `oauth.callback_port` | `oauth.callbackPort` / `--callback-port` | — (MSAL) | `oauth.callbackPort` | — (fest `8787`) |
| Client Secret | — | `--client-secret` (CLI) | CodeLens "Set Client Secret" | — | `auth.CLIENT_SECRET` |
| Anmeldung auslösen | `codex mcp login <name>` | `claude mcp login <name>` / `/mcp` | Server starten → Dialog **Allow** | `/mcp` → Server → **Sign in** | **Customize** → Server → Login / `agent mcp login <name>` |
| Status | `codex mcp list`, `/mcp` | `claude mcp list`, `/mcp` | **MCP: List Servers** | `/mcp` | `agent mcp list`, **MCP Logs** |

## Verwandte Seiten

- [Überblick über den MCP-Server](~/doc/mcp/ueberblick.md)
- [Begleitende Skills](~/doc/mcp/begleitende-skills.md) – der Skill `timecockpit-mcp-setup` automatisiert diese Prüfungen
