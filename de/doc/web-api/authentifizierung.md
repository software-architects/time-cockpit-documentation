---
title: Web-API-Authentifizierung - PAT, Token und Basic
description: So authentifizieren Sie sich bei der Web API von time cockpit mit PAT (Personal Access Token), Token- oder Basic-Authentifizierung. Mit Codebeispielen.
en_page: doc/web-api/authentication.md
---
# Authentifizierung

Derzeit werden drei Arten der Authentifizierung unterstützt:

- [Token-Authentifizierung](http://en.wikipedia.org/wiki/Access_token) bietet eine einfache und effiziente Möglichkeit, Webanfragen zu authentifizieren. Ein Header überträgt das Zugriffstoken und identifiziert den Inhaber (Bearer).
- [Basic-Authentifizierung](http://en.wikipedia.org/wiki/Basic_access_authentication) mit Benutzername und Passwort wird von Werkzeugen verwendet, die keine Token-Authentifizierung anbieten (z. B. [OData in Excel](http://office.microsoft.com/en-001/excel-help/connect-to-an-odata-feed-HA104019824.aspx)), sowie zum erstmaligen Abrufen von Authentifizierungstokens.
- [PAT-Authentifizierung](https://en.wikipedia.org/wiki/Personal_access_token).

> [!WARNING]
> Wir raten dringend von Token- oder Basic-Authentifizierung ab. Diese Authentifizierungsarten werden in absehbarer Zeit deaktiviert. Wir empfehlen dringend, sich mit PATs zu authentifizieren.

### PAT anlegen

So legen Sie ein PAT an:

1. Öffnen Sie https://auth.timecockpit.com/pat
2. Geben Sie Ihren time cockpit Benutzernamen oder Ihr Passwort ein
3. Klicken Sie auf "Create new PAT", um ein neues PAT für Ihren Benutzer anzulegen
4. Geben Sie eine Beschreibung und die Gültigkeitsdauer ein und wählen Sie den Geltungsbereich (Scope) des PAT. Wir unterscheiden zwei Geltungsbereiche:
   1. Management: Ermöglicht es Ihnen, Benutzer programmgesteuert über die Web API anzulegen und zu deaktivieren
   2. Data: Ermöglicht es Ihnen, alle Daten in Ihrem Konto zu verwalten. Wenn Sie Berechtigungen in Ihrem Tenant haben, erhalten Sie mit dem PAT dieselben Berechtigungen, die Ihr Benutzer bereits hat.
![PAT anlegen](/doc/web-api/images/create-pat-1.jpg "PAT anlegen")
5. Klicken Sie auf "Create". Daraufhin wird Ihnen das erzeugte PAT angezeigt. Kopieren Sie das PAT an einen sicheren Ort, z. B. in einen Passwort-Safe.

### Mit einem PAT authentifizieren

Das folgende Codebeispiel zeigt, wie Sie einen time cockpit HTTP-Client in einer Azure Function einrichten

```cs
[assembly: FunctionsStartup(typeof(Startup))]

namespace ImportExportFunctionApp;

public class Startup : FunctionsStartup
{
	public override void Configure(IFunctionsHostBuilder builder)
	{
		builder.Services.AddLogging();
		ConfigureCommonServices(builder);
	}

	#region Helpers

	public virtual void ConfigureCommonServices(IFunctionsHostBuilder builder)
	{
		var context = builder.GetContext();
		var config = context.Configuration;

		builder.Services.AddLogging();

		ConfigureTimeCockpitHttpClient(builder.Services, config);
	}

	public virtual void ConfigureTimeCockpitHttpClient(IServiceCollection services, IConfiguration config)
	{
		services.AddHttpClient("TimeCockpit", httpClient =>
		{
			httpClient.BaseAddress = new Uri(config["TimeCockpitBaseUri"]);
			httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue($"Bearer", $"{config["TimeCockpitDataApiPAT"]}");
		});
	}

	#endregion
}
```

> [!NOTE]
> Wir raten dringend davon ab, das PAT im Quellcode zu speichern. Legen Sie sensible Informationen stattdessen z. B. in Microsoft Key Vault ab

### Metadaten abfragen

Das folgende Beispiel zeigt, wie Sie die Metadaten von time cockpit mit einem PAT abfragen:

```cs
var metadataUri = "https://api.timecockpit.com/odata/$metadata";

using (var httpClient = new HttpClient())
{
	httpClient.BaseAddress = new Uri(timeCockpitBaseUri);
	httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue($"Bearer", timeCockpitDataApiPAT);

	var response = await httpClient.GetAsync(metadataUri);
	response.EnsureSuccessStatusCode();

	var metadata = await response.Content.ReadAsStringAsync();
}
```

### Metadaten-Anfrage

```
GET https://api.timecockpit.com/odata/$metadata HTTP/1.1
Authorization: Bearer YOUR_PAT
Host: api.timecockpit.com
```

### Metadaten-Antwort

```

HTTP/1.1 200 OK
Content-Length: 2403124
Content-Type: application/xml; charset=utf-8
Server: Microsoft-IIS/10.0
DataServiceVersion: 3.0
X-Powered-By: ASP.NET
Date: Tue, 04 Apr 2023 15:34:22 GMT
Access-Control-Expose-Headers: Request-Context
Request-Context: appId=cid-v1:84a13eca-1545-488e-8dd4-a46a0272dff1

<?xml version="1.0" encoding="utf-8"?>
<edmx:Edmx Version="1.0" xmlns:edmx="http://schemas.microsoft.com/ado/2007/06/edmx">
  <edmx:DataServices m:DataServiceVersion="3.0" xmlns:m="http://schemas.microsoft.com/ado/2007/08/dataservices/metadata">
    <Schema Namespace="cofx" xmlns="http://schemas.microsoft.com/ado/2009/11/edm">
      <EntityType Name="APP_CompensatoryTime">
        <Key>
          <PropertyRef Name="APP_CompensatoryTimeUuid" />
        </Key>
        <Property Name="APP_CompensatoryTimeUuid" Type="Edm.Guid" Nullable="false" />
        <Property Name="APP_BeginTime" Type="Edm.DateTime" />
        <Property Name="APP_Description" Type="Edm.String" />
        <Property Name="APP_DurationInHours" Type="Edm.Decimal" />
        <Property Name="APP_EndTime" Type="Edm.DateTime" />
        <Property Name="APP_IsWholeDay" Type="Edm.Boolean" />
        <Property Name="APP_UserDetailUuid" Type="Edm.Guid" />
        <NavigationProperty Name="APP_UserDetail" Relationship="cofx.cofx_APP__CompensatoryTime_APP__UserDetail_cofx_APP__UserDetail_UserDetailsOfCompensatoryTime" ToRole="APP_UserDetail" FromRole="UserDetailsOfCompensatoryTime" />
      </EntityType>
      ...
</edmx:Edmx>
```
