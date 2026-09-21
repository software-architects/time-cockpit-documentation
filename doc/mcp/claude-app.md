---
title: MCP Server - Claude App, claude.ai and Cowork Setup
description: Add the time cockpit MCP server as a custom connector in claude.ai, Claude Desktop, Claude Mobile, and Cowork, using your organization's OAuth client ID and URL segments instead of headers.
---
# Claude App, claude.ai and Cowork

> [!WARNING]
> Preliminary documentation: The time cockpit MCP server and this documentation are under active development. Tool names, dialog labels and configuration steps may change without notice. Check back for updates before rolling the setup out to your users.

The hosted Claude interfaces (claude.ai, Claude Desktop, Claude Mobile, Cowork) do **not** use the Claude Code configuration files. Remote MCP servers are added as a **custom connector**. The setup below has been verified against the time cockpit MCP server. Custom connectors are available on all plans (Free: one connector). On Team and Enterprise plans an owner creates the connector and members connect to it.

## Add a Custom Connector

**Pro / Max (personal):**

1. Open **Customize → Connectors** and choose **Add custom connector**.
2. Name: `Time Cockpit`. MCP server URL: `https://mcp.timecockpit.com` — with URL segments if needed, e.g. `https://mcp.timecockpit.com/tcTenantId/<tenant-id>` or `…/access/readonly/scope/owndata`. Claude probes the URL and pre-fills detected settings.
3. Authentication: **Sign in now**.
4. OAuth client: **Use your own OAuth client**, client ID `<client-id>` of your app registration, **leave the client secret empty** (public client). Older dialogs: **Advanced settings → OAuth Client ID**.
5. **Add**, then **Connect**. Sign in with Entra ID; you are redirected to `https://claude.ai/api/mcp/auth_callback` — this URI must be registered as platform **Web** on your app registration (see [Entra ID Setup](entra-id-setup.md)).
6. In a chat, enable the connector for the conversation via **+ → Connectors**.

**Team / Enterprise:** An owner adds the connector under **Organization settings → Connectors → Add → Custom → Web**; members then choose **Connect**.

> [!NOTE]
> Authentication settings (OAuth client, request headers) cannot be changed after a connector has been created. To change them, remove the connector and add it again; members have to reconnect.

## Tenant and Modes Without Headers

The connector dialog has a **Request headers** section (beta, not enabled everywhere), but custom header names such as `X-tc-tenant-id` have to be approved by Anthropic. This is **not necessary**: all settings can be passed as [URL segments](overview.md#connection-settings-header-or-url-segment). For the common case of one Entra tenant mapped to one time cockpit tenant, the bare URL is enough because the tenant is resolved from your Entra sign-in.

## Alternative for Claude Desktop: Local Bridge with mcp-remote

Claude Desktop additionally starts local stdio servers from `%APPDATA%\Claude\claude_desktop_config.json`; these are also available in Cowork sessions. With `mcp-remote` as a bridge you can use headers, your client ID, and a fixed callback port as with Codex. This requires Node.js and is intended for power users.

> [!WARNING]
> Review required: The mcp-remote bridge has not been tested against the time cockpit MCP server.

```json
{
  "mcpServers": {
    "timecockpit": {
      "command": "npx",
      "args": [
        "-y", "mcp-remote", "https://mcp.timecockpit.com",
        "--header", "X-tc-tenant-id:<tenant-id>",
        "--static-oauth-client-info", "{\"client_id\":\"<client-id>\"}",
        "64485"
      ]
    }
  }
}
```

## Related Pages

- [MCP Server Overview](overview.md)
- [Claude Code (CLI)](claude-code.md)
- [Verify the Connection](verify-connection.md)
- [Anthropic: Third-party connectors with remote MCP](https://claude.com/docs/connectors/custom/remote-mcp)
- [Anthropic: Authentication for connectors](https://claude.com/docs/connectors/building/authentication)
