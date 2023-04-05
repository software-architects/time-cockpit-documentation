# Reporting Endpoint

Time cockpit provides powerful reporting capabilities. For one, every time cockpit list can be represented as a printable SSRS report in either Word, Excel or PDF. The SSRS report definition is generated on the fly. Additionally, you can create your own SSRS report definitions and upload them to time cockpit. For further information take a look at [reporting](~/doc/reporting/overview.md).

Sometimes it is necessary to generate time cockpit reports progrogrammatically. For those scenarios we offer the reporting endpoint in our Web API.

## Use Cases

- Fetch the built-in time report to send to the appropriate employees
- Fetch a custom progress report to send to the corresponding customer

## Service Endpoint

The address of our query endpoint is <https://api.timecockpit.com/report/show>. You can use the `format` url parameter to get different formats of the report:

- PDF: https://api.timecockpit.com/report/show/?**format=pdf**
- Word: https://api.timecockpit.com/report/show/?**format=wordopenxml**
- Excel: https://api.timecockpit.com/report/show/?**format=excelopenxml**

## Authentication

To use the query endpoint, you first need to authentication against the service. To learn how to authenticate, refer to [authentication](authentication.md).

## C# Sample

The following sample shows some simple C# code to fetch the standard time report of time cockpit .

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