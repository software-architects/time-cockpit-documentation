// See https://aka.ms/new-console-template for more information
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using source_code_samples;
using System.Globalization;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using static System.Runtime.InteropServices.JavaScript.JSType;

Console.WriteLine("Hello, World!");

var timeCockpitBaseUri = "https://api.timecockpit.com";
var timeCockpitDataApiPAT = "1029C275AB229E9ED713A15863D7816477212E7B112AAF92CB3FF66BE5FA893F";

using (var httpClient = new HttpClient())
{
	httpClient.BaseAddress = new Uri(timeCockpitBaseUri);
	httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue($"Bearer", timeCockpitDataApiPAT);

	//await Metadata(httpClient);
	//await Crud(httpClient);
	//await Select(httpClient);
	//await Report(httpClient);
	//await ExecuteList(httpClient);

	await ExecuteAction(httpClient);
}

static async Task Crud(HttpClient httpClient)
{
	// ## CREATE

	var guid = new Guid("af0725c0-cf12-43da-8688-3dcced935909");
	var newTask = new
	{
		APP_TaskUuid = guid,
		APP_Code = "test123",
		USR_Title = "test123",
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

	result = await httpClient.PostAsync($"https://api.timecockpit.com/odata/APP_Task(guid'{guid}')", updatedJson);

	// ## UPDATE

	result = await httpClient.DeleteAsync($"https://api.timecockpit.com/odata/APP_Task(guid'{guid}')");
}

static async Task Metadata(HttpClient httpClient)
{
	var response = await httpClient.GetAsync("https://api.timecockpit.com/odata/$metadata");
	response.EnsureSuccessStatusCode();

	var metadata = await response.Content.ReadAsStringAsync();
}

static async Task Select(HttpClient httpClient)
{
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
}

static async Task Report(HttpClient httpClient)
{
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
	var result = await httpClient.PostAsync($"https://api.timecockpit.com/report/show/?format=ExcelOpenXML", content);

	if (result.IsSuccessStatusCode)
	{
		var byteResult = await result.Content.ReadAsByteArrayAsync();
	}
	else
	{
		var json = JObject.Parse(await result.Content.ReadAsStringAsync());
		throw new Exception(json["odata.error"].ToString());
	}
}

static async Task ExecuteList(HttpClient httpClient)
{
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
}

static async Task ExecuteAction(HttpClient httpClient)
{
	var actionRequestParam = new
	{
		inputSet = new
		{
			entityName = "APP_Timesheet",
			listName = string.Empty,
			listParameters = new string[0],
			items = new string[] { "a2788e0c-9484-4f3d-ad0c-236d0a628cf8" }
		},
		fetchModifications = false,
		parameter = new
		{
			entityName = "",
			value = new object()
		}
	};

	var jsonPayload = JsonConvert.SerializeObject(actionRequestParam);
	var jsonContent = new StringContent(jsonPayload, Encoding.UTF8, "application/json");
	var response = await httpClient.PostAsync($"https://api.timecockpit.com/action/USR_SetHomeOfficeFlag", jsonContent);
	if (response.IsSuccessStatusCode)
	{
		var result = await response.Content.ReadAsStringAsync();
	}
	else
	{
		var content = await response.Content.ReadAsStringAsync();
		throw new Exception(content);
	}
}