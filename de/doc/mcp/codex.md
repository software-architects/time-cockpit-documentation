---
title: MCP-Server - Einrichtung in OpenAI Codex
description: "Den MCP-Server von time cockpit in OpenAI Codex (CLI, Desktop-App, IDE) per codex mcp add oder config.toml registrieren und mit Entra ID anmelden."
en_page: doc/mcp/codex.md
---
# OpenAI Codex (CLI, Desktop-App, IDE-Erweiterung)

> [!WARNING]
> Im Aufbau: Der MCP-Server von time cockpit und diese Dokumentation werden aktiv weiterentwickelt, inkompatible Änderungen sind möglich. Tools können umbenannt, geändert oder entfernt werden, und Dialogbeschriftungen sowie Konfigurationsschritte können sich ohne Ankündigung ändern. Prüfen Sie diese Seite auf Aktualisierungen, bevor Sie die Einrichtung für Ihre Benutzer ausrollen, und rechnen Sie damit, Ihre Konfiguration, Skills und Prompts nach einem Update anpassen zu müssen.

Codex liest MCP-Server aus `%USERPROFILE%\.codex\config.toml` (global; `CODEX_HOME`) oder aus `.codex\config.toml` im Projekt. **CLI, Desktop-App und IDE-Erweiterung verwenden diese Datei gemeinsam** – ein einmal registrierter Server ist überall sichtbar. Die folgende Konfiguration ist produktiv im Einsatz und funktioniert.

> [!NOTE]
> Die auf dieser Seite gezeigten Terminalausgaben dienen der Veranschaulichung. Versionsnummern, Callback-IDs und Anzahl der Tools können abweichen.

## Codex installieren und anmelden

```powershell
npm install -g @openai/codex
codex --version
codex login
```

Alternativ installieren Sie die Desktop-App von Codex, die die CLI enthält. `codex login` meldet Sie bei Ihrem ChatGPT-Konto an – nicht zu verwechseln mit der MCP-Anmeldung weiter unten.

## Option A (empfohlen): alles über die CLI

Es muss keine Datei bearbeitet werden. `codex mcp add` schreibt den Server in die globale `config.toml`, übernimmt Ihre Client-ID direkt und **startet die Anmeldung sofort**, sobald es OAuth-Metadaten auf dem Server findet. Ein Befehl, eine Anmeldung im Browser, fertig:

```powershell
codex mcp add timecockpit --url https://mcp.timecockpit.com --oauth-client-id <client-id>
codex mcp list
```

```text
Added global MCP server 'timecockpit'.
OAuth callback URL: http://127.0.0.1/callback/XuuuHAzzHOni
Detected OAuth support. Starting OAuth flow…
Opening browser to authenticate with timecockpit...
✔ Successfully logged in to MCP server timecockpit

Name          Url                          Bearer Token Env Var  Status   Auth
timecockpit   https://mcp.timecockpit.com  -                     enabled  OAuth
```

Mandant, Sandbox und Modi werden als [URL-Segmente](~/doc/mcp/ueberblick.md#verbindungseinstellungen-header-oder-url-segment) statt als Header übergeben, daher ist keine Bearbeitung der TOML-Datei nötig. Um die URL eines vorhandenen Eintrags zu ändern, entfernen Sie ihn und fügen ihn neu hinzu. Beachten Sie, dass die Callback-ID in der Redirect-URI aus der **vollständigen** Server-URL abgeleitet wird. Eine geänderte URL (zusätzliche Segmente oder die Preview-Umgebung) ergibt daher eine neue „OAuth callback URL", die in Ihrer App-Registrierung eingetragen sein muss, bevor die Anmeldung gelingt – siehe [Besonderheiten der Callback-URL](#besonderheiten-der-callback-url). Außerdem müssen Sie sich erneut anmelden, weil Tokens pro Server-URL gespeichert werden:

```powershell
codex mcp remove timecockpit
codex mcp add timecockpit --url https://mcp.timecockpit.com/tcTenantId/<tenant-id>/access/readonly/scope/owndata --oauth-client-id <client-id>
```

Befehle für den Lebenszyklus:

| Befehl | Zweck |
|---------|---------|
| `codex mcp add <name> --url <url> --oauth-client-id <id>` | Server anlegen; gibt die „OAuth callback URL" aus und startet die Anmeldung. Weitere Flags: `--oauth-client-registration AUTO\|CIMD\|DCR`, `--oauth-resource`, `--bearer-token-env-var` |
| `codex mcp login <name>` | Anmeldung (erneut) starten, z. B. nach Ablauf oder Abmeldung; `--no-browser` für Server/WSL, `--scopes` nur, wenn der Server den Scope nicht bekanntgibt |
| `codex mcp list [--json]` | Status und Authentifizierung (OAuth, Not logged in, Bearer token, Unsupported) |
| `codex mcp get <name>` | Konfiguration eines Servers anzeigen |
| `codex mcp logout <name>` | Gespeicherte OAuth-Anmeldedaten löschen |
| `codex mcp remove <name>` | Server entfernen |

> [!NOTE]
> Grenzen des CLI-Wegs: `codex mcp add` hat **keine** Flags für statische HTTP-Header oder einen festen Callback-Port (es schreibt `http_headers = None`, `callback_port = None`). Header sind dank URL-Segmenten nicht nötig. Der Callback-Port ist auf diesem Weg **flüchtig** (ephemeral), daher muss die Entra-Registrierung `http://127.0.0.1/callback/<id>` mit beliebigem Port akzeptieren (Loopback-Regel nach RFC 8252 §7.3). Schlägt die Anmeldung wegen der Redirect-URI fehl oder benötigen Sie einen echten Header, verwenden Sie Option B.

## Option B: config.toml (Header, fester Port)

Sie können die Datei auch direkt pflegen. Das ist sinnvoll für einen festen Callback-Port (`64485`, wie bei Claude Code), einen echten Header oder eine `.codex/config.toml` auf Projektebene (z. B. angelegt von `apm install`).

Abschnitt in `%USERPROFILE%\.codex\config.toml`:

```toml
[mcp_servers.timecockpit]
url = "https://mcp.timecockpit.com"
http_headers = { "X-tc-tenant-id" = "<tenant-id>" }   # optional, see connection settings
enabled = true

[mcp_servers.timecockpit.oauth]
client_id = "<client-id>"
callback_port = 64485
```

Führen Sie dann `codex mcp login timecockpit` aus. Die Schlüssel im Überblick:

| Schlüssel | Bedeutung |
|-----|---------|
| `url` | Streamable-HTTP-Endpunkt (erforderlich) |
| `http_headers` | Statische Header; werden auch bei der OAuth-Ermittlung gesendet |
| `env_http_headers` | Header, deren Wert aus einer Umgebungsvariable stammt, z. B. `{ "X-tc-tenant-id" = "TC_TENANT_ID" }` |
| `bearer_token_env_var` | Alternative zu OAuth: statisches Token aus einer Umgebungsvariable |
| `enabled`, `required`, `startup_timeout_sec`, `tool_timeout_sec` | Aktivierung, erforderlicher Server für `codex exec`, Timeouts (Standard 10 s / 60 s) |
| `scopes`, `oauth_resource` | Optional: explizite Scopes oder RFC-8707-Ressource – mit Entra nur bei Bedarf (siehe Fehlerbehebung) |
| `oauth.client_id` | Client-ID Ihrer App-Registrierung („always takes precedence and skips client registration") |
| `oauth.callback_port` | Fester Loopback-Port; hat Vorrang vor dem globalen `mcp_oauth_callback_port` |
| `oauth.callback_url` | Wird von `codex mcp add` geschrieben; die registrierte Callback-URL (siehe unten) |
| `mcp_oauth_callback_port`, `mcp_oauth_callback_url` (oberste Ebene) | Globaler fester Port oder alternative Redirect-URI für alle Server |
| `mcp_oauth_credentials_store` (oberste Ebene) | `auto` (Standard: Keyring, sonst Datei), `keyring`, `file` (`CODEX_HOME/.credentials.json`) |

Das frühere experimentelle Flag `experimental_use_rmcp_client` wird nicht mehr benötigt. Codex kennt kein `client_secret` – es ist immer ein Public Client mit PKCE.

## Authentifizierung: CLI, TUI, App

**CLI (Standardweg):** Bei Option A erfolgt die Anmeldung während `add`; danach können Sie sie jederzeit wiederholen:

```powershell
codex mcp login timecockpit
codex mcp login timecockpit --no-browser    # prints the URL; paste the redirect URL back
codex mcp login timecockpit --scopes https://mcp.timecockpit.com/mcp.access    # only if the server does not advertise the scope
```

```text
Starting local callback server on http://127.0.0.1:64485 ...
Opening browser to authenticate with timecockpit...
If the browser does not open, visit:
https://login.microsoftonline.com/organizations/oauth2/v2.0/authorize?client_id=<client-id>&redirect_uri=http%3A%2F%2F127.0.0.1%3A64485%2Fcallback%2FXuuuHAzzHOni&response_type=code&code_challenge_method=S256...
✔ Successfully logged in to MCP server timecockpit
```

Mit `--no-browser` gibt Codex die URL aus und bittet Sie, die endgültige Redirect-URL (`http://127.0.0.1:64485/callback/<id>?code=…&state=…`) zurück ins Terminal einzufügen.

**In der TUI:** `/mcp` zeigt die Server mit Authentifizierungsstatus (*Not logged in* / *OAuth*) und ihrer Tool-Liste, startet die Anmeldung aber nicht selbst – führen Sie `codex mcp login` in einer zweiten Shell aus.

```text
MCP servers

• timecockpit  https://mcp.timecockpit.com
  Auth: OAuth (logged in)
  Tools: ping, get_current_user, get_entities, describe_entity, execute_tcql_query, get_timesheets, create_timesheet, … (16)

Use /mcp verbose for details. To (re)authenticate run: codex mcp login timecockpit
```

**Desktop-App:** **Settings → Integrations and MCP** (je nach Version: **Plugins → MCPs**). Erfordert ein Server OAuth, bietet die App eine Schaltfläche **Authenticate** an. Nach einer Anmeldung über die CLI muss ein bereits geöffneter Thread neu gestartet werden.

Tokens werden in der Windows-Anmeldeinformationsverwaltung (Keyring) gespeichert, mit `~/.codex/.credentials.json` als Ausweichlösung. `codex mcp logout timecockpit` löscht sie.

## Prüfen

```powershell
codex mcp list
codex mcp get timecockpit
```

```text
Name          Url                          Bearer Token Env Var  Status   Auth
timecockpit   https://mcp.timecockpit.com  -                     enabled  OAuth

timecockpit
  url: https://mcp.timecockpit.com
  http_headers: { X-tc-tenant-id = <tenant-id> }
  oauth.client_id: <client-id>
  oauth.callback_port: 64485
  enabled: true
```

Folgen Sie danach [Verbindung prüfen](~/doc/mcp/verbindung-pruefen.md).

## Besonderheiten der Callback-URL

Codex bindet den Callback-Listener immer an `127.0.0.1` (nicht `localhost`). Wenn die Metadaten des Autorisierungsservers `authorization_response_iss_parameter_supported` nicht melden – was bei Entra ID der Fall ist –, hängt Codex eine 12-stellige ID an den Pfad an, die aus der **vollständigen** Server-URL (Host und alle Pfadsegmente) abgeleitet wird: `http://127.0.0.1:<port>/callback/<id>`. Folglich haben `https://mcp.timecockpit.com`, `https://mcp.timecockpit.com/access/readonly` und `https://mcp-preview.timecockpit.com` jeweils eine andere Callback-ID und benötigen jeweils eine eigene Redirect-URI in der App-Registrierung. Den genauen Wert gibt `codex mcp add … --oauth-client-id` aus („OAuth callback URL"), und er wird in `oauth.callback_url` gespeichert. Genau dieser Wert muss in Ihrer App-Registrierung eingetragen sein; URIs mit `127.0.0.1` lassen sich im Entra-Portal nur über das App-Manifest hinzufügen (`replyUrlsWithType`, Typ `InstalledClient`) – siehe [Einrichtung in Entra ID](~/doc/mcp/entra-id-einrichtung.md). Bei Option A ist der Port flüchtig, registrieren Sie die URI daher ohne Port; bei Option B mit festem `callback_port` registrieren Sie sie mit Port.

## Fehlerbehebung

| Meldung / Symptom | Ursache / Lösung |
|-------------------|------------------|
| `Dynamic client registration not supported` | `oauth.client_id` fehlt. Verwenden Sie `--oauth-client-id`. |
| Entra: Redirect-URI stimmt nicht überein | Die Callback-URL (siehe oben) ist in Ihrer App-Registrierung nicht eingetragen oder als *Web* statt als *Mobile and desktop* / `InstalledClient` eingetragen. |
| `AADSTS9010010` / `invalid_target` | Entra lehnt den `resource`-Parameter ab, weil er nicht zum Scope passt. Setzen Sie `oauth_resource` nicht; setzen Sie bei Bedarf `scopes = ["https://mcp.timecockpit.com/mcp.access"]` explizit. |
| `Port 127.0.0.1:64485 is already in use` | Ein anderer Prozess belegt den Port (z. B. eine gleichzeitige Anmeldung in Claude Code). Warten Sie oder wählen Sie für Codex einen anderen Port. |
| Desktop-App zeigt *OAuth authorization required* trotz Anmeldung über die CLI | Starten Sie den Thread oder die App neu. |
| Browser öffnet sich nicht (Server, WSL) | `codex mcp login timecockpit --no-browser` |

## Verwandte Seiten

- [Überblick über den MCP-Server](~/doc/mcp/ueberblick.md)
- [Zuordnung der Konfigurationsfelder](~/doc/mcp/verbindung-pruefen.md#zuordnung-der-konfigurationsfelder)
- [Dokumentation von OpenAI Codex zu MCP](https://developers.openai.com/codex/mcp)
