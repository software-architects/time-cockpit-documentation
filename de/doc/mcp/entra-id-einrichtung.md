---
title: MCP-Server - Einrichtung in Microsoft Entra ID
description: "App für den time cockpit MCP-Server im eigenen Entra-ID-Mandanten registrieren: Plattform, Redirect-URIs, API-Berechtigung, Admin-Zustimmung, Client-ID."
en_page: doc/mcp/entra-id-setup.md
---
# Einrichtung in Microsoft Entra ID für den MCP-Server

> [!WARNING]
> Im Aufbau: Der MCP-Server von time cockpit und diese Dokumentation werden aktiv weiterentwickelt, inkompatible Änderungen sind möglich. Tools können umbenannt, geändert oder entfernt werden, und Dialogbeschriftungen sowie Konfigurationsschritte können sich ohne Ankündigung ändern. Prüfen Sie diese Seite auf Aktualisierungen, bevor Sie die Einrichtung für Ihre Benutzer ausrollen, und rechnen Sie damit, Ihre Konfiguration, Skills und Prompts nach einem Update anpassen zu müssen.

Der MCP-Server von time cockpit authentifiziert jeden Benutzer gegen Microsoft Entra ID. Der KI-Client (Claude Code, Codex, VS Code, …) benötigt für die Anmeldung eine **OAuth-Client-Anwendung in Ihrem eigenen Entra-Mandanten**. Diese App-Registrierung legen Sie selbst an; ihre **Client-ID** ist der Wert, den Ihre Benutzer in ihrer Client-Konfiguration eintragen.

Da die App-Registrierung Ihnen gehört, entscheiden Sie, wie viele Sie anlegen. Eine Registrierung für alle Clients funktioniert. Getrennte Registrierungen pro Client (zum Beispiel eine für Claude Code und Codex, eine für die Claude App, eine für Copilot Studio) halten die Redirect-URIs der einzelnen Clients auseinander und erlauben es, einen einzelnen Client einzuschränken oder zu sperren, ohne die anderen zu berühren.

## So funktioniert die Authentifizierung

- time cockpit betreibt den MCP-Server als Entra-**Ressourcenanwendung** mit dem Scope `mcp.access` (Application ID URI `https://mcp.timecockpit.com`; Preview hat eine eigene, siehe [Umgebungen](~/doc/mcp/ueberblick.md#umgebungen)).
- Ihr Entra-Mandant enthält eine oder mehrere **Client-Anwendungen**, die diesen Scope im Namen des angemeldeten Benutzers anfordern. Der MCP-Server akzeptiert Tokens jeder Client-Anwendung in Ihrem Mandanten, der die Berechtigung `mcp.access` erteilt wurde.
- Clients verwenden OAuth 2.1 Authorization Code mit PKCE. Native Clients (Claude Code, Codex, VS Code, Copilot CLI) sind **Public Clients** und benötigen kein Secret. Copilot Studio und ChatGPT erfordern einen **Confidential Client** mit Client Secret – verwenden Sie dafür eine eigene App-Registrierung.
- Entra ID unterstützt keine Dynamic Client Registration, daher muss in jedem Client Ihre Client-ID ausdrücklich konfiguriert werden.

> [!WARNING]
> Prüfung erforderlich: Die folgende Liste der Redirect-URIs entspricht der getesteten Konfiguration. Prüfen Sie sie in Ihrem Mandanten, bevor Sie sie intern veröffentlichen.

## Die MCP-API von time cockpit in Ihrem Mandanten verfügbar machen

Der MCP-Server ist eine **mehrinstanzenfähige** (multi-tenant) Entra-Anwendung im Besitz von time cockpit. Bevor Ihre Client-Anwendung die Berechtigung `mcp.access` anfordern kann, benötigt die MCP-API einen **Service Principal** (Unternehmensanwendung) in Ihrem Mandanten. Solange dieser fehlt, erscheint die API nicht unter *APIs my organization uses*, und die Zustimmung für Ihren Client schlägt mit `AADSTS650052` fehl.

| Umgebung | Application (client) ID der MCP-API | Application ID URI |
|-------------|----------------------------------------|--------------------|
| Prod | `74f0cf06-01e9-4a1b-ba28-98a7877eebae` | `https://mcp.timecockpit.com` |
| Preview | `c93ae778-d445-4490-a7a9-4529f0e0017c` | `https://mcp-preview.timecockpit.com` |

Ein Entra-Administrator legt den Service Principal auf eine der folgenden Arten an. Eine Mitwirkung des time cockpit Supports ist nicht erforderlich.

- **Direkt anlegen** mit der Azure CLI oder Microsoft Graph PowerShell. Das benötigt keine Redirect-URI und funktioniert für jede Umgebung:

  ```bash
  az ad sp create --id 74f0cf06-01e9-4a1b-ba28-98a7877eebae
  ```

  ```powershell
  New-MgServicePrincipal -AppId 74f0cf06-01e9-4a1b-ba28-98a7877eebae
  ```

- **Administratorzustimmung für Ihre eigene Client-Anwendung erteilen** (Schritt 4 unten oder die URL `https://login.microsoftonline.com/<your-tenant-id>/adminconsent?client_id=<your-client-id>`). Entra legt im Zuge dieser Zustimmung die Service Principals aller APIs an, die der Client benötigt.

- **URL für die Administratorzustimmung zur MCP-API selbst**: `https://login.microsoftonline.com/<your-tenant-id>/adminconsent?client_id=74f0cf06-01e9-4a1b-ba28-98a7877eebae`. Damit wird der API mandantenweit zugestimmt und der Service Principal angelegt.

  > [!WARNING]
  > Prüfung erforderlich: Diese URL funktioniert nur, wenn die Registrierung der MCP-API eine Redirect-URI hat. Andernfalls antwortet Entra mit `AADSTS500113`. Noch nicht verifiziert; verwenden Sie bevorzugt die ersten beiden Möglichkeiten.

Der Service Principal erscheint unter **Identity → Applications → Enterprise applications**. Wiederholen Sie den Vorgang für Preview, wenn sich Ihre Benutzer mit dieser Umgebung verbinden sollen.

## App-Registrierung anlegen

Ein Entra-Administrator (oder ein Benutzer mit der Rolle *Application Developer*) führt diese Schritte einmal pro App-Registrierung im [Entra Admin Center](https://entra.microsoft.com) unter **Identity → Applications → App registrations → New registration** aus.

1. **Name**: z. B. `time cockpit MCP client`. **Supported account types**: *Accounts in this organizational directory only*.

2. **Plattform und Redirect-URIs** – je nachdem, für welche Clients diese Registrierung gedacht ist:

   - Für native Clients fügen Sie die Plattform **Mobile and desktop applications** und die Redirect-URIs aus der Tabelle unten hinzu. Setzen Sie unter **Authentication → Advanced settings** die Option **Allow public client flows** auf *Yes*.
   - Für gehostete Clients (Claude App, ChatGPT, Copilot Studio, M365) fügen Sie die Plattform **Web** mit den jeweiligen Redirect-URIs hinzu.
   - Redirect-URIs mit `127.0.0.1` (Codex) lassen sich im Formular des Portals nicht eingeben; fügen Sie sie über **Manifest → `replyUrlsWithType`** mit `"type": "InstalledClient"` hinzu.

3. **Token-Version**: Öffnen Sie **Manifest** und setzen Sie die angeforderte Access-Token-Version auf **2**. Im aktuellen Manifest-Format (Microsoft Graph App) lautet das `"api": { "requestedAccessTokenVersion": 2 }`; im älteren AAD-Graph-Manifest heißt die Eigenschaft `accessTokenAcceptedVersion`. Der MCP-Server akzeptiert nur Entra-v2.0-Tokens und lehnt v1.0-Tokens mit `401` ab. Neue App-Registrierungen haben standardmäßig `null`, was v1.0-Tokens ergibt; dieser Schritt ist daher erforderlich.

4. **API-Berechtigung**: **API permissions → Add a permission → APIs my organization uses**, suchen Sie nach der MCP-API von time cockpit, wählen Sie **Delegated permissions → `mcp.access`** und dann **Grant admin consent** für Ihren Mandanten. Wiederholen Sie das für die Preview-API, wenn sich Ihre Benutzer auch mit dieser Umgebung verbinden können sollen.

   > [!NOTE]
   > Die MCP-API von time cockpit erscheint erst unter *APIs my organization uses*, wenn ihr Service Principal in Ihrem Mandanten existiert. Ist sie nicht aufgeführt, legen Sie ihn wie unter [Die MCP-API von time cockpit in Ihrem Mandanten verfügbar machen](#die-mcp-api-von-time-cockpit-in-ihrem-mandanten-verfügbar-machen) beschrieben an.

5. Nur für **Copilot Studio** und **ChatGPT**: **Certificates & secrets → New client secret**. Notieren Sie den Wert des Secrets; er wird zusammen mit der Client-ID im MCP-Assistenten von Copilot Studio oder im Dialog **New App** von ChatGPT eingetragen.

6. Kopieren Sie die **Application (client) ID** von der Übersichtsseite. Das ist die `<client-id>`, die auf allen Client-Seiten dieser Dokumentation verwendet wird.

Optionale Absicherung: Unter **Enterprise applications** können Sie für die zugehörige Unternehmensanwendung **Assignment required** setzen und Gruppen zuweisen, sodass sich nur ausgewählte Benutzer über diesen Client anmelden können. Ihre Richtlinien für bedingten Zugriff (Conditional Access) gelten automatisch.

## Alternative: App-Registrierung mit Bicep anlegen

Statt der obigen Schritte im Portal kann ein Entra-Administrator die App-Registrierung mit der folgenden Bicep-Vorlage bereitstellen. Sie verwendet die [Microsoft Graph Bicep-Erweiterung](https://learn.microsoft.com/graph/templates/) und erzeugt dasselbe Ergebnis: einen Public Client für einen einzelnen Mandanten mit v2.0-Tokens, den Service Principal der MCP-API von time cockpit, die Berechtigung `mcp.access` und optional die mandantenweite Administratorzustimmung. Die Redirect-URIs werden als Parameter übergeben; entnehmen Sie sie der [Tabelle unten](#redirect-uris-pro-client).

Speichern Sie beide Dateien in einem Ordner. `bicepconfig.json` aktiviert die Graph-Erweiterung:

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

Stellen Sie die Vorlage auf Mandantenebene bereit. Das bereitstellende Konto benötigt die Rolle *Application Administrator* und für `grantAdminConsent=true` zusätzlich die Berechtigung, delegierte Berechtigungserteilungen anzulegen (zum Beispiel *Privileged Role Administrator* oder *Global Administrator*):

```bash
az deployment tenant create --location westeurope --template-file application.bicep --parameters redirectUris="['http://localhost:64485/callback','https://claude.ai/api/mcp/auth_callback']" grantAdminConsent=true
```

Die Ausgabe `applicationClientId` ist die `<client-id>` für Ihre Benutzer. Redirect-URIs für gehostete Clients (Plattform **Web**) und Client Secrets für Copilot Studio deckt die Vorlage nicht ab; fügen Sie diese anschließend im Portal hinzu. Eine erneute Bereitstellung mit demselben `applicationUniqueName` aktualisiert die vorhandene Registrierung.

## Redirect-URIs pro Client

| Client | Redirect-URI | Plattformtyp in Entra |
|--------|--------------|------------------------|
| Claude Code | `http://localhost:64485/callback` (fester Port aus `callbackPort`) | Mobile and desktop |
| Codex | `http://127.0.0.1:<port>/callback/<callback-id>` – den genauen Wert gibt `codex mcp add … --oauth-client-id` als „OAuth callback URL" aus; mit einem festen `callback_port` ist der Port Teil der URI | Mobile and desktop (über das Manifest) |
| VS Code | `http://localhost` (MSAL-Loopback, variabler Port) und `https://vscode.dev/redirect` | Mobile and desktop |
| GitHub Copilot CLI | Loopback, Port konfigurierbar (`callbackPort`) – Verhalten nicht verifiziert | Mobile and desktop |
| claude.ai / Claude Desktop / Cowork | `https://claude.ai/api/mcp/auth_callback` | Web (Public Client) |
| ChatGPT (Custom App im Workspace) | `https://chatgpt.com/connector/oauth/<callback-id>` – wird im Dialog **New App** als **Callback URL** angezeigt, pro App eindeutig | Web (Confidential Client mit Secret, `client_secret_post`) |
| Copilot Studio | `https://global.consent.azure-apim.net/redirect/<connector-id>` – wird nach **Create** angezeigt, pro Tool unterschiedlich | Web (Confidential Client mit Secret) |
| M365 deklarativer Agent / föderierter Connector | `https://teams.microsoft.com/api/platform/v1.0/oAuthRedirect` | Web |
| Cursor (Desktop-App, CLI) – nicht getestet | `http://localhost:8787/callback` | Mobile and desktop |
| Cursor Web / Cloud Agents – nicht getestet | `https://www.cursor.com/agents/mcp/oauth/callback` | Web |

## Werte, die Benutzer benötigen

| Wert | Herkunft | Benötigt von |
|-------|--------------------|-----------|
| Client-ID (`<client-id>`) | Application (client) ID Ihrer App-Registrierung | jedem Client |
| Client Secret | Ihre App-Registrierung (Confidential Client) | nur ChatGPT und Copilot Studio |
| Mandanten-ID des time cockpit Mandanten | time cockpit Support | nur wenn Ihr Entra-Mandant mehreren time cockpit Mandanten zugeordnet ist – siehe [Verbindungseinstellungen](~/doc/mcp/ueberblick.md#verbindungseinstellungen-header-oder-url-segment) |

## Netzwerkvoraussetzungen

Wenn Ihre Organisation ausgehenden Datenverkehr filtert oder bedingten Zugriff mit benannten Standorten verwendet, müssen gehostete Clients den MCP-Server erreichen können:

- Anthropic (claude.ai, Claude Desktop, Cowork): `160.79.104.0/21`
- Power Platform / Copilot Studio: die ausgehenden IP-Bereiche Ihrer Region, siehe die Dokumentation von Microsoft.

## Fehlerbehebung

| Meldung | Ursache / Lösung |
|---------|------------------|
| *needs admin approval* bei der Anmeldung | Für die Berechtigung `mcp.access` wurde in Ihrer App-Registrierung keine Administratorzustimmung erteilt. |
| `does not support dynamic client registration` | Im Client ist keine Client-ID konfiguriert. Tragen Sie Ihre Client-ID wie auf der Client-Seite beschrieben ein. |
| `AADSTS50011: redirect URI … does not match` | Die vom Client verwendete Redirect-URI ist in Ihrer App-Registrierung nicht eingetragen. Vergleichen Sie mit der Tabelle oben; prüfen Sie den Plattformtyp (Mobile and desktop oder Web). |
| `AADSTS7000218` / *client assertion or secret required* | Die App-Registrierung wird als Confidential Client behandelt. Setzen Sie **Allow public client flows** auf *Yes* oder tragen Sie die Redirect-URI unter *Mobile and desktop applications* statt unter *Web* ein. |
| `AADSTS65001` / *user or administrator has not consented* | Erteilen Sie unter **API permissions** die Administratorzustimmung für `mcp.access`. |
| Anmeldung gelingt, aber jeder Tool-Aufruf liefert `401`, obwohl das Token frisch ist | Die App-Registrierung stellt v1.0-Access-Tokens aus. Setzen Sie die angeforderte Access-Token-Version im Manifest auf 2 (Schritt 3) und melden Sie sich erneut an. |
| `AADSTS9010010` / `invalid_target` | Der Client sendet einen `resource`-Parameter, der nicht zur Application ID URI der MCP-API passt. Siehe die Abschnitte zur Fehlerbehebung auf den jeweiligen Client-Seiten. |
| `AADSTS500011` / *resource principal not found* | Die MCP-API von time cockpit hat noch keinen Service Principal in Ihrem Mandanten. Legen Sie ihn wie unter [Die MCP-API von time cockpit in Ihrem Mandanten verfügbar machen](#die-mcp-api-von-time-cockpit-in-ihrem-mandanten-verfügbar-machen) beschrieben an. |
| `AADSTS650052` / *needs access to a service that your organization has not subscribed to or enabled* | Dieselbe Ursache, sichtbar beim Erteilen der Administratorzustimmung für Ihre Client-Anwendung. Legen Sie zuerst den Service Principal der MCP-API an und erteilen Sie die Zustimmung dann erneut. |

## Verwandte Seiten

- [Überblick über den MCP-Server](~/doc/mcp/ueberblick.md)
- [Integration von Azure Active Directory (AAD)](~/doc/enterprise/azure-active-directory.md) – föderierte Anmeldung bei time cockpit selbst
- [Verbindung prüfen](~/doc/mcp/verbindung-pruefen.md)
