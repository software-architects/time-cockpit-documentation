---
title: MCP Server - Cursor Setup
description: Configure the time cockpit MCP server in Cursor (editor and CLI) via mcp.json with static OAuth client ID, sign in with Microsoft Entra ID, and troubleshoot common errors. Not yet tested.
---
# Cursor (Editor and CLI)

> [!WARNING]
> Preliminary documentation: The time cockpit MCP server and this documentation are under active development. Tool names, dialog labels and configuration steps may change without notice. Check back for updates before rolling the setup out to your users.

> [!WARNING]
> Not tested: This page is based on the [Cursor MCP documentation](https://cursor.com/docs/context/mcp) and has **not yet been verified** against the time cockpit MCP server. Configuration keys, redirect URIs and the sign-in behavior may differ in practice. Until a test succeeds, treat Cursor as *under evaluation* and prefer a [tested client](overview.md#which-client-which-configuration) such as [Visual Studio Code](vscode.md) or [Claude Code](claude-code.md) for productive use.

Cursor reads MCP servers from `mcp.json` — either in the project (`.cursor/mcp.json`, shareable via the repository) or globally in your user profile (`%USERPROFILE%\.cursor\mcp.json`). The Cursor CLI (`agent`) uses the same files. Because the time cockpit MCP server does not support Dynamic Client Registration, you configure the client ID of your app registration statically in the `auth` object.

## mcp.json

Example `%USERPROFILE%\.cursor\mcp.json` (or `.cursor/mcp.json` in the project):

```json
{
  "mcpServers": {
    "timecockpit": {
      "url": "https://mcp.timecockpit.com",
      "headers": { "X-tc-tenant-id": "<tenant-id>" },
      "auth": {
        "CLIENT_ID": "<client-id>"
      }
    }
  }
}
```

- `url` — Streamable HTTP endpoint (required). To pass [connection settings](overview.md#connection-settings-header-or-url-segment) such as `access` or `scope`, use either headers or URL segments, e.g. `https://mcp.timecockpit.com/access/readonly/scope/owndata`.
- `headers` — static headers sent with every request. Leave out `X-tc-tenant-id` if your Entra tenant maps to a single time cockpit tenant. Do not set your own `Authorization` header — OAuth manages it.
- `auth.CLIENT_ID` — client ID of the app registration from [Entra ID Setup](entra-id-setup.md) (required).
- `auth.CLIENT_SECRET` — not needed; the desktop app is a public client with PKCE. Do not store secrets in a shared `.cursor/mcp.json`.
- `auth.scopes` — optional. The server advertises its scope through the protected-resource metadata. Set it explicitly only if the sign-in fails without it: `"scopes": ["https://mcp.timecockpit.com/mcp.access"]`.

Values can be taken from environment variables with `${env:NAME}` in `url` and `headers`, for example `"X-tc-tenant-id": "${env:TC_TENANT_ID}"`, which keeps tenant-specific values out of a shared project file.

## Redirect URI

Cursor uses fixed callback URLs that do not depend on the server URL. Register them on your app registration:

| Surface | Redirect URI | Platform type in Entra |
|---------|--------------|------------------------|
| Cursor desktop app (and CLI) | `http://localhost:8787/callback` | Mobile and desktop |
| Cursor web / cloud agents | `https://www.cursor.com/agents/mcp/oauth/callback` | Web — not tested; would likely require a confidential client |

See [Redirect URIs per Client](entra-id-setup.md#redirect-uris-per-client). Port `8787` is fixed, so another process holding that port blocks the sign-in.

## Authentication

After saving `mcp.json`, open **Customize** in the Cursor sidebar (depending on version: **Cursor Settings → Tools & MCP**). The `timecockpit` server appears in the list; if it needs a sign-in, Cursor offers a **Login** / **Connect** action that opens the browser for the Microsoft Entra ID sign-in. Sign in with the account you use for time cockpit.

With the Cursor CLI:

```powershell
agent mcp list
agent mcp login timecockpit
agent mcp list-tools timecockpit
```

| Command | Purpose |
|---------|---------|
| `agent mcp list` | Configured servers and connection status |
| `agent mcp login <name>` | Start the OAuth sign-in |
| `agent mcp list-tools <name>` | Tools offered by a server |
| `agent mcp enable <name>` / `agent mcp disable <name>` | Activate / deactivate a server |

## Verify

In the Cursor chat (agent mode), make sure the `timecockpit` server is enabled and ask a question, for example *Which projects did I work on this week according to time cockpit?* Cursor asks for approval before running an MCP tool by default. Then follow [Verify the Connection](verify-connection.md).

## Install Link

For internal portals, Cursor supports deep links of the form `cursor://anysphere.cursor-deeplink/mcp/install?name=timecockpit&config=<base64 JSON>`, where the JSON is the server entry without the name, e.g. `{"url":"https://mcp.timecockpit.com","auth":{"CLIENT_ID":"<client-id>"}}`.

## Troubleshooting

MCP logs: **Output panel** (Ctrl+Shift+U) → select **MCP Logs** in the drop-down. They show connection errors, authentication problems and tool calls.

| Message / symptom | Cause / solution |
|-------------------|------------------|
| Sign-in fails with a client registration error | `auth.CLIENT_ID` is missing; Cursor falls back to Dynamic Client Registration, which the time cockpit MCP server does not support. |
| `AADSTS50011: redirect URI … does not match` | `http://localhost:8787/callback` is not registered on your app registration, or is registered as *Web* instead of *Mobile and desktop*. |
| `AADSTS7000218` / *client secret required* | The app registration is treated as a confidential client. Set **Allow public client flows** to *Yes*, see [Entra ID Setup](entra-id-setup.md). |
| `AADSTS9010010` / `invalid_target` | Entra rejects the `resource` parameter or the requested scope. Set `auth.scopes` explicitly to `["https://mcp.timecockpit.com/mcp.access"]`. Contact support if it persists. |
| Sign-in does not complete | Port `8787` is in use by another process. Close it and retry. |
| Server not shown in chat | The server is disabled in **Customize**, or `mcp.json` contains a JSON error (see MCP Logs). |

## Related Pages

- [MCP Server Overview](overview.md)
- [Entra ID Setup](entra-id-setup.md)
- [Configuration Field Mapping](verify-connection.md#configuration-field-mapping)
- [Cursor MCP documentation](https://cursor.com/docs/context/mcp)
