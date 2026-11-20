---
title: MCP Server - Microsoft 365 Copilot Setup
description: "Three ways to bring the time cockpit MCP server into Microsoft 365 Copilot: Copilot Studio agents, declarative agents with MCP plugins, federated connectors."
---
# Microsoft 365 Copilot

> [!WARNING]
> Under construction: The time cockpit MCP server and this documentation are under active development, and breaking changes are possible. Tools may be renamed, changed or removed, and dialog labels and configuration steps may change without notice. Check back for updates before rolling the setup out to your users, and expect to adapt your configuration, skills and prompts after an update.

End users cannot enter an MCP URL in the Copilot chat. MCP servers reach Microsoft 365 Copilot through **agents or connectors** — three routes, all of which involve a maker or an administrator. The consumer Copilot (copilot.microsoft.com) does not support custom MCP servers.

> [!WARNING]
> Review required: Routes A and C have not been verified end-to-end against the time cockpit MCP server yet. The steps follow the Microsoft documentation; dialog labels may differ. Route B was verified in November 2026 with Microsoft 365 Agents Toolkit 6.20.

| Route | Who | Auth options | Headers | Status |
|-------|-----|--------------|---------|--------|
| A) Copilot Studio — MCP tool in an agent, agent published to M365 Copilot | Maker (Copilot Studio license), admin approves publication | OAuth 2.0 (DCR / Dynamic / **Manual** with client ID **and secret**), API key, None | only via custom connector policy "Set HTTP header" — prefer URL segments | GA |
| B) Declarative agent with MCP plugin (M365 Agents Toolkit) | Developer, admin publishes | OAuth 2.0 with static registration (client ID **and secret**); the toolkit also offers Entra SSO, dynamic registration and None | no | GA |
| C) Custom federated connector (M365 Admin Center → Copilot → Connectors) | Global / AI Administrator | Entra SSO, OAuth 2.0, None | no | Preview, read-only tools only |

Because none of these routes supports custom headers, pass tenant and modes as [URL segments](overview.md#connection-settings-header-or-url-segment).

## Route A: Copilot Studio

1. Copilot Studio → agent → **Tools** → **Add a tool** → **New tool** → **Model Context Protocol**.
2. *Server name*, *Server description*, *Server URL* `https://mcp.timecockpit.com` (with URL segments for tenant/modes, since there is no header field).
3. Authentication **OAuth 2.0 → Manual**: *Client ID* and *Client secret* of your confidential app registration (see below), *Authorization URL* `https://login.microsoftonline.com/<your-entra-tenant>/oauth2/v2.0/authorize`, *Token URL template* and *Refresh URL* `https://login.microsoftonline.com/<your-entra-tenant>/oauth2/v2.0/token`, *Scopes* `https://mcp.timecockpit.com/mcp.access offline_access`. The MCP wizard has no separate Entra option.
4. **Create** → the displayed **Redirect URL** (`https://global.consent.azure-apim.net/redirect/<id>`) must be registered as a redirect URI of platform type **Web** on your app registration. The last path segment is generated per tool — copy the exact displayed value.
5. **Create a new connection** → Entra sign-in → **Add to agent**. Test the agent, then **Channels → Teams and Microsoft 365 Copilot → Make agent available in Microsoft 365 Copilot** and, if required, **Submit for admin approval**.

> [!NOTE]
> Copilot Studio requires a **client secret** in manual mode, so it needs a **confidential client**. Create a separate app registration for Copilot Studio (platform *Web*, client secret, `mcp.access` permission) rather than adding a secret to the public-client registration used by Claude Code and Codex — see [Entra ID Setup](entra-id-setup.md).

Under the hood the MCP tool is a Power Platform custom connector, so your tenant's Data Loss Prevention policies apply. If a static header is unavoidable, the alternative is **Custom connector → Import OpenAPI** (with `x-ms-agentic-protocol: mcp-streamable-1.0`) and the policy **Set HTTP header** — considerably more effort than a URL segment.

## Route B: Declarative Agent with MCP Plugin

With the Microsoft 365 Agents Toolkit (≥ 6.12) in Visual Studio Code you create a declarative agent whose plugin manifest (`appPackage/ai-plugin.json`, schema v2.4) contains a runtime `"type": "RemoteMCPServer"` with `spec.url`. Headers are not supported in the manifest — use URL segments.

### Prerequisites

- A Microsoft 365 account with a Microsoft 365 Copilot license and permission to upload custom apps (sideloading). After signing in, the toolkit's **Accounts** view shows whether custom app upload and Copilot access are enabled.
- An app registration in your Entra tenant, set up as a **confidential client**:
  - platform **Web** with the redirect URI `https://teams.microsoft.com/api/platform/v1.0/oAuthRedirect`
  - a client secret
  - the delegated permission `mcp.access` of the time cockpit MCP API, with admin consent

  As with Copilot Studio, prefer a separate registration rather than adding a secret to the public-client registration of your developer tools — see [Entra ID Setup](entra-id-setup.md).

### Create the Agent

1. In the toolkit: **Build Declarative Agent** → **Add an Action** → **Start with an MCP Server**.
2. MCP server URL: `https://mcp.timecockpit.com`, with [URL segments](overview.md#connection-settings-header-or-url-segment) as needed, for example `https://mcp.timecockpit.com/access/readonly`.
3. Authentication type **OAuth (with static registration)**: the client ID, the client secret and the scopes `https://mcp.timecockpit.com/mcp.access offline_access`. Enter the **Value** of the secret, not its Secret ID. The toolkit stores the client ID in `env/.env.dev` and the secret in `env/.env.dev.user`, which is excluded from Git.
4. In `m365agents.yml`, set `authorizationUrl` and `tokenUrl` of the `oauth/register` step to the Entra endpoints of your tenant:

   ```yaml
   authorizationUrl: https://login.microsoftonline.com/<your-entra-tenant>/oauth2/v2.0/authorize
   tokenUrl: https://login.microsoftonline.com/<your-entra-tenant>/oauth2/v2.0/token
   ```

   The toolkit pre-fills `https://mcp.timecockpit.com/authorize` and `/token` from the server metadata. The verified setup used the Entra endpoints.

### Add the Tool Definitions

The toolkit creates the plugin with an empty `functions` list and relies on dynamic tool discovery at runtime. With the time cockpit MCP server, Copilot found the plugin but no tools. Add the tool definitions to the manifest instead:

1. Open `.vscode/mcp.json` in the agent project and use the CodeLens above the server entry to start the server in VS Code. VS Code signs in to the MCP server with its own redirect URIs; see [Visual Studio Code](vscode.md) and the [redirect URIs per client](entra-id-setup.md#redirect-uris-per-client).
2. Use the toolkit CodeLens to fetch the actions from the MCP server and select the tools the agent may use. The toolkit writes them to `functions` and `run_for_functions` in `ai-plugin.json` and the tool descriptions to `appPackage/mcp-tools.json`.
3. Check the fetched descriptions. If they start with "Sign-in to time cockpit was refused:", the server listed only `ping` and `entra_whoami`; see [Verify the Connection](verify-connection.md).

To remove a tool later, delete it from `functions`, `run_for_functions` and `mcp-tools.json`. Fetching again restores the full selection.

> [!TIP]
> Optional: if your Entra tenant is mapped to several time cockpit tenants, the fetched descriptions end with `AmbiguousTenantMapping`. Add the tenant segment to the URL in `.vscode/mcp.json`, in `spec.url` of `ai-plugin.json` and in `baseUrl` of `m365agents.yml` (for example `https://mcp.timecockpit.com/tcTenantId/<tenant-id>/access/readonly`), then fetch again.

### Write the Instructions

Replace the placeholder instructions in `appPackage/instruction.txt` and the description in `declarativeAgent.json`. With the generated placeholders, the agent answered questions about time cockpit from the user's emails instead of calling the MCP tools. State which questions the agent answers with the time cockpit tools, and that it must not answer them from emails, chats or files.

### Provision and Test

1. Run **Provision** in the toolkit. It registers the OAuth client in the Teams Developer Portal, builds the app package and uploads it for your account.
2. Open the Microsoft 365 Copilot chat, select the agent and ask a question that needs time cockpit data. Copilot shows a sign-in button on the first tool call.

- Before every further provision, increase `version` in `appPackage/manifest.json`. Otherwise provisioning fails with "New title must have a higher version than the existing title."
- After you change the URL, the authorization endpoints or the secret, clear `MCP_DA_AUTH_ID_<namespace>` in `env/.env.dev` so that provisioning registers a new OAuth configuration.
- If the sign-in window shows "Something went wrong. Please try again.", check the client secret (Value, not Secret ID) and the token URL.

> [!WARNING]
> Review required: Publication to other users (toolkit **Publish**, then approval by an administrator under **Integrated apps** in the Microsoft 365 admin center) has not been verified yet.

## Route C: Custom Federated Connector (Preview)

Microsoft 365 Admin Center → **Copilot → Connectors → Gallery → Create a new connector → Custom connector → Connect to MCP server**: *Display name*, *Base URL*, authentication **Microsoft Entra SSO** (client ID of the Entra application) or OAuth 2.0 (client registered in the Teams Developer Portal, redirect `https://teams.microsoft.com/api/platform/v1.0/oAuthRedirect`). Requires **Global Administrator** or **AI Administrator**. Only read-only tools (search, fetch, query-like) are supported — writing time cockpit tools are not available on this route. Surfaces: Copilot Chat, Copilot in Excel, Researcher, Cowork.

## Recommendation

- For a first pilot: Route A (Copilot Studio), because makers can configure it without development; tenant and modes as URL segments; a dedicated confidential app registration for Copilot Studio.
- Route C only for pure research scenarios (read-only), once it leaves preview.

## Related Pages

- [MCP Server Overview](overview.md)
- [Entra ID Setup](entra-id-setup.md)
- [Microsoft Learn: Add an existing MCP server in Copilot Studio](https://learn.microsoft.com/en-us/microsoft-copilot-studio/mcp-add-existing-server-to-agent)
