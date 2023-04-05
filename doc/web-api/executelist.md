# ExecuteList Endpoint

Besides the [OData endpoint](odata.md) for CRUD operations, the [query endpoint](query.md) for advanced querying and the [reporting endpoint](reporting) for generating printable reports, time cockpit offers also a list endpoint for advanced data analysis.

As described in [Customizing Lists](~/doc/data-model-customization/list.md), you can define either TCQL lists or so-called script lists. With TCQL lists, the data source of a list is a plain TCQL query. TCQL queries have one major drawback. You cannot arbitrarily join tables, but only along the relations defined in the time cockpit data model. 

With script lists, the data source of a list is an **Iron Python** script. For further information see [Scripting](~/doc/scripting/overview.md). When writing a script list, you have a large part of the .NET framework at your disposal. This also means that you can issue multiple TCQL queries in a script list and e.g. transform the result of multiple queries to one consolidated result. In a way, script lists can be compared to a database view.

Both TCQL lists and script lists can be referenced in the time cockpit UI, but they can also be queried using the time cockpit Web API.

## Use Cases

- Query working time violations to send them to the appropriate employees
- Query a project controlling list to use in e.g. PowerBI
- Query billed time sheet entries to process in a downstream billing system

## Service Endpoint

The address of our query endpoint is <https://api.timecockpit.com/executelist>. You can use the `top` url parameter to limit the result set. E.g.: `https://api.timecockpit.com/executelist/APP_DefaultTimeReportList?$top=301`

## Authentication

To use the query endpoint, you first need to authentication against the service. To learn how to authenticate, refer to [authentication](authentication.md).

## C# Sample

The following sample shows some simple C# code to fetch the standard time report list of time cockpit.

> [!NOTE]
Please be aware that this example demonstrates how to query the time report **list** and not the printable time report (PDF, Word, Excel). For an example on how to get a printable report programmatically refer to [Reporting Endpoint](reporting.md).

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