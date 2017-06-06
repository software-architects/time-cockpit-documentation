# Web API
> [!WARNING]
This is preliminary information and subject to change. The services are offered as a developer preview and are not yet fully supported.

Starting with version May 2014 (1.24) time cockpit offers a web-based API. HTTP, REST and JSON (or XML) can be used to access and modify information without depending on our .NET SDK. This service is publicly hosted and customers do not have to perform any additional installation or configuration steps.

## Service Endpoint

The preliminary base address of our web API is <https://apipreview.timecockpit.com>. It is only accessible via HTTPS and with valid authentication.

## Authentication

Two forms of authentication are currently supported:

- [Token authentication](http://en.wikipedia.org/wiki/Access_token) offers a simple and efficient way to authenticate web requests. A header is used to transfer the access token and identify the bearer.
- [Basic authentication](http://en.wikipedia.org/wiki/Basic_access_authentication) with username and password is used by tools that do not offer token authentication (e.g. [OData in Excel](http://office.microsoft.com/en-001/excel-help/connect-to-an-odata-feed-HA104019824.aspx)) and to initially acquire authentication tokens.

The following sample shows how to acquire a token via a simple web request and issue an exemplary service request with token authentication:

```cs
var tokenUri = "https://apipreview.timecockpit.com/token";
var metadataUri = "https://apipreview.timecockpit.com/odata/$metadata";

using (var client = new WebClient())
{
  // set basic credentials and acquire token
  client.Credentials = new NetworkCredential("demo@timecockpit.com", "...");
  var token = client.DownloadString(tokenUri);

  // remove basic credentials and add token to headers
  client.Credentials = null;
  client.Headers.Add("Authorization", "Bearer " + token);

  // example service usage: retrieve and parser metadata 
  var metadata = XDocument.Parse(client.DownloadString(metadataUri));
}
```

The relevant web requests issued by this example are:

### Token Request

```
GET https://apipreview.timecockpit.com/token HTTP/1.1
Authorization: Basic bmljZTp0cnkgOik=
Host: apipreview.timecockpit.com
```

### Metadata Request

```
GET https://apipreview.timecockpit.com/odata/$metadata HTTP/1.1
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9...
Host: apipreview.timecockpit.com
```

### Metadata Response

```
HTTP/1.1 200 OK
Content-Length: 53769
Content-Type: application/xml; charset=utf-8
Server: Microsoft-IIS/8.0
DataServiceVersion: 3.0
X-Powered-By: ASP.NET
Set-Cookie: ARRAffinity=244116e25a72155d832c22601a40ae87af7d9c2cb18a99a181efeffc297cbc64;Path=/;Domain=apipreview.timecockpit.com
Date: Wed, 30 Apr 2014 11:08:26 GMT

<?xml version="1.0" encoding="utf-8"?>
<edmx:Edmx Version="1.0" xmlns:edmx="http://schemas.microsoft.com/ado/2007/06/edmx">
<edmx:DataServices m:DataServiceVersion="3.0" xmlns:m="http://schemas.microsoft.com/ado/2007/08/dataservices/metadata">
<Schema Namespace="cofx" xmlns="http://schemas.microsoft.com/ado/2009/11/edm">
<EntityType Name="APP_CalendarWeekRule">
<Key>
<PropertyRef Name="APP_CalendarWeekRuleUuid" />
</Key>
<Property Name="APP_CalendarWeekRuleUuid" Type="Edm.Guid" Nullable="false" />
<Property Name="APP_CalendarWeekRuleCode" Type="Edm.String" />
<Property Name="APP_CalendarWeekRuleName" Type="Edm.String" />
<!-- .... -->
```

## Current Limitations

The developer preview API is only tested with recent time cockpit versions. If your account has never been used with a time cockpit version >= 1.10 (March 2013) a recent full client has to be used to update.