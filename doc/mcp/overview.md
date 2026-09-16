---
title: MCP Server - Connect AI Assistants to Time Cockpit
description: Overview of the time cockpit MCP server, its endpoints, authentication with Microsoft Entra ID, per-connection settings, and the supported AI clients.
---
# Time Cockpit MCP Server

The time cockpit MCP server exposes time cockpit data and functions (projects, customers, tasks, timesheets, lists, actions) to AI assistants via the [Model Context Protocol](https://modelcontextprotocol.io/) (MCP). It is a remote server that clients reach over Streamable HTTP. Every user signs in with their own Microsoft Entra ID work account, so the assistant only sees what that user is allowed to see in time cockpit.

A local stdio host (`OnCockpit.Admin.exe --mcp`, Windows only) exists for administrative scripting. This section covers the remote server only.

## Server Facts

| Property | Value |
|----------|-------|
| Server URL (production) | `https://mcp.timecockpit.com` |
| Server URL (preview) | `https://mcp-preview.timecockpit.com` |
| Transport | Streamable HTTP (`http`) — not SSE, not stdio |
| Authentication | OAuth 2.1 Authorization Code + PKCE (S256) against Microsoft Entra ID, per user |
| OAuth client | Pre-registered public client (no Dynamic Client Registration, no client secret). See [Entra ID Setup](entra-id-setup.md). |
| OAuth scope | `https://mcp.timecockpit.com/mcp.access` (preview: `https://mcp-preview.timecockpit.com/mcp.access`). Advertised by the server through its protected-resource metadata; usually does not need to be configured. |
| Metadata | `/.well-known/oauth-protected-resource` and `/.well-known/oauth-authorization-server` on the server. Clients discover Entra ID from these documents — but not the client ID. |

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
- The **OAuth client ID** of the time cockpit MCP client application. This is the one value every client needs and no client can discover on its own. See [Entra ID Setup](entra-id-setup.md).
- Optionally the **tenant ID** (GUID) of your time cockpit tenant — only if your Entra tenant is mapped to several time cockpit tenants.

## Getting Started

1. Read [Entra ID Setup](entra-id-setup.md) to make sure your organization has consented to the MCP client application.
2. Configure your client: [Claude Code](claude-code.md), [Claude app](claude-app.md), [Codex](codex.md), [VS Code](vscode.md), [Copilot CLI](copilot-cli.md), or [Microsoft 365 Copilot](microsoft-365-copilot.md).
3. [Verify the connection](verify-connection.md) with the server's diagnostic tools.
4. Install the [companion skills](companion-skills.md) so your assistant knows how to work with time cockpit.
5. Try the [use cases and prompts](~/doc/ai-assistants/use-cases-and-prompts.md).

## Related Pages

- [Web API](~/doc/web-api/overview.md) — REST/OData access without an AI assistant
- [Azure Active Directory (AAD) Integration](~/doc/enterprise/aad.md)
- [AI Assistants for Users](~/doc/ai-assistants/overview.md)
