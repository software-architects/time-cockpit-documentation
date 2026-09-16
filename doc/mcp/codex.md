---
title: MCP Server - OpenAI Codex Setup
description: Register the time cockpit MCP server in OpenAI Codex (CLI, desktop app, IDE extension) with codex mcp add or config.toml, sign in with Microsoft Entra ID, and troubleshoot common errors.
---
# OpenAI Codex (CLI, Desktop App, IDE Extension)

Codex reads MCP servers from `%USERPROFILE%\.codex\config.toml` (global; `CODEX_HOME`) or from `.codex\config.toml` in the project. **CLI, desktop app and IDE extension share this file** — a server registered once is visible everywhere. The configuration below is in production use and works.

> [!NOTE]
> Terminal output shown on this page is illustrative. Version numbers, callback IDs and tool counts vary.

## Install and Sign In to Codex

```powershell
npm install -g @openai/codex
codex --version
codex login
```

Alternatively install the Codex desktop app, which includes the CLI. `codex login` signs in to your ChatGPT account — not to be confused with the MCP sign-in below.

## Option A (Recommended): Everything via the CLI

No file has to be edited. `codex mcp add` writes the server to the global `config.toml`, accepts the pre-registered client ID directly and — as soon as it finds OAuth metadata on the server — **starts the sign-in flow immediately**. One command, one browser sign-in, done:

```powershell
codex mcp add timecockpit --url https://mcp.timecockpit.com --oauth-client-id 41a831af-fb94-4c39-8dfe-e9c9b8a1b18a
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

Tenant, sandbox and modes are passed as [URL segments](overview.md#connection-settings-header-or-url-segment) rather than headers, so no TOML editing is required. To change the URL of an existing entry, remove it and add it again:

```powershell
codex mcp remove timecockpit
codex mcp add timecockpit --url https://mcp.timecockpit.com/tcTenantId/<tenant-id>/access/readonly/scope/owndata --oauth-client-id 41a831af-fb94-4c39-8dfe-e9c9b8a1b18a
```

Lifecycle commands:

| Command | Purpose |
|---------|---------|
| `codex mcp add <name> --url <url> --oauth-client-id <id>` | Create the server; prints the "OAuth callback URL" and starts sign-in. Further flags: `--oauth-client-registration AUTO\|CIMD\|DCR`, `--oauth-resource`, `--bearer-token-env-var` |
| `codex mcp login <name>` | Start sign-in (again), e.g. after expiry or logout; `--no-browser` for servers/WSL, `--scopes` only if the server does not advertise the scope |
| `codex mcp list [--json]` | Status and auth (OAuth, Not logged in, Bearer token, Unsupported) |
| `codex mcp get <name>` | Show a server's configuration |
| `codex mcp logout <name>` | Delete stored OAuth credentials |
| `codex mcp remove <name>` | Remove the server |

> [!NOTE]
> Limits of the CLI route: `codex mcp add` has **no** flags for static HTTP headers or a fixed callback port (it writes `http_headers = None`, `callback_port = None`). Headers are unnecessary thanks to URL segments. The callback port is **ephemeral** on this route, so the Entra registration must accept `http://127.0.0.1/callback/<id>` with any port (loopback rule per RFC 8252 §7.3). If sign-in fails because of the redirect URI, or if you need a real header, use Option B.

## Option B: config.toml (Headers, Fixed Port)

You can also maintain the file directly. This is useful for a fixed callback port (`64485`, as with Claude Code), a real header, or a project-level `.codex/config.toml` (e.g. created by `apm install`).

Section in `%USERPROFILE%\.codex\config.toml`:

```toml
[mcp_servers.timecockpit]
url = "https://mcp.timecockpit.com"
http_headers = { "X-tc-tenant-id" = "<tenant-id>" }   # optional, see connection settings
enabled = true

[mcp_servers.timecockpit.oauth]
client_id = "41a831af-fb94-4c39-8dfe-e9c9b8a1b18a"
callback_port = 64485
```

Then run `codex mcp login timecockpit`. Keys at a glance:

| Key | Meaning |
|-----|---------|
| `url` | Streamable HTTP endpoint (required) |
| `http_headers` | Static headers; also sent during OAuth discovery |
| `env_http_headers` | Headers whose value comes from an environment variable, e.g. `{ "X-tc-tenant-id" = "TC_TENANT_ID" }` |
| `bearer_token_env_var` | Alternative to OAuth: static token from an environment variable |
| `enabled`, `required`, `startup_timeout_sec`, `tool_timeout_sec` | Activation, required server for `codex exec`, timeouts (defaults 10 s / 60 s) |
| `scopes`, `oauth_resource` | Optional: explicit scopes or RFC 8707 resource — with Entra only when needed (see troubleshooting) |
| `oauth.client_id` | Pre-registered client ID ("always takes precedence and skips client registration") |
| `oauth.callback_port` | Fixed loopback port; takes precedence over the global `mcp_oauth_callback_port` |
| `oauth.callback_url` | Written by `codex mcp add`; the registered callback URL (see below) |
| `mcp_oauth_callback_port`, `mcp_oauth_callback_url` (top level) | Global fixed port or alternative redirect URI for all servers |
| `mcp_oauth_credentials_store` (top level) | `auto` (default: keyring, otherwise file), `keyring`, `file` (`CODEX_HOME/.credentials.json`) |

The former experimental flag `experimental_use_rmcp_client` is no longer needed. Codex has no `client_secret` — it is always a public client with PKCE.

## Authentication: CLI, TUI, App

**CLI (standard route):** With Option A the sign-in happens during `add`; afterwards you can repeat it at any time:

```powershell
codex mcp login timecockpit
codex mcp login timecockpit --no-browser    # prints the URL; paste the redirect URL back
codex mcp login timecockpit --scopes https://mcp.timecockpit.com/mcp.access    # only if the server does not advertise the scope
```

```text
Starting local callback server on http://127.0.0.1:64485 ...
Opening browser to authenticate with timecockpit...
If the browser does not open, visit:
https://login.microsoftonline.com/organizations/oauth2/v2.0/authorize?client_id=41a831af-...&redirect_uri=http%3A%2F%2F127.0.0.1%3A64485%2Fcallback%2FXuuuHAzzHOni&response_type=code&code_challenge_method=S256...
✔ Successfully logged in to MCP server timecockpit
```

With `--no-browser`, Codex prints the URL and asks you to paste the final redirect URL (`http://127.0.0.1:64485/callback/<id>?code=…&state=…`) back into the terminal.

**In the TUI:** `/mcp` shows the servers with auth status (*Not logged in* / *OAuth*) and their tool list, but does not start the sign-in itself — run `codex mcp login` in a second shell.

```text
MCP servers

• timecockpit  https://mcp.timecockpit.com
  Auth: OAuth (logged in)
  Tools: list_projects, list_customers, list_tasks, query_timesheets, create_timesheet, … (12)

Use /mcp verbose for details. To (re)authenticate run: codex mcp login timecockpit
```

**Desktop app:** **Settings → Integrations and MCP** (depending on version: **Plugins → MCPs**). If a server requires OAuth, the app offers an **Authenticate** button. After a CLI sign-in, an already open thread has to be restarted.

Tokens are stored in the Windows Credential Manager (keyring), with `~/.codex/.credentials.json` as fallback. `codex mcp logout timecockpit` deletes them.

## Verify

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
  oauth.client_id: 41a831af-fb94-4c39-8dfe-e9c9b8a1b18a
  oauth.callback_port: 64485
  enabled: true
```

Then follow [Verify the Connection](verify-connection.md).

## Callback URL Specifics

Codex always binds the callback listener to `127.0.0.1` (not `localhost`). If the authorization server metadata does not report `authorization_response_iss_parameter_supported` — which is the case with Entra ID — Codex appends a 12-character ID derived from the server URL to the path: `http://127.0.0.1:<port>/callback/<id>`. The exact value is printed by `codex mcp add … --oauth-client-id` ("OAuth callback URL") and stored in `oauth.callback_url`. Exactly this value must be registered on the Entra client application; `127.0.0.1` URIs can only be added in the Entra portal via the app manifest (`replyUrlsWithType`). This is maintained centrally by time cockpit — see [Entra ID Setup](entra-id-setup.md).

## Troubleshooting

| Message / symptom | Cause / solution |
|-------------------|------------------|
| `Dynamic client registration not supported` | `oauth.client_id` is missing. Use `--oauth-client-id`. |
| Entra: redirect URI does not match | The callback URL (see above) is not registered, or is registered as *Web* instead of *Mobile and desktop*. Contact support. |
| `AADSTS9010010` / `invalid_target` | Entra rejects the `resource` parameter because it does not match the scope. Do not set `oauth_resource`; if needed set `scopes = ["https://mcp.timecockpit.com/mcp.access"]` explicitly. |
| `Port 127.0.0.1:64485 is already in use` | Another process holds the port (e.g. a simultaneous Claude Code sign-in). Wait, or choose a different port for Codex. |
| Desktop app shows *OAuth authorization required* despite CLI sign-in | Restart the thread or the app. |
| Browser does not open (server, WSL) | `codex mcp login timecockpit --no-browser` |

## Related Pages

- [MCP Server Overview](overview.md)
- [Configuration Field Mapping](verify-connection.md#configuration-field-mapping)
- [OpenAI Codex MCP documentation](https://developers.openai.com/codex/mcp)
