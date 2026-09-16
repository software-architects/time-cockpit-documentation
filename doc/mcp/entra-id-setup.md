---
title: MCP Server - Microsoft Entra ID Setup
description: What your Entra ID tenant needs before users can connect AI assistants to the time cockpit MCP server - admin consent, client ID, redirect URIs, and network prerequisites.
---
# Microsoft Entra ID Setup for the MCP Server

The time cockpit MCP server authenticates every user against Microsoft Entra ID. This page describes what an Entra administrator of your organization has to prepare once, and which values users need afterwards.

> [!WARNING]
> Review required: The consent model and the client ID below are documented as they are used in the tested configuration. Confirm with time cockpit support that the pre-registered client application applies to your tenant before publishing these values internally.

## How Authentication Works

- time cockpit registers **one** client application ("time cockpit MCP client", public client, multi-tenant) and one resource application (the MCP API with scope `mcp.access`, Application ID URI `https://mcp.timecockpit.com`).
- The **client ID is the same for all customers** and for all [environments](overview.md#environments) (prod, preview, dev): `41a831af-fb94-4c39-8dfe-e9c9b8a1b18a`. The preview and dev servers expose their own scopes (`https://mcp-preview.timecockpit.com/mcp.access`, `https://mcp-dev.timecockpit.com/mcp.access`), which clients pick up automatically from the server metadata.
- Clients use OAuth 2.1 Authorization Code with PKCE. There is no client secret and no Dynamic Client Registration (Entra ID does not support DCR).
- The server advertises its authorization server via `/.well-known/oauth-protected-resource`. Clients find Entra ID from there but still need the client ID from you.

## What the Customer Administrator Does

1. **Grant admin consent** for the client application once. Either open the admin consent URL

   ```
   https://login.microsoftonline.com/<your-entra-tenant>/adminconsent?client_id=41a831af-fb94-4c39-8dfe-e9c9b8a1b18a
   ```

   or check **Consent on behalf of your organization** when signing in for the first time. Without consent, tenants with a restrictive consent policy show *needs admin approval* (see [Troubleshooting](#troubleshooting)).

2. After consent, the enterprise application appears in your tenant under **Enterprise applications**. There you can optionally enable **Assignment required** and restrict access to specific groups.

3. Your Conditional Access policies apply automatically. Redirect URIs for hosted clients (Claude, Copilot Studio) are maintained centrally by time cockpit on the client application — you do not have to register anything.

## Values Users Need

| Value | Where it comes from | Needed by |
|-------|--------------------|-----------|
| Client ID `41a831af-fb94-4c39-8dfe-e9c9b8a1b18a` | this page / time cockpit support | every client |
| Tenant ID (GUID) | time cockpit support | only if your Entra tenant maps to several time cockpit tenants |

## Redirect URIs Registered on the Client Application

For reference: these redirect URIs are registered on the time cockpit client application. If a client reports `AADSTS50011: redirect URI … does not match`, compare the URI in the error with this list and contact support.

| Client | Redirect URI | Platform type in Entra |
|--------|--------------|------------------------|
| Claude Code | `http://localhost:64485/callback` (fixed port from `callbackPort`) | Mobile and desktop |
| Codex | `http://127.0.0.1:<port>/callback/<callback-id>` — the exact value is printed by `codex mcp add … --oauth-client-id` as "OAuth callback URL" | Mobile and desktop |
| VS Code | `http://localhost` (MSAL loopback, variable port) and `https://vscode.dev/redirect` | Mobile and desktop |
| GitHub Copilot CLI | loopback, port configurable (`callbackPort`) — behavior not verified | Mobile and desktop |
| claude.ai / Claude Desktop / Cowork | `https://claude.ai/api/mcp/auth_callback` | Web (public client) |
| Copilot Studio | `https://global.consent.azure-apim.net/redirect/<connector-id>` — shown after **Create**, different per tool | Web (with client secret) |
| M365 declarative agent / federated connector | `https://teams.microsoft.com/api/platform/v1.0/oAuthRedirect` | Web |
| Cursor | `http://localhost:8787/callback` | Mobile and desktop |

## Network Prerequisites

If your organization filters outbound traffic or uses Conditional Access with named locations, hosted clients need to be able to reach the MCP server:

- Anthropic (claude.ai, Claude Desktop, Cowork): `160.79.104.0/21`
- Power Platform / Copilot Studio: the egress ranges for your region, see the Microsoft documentation.

## Troubleshooting

| Message | Cause / solution |
|---------|------------------|
| *needs admin approval* during sign-in | Admin consent for the client application has not been granted in your tenant. |
| `does not support dynamic client registration` | The client has no client ID configured. Set the client ID as described on the client page. |
| `AADSTS50011: redirect URI … does not match` | The client uses a redirect URI that is not registered. Compare with the table above and contact support. |
| `AADSTS9010010` / `invalid_target` | The client sends a `resource` parameter that does not match the Application ID URI. See the client-specific troubleshooting sections. |

## Related Pages

- [MCP Server Overview](overview.md)
- [Azure Active Directory (AAD) Integration](~/doc/enterprise/aad.md) — federated sign-in to time cockpit itself
- [Verify the Connection](verify-connection.md)
