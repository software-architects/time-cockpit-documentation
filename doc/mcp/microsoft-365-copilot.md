---
title: MCP Server - Microsoft 365 Copilot Setup
description: "Three ways to bring the time cockpit MCP server into Microsoft 365 Copilot: Copilot Studio agents, declarative agents with MCP plugins, federated connectors."
---
# Microsoft 365 Copilot

> [!WARNING]
> Under construction: The time cockpit MCP server and this documentation are under active development, and breaking changes are possible. Tools may be renamed, changed or removed, and dialog labels and configuration steps may change without notice. Check back for updates before rolling the setup out to your users, and expect to adapt your configuration, skills and prompts after an update.

End users cannot enter an MCP URL in the Copilot chat. MCP servers reach Microsoft 365 Copilot through **agents or connectors** — three routes, all of which involve a maker or an administrator. The consumer Copilot (copilot.microsoft.com) does not support custom MCP servers.

> [!WARNING]
> Review required: None of the three routes has been verified end-to-end against the time cockpit MCP server yet. The steps follow the Microsoft documentation; dialog labels may differ.

| Route | Who | Auth options | Headers | Status |
|-------|-----|--------------|---------|--------|
| A) Copilot Studio — MCP tool in an agent, agent published to M365 Copilot | Maker (Copilot Studio license), admin approves publication | OAuth 2.0 (DCR / Dynamic / **Manual** with client ID **and secret**), API key, None | only via custom connector policy "Set HTTP header" — prefer URL segments | GA |
| B) Declarative agent with MCP plugin (M365 Agents Toolkit) | Developer, admin publishes | Entra SSO, OAuth 2.0 auth code, DCR, None (no API key) | no | GA |
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

With the Microsoft 365 Agents Toolkit (≥ 6.12) you create a declarative agent whose plugin manifest (v2.4) contains a runtime `"type": "RemoteMCPServer"` with `spec.url`. Authentication: **Entra SSO** (the toolkit asks for the Entra client ID), OAuth static/dynamic, or None; include `offline_access` in the scopes for refresh tokens. Redirect URL for OAuth: `https://teams.microsoft.com/api/platform/v1.0/oAuthRedirect`. Distribution via sideload, then publication by the admin (Integrated apps). Headers are not supported in the manifest — use URL segments.

## Route C: Custom Federated Connector (Preview)

Microsoft 365 Admin Center → **Copilot → Connectors → Gallery → Create a new connector → Custom connector → Connect to MCP server**: *Display name*, *Base URL*, authentication **Microsoft Entra SSO** (client ID of the Entra application) or OAuth 2.0 (client registered in the Teams Developer Portal, redirect `https://teams.microsoft.com/api/platform/v1.0/oAuthRedirect`). Requires **Global Administrator** or **AI Administrator**. Only read-only tools (search, fetch, query-like) are supported — writing time cockpit tools are not available on this route. Surfaces: Copilot Chat, Copilot in Excel, Researcher, Cowork.

## Recommendation

- For a first pilot: Route A (Copilot Studio), because makers can configure it without development; tenant and modes as URL segments; a dedicated confidential app registration for Copilot Studio.
- Route C only for pure research scenarios (read-only), once it leaves preview.

## Related Pages

- [MCP Server Overview](overview.md)
- [Entra ID Setup](entra-id-setup.md)
- [Microsoft Learn: Add an existing MCP server in Copilot Studio](https://learn.microsoft.com/en-us/microsoft-copilot-studio/mcp-add-existing-server-to-agent)
