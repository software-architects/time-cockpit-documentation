---
title: MCP Server - Claude Code Setup
description: Register the time cockpit MCP server in Claude Code, sign in with Microsoft Entra ID, verify the connection, and share the configuration with your team via .mcp.json.
---
# Claude Code (CLI)

> [!WARNING]
> Preliminary documentation: The time cockpit MCP server and this documentation are under active development. Tool names, dialog labels and configuration steps may change without notice. Check back for updates before rolling the setup out to your users.

Claude Code is Anthropic's terminal agent. MCP servers are stored in configuration files and managed with `claude mcp …`. The steps below were verified on Windows 11 with PowerShell.

> [!NOTE]
> Terminal output shown on this page is illustrative. Version numbers, tool counts and example bookings vary.

## Installation

If `claude` is not recognized in your shell, install Claude Code:

```powershell
irm https://claude.ai/install.ps1 | iex
```

```text
Downloading Claude Code...
✔ Claude Code installed successfully.
Restart your terminal so the new PATH entry takes effect, then run 'claude' to get started.
```

Alternatives: `winget install Anthropic.ClaudeCode` or `npm install -g @anthropic-ai/claude-code`. Afterwards **open a new terminal**, run `claude --version`, start `claude` once and sign in with your Anthropic account.

## Register the Server (User Scope)

With `--scope user` the server is available in all your projects (`%USERPROFILE%\.claude.json`). The JSON form sets headers and OAuth in one step. Enter the command on a single line:

```powershell
claude mcp add-json timecockpit --scope user '{"type":"http","url":"https://mcp.timecockpit.com","headers":{"X-tc-tenant-id":"<tenant-id>"},"oauth":{"clientId":"<client-id>","callbackPort":64485}}'
```

```text
Added HTTP MCP server timecockpit with URL: https://mcp.timecockpit.com to user config
File modified: C:\Users\<you>\.claude.json
```

If your Entra tenant maps to a single time cockpit tenant, leave out the `headers` block. For a cautious start use `"headers":{"X-access":"readonly","X-scope":"owndata"}` instead — see [connection settings](overview.md#connection-settings-header-or-url-segment).

Alternatively with individual options. **Name and URL must come before the options**, otherwise Claude Code reports `error: missing required argument 'name'`:

```powershell
claude mcp add timecockpit https://mcp.timecockpit.com --scope user --transport http `
  --client-id <client-id> --callback-port 64485 `
  --header "X-tc-tenant-id: <tenant-id>"
```

> [!NOTE]
> Single quotes around the JSON work in PowerShell and Bash, not in `cmd.exe`. If your version reports `unknown option` for `--client-id` or `--callback-port`, run `claude update`.

## Sign In (Entra ID)

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

The browser opens the Entra ID sign-in. After sign-in you are redirected to `http://localhost:64485/callback` and the tokens are stored locally. Alternatively, inside a session run `/mcp`, select the server, and choose **Authenticate**.

## Verify

```powershell
claude mcp list
```

```text
Checking MCP server health...

timecockpit: https://mcp.timecockpit.com (HTTP) - ✔ Connected
```

Inside a Claude Code session, `/mcp` lists the configured servers with their status and configuration locations:

```text
Manage MCP servers

❯ 1. timecockpit   ✔ connected · Enter to view details

MCP Config locations (by scope):
 • User config (available in all your projects):
   • C:\Users\<you>\.claude.json
 • Project config (shared via .mcp.json):
   • C:\Repos\my-project\.mcp.json
```

Selecting the server shows its details and offers **View tools**, **Reconnect**, **Clear authentication** and **Disable**:

```text
timecockpit MCP Server

Status: ✔ connected
URL: https://mcp.timecockpit.com
Config location: C:\Users\<you>\.claude.json (user)
Capabilities: tools
Tools: 19 tools
Authentication: ✔ Authenticated (OAuth)
```

A first query then looks like this:

```text
> Who am I connected as, and what did I book today?

● timecockpit - get_current_user
● timecockpit - get_timesheets (from: 2026-09-15, to: 2026-09-15)
  └ 3 timesheet entries returned

● You are connected as Jane Doe (jane.doe@example.com).
  Today you booked 3 entries totalling 6h 30m:
  • 09:00–11:30  Project Alpha – Sprint planning
  • 12:30–15:00  Project Alpha – Implementation
  • 15:00–16:30  Internal – MCP documentation
```

Then follow [Verify the Connection](verify-connection.md) to call the diagnostic tools.

## Alternative: Project Scope via .mcp.json

The server can be declared in `.mcp.json` in the repository root and shared with the team. Claude Code asks on first start whether the project servers may be used. If a user-scope and a project-scope entry share the same name, the project entry wins. `apm install software-architects/timecockpit-agents` writes such an entry (without client ID) after you confirm the trust prompt — see [Companion Skills](companion-skills.md).

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
> Put a tenant ID into the shared `.mcp.json` only if everyone works against the same time cockpit tenant. Otherwise use `"X-tc-tenant-id": "${TC_TENANT_ID}"` — Claude Code expands `${VAR}` in `url` and `headers`.

## Troubleshooting

| Message | Cause / solution |
|---------|------------------|
| `The term 'claude' is not recognized …` | Not installed, or the terminal was not reopened after installation. |
| `error: missing required argument 'name'` | Name and URL were placed after the options. Change the order or use `add-json`. |
| `does not support dynamic client registration` | No client ID configured (`oauth.clientId`). |
| `AADSTS50011: redirect URI … does not match` | `http://localhost:64485/callback` is not registered on your app registration. See [Entra ID Setup](entra-id-setup.md). |
| `AADSTS9010010` | The MCP server URL is not registered as Application ID URI of the resource application. Contact support. |
| `/mcp` shows *needs authentication* | Run `claude mcp login timecockpit` or choose **Authenticate** in `/mcp`. |
| Wrong data / wrong tenant | Call the `entra_whoami` tool — it shows identity, resolved tenant, sandbox, access and scope. |

## Related Pages

- [MCP Server Overview](overview.md)
- [Claude App, claude.ai and Cowork](claude-app.md)
- [Configuration Field Mapping](verify-connection.md#configuration-field-mapping)
- [Claude Code MCP documentation](https://code.claude.com/docs/en/mcp)
