---
title: Query-Endpunkt - TCQL-Abfrage-API
description: TCQL-Abfragen über den Query-Endpunkt von time cockpit ausführen. Wann er statt OData sinnvoll ist, mit REST- und C#-Beispielen für komplexe Abfragen.
en_page: doc/web-api/query.md
---
# Query-Endpunkt

Neben dem [OData](~/doc/web-api/odata-endpunkt.md)-Endpunkt für CRUD-Operationen bietet time cockpit auch einen Endpunkt, der ausschließlich zum Abfragen von Daten dient. Über den Query-Endpunkt senden Sie Abfragen in der proprietären Sprache TCQL von time cockpit an die Web API. Weitere Informationen zur Sprache finden Sie unter [TCQL](~/doc/tcql/ueberblick.md).

## Service-Endpunkt

Die Adresse unseres Query-Endpunkts ist <https://api.timecockpit.com/select>.

## Authentifizierung

Um den Query-Endpunkt zu verwenden, müssen Sie sich zuerst beim Dienst authentifizieren. Wie Sie sich authentifizieren, lesen Sie unter [Authentifizierung](~/doc/web-api/authentifizierung.md).

## Wann verwenden

Der OData-Endpunkt ist bequem, reicht aber in manchen Szenarien nicht aus, z. B. bei komplexen Joins oder wenn Sie eigene Domänenlogik von time cockpit in einer Abfrage verwenden. In diesen Fällen empfehlen wir den Query-Endpunkt. 

> [!NOTE]
> Wenn Sie den Query-Endpunkt verwenden, müssen Sie das JSON-Ergebnis selbst auf ein Objekt abbilden.

## REST-Beispiel

```
POST https://api.timecockpit.com/select
Authorization: Bearer <PAT or Token>
Content-Type: application/json;charset=UTF-8
Accept: application/json

{
    "query": "From T In Project Where T.Code = @Code Select T",
    "parameters": 
    {
        "Code": "'testproject'"
    }
}
```

## C#-Beispiel

Das folgende Beispiel zeigt einfachen C#-Code, der ein time cockpit Projekt mit einem bestimmten Projektcode abruft. Beachten Sie, dass Sie reines TCQL mit allen seinen Funktionen verwenden können, genau wie beim Schreiben einer Abfrage im Vollclient.

> [!NOTE]
> Dieser Code verwendet eine Klasse `TcProject`, die die JSON-Antwort der time cockpit API auf das Domänenobjekt `TcProject` abbildet. Eine vollständige Referenz finden Sie unter [TimeCockpitClient](~/doc/web-api/timecockpit-client.md).

```cs
var code = "testproject";

var query = @"From T In Project Where T.Code = @Code Select T";

var jsonRequest = new JObject(new JProperty("query", query),
    new JProperty("parameters",
        new JObject(new JProperty("Code", $"'{code}'"))));

var content = new StringContent(jsonRequest.ToString(), Encoding.UTF8, "application/json");
var response = await httpClient.PostAsync($"https://api.timecockpit.com/select", content);
var json = JObject.Parse(await response.Content.ReadAsStringAsync());

if (response.IsSuccessStatusCode)
{
    var result = json["value"].Select(jsonItem => TcProject.FromJson(jsonItem)).ToList();
}
else
{
    throw new Exception(json["odata.error"].ToString());
}
```
