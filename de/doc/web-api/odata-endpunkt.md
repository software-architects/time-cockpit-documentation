---
title: OData-API - Datenzugriff und Integration
description: So verwenden Sie den OData-Endpunkt von time cockpit zum Abfragen, Einfügen, Ändern und Löschen von Daten. Mit Beispielen für C#, TypeScript und mehr.
en_page: doc/web-api/odata.md
---
# OData

Das [Open Data Protocol (OData)](http://www.odata.org/) ist ein Webservice-Protokoll für den Datenaustausch. Es unterstützt gefilterte Abfragen, Metadaten-Reflection und Datenmanipulation (d. h. Einfügen, Ändern, Löschen). 

Time cockpit bietet einen OData-Endpunkt, der Modell und Daten einschließlich individueller Konfigurationen des Datenmodells bereitstellt. OData kann von Client-Anwendungen (z. B. [PowerBI](https://www.microsoft.com/en-us/power-platform/products/power-bi), [Excel](http://www.timecockpit.com/blog/2014/04/29/Your-Data-in-a-Geographical-Context), [LINQPad](https://www.linqpad.net/)) und aus verschiedenen Programmiersprachen (z. B. [C#](http://www.asp.net/web-api/overview/odata-support-in-aspnet-web-api/calling-an-odata-service-from-a-net-client), [TypeScript](http://jaystack.com/blog/typescript-meets-odata-with-the-help-of-jaydata-and-jaysvcutil), [Java](http://restlet.org/learn/guide/2.2/extensions/odata/)) genutzt werden.

## Service-Endpunkt

Die Adresse unseres OData-Endpunkts ist <https://api.timecockpit.com/odata>.

## Authentifizierung

Um den OData-Endpunkt zu verwenden, müssen Sie sich zuerst beim Dienst authentifizieren. Wie Sie sich authentifizieren, lesen Sie unter [Authentifizierung](~/doc/web-api/authentifizierung.md).

## Aktuelle Einschränkungen

- OData wird nur bis [Version 3.0](http://www.odata.org/documentation/odata-version-3-0/) unterstützt.
- Der numerische Operator `Modulo (%)` wird nicht unterstützt.
- Die Entity-Set-Funktion `Count` wird nicht unterstützt.
- Nur die Filterfunktionen `length`, `concat`, `day`, `month` und `year` werden unterstützt. Andere Funktionen (z. B. `substringof`, `startswith`) werden nicht unterstützt.

## C#-CRUD-Beispiel

```cs
var timeCockpitBaseUri = "https://api.timecockpit.com";
var timeCockpitDataApiPAT = "YOUR_PAT";

using (var httpClient = new HttpClient())
{
	httpClient.BaseAddress = new Uri(timeCockpitBaseUri);
	httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue($"Bearer", timeCockpitDataApiPAT);

	// ## CREATE

	var guid = new Guid("af0725c0-cf12-43da-8688-3dcced935909");
	var newTask = new
	{
		APP_TaskUuid = guid,
		APP_Code = "IMPL",
		USR_Title = "Implementation",
		APP_ProjectUuid = "79b82123-596e-4abe-bdf2-38a8c279f589"
	};

	var newTaskContent = new StringContent(JsonConvert.SerializeObject(newTask), Encoding.UTF8, "application/json");

	var result = await httpClient.PostAsync($"https://api.timecockpit.com/odata/APP_Task", newTaskContent);

	// ## READ

	result = await httpClient.GetAsync($"https://api.timecockpit.com/odata/APP_Task()?$filter=APP_TaskUuid eq guid'{guid}'");
	var json = JObject.Parse(result.Content.ReadAsStringAsync().Result);

	// ## READ ALL

	result = await httpClient.GetAsync("https://api.timecockpit.com/odata/APP_Task()");
	json = JObject.Parse(result.Content.ReadAsStringAsync().Result);

	// ## UPDATE

	var taskData = new
	{
		APP_Description = "Development"
	};

	var updatedJson = new StringContent(JsonConvert.SerializeObject(taskData), Encoding.UTF8, "application/json");

	result = await httpClient.PatchAsync($"https://api.timecockpit.com/odata/APP_Task(guid'{guid}')", updatedJson);

	// ## DELETE

	result = await httpClient.DeleteAsync($"https://api.timecockpit.com/odata/APP_Task(guid'{guid}')");
}
```

## Beispielabfrage: Alle Länder abrufen

Das folgende Beispiel zeigt, wie Sie alle Elemente des Entitätstyps APP_Country abfragen. Ein HTTP GET auf das entsprechende Entity Set ergibt eine ungefilterte Abfrage. Das Beispiel verwendet Token-Authentifizierung, und die Antwort enthält eine Sammlung von vier Ländern. Beachten Sie, dass das Ergebnis als [JSON](http://www.json.org/) kodiert ist und einige [OData-spezifische Informationen](http://www.odata.org/documentation/odata-version-2-0/json-format/) enthält.

### Anfrage

```
GET https://api.timecockpit.com/odata/APP_Country HTTP/1.1
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9...
Host: api.timecockpit.com
```

### Antwort

```
HTTP/1.1 200 OK
Cache-Control: no-store, must-revalidate, no-cache
Pragma: no-cache
Content-Length: 600
Content-Type: application/json; odata=minimalmetadata; streaming=true; charset=utf-8
Server: Microsoft-IIS/8.0
DataServiceVersion: 3.0
X-Powered-By: ASP.NET
Set-Cookie: ARRAffinity=244116e25a72155d832c22601a40ae87af7d9c2cb18a99a181efeffc297cbc64;Path=/;Domain=api.timecockpit.com
Date: Wed, 30 Apr 2014 14:19:29 GMT

{
  "odata.metadata":"https://api.timecockpit.com/odata/$metadata#APP_Country","value":[
    {
      "APP_CountryUuid":"94bac4d3-fdc3-4ef7-ab6b-3123a6f361e0","APP_CountryName":"Switzerland","APP_IsoCode":"CH"
    },{
      "APP_CountryUuid":"e3d0782e-b929-4edc-826b-3d1f79d45115","APP_CountryName":"Germany","APP_IsoCode":"DE"
    },{
      "APP_CountryUuid":"89e40635-268f-436a-8388-516f2ccb1c9e","APP_CountryName":"Austria","APP_IsoCode":"AT"
    },{
      "APP_CountryUuid":"35a34340-2533-4925-b445-ab243a1115d0","APP_CountryName":"United Kingdom","APP_IsoCode":"GB"
    }
  ]
}
```

## Beispielabfrage: Gefilterte Zeitbuchungen

Dieses Beispiel wählt die 101. Zeitbuchung für österreichische Kunden aus. Es enthält den zugeordneten Benutzer, das Projekt und den Kunden.

### Anfrage-URI (mit Zeilenumbrüchen zur besseren Lesbarkeit)

```
https://api.timecockpit.com/odata/APP_Timesheet()
?$filter=APP_Project/APP_Customer/APP_Country/APP_CountryName eq 'Austria'
&$orderby=APP_BeginTime
&$skip=100
&$top=1
&$expand=APP_UserDetail,APP_Project/APP_Customer
```

### Entsprechende TCQL-Abfrage

```
From A In APP_Timesheet.Include('APP_UserDetail').Include('APP_Project.APP_Customer')
Where (A.APP_Project.APP_Customer.APP_Country.APP_CountryName = "Austria")
Order By A.APP_BeginTime Asc
Skip 100
Take 1
Select A
```

### Antwort-Body

```
{
    "odata.metadata": "https://api.timecockpit.com/odata/$metadata#APP_Timesheet",
    "value": [
        {
            "APP_UserDetail": {
                "APP_UserDetailUuid": "58b4edf2-d161-4a3c-926a-d1163718d0fc",
                "APP_DateOfJoining": "2013-01-01T00:00:00",
                "APP_DateOfSeparation": null,
                "APP_Firstname": "Tim",
                "APP_HourlyRate": "25.00",
                "APP_IsHidden": false,
                "APP_Lastname": "Smith",
                "APP_Username": "demo@timecockpit.com",
                "APP_WeeklyHoursOfWork": "38.50",
                "APP_Fullname": "Smith, Tim",
                "APP_ReadOnlyUsername": "demo@timecockpit.com",
                "APP_CultureInfoUuid": "c6b71cf0-2d96-46ba-b7e9-33d46c2b74d1",
                "APP_DepartmentUuid": null,
                "APP_LegalHolidayCalendarUuid": "65945ecf-bd8c-4008-adeb-959ba5b546d8"
            },
            "APP_Project": {
                "APP_Customer": {
                    "APP_CustomerUuid": "6a8ff888-c830-471f-a322-01d27d0083f8",
                    "APP_Code": "FernandoArchitecture",
                    "APP_CommercialRegNumber": "FN999999x",
                    "APP_CompanyName": "Fernando Architecture Ltd",
                    "APP_ContactInfo": "Max Muster",
                    "APP_Email": "office@Fernando.com",
                    "APP_Fax": null,
                    "APP_HourlyRate": "67.00",
                    "APP_InvoiceFAO": null,
                    "APP_InvoicingRules": null,
                    "APP_Phone": "123 456 789",
                    "APP_Street": "Euro Plaza 99",
                    "APP_Town": "Home",
                    "APP_VatID": "XY999999",
                    "APP_ZipCode": "20100",
                    "APP_CountryUuid": "89e40635-268f-436a-8388-516f2ccb1c9e"
                },
                "APP_ProjectUuid": "fc4beca0-157b-4fbc-ac2e-d5d028562e66",
                "APP_Billable": true,
                "APP_Budget": null,
                "APP_BudgetInHours": null,
                "APP_Closed": false,
                "APP_Code": "ProjectCons",
                "APP_Description": "Project Consulting Time & Material",
                "APP_EndDate": null,
                "APP_ExternalProjectCode": "SAP123-456-789",
                "APP_FixedPrice": false,
                "APP_HourlyRate": "80.40",
                "APP_InvoicingRules": "Monthly invoicing, we do not charge travelling time, ...",
                "APP_ProjectName": "Project Consulting",
                "APP_StartDate": "2013-01-01T00:00:00",
                "APP_Fullname": "FernandoArchitecture.ProjectCons",
                "APP_HourlyRateActual": "80.40",
                "APP_HourlyRateCustomer": "67.00",
                "APP_CustomerUuid": "6a8ff888-c830-471f-a322-01d27d0083f8"
            },
            "APP_TimesheetUuid": "63aca8f6-b31c-4334-bfa3-1efd318f2b1a",
            "APP_BeginTime": "2013-05-23T13:15:00",
            "APP_Description": "Project Consulting Time & Material",
            "APP_EndTime": "2013-05-23T15:00:00",
            "APP_HourlyRate": null,
            "APP_HourlyRateBilled": "80.40",
            "APP_IsDurationTimesheet": false,
            "APP_JourneyDistance": null,
            "APP_JourneyFrom": null,
            "APP_JourneyTo": null,
            "APP_Location": "Russia",
            "APP_NoBilling": false,
            "APP_BeginTimeActual": "2013-05-23T13:15:00",
            "APP_Billable": true,
            "APP_Billed": true,
            "APP_CompanyNameActual": "Fernando Architecture Ltd",
            "APP_DateActual": "2013-05-23T00:00:00",
            "APP_DurationInDays": "0.2187499999999998",
            "APP_DurationInHours": "1.7499999999999984",
            "APP_EndTimeActual": "2013-05-23T15:00:00",
            "APP_HourlyRateActual": "80.40",
            "APP_HourlyRateProjectOrTask": "80.40",
            "APP_ProjectCodeActual": "ProjectCons",
            "APP_ProjectOrTaskIsBillable": true,
            "APP_Revenue": "140.699999999999871360",
            "APP_InvoiceUuid": "d776673b-99d7-48c9-9ef8-07a4608b9899",
            "APP_JourneyMeansOfTransportUuid": null,
            "APP_ProjectUuid": "fc4beca0-157b-4fbc-ac2e-d5d028562e66",
            "APP_TaskUuid": null,
            "APP_UserDetailUuid": "58b4edf2-d161-4a3c-926a-d1163718d0fc",
            "APP_WorkingTimeWeightUuid": null
        }
    ]
}
```

## Beispieloperation: Ein neues Land einfügen

Mit [TypeScript](http://www.typescriptlang.org/) und [JayData](http://jaydata.org/) lässt sich einfach eine kleine Anwendung erstellen, die ein neues Land einfügt. Das zeigt, wie Sie unseren Dienst aus einer Client-Technologie nutzen, die nicht standardmäßig unterstützt wird. Der Service-Client wurde mit JaySvcUtil generiert und bietet typisierte Modellentitäten, Entity Sets und Abfrageoperationen, vergleichbar mit [LINQ](http://msdn.microsoft.com/library/bb397926.aspx).

```
var data = new cofx.DataService({
    name: "oData",
    oDataServiceHost: "https://api.timecockpit.com/odata",
    user: "demo@timecockpit.com",
    password: "...",
    maxDataServiceVersion: '3.0'
});

var country = new cofx.APP_Country({
    APP_CountryName: "Ireland",
    APP_IsoCode: "IE",
    APP_CountryUuid: "00000000-0000-0000-0000-000000000000"
});

data.APP_Country.add(country);
data.saveChanges();
```

Eine HTTP-POST-Operation fügt neue Daten in das Entity Set APP_Country ein. Beachten Sie, dass viele der Header in der Anfrage optional sind und vom Webbrowser eingefügt wurden. Der Anfrage-Body enthält ein JSON-kodiertes Länderobjekt. Da die ID des Objekts (APP_CountryUuid) leer gelassen wird, legt der Dienst eine neue ID fest.

### Anfrage-Header

```
POST https://api.timecockpit.com/odata/APP_Country HTTP/1.1
Accept: application/atomsvc+xml;q=0.8, application/json;odata=fullmetadata;q=0.7, application/json;q=0.5, */*;q=0.1
MaxDataServiceVersion: 3.0
DataServiceVersion: 3.0
Authorization: Basic bmljZTp0cnkgOik=
Content-Type: application/json;odata=verbose
Referer: http://localhost:20337/
Accept-Language: de-AT
Origin: http://localhost:20337
Accept-Encoding: gzip, deflate
User-Agent: Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; WOW64; Trident/6.0)
Host: api.timecockpit.com
Content-Length: 105
DNT: 1
Connection: Keep-Alive
Cache-Control: no-cache
```

### Anfrage-Body

```
{
    "APP_CountryUuid" : "00000000-0000-0000-0000-000000000000",
    "APP_CountryName" : "Ireland",
    "APP_IsoCode" : "IE"
}
```

Der Antwort-Body enthält das neue Objekt einschließlich Metadaten, die Header spiegeln das erfolgreiche Anlegen des Objekts wider. Beachten Sie, dass die eindeutige ID und die URL des Landes in der Antwort enthalten sind.

### Antwort-Header

```
HTTP/1.1 201 Created
Content-Length: 529
Content-Type: application/json; odata=fullmetadata; charset=utf-8
Location: https://api.timecockpit.com/odata/APP_Country(guid'046ac6cf-1c55-493c-b6dd-65249fcf669e')
Server: Microsoft-IIS/8.0
Access-Control-Allow-Origin: http://localhost:20337
Access-Control-Allow-Credentials: true
Access-Control-Expose-Headers: DataServiceVersion
DataServiceVersion: 3.0
X-Powered-By: ASP.NET
Set-Cookie: ARRAffinity=244116e25a72155d832c22601a40ae87af7d9c2cb18a99a181efeffc297cbc64;Path=/;Domain=api.timecockpit.com
Date: Wed, 30 Apr 2014 15:48:26 GMT
```

### Antwort-Body

```
{
    "odata.metadata" : "https://api.timecockpit.com/odata/$metadata#APP_Country/@Element",
    "odata.type" : "cofx.APP_Country",
    "odata.id" : "https://api.timecockpit.com/odata/APP_Country(guid'046ac6cf-1c55-493c-b6dd-65249fcf669e')",
    "Customers@odata.navigationLinkUrl" : "https://api.timecockpit.com/odata/APP_Country(guid'046ac6cf-1c55-493c-b6dd-65249fcf669e')/Customers",
    "APP_CountryUuid@odata.type" : "Edm.Guid",
    "APP_CountryUuid" : "046ac6cf-1c55-493c-b6dd-65249fcf669e",
    "APP_CountryName" : "Ireland",
    "APP_IsoCode" : "IE"
}
```
