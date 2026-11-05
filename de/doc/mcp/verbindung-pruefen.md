---
title: MCP-Server - Verbindung prüfen
description: "MCP-Verbindung zu time cockpit mit ping, get_environment, get_current_user und entra_whoami prüfen, abgelehnte Anmeldungen und fehlende Tools beheben."
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

## Anmeldung von time cockpit abgelehnt

Lehnt time cockpit die Anmeldung für Ihr Konto oder für den gewählten Mandanten bzw. die gewählte Sandbox ab, listet der Remote-Server keine Tools und beantwortet jeden Aufruf mit einer Meldung, die den Grund nennt. Auch `entra_whoami` steht erst nach erfolgreicher Anmeldung zur Verfügung. Die Meldung endet mit den Fehlercodes, zum Beispiel `(error: invalid_grant, AmbiguousTenantMapping)`; geben Sie diese an, wenn Sie den Support kontaktieren. Die Meldungen selbst sind englisch.

| Code | Die Meldung besagt | Was zu tun ist |
|------|--------------------|----------------|
| `AmbiguousTenantMapping` | time cockpit hat für Ihr Microsoft-Entra-Konto mehr als einen Mandanten gefunden | Wählen Sie den Mandanten mit der Mandanten-[Verbindungseinstellung](~/doc/mcp/ueberblick.md#verbindungseinstellungen-header-oder-url-segment). Die Mandanten-ID erhalten Sie von Ihrem Administrator. |
| `NoTenantMapping` | für Ihre Microsoft-Entra-Organisation ist kein Mandant für die Anmeldung eingerichtet | Bitten Sie Ihren time cockpit Administrator, die Anmeldung mit Microsoft Entra für Ihren Mandanten einzurichten. |
| `RequestedTenantNotAllowed` | time cockpit kann Ihr Microsoft-Entra-Konto nicht beim Mandanten anmelden | Prüfen Sie die Mandanten-ID in Ihrer Konfiguration. Der Mandant muss Anmeldungen aus Ihrer Microsoft-Entra-Organisation zulassen. |
| `InvalidRequestedTenantId` | die Mandanten-Einstellung ist keine Mandanten-ID | Verwenden Sie die Mandanten-ID (eine GUID) oder lassen Sie die Einstellung weg. |
| `UserNotAllowed` | time cockpit lässt die Anmeldung Ihres Benutzers nicht zu | Prüfen Sie, ob Ihr Microsoft-Entra-Konto mit einem time cockpit Benutzer verknüpft ist. |
| `UserInactive` | Ihr time cockpit Benutzer ist gesperrt oder inaktiv | Bitten Sie Ihren Administrator, Ihren Benutzer zu entsperren oder wieder zu aktivieren. |
| `SandboxNotAllowed` | Ihr time cockpit Benutzer darf die Sandbox nicht verwenden | Bitten Sie Ihren Administrator um Zugriff auf die Sandbox oder verbinden Sie sich ohne Sandbox-Einstellung. |
| `UnknownSandboxEnvironment` | die Sandbox-Einstellung nennt keine Sandbox | Verwenden Sie `test` oder lassen Sie die Einstellung weg, um in der Produktion zu arbeiten. |
| `InvalidSubjectToken` | time cockpit hat Ihre Microsoft-Entra-Anmeldung nicht akzeptiert | Melden Sie sich in Ihrem Client erneut beim MCP-Server an. Hilft das nicht, kontaktieren Sie Ihren Administrator. |
| andere Codes | die Anmeldung des MCP-Servers bei time cockpit ist falsch konfiguriert | Auf Ihrer Seite ist nichts zu ändern; kontaktieren Sie Ihren Administrator oder den time cockpit Support. |

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
