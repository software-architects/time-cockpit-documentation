---
title: MCP Server - Visual Studio Code Setup
description: Configure the time cockpit MCP server in Visual Studio Code for GitHub Copilot agent mode via mcp.json, including OAuth client ID, header inputs, Microsoft authentication, and troubleshooting.
---
# Visual Studio Code (GitHub Copilot Agent Mode)

> [!WARNING]
> Preliminary documentation: The time cockpit MCP server and this documentation are under active development. Tool names, dialog labels and configuration steps may change without notice. Check back for updates before rolling the setup out to your users.

VS Code configures MCP servers in `mcp.json` — either in the workspace (`.vscode/mcp.json`, shareable) or in the user profile (command **MCP: Open User Configuration**). Since **VS Code 1.123 (June 2026)** your own OAuth client ID can be specified per server (`oauth.clientId`). The configuration below has been verified against the time cockpit MCP server.

## mcp.json

Example `.vscode/mcp.json` with a header input and your client ID (VS Code shows a *Set Client Secret* CodeLens above `oauth`, which is not needed for this public client):

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

- `type: "http"` — VS Code tries Streamable HTTP and falls back to SSE.
- `headers` are attached to every request, including the fetch of `/.well-known/oauth-protected-resource`. Do not set your own `Authorization` header — OAuth manages it. Leave out `headers` (and `inputs`) if your Entra tenant maps to a single time cockpit tenant.
- `inputs` (`promptString`, optionally `password: true`) keeps values out of the shared file; VS Code asks on first start. `envFile` exists only for stdio servers.
- `oauth.clientId`: Without it, VS Code uses its own Microsoft client ID (`aebc6443-996d-45c2-90f0-388ff96faa56`), which would have to be authorized on the time cockpit resource application. With your own client ID this is not necessary.

## Add via Command or CLI

**Command Palette → MCP: Add Server → HTTP** → URL → server ID → target *Global* or *Workspace*. The wizard asks neither for headers nor for a client ID — add them to the file afterwards. Or on the command line (writes to the user `mcp.json`):

```powershell
code --add-mcp '{"name":"timecockpit","type":"http","url":"https://mcp.timecockpit.com","oauth":{"clientId":"<client-id>"}}'
```

VS Code opens (or focuses) and adds the server to the user-profile `mcp.json`.

## Authentication

VS Code recognizes the authorization server (`login.microsoftonline.com/*`) and uses its built-in **Microsoft authentication provider** (MSAL) instead of a generic OAuth flow — no Dynamic Client Registration takes place. When the server starts for the first time, the dialog *The MCP Server Definition 'timecockpit' wants to authenticate to Microsoft* appears → **Allow**; with several Microsoft accounts an account picker follows. Sign-in runs through the browser (MSAL loopback `http://localhost:<port>`) or, depending on the environment, through `https://vscode.dev/redirect` or the Windows broker (WAM).

Management: **Accounts menu (bottom left) → Microsoft account → Manage Trusted MCP Servers** or **Sign Out**; command **MCP: List Servers** → server → *Start Server / Stop Server / Restart Server / Show Output / Show Configuration / Manage MCP Server Account Preferences*. The command *Authentication: Remove Dynamic Authentication Providers* does not apply here because no dynamic provider is used.

## Verify

In Copilot Chat (agent mode), enable the server via the tools icon and ask a question. Tool calls appear as *Ran \<tool\> (MCP Server: timecockpit)*:

```text
You
Which projects did I work on this week according to time cockpit?

GitHub Copilot
▸ Ran get_timesheets (MCP Server: timecockpit)
  { "from": "2026-09-14", "to": "2026-09-20" }
▸ Ran execute_tcql_query (MCP Server: timecockpit)

This week you booked time on three projects:
  • Project Alpha – 14h 30m
  • Customer Portal – 6h 00m
  • Internal / MCP documentation – 3h 15m
```

Then follow [Verify the Connection](verify-connection.md).

## Install Link

For internal portals, VS Code supports install links: `vscode:mcp/install?<url-encoded JSON>` or `https://insiders.vscode.dev/redirect/mcp/install?name=timecockpit&config=<url-encoded JSON>` as an "Install in VS Code" badge.

## Troubleshooting and Settings

| Symptom | Cause / solution |
|---------|------------------|
| `AADSTS9010010` / `invalid_target` on start | VS Code sends `resource=<MCP URL>`; Entra requires Application ID URI and scope to match. The setting `microsoft-authentication.implementation = msal-no-broker` makes the error visible. Contact support if it persists. |
| No sign-in dialog, server *failed to start* | Read **MCP: List Servers → Show Output**; check protected-resource discovery (401 with `resource_metadata`). |
| Wrong account | **Accounts → Manage MCP Server Account Preferences** / **Sign Out**. |
| MCP disabled (enterprise) | Policy `chat.mcp.access` (`all` / `registry` / `none`), `chat.mcp.allowedServers`. |
| Servers from other apps appear | `chat.mcp.discovery.enabled` (reads e.g. the Claude Desktop configuration). |

## Related Pages

- [MCP Server Overview](overview.md)
- [GitHub Copilot CLI](copilot-cli.md)
- [Configuration Field Mapping](verify-connection.md#configuration-field-mapping)
- [VS Code MCP configuration reference](https://code.visualstudio.com/docs/agents/reference/mcp-configuration)
