---
title: ExecuteList-API - Listen programmgesteuert abfragen
description: time cockpit Listen über die Web API ausführen. TCQL-Listen und Skriptlisten für Datenanalyse, Arbeitszeitverstöße und Projektcontrolling abfragen.
en_page: doc/web-api/executelist.md
---
# ExecuteList-Endpunkt

Neben dem [OData-Endpunkt](~/doc/web-api/odata-endpunkt.md) für CRUD-Operationen, dem [Query-Endpunkt](~/doc/web-api/query-endpunkt.md) für erweiterte Abfragen und dem [Reporting-Endpunkt](~/doc/web-api/reporting-endpunkt.md) zum Erzeugen druckbarer Berichte bietet time cockpit auch einen Listen-Endpunkt für erweiterte Datenanalysen.

Wie unter [Listen anpassen](~/doc/datenmodell-anpassung/liste.md) beschrieben, können Sie entweder TCQL-Listen oder sogenannte Skriptlisten definieren. Bei TCQL-Listen ist die Datenquelle einer Liste eine einfache TCQL-Abfrage. TCQL-Abfragen haben einen wesentlichen Nachteil: Sie können Tabellen nicht beliebig verknüpfen, sondern nur entlang der Beziehungen, die im Datenmodell von time cockpit definiert sind. 

Bei Skriptlisten ist die Datenquelle einer Liste ein **Iron Python**-Skript. Weitere Informationen finden Sie unter [Scripting](/doc/scripting/overview.html). Beim Schreiben einer Skriptliste steht Ihnen ein großer Teil des .NET Frameworks zur Verfügung. Das bedeutet auch, dass Sie in einer Skriptliste mehrere TCQL-Abfragen ausführen und z. B. die Ergebnisse mehrerer Abfragen zu einem konsolidierten Ergebnis zusammenführen können. In gewisser Weise sind Skriptlisten mit einer Datenbank-View vergleichbar.

Sowohl TCQL-Listen als auch Skriptlisten können in der Benutzeroberfläche von time cockpit referenziert, aber auch über die Web API von time cockpit abgefragt werden.

> [!NOTE]
> Da eine Skriptliste Code ist, der auf unserer Infrastruktur läuft, muss sie von software architects geprüft und digital [signiert](https://www.timecockpit.com/blog/2014/11/27/Why-You-Need-to-Sign-Your-Custom-Code) werden. Diese Maßnahme schützt unsere Kunden vor dem [Noisy-Neighbor-Problem](https://learn.microsoft.com/en-us/azure/architecture/antipatterns/noisy-neighbor/noisy-neighbor).

## Anwendungsfälle

- Arbeitszeitverstöße abfragen, um sie an die jeweiligen Mitarbeiter zu senden
- Eine Projektcontrolling-Liste abfragen, um sie z. B. in PowerBI zu verwenden
- Verrechnete Zeitbuchungen abfragen, um sie in einem nachgelagerten Abrechnungssystem zu verarbeiten

## Service-Endpunkt

Die Adresse unseres Query-Endpunkts ist <https://api.timecockpit.com/executelist>. Mit dem URL-Parameter `top` können Sie die Ergebnismenge begrenzen. Beispiel: `https://api.timecockpit.com/executelist/APP_DefaultTimeReportList?$top=301`

## Authentifizierung

Um den Query-Endpunkt zu verwenden, müssen Sie sich zuerst beim Dienst authentifizieren. Wie Sie sich authentifizieren, lesen Sie unter [Authentifizierung](~/doc/web-api/authentifizierung.md).

## C#-Beispiel

Das folgende Beispiel zeigt einfachen C#-Code, der die Standard-Zeitberichtsliste von time cockpit abruft.

> [!NOTE]
> Beachten Sie, dass dieses Beispiel zeigt, wie Sie die Zeitbericht-**Liste** abfragen, nicht den druckbaren Zeitbericht (PDF, Word, Excel). Ein Beispiel, wie Sie einen druckbaren Bericht programmgesteuert abrufen, finden Sie unter [Reporting-Endpunkt](~/doc/web-api/reporting-endpunkt.md).

```cs
var userDetailUuid = new Guid("2019ff2c-edea-4864-b092-b0ba2b5be9c1"); // guid of the user to fetch the list data for
var beginTime = new DateTime(2023, 3, 1).ToString("s", CultureInfo.InvariantCulture); // the begin time of the period to get the list data for
var endTime = new DateTime(2023, 3, 31).ToString("s", CultureInfo.InvariantCulture); // the end time of the period to get the list data for

// the parameters that are passed to the list
var parametersObject = new JObject();
parametersObject.Add(new JProperty("UserDetail", $"guid'{userDetailUuid}'"));
parametersObject.Add(new JProperty("BeginTime", $"datetime'{beginTime}'"));
parametersObject.Add(new JProperty("EndTime", $"datetime'{endTime}'"));

var jsonRequest = new JObject(
	new JProperty("list", "APP_DefaultTimeReportList"),
	new JProperty("parameters", parametersObject));

var content = new StringContent(jsonRequest.ToString(), Encoding.UTF8, "application/json");
var result = await httpClient.PostAsync($"https://api.timecockpit.com/executelist/APP_DefaultTimeReportList?$top=301", content);

if (result.IsSuccessStatusCode)
{
	var byteResult = await result.Content.ReadAsStringAsync();
}
else
{
	var json = JObject.Parse(await result.Content.ReadAsStringAsync());
	throw new Exception(json["odata.error"].ToString());
}
```
