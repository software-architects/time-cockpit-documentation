---
title: MCP Server - Microsoft Entra ID Setup
description: Register a client application for the time cockpit MCP server in your own Microsoft Entra ID tenant - platform, redirect URIs, API permission, admin consent - and hand the client ID to your users.
---
# Microsoft Entra ID Setup for the MCP Server

> [!WARNING]
> Preliminary documentation: The time cockpit MCP server and this documentation are under active development. Tool names, dialog labels and configuration steps may change without notice. Check back for updates before rolling the setup out to your users.

The time cockpit MCP server authenticates every user against Microsoft Entra ID. The AI client (Claude Code, Codex, VS Code, …) needs an **OAuth client application in your own Entra tenant** to run the sign-in. You create this app registration yourself; its **client ID** is the value your users enter in their client configuration.

Because the app registration is yours, you decide how many you want. One registration for all clients works. Separate registrations per client (for example one for Claude Code and Codex, one for the Claude app, one for Copilot Studio) let you keep the redirect URIs of each client apart and restrict or revoke a single client without touching the others.

## How Authentication Works

- time cockpit operates the MCP server as an Entra **resource application** with the scope `mcp.access` (Application ID URI `https://mcp.timecockpit.com`; preview has its own, see [Environments](overview.md#environments)).
- Your Entra tenant contains one or more **client applications** that request this scope on behalf of the signed-in user. The MCP server accepts tokens from any client application in your tenant that has been granted the `mcp.access` permission.
- Clients use OAuth 2.1 Authorization Code with PKCE. Native clients (Claude Code, Codex, VS Code, Copilot CLI) are **public clients** and need no secret. Copilot Studio and ChatGPT require a **confidential client** with a client secret — use a separate app registration for them.
- Entra ID does not support Dynamic Client Registration, which is why every client needs your client ID configured explicitly.

> [!WARNING]
> Review required: The list of redirect URIs below follows the tested configuration. Verify against your tenant before publishing internally.

## Make the time cockpit MCP API Available in Your Tenant

The MCP server is a **multi-tenant** Entra application owned by time cockpit. Before your client application can request its `mcp.access` permission, the MCP API needs a **service principal** (enterprise application) in your tenant. As long as it is missing, the API does not appear under *APIs my organization uses*, and granting consent to your client fails with `AADSTS650052`.

| Environment | Application (client) ID of the MCP API | Application ID URI |
|-------------|----------------------------------------|--------------------|
| Prod | `74f0cf06-01e9-4a1b-ba28-98a7877eebae` | `https://mcp.timecockpit.com` |
| Preview | `c93ae778-d445-4490-a7a9-4529f0e0017c` | `https://mcp-preview.timecockpit.com` |

An Entra administrator creates the service principal in one of these ways. No involvement of time cockpit support is required.

- **Create it directly** with the Azure CLI or Microsoft Graph PowerShell. This needs no redirect URI and works for every environment:

  ```bash
  az ad sp create --id 74f0cf06-01e9-4a1b-ba28-98a7877eebae
  ```

  ```powershell
  New-MgServicePrincipal -AppId 74f0cf06-01e9-4a1b-ba28-98a7877eebae
  ```

- **Grant admin consent to your own client application** (step 4 below, or the URL `https://login.microsoftonline.com/<your-tenant-id>/adminconsent?client_id=<your-client-id>`). Entra provisions the service principals of all APIs the client requires as part of that consent.

- **Admin consent URL for the MCP API itself**: `https://login.microsoftonline.com/<your-tenant-id>/adminconsent?client_id=74f0cf06-01e9-4a1b-ba28-98a7877eebae`. This consents to the API tenant-wide and creates the service principal.

  > [!WARNING]
  > Review required: This URL only works if the MCP API registration has a redirect URI. Otherwise Entra answers with `AADSTS500113`. Not verified yet; prefer the first two options.

The service principal appears under **Identity → Applications → Enterprise applications**. Repeat for preview if your users should connect to that environment.

## Create the App Registration

An Entra administrator (or a user with the *Application Developer* role) performs these steps once per app registration in the [Entra admin center](https://entra.microsoft.com) under **Identity → Applications → App registrations → New registration**.

1. **Name**: e.g. `time cockpit MCP client`. **Supported account types**: *Accounts in this organizational directory only*.

2. **Platform and redirect URIs** — depending on which clients this registration is for:

   - For native clients add the platform **Mobile and desktop applications** and the redirect URIs from the table below. Under **Authentication → Advanced settings** set **Allow public client flows** to *Yes*.
   - For hosted clients (Claude app, ChatGPT, Copilot Studio, M365) add the platform **Web** with the respective redirect URIs.
   - `127.0.0.1` redirect URIs (Codex) cannot be entered in the portal form; add them via **Manifest → `replyUrlsWithType`** with `"type": "InstalledClient"`.

3. **Token version**: open **Manifest** and set the requested access token version to **2**. In the current manifest format (Microsoft Graph app) this is `"api": { "requestedAccessTokenVersion": 2 }`; in the legacy AAD Graph manifest the property is called `accessTokenAcceptedVersion`. The MCP server only accepts Entra v2.0 tokens and rejects v1.0 tokens with `401`. New app registrations default to `null`, which yields v1.0 tokens, so this step is required.

4. **API permission**: **API permissions → Add a permission → APIs my organization uses**, search for the time cockpit MCP API, select **Delegated permissions → `mcp.access`**, then **Grant admin consent** for your tenant. Repeat for the preview API if your users should be able to connect to that environment.

   > [!NOTE]
   > The time cockpit MCP API appears under *APIs my organization uses* only once its service principal exists in your tenant. If it is not listed, create it as described in [Make the time cockpit MCP API Available in Your Tenant](#make-the-time-cockpit-mcp-api-available-in-your-tenant).

5. For **Copilot Studio** and **ChatGPT** only: **Certificates & secrets → New client secret**. Note the secret value; it is entered in the Copilot Studio MCP wizard or in the ChatGPT **New App** dialog together with the client ID.

6. Copy the **Application (client) ID** from the overview page. This is the `<client-id>` used on all client pages of this documentation.

Optional hardening: under **Enterprise applications** you can set **Assignment required** on the corresponding enterprise app and assign groups, so only selected users can sign in through this client. Your Conditional Access policies apply automatically.

## Alternative: Create the App Registration with Bicep

Instead of the portal steps above, an Entra administrator can deploy the app registration with the following Bicep template. It uses the [Microsoft Graph Bicep extension](https://learn.microsoft.com/graph/templates/) and creates the same result: a single-tenant public client with v2.0 tokens, the service principal of the time cockpit MCP API, the `mcp.access` permission and, optionally, tenant-wide admin consent. Redirect URIs are passed as a parameter; take them from the [table below](#redirect-uris-per-client).

Save both files in one folder. `bicepconfig.json` enables the Graph extension:

```json
{
  "extensions": {
    "microsoftGraphV1": "br:mcr.microsoft.com/bicep/extensions/microsoftgraph/v1.0:1.0.0"
  }
}
```

`application.bicep`:

```bicep
// Provisions the Entra ID app registration (and its service principal) for the time cockpit MCP
// public/native OAuth client, including the required-resource-access grant for the MCP resource API.
// Deploy by hand as an Entra administrator:
//   az deployment tenant create --location <region> --template-file application.bicep \
//     --parameters redirectUris="['http://localhost:64485/callback']"
//
// The default requiredApis[0].appId is the PRODUCTION MCP resource app registration. For the
// preview environment override requiredApis with appId c93ae778-d445-4490-a7a9-4529f0e0017c and
// resourceUri https://mcp-preview.timecockpit.com.
extension microsoftGraphV1

targetScope = 'tenant'

type requiredApiConfiguration = {
  @description('Application/client ID of the resource API.')
  appId: string

  @description('Resource URI without a trailing slash, used to construct scope URIs in the outputs.')
  resourceUri: string

  @description('Delegated scope values exposed by this resource API.')
  @minLength(1)
  scopes: string[]
}

@description('Display name of the Entra ID application registration.')
param applicationName string = 'TimeCockpit MCP - Client'

@description('Redirect URIs registered for the public/native client.')
param redirectUris array = []

@description('Immutable key used by the Graph Bicep extension for idempotent deployments.')
param applicationUniqueName string = 'timecockpit-mcp-client-${tenant().tenantId}'

@description('Grant all configured delegated scopes tenant-wide. Enabling this requires an authorized Entra administrator and DelegatedPermissionGrant.ReadWrite.All.')
param grantAdminConsent bool = false

@description('Resource APIs and delegated scopes requested by the client. resourceUri must not end with a slash.')
@minLength(1)
param requiredApis requiredApiConfiguration[] = [
  {
    appId: '74f0cf06-01e9-4a1b-ba28-98a7877eebae'
    resourceUri: 'https://mcp.timecockpit.com'
    scopes: [
      'mcp.access'
    ]
  }
]

// Ensure that every resource API has a service principal in this tenant. Scope
// IDs are resolved from the published metadata instead of being hard-coded.
resource apiServicePrincipals 'Microsoft.Graph/servicePrincipals@v1.0' = [for apiConfiguration in requiredApis: {
  appId: apiConfiguration.appId
}]

resource application 'Microsoft.Graph/applications@v1.0' = {
  uniqueName: applicationUniqueName
  displayName: applicationName

  // Accounts in this organizational directory only (single tenant).
  signInAudience: 'AzureADMyOrg'

  // Configure this as a public/native OAuth client.
  isFallbackPublicClient: true
  publicClient: {
    redirectUris: redirectUris
  }

  // Manifest equivalent: api.requestedAccessTokenVersion = 2.
  api: {
    requestedAccessTokenVersion: 2
  }

  // Resolve permission IDs from each API service principal at deployment time.
  requiredResourceAccess: [for (apiConfiguration, apiIndex) in requiredApis: {
    resourceAppId: apiConfiguration.appId
    resourceAccess: map(apiConfiguration.scopes, scopeValue => {
      id: first(filter(
        apiServicePrincipals[apiIndex].oauth2PermissionScopes,
        publishedScope => publishedScope.value == scopeValue
      ))!.id
      type: 'Scope'
    })
  }]

  owners: {
    relationships: [deployer().objectId]
    relationshipSemantics: 'append'
  }
}

// The application object and its home-tenant service principal are separate
// Graph objects. Create both, as the Entra portal normally does.
resource applicationServicePrincipal 'Microsoft.Graph/servicePrincipals@v1.0' = {
  appId: application.appId
  owners: {
    relationships: [deployer().objectId]
    relationshipSemantics: 'append'
  }
}

// Optionally grant all configured delegated permissions on behalf of every
// user in the tenant. With the default value false, users instead consent
// interactively when permitted by the tenant's consent policies.
resource adminConsents 'Microsoft.Graph/oauth2PermissionGrants@v1.0' = [for (apiConfiguration, apiIndex) in requiredApis: if (grantAdminConsent) {
  clientId: applicationServicePrincipal.id
  consentType: 'AllPrincipals'
  resourceId: apiServicePrincipals[apiIndex].id
  scope: join(apiConfiguration.scopes, ' ')
}]

output applicationClientId string = application.appId
output applicationObjectId string = application.id
output servicePrincipalObjectId string = applicationServicePrincipal.id
output requestedScopes array = flatten(map(requiredApis, apiConfiguration => map(apiConfiguration.scopes, scopeValue => '${apiConfiguration.resourceUri}/${scopeValue}')))
output tenantWideAdminConsentRequested bool = grantAdminConsent
```

Deploy it at tenant scope. The deploying account needs the *Application Administrator* role, and for `grantAdminConsent=true` additionally the permission to create delegated permission grants (for example *Privileged Role Administrator* or *Global Administrator*):

```bash
az deployment tenant create --location westeurope --template-file application.bicep --parameters redirectUris="['http://localhost:64485/callback','https://claude.ai/api/mcp/auth_callback']" grantAdminConsent=true
```

The output `applicationClientId` is the `<client-id>` for your users. Redirect URIs for hosted clients (platform **Web**) and client secrets for Copilot Studio are not covered by the template; add them in the portal afterwards. Re-running the deployment with the same `applicationUniqueName` updates the existing registration.

## Redirect URIs per Client

| Client | Redirect URI | Platform type in Entra |
|--------|--------------|------------------------|
| Claude Code | `http://localhost:64485/callback` (fixed port from `callbackPort`) | Mobile and desktop |
| Codex | `http://127.0.0.1:<port>/callback/<callback-id>` — the exact value is printed by `codex mcp add … --oauth-client-id` as "OAuth callback URL"; with a fixed `callback_port` the port is part of the URI | Mobile and desktop (via manifest) |
| VS Code | `http://localhost` (MSAL loopback, variable port) and `https://vscode.dev/redirect` | Mobile and desktop |
| GitHub Copilot CLI | loopback, port configurable (`callbackPort`) — behavior not verified | Mobile and desktop |
| claude.ai / Claude Desktop / Cowork | `https://claude.ai/api/mcp/auth_callback` | Web (public client) |
| ChatGPT (workspace custom app) | `https://chatgpt.com/connector/oauth/<callback-id>` — shown as **Callback URL** in the **New App** dialog, unique per app | Web (confidential client with secret, `client_secret_post`) |
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
| Sign-in succeeds, but every tool call returns `401` although the token is fresh | The app registration issues v1.0 access tokens. Set the requested access token version to 2 in the manifest (step 3), then sign in again. |
| `AADSTS9010010` / `invalid_target` | The client sends a `resource` parameter that does not match the Application ID URI of the MCP API. See the client-specific troubleshooting sections. |
| `AADSTS500011` / *resource principal not found* | The time cockpit MCP API has no service principal in your tenant yet. Create it as described in [Make the time cockpit MCP API Available in Your Tenant](#make-the-time-cockpit-mcp-api-available-in-your-tenant). |
| `AADSTS650052` / *needs access to a service that your organization has not subscribed to or enabled* | Same cause, seen when granting admin consent to your client application. Create the service principal of the MCP API first, then grant consent again. |

## Related Pages

- [MCP Server Overview](overview.md)
- [Azure Active Directory (AAD) Integration](~/doc/enterprise/aad.md) — federated sign-in to time cockpit itself
- [Verify the Connection](verify-connection.md)
