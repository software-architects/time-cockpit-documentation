---
title: MCP Server - Verify the Connection
description: Check a time cockpit MCP connection with the ping, get_environment, get_current_user, and entra_whoami tools, understand why tools may be missing, and compare configuration fields across clients.
---
# Verify the Connection

> [!WARNING]
> Under construction: The time cockpit MCP server and this documentation are under active development, and breaking changes are possible. Tools may be renamed, changed or removed, and dialog labels and configuration steps may change without notice. Check back for updates before rolling the setup out to your users, and expect to adapt your configuration, skills and prompts after an update.

After configuring a client, call the server's diagnostic tools in this order. Depending on the client, tool names may be prefixed with `timecockpit__`.

1. `ping` — the server is reachable and the request is authenticated.
2. `get_environment` — you are signed in to a real tenant (`currentUser`, `globalSettings`, `namedSets`).
3. `get_current_user` — the assistant acts as the right person.
4. `entra_whoami` (remote server only) — Entra identity plus the **resolved** tenant, sandbox, access and scope. This proves that headers or URL segments arrived at the server.

A prompt such as *"Call ping, get_environment, get_current_user and entra_whoami on the time cockpit server and summarize the result"* works in every client.

## Missing Tools

Missing tools are usually a matter of configuration:

- `access=readonly` hides all writing tools.
- `scope=owndata` hides everything that cannot be restricted to the current user.
- The named-list tools (`get_lists`, `describe_list`, `execute_list`) depend on optional server capabilities and may be absent in a deployment.
- Model actions are not available through the MCP server; run them in the time cockpit UI.

See [connection settings](overview.md#connection-settings-header-or-url-segment) for how these values are passed.

## Configuration Field Mapping

The same setting has different names in each client:

| Meaning | Codex `config.toml` | Claude Code `.mcp.json` | VS Code `mcp.json` | Copilot CLI `mcp-config.json` |
|---------|--------------------|-------------------------|--------------------|-------------------------------|
| Server entry | `[mcp_servers.<name>]` | `mcpServers.<name>` | `servers.<name>` | `mcpServers.<name>` |
| Transport | `url` | `"type":"http"`, `url` | `"type":"http"`, `url` | `"type":"http"`, `url` |
| Static headers | `http_headers = { }` | `headers` | `headers` | `headers` |
| Headers from env/input | `env_http_headers` | `"${VAR}"` in `headers` | `"${input:id}"` + `inputs` | — |
| Client ID | `oauth.client_id` / `--oauth-client-id` | `oauth.clientId` / `--client-id` | `oauth.clientId` | `oauth.clientId` (reportedly ignored) |
| Callback port | `oauth.callback_port` | `oauth.callbackPort` / `--callback-port` | — (MSAL) | `oauth.callbackPort` |
| Client secret | — | `--client-secret` (CLI) | CodeLens "Set Client Secret" | — |
| Trigger sign-in | `codex mcp login <name>` | `claude mcp login <name>` / `/mcp` | start server → dialog **Allow** | `/mcp` → server → **Sign in** |
| Status | `codex mcp list`, `/mcp` | `claude mcp list`, `/mcp` | **MCP: List Servers** | `/mcp` |

## Related Pages

- [MCP Server Overview](overview.md)
- [Companion Skills](companion-skills.md) — the `timecockpit-mcp-setup` skill automates these checks
