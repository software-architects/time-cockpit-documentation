---
title: Reporting-API - Berichte programmgesteuert erzeugen
description: SSRS-Berichte von time cockpit über die Web API als PDF, Word oder Excel erzeugen. Zeitberichte und eigene Berichte programmgesteuert abrufen.
en_page: doc/web-api/reporting.md
---
# Reporting-Endpunkt

Time cockpit bietet leistungsfähige Berichtsfunktionen. Zum einen kann jede Liste in time cockpit als druckbarer SSRS-Bericht in Word, Excel oder PDF dargestellt werden. Die SSRS-Berichtsdefinition wird dabei zur Laufzeit erzeugt. Zusätzlich können Sie eigene SSRS-Berichtsdefinitionen erstellen und in time cockpit hochladen. Weitere Informationen finden Sie unter [Berichte](~/doc/berichte/ueberblick.md).

Manchmal ist es notwendig, Berichte von time cockpit programmgesteuert zu erzeugen. Für diese Szenarien bieten wir den Reporting-Endpunkt in unserer Web API an.

## Anwendungsfälle

- Den integrierten Zeitbericht abrufen, um ihn an die jeweiligen Mitarbeiter zu senden
- Einen eigenen Fortschrittsbericht abrufen, um ihn an den entsprechenden Kunden zu senden

## Service-Endpunkt

Die Adresse unseres Query-Endpunkts ist <https://api.timecockpit.com/report/show>. Mit dem URL-Parameter `format` können Sie den Bericht in verschiedenen Formaten abrufen:

- PDF: https://api.timecockpit.com/report/show/?**format=pdf**
- Word: https://api.timecockpit.com/report/show/?**format=wordopenxml**
- Excel: https://api.timecockpit.com/report/show/?**format=excelopenxml**

## Authentifizierung

Um den Query-Endpunkt zu verwenden, müssen Sie sich zuerst beim Dienst authentifizieren. Wie Sie sich authentifizieren, lesen Sie unter [Authentifizierung](~/doc/web-api/authentifizierung.md).

## C#-Beispiel

Das folgende Beispiel zeigt einfachen C#-Code, der den Standard-Zeitbericht von time cockpit abruft.

```cs
var reportUuid = new Guid("7dd35f33-d2c1-49ed-b341-d2c2250e7a49"); // guid of the default time report
	var userDetailUuid = new Guid("2019ff2c-edea-4864-b092-b0ba2b5be9c1"); // guid of the user to fetch the report for
	var beginTime = new DateTime(2023, 3, 1).ToString("s", CultureInfo.InvariantCulture); // the begin time of the period to get the time report for
	var endTime = new DateTime(2023, 3, 31).ToString("s", CultureInfo.InvariantCulture); // the end time of the period to get the time report for

	// the parameters that are passed to the report
	var parametersObject = new JObject();
	parametersObject.Add(new JProperty("UserDetail", $"guid'{userDetailUuid}'"));
	parametersObject.Add(new JProperty("BeginTime", $"datetime'{beginTime}'"));
	parametersObject.Add(new JProperty("EndTime", $"datetime'{endTime}'"));

	// the parameters that are passed to the filter of the APP_DefaultTimeReportList
	var filterEntityObject = new JObject();
	filterEntityObject.Add(new JProperty("USR_UserDetailUuid", $"{userDetailUuid}"));
	filterEntityObject.Add(new JProperty("USR_BeginTime", $"{beginTime}"));
	filterEntityObject.Add(new JProperty("USR_EndTime", $"{endTime}"));

	var configuration = new JObject();
	configuration.Add(new JProperty("Title", $"Time Report"));
	configuration.Add(new JProperty("MainColor", $"#25a0da"));

	var jsonRequest = new JObject(
		new JProperty("listname", "APP_DefaultTimeReportList"),
		new JProperty("parameters", parametersObject),
		new JProperty("filterEntityObject", filterEntityObject),
		new JProperty("contentDisposition", "attachment"),
		new JProperty("groupState", new JArray()),
		new JProperty("reportuuid", reportUuid.ToString()),
		new JProperty("configuration", configuration));

	var content = new StringContent("data=" + jsonRequest.ToString(), Encoding.UTF8, "application/x-www-form-urlencoded");
	var result = await httpClient.PostAsync($"https://api.timecockpit.com/report/show/?format=pdf", content);

	if (result.IsSuccessStatusCode)
	{
		var byteResult = await result.Content.ReadAsByteArrayAsync();
	}
	else
	{
		var json = JObject.Parse(await result.Content.ReadAsStringAsync());
		throw new Exception(json["odata.error"].ToString());
	}
```
