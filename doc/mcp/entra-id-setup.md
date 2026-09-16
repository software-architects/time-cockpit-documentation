---
title: MCP Server - Microsoft Entra ID Setup
description: Register a client application for the time cockpit MCP server in your own Microsoft Entra ID tenant - platform, redirect URIs, API permission, admin consent - and hand the client ID to your users.
---
# Microsoft Entra ID Setup for the MCP Server

The time cockpit MCP server authenticates every user against Microsoft Entra ID. The AI client (Claude Code, Codex, VS Code, …) needs an **OAuth client application in your own Entra tenant** to run the sign-in. You create this app registration yourself; its **client ID** is the value your users enter in their client configuration.

Because the app registration is yours, you decide how many you want. One registration for all clients works. Separate registrations per client (for example one for Claude Code and Codex, one for the Claude app, one for Copilot Studio) let you keep the redirect URIs of each client apart and restrict or revoke a single client without touching the others.

## How Authentication Works

- time cockpit operates the MCP server as an Entra **resource application** with the scope `mcp.access` (Application ID URI `https://mcp.timecockpit.com`; preview and dev have their own, see [Environments](overview.md#environments)).
- Your Entra tenant contains one or more **client applications** that request this scope on behalf of the signed-in user. The MCP server accepts tokens from any client application in your tenant that has been granted the `mcp.access` permission.
- Clients use OAuth 2.1 Authorization Code with PKCE. Native clients (Claude Code, Codex, VS Code, Copilot CLI) are **public clients** and need no secret. Copilot Studio requires a **confidential client** with a client secret — use a separate app registration for it.
- Entra ID does not support Dynamic Client Registration, which is why every client needs your client ID configured explicitly.

> [!WARNING]
> Review required: The list of redirect URIs and the exact Entra permission name below follow the tested configuration. Verify against your tenant before publishing internally.

## Create the App Registration

An Entra administrator (or a user with the *Application Developer* role) performs these steps once per app registration in the [Entra admin center](https://entra.microsoft.com) under **Identity → Applications → App registrations → New registration**.

1. **Name**: e.g. `time cockpit MCP client`. **Supported account types**: *Accounts in this organizational directory only*.

2. **Platform and redirect URIs** — depending on which clients this registration is for:

   - For native clients add the platform **Mobile and desktop applications** and the redirect URIs from the table below. Under **Authentication → Advanced settings** set **Allow public client flows** to *Yes*.
   - For hosted clients (Claude app, Copilot Studio, M365) add the platform **Web** with the respective redirect URIs.
   - `127.0.0.1` redirect URIs (Codex) cannot be entered in the portal form; add them via **Manifest → `replyUrlsWithType`** with `"type": "InstalledClient"`.

3. **API permission**: **API permissions → Add a permission → APIs my organization uses**, search for the time cockpit MCP API, select **Delegated permissions → `mcp.access`**, then **Grant admin consent** for your tenant. Repeat for the preview or dev API if your users should be able to connect to those environments.

   > [!NOTE]
   > The time cockpit MCP API appears under *APIs my organization uses* only after it has been consented to in your tenant once. If it is not listed, ask time cockpit support to trigger the consent for your tenant.

4. For **Copilot Studio** only: **Certificates & secrets → New client secret**. Note the secret value; it is entered in the Copilot Studio MCP wizard together with the client ID.

5. Copy the **Application (client) ID** from the overview page. This is the `<client-id>` used on all client pages of this documentation.

Optional hardening: under **Enterprise applications** you can set **Assignment required** on the corresponding enterprise app and assign groups, so only selected users can sign in through this client. Your Conditional Access policies apply automatically.

## Redirect URIs per Client

| Client | Redirect URI | Platform type in Entra |
|--------|--------------|------------------------|
| Claude Code | `http://localhost:64485/callback` (fixed port from `callbackPort`) | Mobile and desktop |
| Codex | `http://127.0.0.1:<port>/callback/<callback-id>` — the exact value is printed by `codex mcp add … --oauth-client-id` as "OAuth callback URL"; with a fixed `callback_port` the port is part of the URI | Mobile and desktop (via manifest) |
| VS Code | `http://localhost` (MSAL loopback, variable port) and `https://vscode.dev/redirect` | Mobile and desktop |
| GitHub Copilot CLI | loopback, port configurable (`callbackPort`) — behavior not verified | Mobile and desktop |
| claude.ai / Claude Desktop / Cowork | `https://claude.ai/api/mcp/auth_callback` | Web (public client) |
| Copilot Studio | `https://global.consent.azure-apim.net/redirect/<connector-id>` — shown after **Create**, different per tool | Web (confidential client with secret) |
| M365 declarative agent / federated connector | `https://teams.microsoft.com/api/platform/v1.0/oAuthRedirect` | Web |
| Cursor | `http://localhost:8787/callback` | Mobile and desktop |

## Values Users Need

| Value | Where it comes from | Needed by |
|-------|--------------------|-----------|
| Client ID (`<client-id>`) | Application (client) ID of your app registration | every client |
| Client secret | your app registration (confidential client) | Copilot Studio only |
| Tenant ID of the time cockpit tenant | time cockpit support | only if your Entra tenant is mapped to several time cockpit tenants — see [connection settings](overview.md#connection-settings-header-or-url-segment) |

## Network Prerequisites

If your organization filters outbound traffic or uses Conditional Access with named locations, hosted clients need to be able to reach the MCP server:

- Anthropic (claude.ai, Claude Desktop, Cowork): `160.79.104.0/21`
- Power Platform / Copilot Studio: the egress ranges for your region, see the Microsoft documentation.

## Troubleshooting

| Message | Cause / solution |
|---------|------------------|
| *needs admin approval* during sign-in | Admin consent for the `mcp.access` permission has not been granted on your app registration. |
| `does not support dynamic client registration` | The client has no client ID configured. Set your client ID as described on the client page. |
| `AADSTS50011: redirect URI … does not match` | The redirect URI used by the client is not registered on your app registration. Compare with the table above; check the platform type (Mobile and desktop vs. Web). |
| `AADSTS7000218` / *client assertion or secret required* | The app registration is treated as a confidential client. Set **Allow public client flows** to *Yes*, or register the redirect URI under *Mobile and desktop applications* instead of *Web*. |
| `AADSTS65001` / *user or administrator has not consented* | Grant admin consent for `mcp.access` under **API permissions**. |
| `AADSTS9010010` / `invalid_target` | The client sends a `resource` parameter that does not match the Application ID URI of the MCP API. See the client-specific troubleshooting sections. |
| `AADSTS500011` / *resource principal not found* | The time cockpit MCP API is not present in your tenant yet. Ask time cockpit support to trigger the consent. |

## Related Pages

- [MCP Server Overview](overview.md)
- [Azure Active Directory (AAD) Integration](~/doc/enterprise/aad.md) — federated sign-in to time cockpit itself
- [Verify the Connection](verify-connection.md)
