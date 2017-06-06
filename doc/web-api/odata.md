# OData

> [!WARNING]
This is preliminary information and subject to change. The services are offered as a developer preview and are not yet fully supported.

The [Open Data Protocol (OData)](http://www.odata.org/) is a web service protocol for data exchange. It supports filtered queries, metadata reflection, and data manipulation (i.e. insert, update, delete). Time cockpit provides an OData endpoint exposing model and data while including individual data model configurations. OData can be consumed via client applications (e.g. [Excel](http://www.timecockpit.com/blog/2014/04/29/Your-Data-in-a-Geographical-Context), [LINQPad](https://www.linqpad.net/)) and various programming languages (e.g. [C#](http://www.asp.net/web-api/overview/odata-support-in-aspnet-web-api/calling-an-odata-service-from-a-net-client), [TypeScript](http://jaystack.com/blog/typescript-meets-odata-with-the-help-of-jaydata-and-jaysvcutil), [Java](http://restlet.org/learn/guide/2.2/extensions/odata/)).

## Service Endpoint

The preliminary address of our OData endpoint is <https://apipreview.timecockpit.com/odata>.

## Authentication

The OData service uses the authentication mechanisms described in [Web API](overview.md).

## Current Limitations

- OData support only up to [version 3.0](http://www.odata.org/documentation/odata-version-3-0/).
- The numeric operator `Modulo (%)` is not supported.
- The entity set function `Count` is not supported.
- Only the filter functions `length`, `concat`, `day`, `month`, and `year` are supported. Other functions (e.g. `substringof`, `startswith`) are not supported.

## Example Query: Get All Countries

The following example shows how to query all items of the entity type APP_Country. Using HTTP GET on the corresponding entity set results in an unfiltered query. The sample uses token authentication and the response contains a collection of four countries. Note that the result is encoded as [JSON](http://www.json.org/) and contains some [OData-specific information](http://www.odata.org/documentation/odata-version-2-0/json-format/).

### Request

```
GET https://apipreview.timecockpit.com/odata/APP_Country HTTP/1.1
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9...
Host: apipreview.timecockpit.com
```

### Response

```
HTTP/1.1 200 OK
Cache-Control: no-store, must-revalidate, no-cache
Pragma: no-cache
Content-Length: 600
Content-Type: application/json; odata=minimalmetadata; streaming=true; charset=utf-8
Server: Microsoft-IIS/8.0
DataServiceVersion: 3.0
X-Powered-By: ASP.NET
Set-Cookie: ARRAffinity=244116e25a72155d832c22601a40ae87af7d9c2cb18a99a181efeffc297cbc64;Path=/;Domain=apipreview.timecockpit.com
Date: Wed, 30 Apr 2014 14:19:29 GMT

{
  "odata.metadata":"https://apipreview.timecockpit.com/odata/$metadata#APP_Country","value":[
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

## Example Query: Filtered Timesheets

This example selects the 101st time sheet entry for Austrian customers. It includes the assigned user, project and customer.

### Request URI (with line breaks added for readability)

```
https://apipreview.timecockpit.com/odata/APP_Timesheet()
?$filter=APP_Project/APP_Customer/APP_Country/APP_CountryName eq 'Austria'
&$orderby=APP_BeginTime
&$skip=100
&$top=1
&$expand=APP_UserDetail,APP_Project/APP_Customer
```

### Corresponding TCQL Query

```
From A In APP_Timesheet.Include('APP_UserDetail').Include('APP_Project.APP_Customer')
Where (A.APP_Project.APP_Customer.APP_Country.APP_CountryName = "Austria")
Order By A.APP_BeginTime Asc
Skip 100
Take 1
Select A
```

### Response Body

```
{
    "odata.metadata": "https://apipreview.timecockpit.com/odata/$metadata#APP_Timesheet",
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

## Example Operation: Inserting a New Country

By using [TypeScript](http://www.typescriptlang.org/) and [JayData](http://jaydata.org/) it is easy to build a simple application capable of inserting a new country. This illustrates a way of consuming our service from a client technology not supported out of the box. The service client has been generated by JaySvcUtil and provides typed model entities, entity sets and query operations comparable to [LINQ](http://msdn.microsoft.com/library/bb397926.aspx).

```
var data = new cofx.DataService({
    name: "oData",
    oDataServiceHost: "https://apipreview.timecockpit.com/odata",
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

A HTTP POST operation is used to insert new data into the APP_Country entity set. Note that many of the headers present in the request are optional and have been inserted by the web browser. The request body contains a JSON-encoded country object. Because the id of the object (APP_CountryUuid) is left empty the service will determine a new identifier.

### Request Headers

```
POST https://apipreview.timecockpit.com/odata/APP_Country HTTP/1.1
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
Host: apipreview.timecockpit.com
Content-Length: 105
DNT: 1
Connection: Keep-Alive
Cache-Control: no-cache
```

### Request Body

```
{
    "APP_CountryUuid" : "00000000-0000-0000-0000-000000000000",
    "APP_CountryName" : "Ireland",
    "APP_IsoCode" : "IE"
}
```

The response body contains the new object including metadata while the headers reflect the successful object creation. Note that the unique identifier and the URL of the country are contained in the response.

### Response Headers

```
HTTP/1.1 201 Created
Content-Length: 529
Content-Type: application/json; odata=fullmetadata; charset=utf-8
Location: https://apipreview.timecockpit.com/odata/APP_Country(guid'046ac6cf-1c55-493c-b6dd-65249fcf669e')
Server: Microsoft-IIS/8.0
Access-Control-Allow-Origin: http://localhost:20337
Access-Control-Allow-Credentials: true
Access-Control-Expose-Headers: DataServiceVersion
DataServiceVersion: 3.0
X-Powered-By: ASP.NET
Set-Cookie: ARRAffinity=244116e25a72155d832c22601a40ae87af7d9c2cb18a99a181efeffc297cbc64;Path=/;Domain=apipreview.timecockpit.com
Date: Wed, 30 Apr 2014 15:48:26 GMT
```

### Response Body

```
{
    "odata.metadata" : "https://apipreview.timecockpit.com/odata/$metadata#APP_Country/@Element",
    "odata.type" : "cofx.APP_Country",
    "odata.id" : "https://apipreview.timecockpit.com/odata/APP_Country(guid'046ac6cf-1c55-493c-b6dd-65249fcf669e')",
    "Customers@odata.navigationLinkUrl" : "https://apipreview.timecockpit.com/odata/APP_Country(guid'046ac6cf-1c55-493c-b6dd-65249fcf669e')/Customers",
    "APP_CountryUuid@odata.type" : "Edm.Guid",
    "APP_CountryUuid" : "046ac6cf-1c55-493c-b6dd-65249fcf669e",
    "APP_CountryName" : "Ireland",
    "APP_IsoCode" : "IE"
}
```