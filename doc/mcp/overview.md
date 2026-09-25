---
title: MCP Server - Connect AI Assistants to Time Cockpit
description: Overview of the time cockpit MCP server, its endpoints, authentication with Microsoft Entra ID, per-connection settings, and the supported AI clients.
---
# Time Cockpit MCP Server

> [!WARNING]
> Preliminary documentation: The time cockpit MCP server and this documentation are under active development. Tool names, dialog labels and configuration steps may change without notice. Check back for updates before rolling the setup out to your users.

The time cockpit MCP server exposes time cockpit data and functions (projects, customers, tasks, timesheets, lists, actions) to AI assistants via the [Model Context Protocol](https://modelcontextprotocol.io/) (MCP). It is a remote server that clients reach over Streamable HTTP. Every user signs in with their own Microsoft Entra ID work account, so the assistant only sees what that user is allowed to see in time cockpit.

A local stdio server (`OnCockpit.Admin.exe --mcp`, Windows only) exists for administrators and customizers who need IronPython scripting against the live data context; see [OnCockpit Admin: Local MCP Server](oncockpit-admin-local.md). The rest of this section covers the remote server.

## Server Facts

| Property | Value |
|----------|-------|
| Server URL | `https://mcp.timecockpit.com` (production; see [Environments](#environments) for preview) |
| Transport | Streamable HTTP (`http`) — not SSE, not stdio |
| Authentication | OAuth 2.1 Authorization Code + PKCE (S256) against Microsoft Entra ID, per user |
| OAuth client | An app registration **in your own Entra tenant** — you create it and hand its client ID to your users. No Dynamic Client Registration; public client for native tools, confidential client (secret) for hosted clients such as ChatGPT and Copilot Studio. See [Entra ID Setup](entra-id-setup.md). |
| OAuth scope | `https://mcp.timecockpit.com/mcp.access` (per environment, see below). Advertised by the server through its protected-resource metadata; usually does not need to be configured. |
| Metadata | `/.well-known/oauth-protected-resource` and `/.well-known/oauth-authorization-server` on the server. Clients discover Entra ID from these documents — but not the client ID. |

## Environments

The MCP server is available in a production and a preview environment. It is deployed independently of the web client whenever an update is needed and does not follow a fixed release schedule. Each environment has its own server URL and its own OAuth scope. Your app registration can be granted the `mcp.access` permission of several environments, so one client ID can serve both — see [Entra ID Setup](entra-id-setup.md).

| Environment | Server URL | OAuth scope | Use for |
|-------------|------------|-------------|---------|
| Prod | `https://mcp.timecockpit.com` | `https://mcp.timecockpit.com/mcp.access` | Daily work. |
| Preview | `https://mcp-preview.timecockpit.com` | `https://mcp-preview.timecockpit.com/mcp.access` | Testing upcoming changes before they reach production. |

All client pages in this section use the production URL. To connect to another environment, replace the server URL in the client configuration. Client ID, callback port and connection settings stay the same, but a changed server URL has three consequences:

- **You have to sign in again.** Every client stores its OAuth tokens per server URL. A new URL — whether a different environment or additional [URL segments](#connection-settings-header-or-url-segment) — starts with no token, so the client asks for a fresh Entra sign-in even though you were already signed in to the other URL. This is expected, not an error.
- **The app registration needs the permission of that environment.** Each environment has its own scope (`https://mcp-preview.timecockpit.com/mcp.access` for preview). If your app registration has only been granted `mcp.access` of the production API, the preview sign-in fails with a consent error. See [Entra ID Setup](entra-id-setup.md).
- **Codex may need another redirect URI.** Codex derives the callback ID in its redirect URI (`http://127.0.0.1:<port>/callback/<id>`) from the complete server URL, including path segments. Switching to preview or adding URL segments therefore produces a **new callback ID** that has to be registered on your app registration as well. `codex mcp add` prints the new value; see [Callback URL Specifics](codex.md#callback-url-specifics). Claude Code, the Claude app, VS Code, Cursor and ChatGPT use fixed redirect URIs that do not depend on the server URL.

Because tokens are stored per URL, you can register several environments side by side under different names (for example `timecockpit` and `timecockpit-preview`) and switch between them without signing in again each time.

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
| [Claude app / claude.ai / Cowork](claude-app.md) | Custom connector in the app settings | yes (own OAuth client) | standard headers only (beta) — use URL segments | tested |
| [OpenAI Codex (CLI, app, IDE)](codex.md) | `codex mcp add … --oauth-client-id` (writes `%USERPROFILE%\.codex\config.toml`) | yes | via TOML only — use URL segments | tested |
| [Visual Studio Code (Copilot agent mode)](vscode.md) | `.vscode/mcp.json` or user `mcp.json` | yes since VS Code 1.123 (`oauth.clientId`) | yes | tested |
| [GitHub Copilot CLI](copilot-cli.md) | `%USERPROFILE%\.copilot\mcp-config.json` | unclear (client ID reportedly ignored) | yes | not verified |
| [Microsoft 365 Copilot](microsoft-365-copilot.md) | Copilot Studio, M365 Admin Center, or declarative agent | yes, but Copilot Studio requires a client secret | no — use URL segments | not yet verified |
| [Cursor (editor, CLI)](cursor.md) | `.cursor/mcp.json` or `%USERPROFILE%\.cursor\mcp.json` (`auth.CLIENT_ID`) | yes | yes | not yet tested |
| [ChatGPT (web, Business/Enterprise workspace)](chatgpt.md) | Custom app in the admin console (`chatgpt.com/admin/apps`), published to the workspace | yes (User-Defined OAuth Client, with client secret) | no — use URL segments | tested |
| Microsoft Copilot (consumer) | — | — | — | no custom MCP support |

## What You Need

- A Microsoft Entra ID work account with access to time cockpit. You sign in to the MCP server with the same account you use for time cockpit.
- The **OAuth client ID** of the app registration your Entra administrator created for the MCP server. This is the one value every client needs and no client can discover on its own. See [Entra ID Setup](entra-id-setup.md).
- Optionally the **tenant ID** (GUID) of your time cockpit tenant — only if your Entra tenant is mapped to several time cockpit tenants.

## Getting Started

1. Have your Entra administrator create the app registration described in [Entra ID Setup](entra-id-setup.md) and give you its client ID.
2. Configure your client: [Claude Code](claude-code.md), [Claude app](claude-app.md), [Codex](codex.md), [ChatGPT](chatgpt.md), [VS Code](vscode.md), [Cursor](cursor.md) (not tested), [Copilot CLI](copilot-cli.md), or [Microsoft 365 Copilot](microsoft-365-copilot.md).
3. [Verify the connection](verify-connection.md) with the server's diagnostic tools.
4. Install the [companion skills](companion-skills.md) so your assistant knows how to work with time cockpit.
5. Try the [use cases and prompts](~/doc/ai-assistants/use-cases-and-prompts.md).

## What the Server Cannot Enforce: Your Data Goes to the AI Provider

> [!IMPORTANT]
> Everything an assistant reads through the MCP server — customers, projects, tasks, time entries, names, rates, notes — is sent to the AI provider (Anthropic, OpenAI, Microsoft, …) and processed under that provider's terms. Permissions, `readonly` and `owndata` limit **what** a user can see, not **where** the data goes once the assistant has it.
>
> Before rolling out AI assistants with time cockpit, clarify their use with your IT, data protection officer or compliance team. Check the provider's settings for your organization's plan: data retention, chat memory, sharing of conversations, and whether your data may be used for model training. Hosted clients such as ChatGPT and claude.ai may additionally share chat context and memories with the connected app. time cockpit has no influence on these settings.

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
