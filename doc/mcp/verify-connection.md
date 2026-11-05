---
title: MCP Server - Verify the Connection
description: "Check a time cockpit MCP connection with ping, get_environment, get_current_user and entra_whoami, and fix refused sign-ins and missing tools."
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

## Sign-in Refused by time cockpit

When time cockpit refuses the sign-in for your account, or for the tenant or sandbox you selected, the remote server still answers `ping`, but every other call, `entra_whoami` included, returns a message that names the reason. The message ends with the error codes, for example `(error: invalid_grant, AmbiguousTenantMapping)`; include them when you contact support.

| Code | The message says | What to do |
|------|------------------|------------|
| `AmbiguousTenantMapping` | time cockpit found more than one tenant for your Microsoft Entra account | Select the tenant with the tenant [connection setting](overview.md#connection-settings-header-or-url-segment). Your administrator has the tenant ID. |
| `NoTenantMapping` | time cockpit has no tenant set up for sign-in with your Microsoft Entra organization | Ask your time cockpit administrator to set up Microsoft Entra sign-in for your tenant. |
| `RequestedTenantNotAllowed` | time cockpit cannot sign your Microsoft Entra account in to the tenant | Check the tenant ID in your configuration. The tenant must accept sign-ins from your Microsoft Entra organization. |
| `InvalidRequestedTenantId` | the tenant setting is not a tenant ID | Use the tenant ID (a GUID), or leave the setting out. |
| `UserNotAllowed` | time cockpit does not allow your user to sign in | Check that your Microsoft Entra account is linked to a time cockpit user. |
| `UserInactive` | your time cockpit user is locked or inactive | Ask your administrator to unlock or reactivate your user. |
| `SandboxNotAllowed` | your time cockpit user is not allowed to use the sandbox environment | Ask your administrator for sandbox access, or connect without the sandbox setting. |
| `UnknownSandboxEnvironment` | the sandbox setting does not name a sandbox environment | Use `test`, or leave the setting out to work in production. |
| `InvalidSubjectToken` | time cockpit did not accept your Microsoft Entra sign-in | Sign in to the MCP server again in your client. If that does not help, contact your administrator. |
| other codes | the MCP server's sign-in to time cockpit is misconfigured | Nothing to change on your side; contact your administrator or time cockpit support. |

## Missing Tools

Missing tools are usually a matter of configuration:

- `access=readonly` hides all writing tools.
- `scope=owndata` hides everything that cannot be restricted to the current user.
- The named-list tools (`get_lists`, `describe_list`, `execute_list`) depend on optional server capabilities and may be absent in a deployment.
- Model actions are not available through the MCP server; run them in the time cockpit UI.

See [connection settings](overview.md#connection-settings-header-or-url-segment) for how these values are passed.

## Configuration Field Mapping

The same setting has different names in each client:

| Meaning | Codex `config.toml` | Claude Code `.mcp.json` | VS Code `mcp.json` | Copilot CLI `mcp-config.json` | Cursor `mcp.json` (not tested) |
|---------|--------------------|-------------------------|--------------------|-------------------------------|--------------------------------|
| Server entry | `[mcp_servers.<name>]` | `mcpServers.<name>` | `servers.<name>` | `mcpServers.<name>` | `mcpServers.<name>` |
| Transport | `url` | `"type":"http"`, `url` | `"type":"http"`, `url` | `"type":"http"`, `url` | `url` |
| Static headers | `http_headers = { }` | `headers` | `headers` | `headers` | `headers` |
| Headers from env/input | `env_http_headers` | `"${VAR}"` in `headers` | `"${input:id}"` + `inputs` | — | `"${env:VAR}"` in `headers` |
| Client ID | `oauth.client_id` / `--oauth-client-id` | `oauth.clientId` / `--client-id` | `oauth.clientId` | `oauth.clientId` (reportedly ignored) | `auth.CLIENT_ID` |
| Callback port | `oauth.callback_port` | `oauth.callbackPort` / `--callback-port` | — (MSAL) | `oauth.callbackPort` | — (fixed `8787`) |
| Client secret | — | `--client-secret` (CLI) | CodeLens "Set Client Secret" | — | `auth.CLIENT_SECRET` |
| Trigger sign-in | `codex mcp login <name>` | `claude mcp login <name>` / `/mcp` | start server → dialog **Allow** | `/mcp` → server → **Sign in** | **Customize** → server → Login / `agent mcp login <name>` |
| Status | `codex mcp list`, `/mcp` | `claude mcp list`, `/mcp` | **MCP: List Servers** | `/mcp` | `agent mcp list`, **MCP Logs** |

## Related Pages

- [MCP Server Overview](overview.md)
- [Companion Skills](companion-skills.md) — the `timecockpit-mcp-setup` skill automates these checks
