---
title: Web API (Legacy) - Token- und Basic-Authentifizierung
description: "Legacy-Dokumentation der Web API von time cockpit mit Token- und Basic-Authentifizierung. Hinweis: Empfohlen wird jetzt die PAT-Authentifizierung."
en_page: doc/web-api/legacy-overview.md
---
# Web API

Time cockpit bietet eine webbasierte API. Über HTTP, REST und JSON können Sie Informationen abrufen und ändern, ohne von unserem .NET SDK abhängig zu sein. Dieser Dienst wird öffentlich gehostet, Kunden müssen keine zusätzlichen Installations- oder Konfigurationsschritte durchführen.

## Service-Endpunkt

Die Adresse unserer Web API ist <https://api.timecockpit.com>. Sie ist nur über HTTPS und mit gültiger Authentifizierung erreichbar.

## Authentifizierung

Derzeit werden drei Arten der Authentifizierung unterstützt:

- [Token-Authentifizierung](http://en.wikipedia.org/wiki/Access_token) bietet eine einfache und effiziente Möglichkeit, Webanfragen zu authentifizieren. Ein Header überträgt das Zugriffstoken und identifiziert den Inhaber (Bearer).
- [Basic-Authentifizierung](http://en.wikipedia.org/wiki/Basic_access_authentication) mit Benutzername und Passwort wird von Werkzeugen verwendet, die keine Token-Authentifizierung anbieten (z. B. [OData in Excel](http://office.microsoft.com/en-001/excel-help/connect-to-an-odata-feed-HA104019824.aspx)), sowie zum erstmaligen Abrufen von Authentifizierungstokens.

> [!WARNING]
> Wir raten dringend von Token- oder Basic-Authentifizierung ab. Diese Authentifizierungsarten werden in absehbarer Zeit deaktiviert. Wir empfehlen dringend, sich mit PATs zu authentifizieren.

Das folgende Beispiel zeigt, wie Sie über eine einfache Webanfrage ein Token abrufen und eine beispielhafte Dienstanfrage mit Token-Authentifizierung senden:

```cs
var tokenUri = "https://api.timecockpit.com/token";
var metadataUri = "https://api.timecockpit.com/odata/$metadata";

using (var client = new HttpClient())
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

Die relevanten Webanfragen dieses Beispiels sind:

### Token-Anfrage

```
GET https://api.timecockpit.com/token HTTP/1.1
Authorization: Basic bmljZTp0cnkgOik=
Host: api.timecockpit.com
```

### Metadaten-Anfrage

```
GET https://api.timecockpit.com/odata/$metadata HTTP/1.1
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9...
Host: api.timecockpit.com
```

### Metadaten-Antwort

```
HTTP/1.1 200 OK
Content-Length: 53769
Content-Type: application/xml; charset=utf-8
Server: Microsoft-IIS/8.0
DataServiceVersion: 3.0
X-Powered-By: ASP.NET
Set-Cookie: ARRAffinity=244116e25a72155d832c22601a40ae87af7d9c2cb18a99a181efeffc297cbc64;Path=/;Domain=api.timecockpit.com
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

## Aktuelle Einschränkungen

Die API ist nur mit aktuellen time cockpit Versionen getestet. Wenn Ihr Konto noch nie mit einer time cockpit Version >= 1.10 (März 2013) verwendet wurde, muss es mit einem aktuellen Vollclient aktualisiert werden.
