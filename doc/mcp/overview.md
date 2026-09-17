---
title: MCP Server - Connect AI Assistants to Time Cockpit
description: Overview of the time cockpit MCP server, its endpoints, authentication with Microsoft Entra ID, per-connection settings, and the supported AI clients.
---
# Time Cockpit MCP Server

The time cockpit MCP server exposes time cockpit data and functions (projects, customers, tasks, timesheets, lists, actions) to AI assistants via the [Model Context Protocol](https://modelcontextprotocol.io/) (MCP). It is a remote server that clients reach over Streamable HTTP. Every user signs in with their own Microsoft Entra ID work account, so the assistant only sees what that user is allowed to see in time cockpit.

A local stdio server (`OnCockpit.Admin.exe --mcp`, Windows only) exists for administrators and customizers who need IronPython scripting against the live data context; see [OnCockpit Admin: Local MCP Server](oncockpit-admin-local.md). The rest of this section covers the remote server.

## Server Facts

| Property | Value |
|----------|-------|
| Server URL | `https://mcp.timecockpit.com` (production; see [Environments](#environments) for preview) |
| Transport | Streamable HTTP (`http`) — not SSE, not stdio |
| Authentication | OAuth 2.1 Authorization Code + PKCE (S256) against Microsoft Entra ID, per user |
| OAuth client | An app registration **in your own Entra tenant** — you create it and hand its client ID to your users. No Dynamic Client Registration; public client for native tools, confidential client (secret) only for Copilot Studio. See [Entra ID Setup](entra-id-setup.md). |
| OAuth scope | `https://mcp.timecockpit.com/mcp.access` (per environment, see below). Advertised by the server through its protected-resource metadata; usually does not need to be configured. |
| Metadata | `/.well-known/oauth-protected-resource` and `/.well-known/oauth-authorization-server` on the server. Clients discover Entra ID from these documents — but not the client ID. |

## Environments

The MCP server follows the [release plan](~/doc/getting-started/web-client.md#release-plan) of the time cockpit web client with a production and a preview stage. Each environment has its own server URL and its own OAuth scope. Your app registration can be granted the `mcp.access` permission of several environments, so one client ID can serve both — see [Entra ID Setup](entra-id-setup.md).

| Environment | Server URL | OAuth scope | Use for |
|-------------|------------|-------------|---------|
| Prod | `https://mcp.timecockpit.com` | `https://mcp.timecockpit.com/mcp.access` | Daily work. Updated from the latest preview release on the 10th of each month; hotfixes only in between. |
| Preview | `https://mcp-preview.timecockpit.com` | `https://mcp-preview.timecockpit.com/mcp.access` | Testing the upcoming release. Stable between the 1st and 9th of each month. |

All client pages in this section use the production URL. To connect to another environment, replace the server URL in the client configuration — the rest of the setup (client ID, callback port, connection settings) stays the same. Each client stores its OAuth tokens per server URL, so you can register several environments side by side under different names (for example `timecockpit` and `timecockpit-preview`).

> [!NOTE]
> The environment is independent of the [sandbox setting](#connection-settings-header-or-url-segment): `sandboxEnvironment=test` selects the test sandbox of your tenant on whichever server you are connected to, while the environment selects the server release.

## Connection Settings: Header or URL Segment

The server knows five optional settings per connection. Each can be passed **either** as an HTTP header **or** as a segment in the URL path — never both for the same setting (the server responds with 404). Use headers where the client supports them and URL segments where it does not (for example the Claude app or Copilot Studio).

| Setting | Header | URL segment | Values | When needed |
|---------|--------|-------------|--------|-------------|
| Tenant | `X-tc-tenant-id` | `/tcTenantId/{id}` | tenant GUID | **Only** if your Entra tenant is mapped to several time cockpit tenants; otherwise omit |
| Sandbox | `X-sandbox-environment` | `/sandboxEnvironment/test` | `test` | To work against the test sandbox; without it, production |
| Profile | `X-profile` | `/profile/{name}` | profile name | Only with named profiles |
| Access | `X-access` | `/access/readonly` | `readonly`, `default` | Hides all writing tools |
| Scope | `X-scope` | `/scope/owndata` | `owndata`, `default` | Restricts results to the user's own data |

Example URL form: `https://mcp.timecockpit.com/tcTenantId/<tenant-id>/access/readonly/scope/owndata`. Values are case-insensitive. There is no `readwrite` value — omit the setting or use `default`.

> [!NOTE]
> For the common case of one Entra tenant mapped to one time cockpit tenant, the bare server URL is enough. The tenant is resolved from your Entra ID sign-in. You only need the tenant setting if support has told you that your Entra tenant is mapped to multiple time cockpit tenants.

## Which Client, Which Configuration?

Every client has its own configuration. A server registered in Claude Code is invisible in the Claude app and vice versa.

| Client | Configuration | Own client ID | Headers | Status |
|--------|---------------|---------------|---------|--------|
| [Claude Code (CLI)](claude-code.md) | `%USERPROFILE%\.claude.json` or `.mcp.json` in the project | yes (`oauth.clientId`) | yes | tested |
| [Claude app / claude.ai / Cowork](claude-app.md) | Custom connector in the app settings | yes (own OAuth client) | standard headers only (beta) — use URL segments | not yet verified |
| [OpenAI Codex (CLI, app, IDE)](codex.md) | `codex mcp add … --oauth-client-id` (writes `%USERPROFILE%\.codex\config.toml`) | yes | via TOML only — use URL segments | tested |
| [Visual Studio Code (Copilot agent mode)](vscode.md) | `.vscode/mcp.json` or user `mcp.json` | yes since VS Code 1.123 (`oauth.clientId`) | yes | not yet tested |
| [GitHub Copilot CLI](copilot-cli.md) | `%USERPROFILE%\.copilot\mcp-config.json` | unclear (client ID reportedly ignored) | yes | not verified |
| [Microsoft 365 Copilot](microsoft-365-copilot.md) | Copilot Studio, M365 Admin Center, or declarative agent | yes, but Copilot Studio requires a client secret | no — use URL segments | not yet verified |
| Cursor | `.cursor/mcp.json` (`auth.CLIENT_ID`) | yes | yes | not yet tested |
| ChatGPT (custom app) | Workspace admin registers a custom MCP app | yes (predefined client) | no | not yet verified |
| Microsoft Copilot (consumer) | — | — | — | no custom MCP support |

## What You Need

- A Microsoft Entra ID work account with access to time cockpit. You sign in to the MCP server with the same account you use for time cockpit.
- The **OAuth client ID** of the app registration your Entra administrator created for the MCP server. This is the one value every client needs and no client can discover on its own. See [Entra ID Setup](entra-id-setup.md).
- Optionally the **tenant ID** (GUID) of your time cockpit tenant — only if your Entra tenant is mapped to several time cockpit tenants.

## Getting Started

1. Have your Entra administrator create the app registration described in [Entra ID Setup](entra-id-setup.md) and give you its client ID.
2. Configure your client: [Claude Code](claude-code.md), [Claude app](claude-app.md), [Codex](codex.md), [VS Code](vscode.md), [Copilot CLI](copilot-cli.md), or [Microsoft 365 Copilot](microsoft-365-copilot.md).
3. [Verify the connection](verify-connection.md) with the server's diagnostic tools.
4. Install the [companion skills](companion-skills.md) so your assistant knows how to work with time cockpit.
5. Try the [use cases and prompts](~/doc/ai-assistants/use-cases-and-prompts.md).

## What the Server Enforces

- **Your permissions always apply.** Every call is authorized against the tenant's permission model with the roles of the signed-in user. Whatever you cannot see in the web client stays invisible to the assistant, and cannot be reached by guessing a technical name. System and internal entities are hidden from every tool.
- **Access and scope** narrow a connection further: `readonly` hides all writing tools, `owndata` hides everything that cannot be restricted to your own data. **Confirmation** is an operator setting: by default every generic action and record change has to be repeated with `confirmed=true` after the assistant has told you what will change. See [Access, Scope, and Confirmation](access-and-confirmation.md).
- **Results are bounded.** Reads are capped in rows and size and say so with `truncated: true`. See [Limits and Truncation](limits.md).
- **Every tool call is audited.** The server records one operational audit event per attempted call with tenant, acting user, host, tool, whether it changes data, outcome and duration. Denied, failed and cancelled attempts are recorded as well. The event contains no arguments, query text, record contents or results.

## Related Pages

- [Access, Scope, and Confirmation](access-and-confirmation.md) and [Limits and Truncation](limits.md)
- [Web API](~/doc/web-api/overview.md) — REST/OData access without an AI assistant
- [Azure Active Directory (AAD) Integration](~/doc/enterprise/aad.md)
- [AI Assistants for Users](~/doc/ai-assistants/overview.md)
