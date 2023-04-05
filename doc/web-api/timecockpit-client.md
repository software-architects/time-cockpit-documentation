
# TimeCockpitClient

In this article we provide some utility classes that should help you get started with the time cockpit Web API. 

- **TimeCockpitClient class:** This class encapsulates both the OData endpoint for CRUD operations and the query endpoint for more sophisticated querying of data.
- **TcProject class:** This class should give you an idea how you can manually map the result of a TCQL query via the query endpoint to a POCO. Note that the POCO is not only used for the query endpoint, but also as payload for the OData endpoint.
- **Settings class:** This class is a strongly-typed representation of your configuration. It holds settings for all your configured configuration profiders like appsettings.json, environment variables or e.g. KeyVault.

## TimeCockpitClient Class

```cs
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Text;

namespace source_code_samples;

/// <summary>
/// This class provides methods to access the time cockpit web api.
/// </summary>
public class TimeCockpitClient
{
	private readonly HttpClient httpClient;
	private readonly string baseUri;
	private readonly ILogger logger;
	private readonly IOptions<Settings> configuration;

	public TimeCockpitClient(IHttpClientFactory httpClientFactory, ILogger<TimeCockpitClient> logger, IOptions<Settings> configuration)
	{
		this.httpClient = httpClientFactory.CreateClient("TimeCockpit");
		this.configuration = configuration;
		this.baseUri = this.configuration.Value.TimeCockpitBaseUri;
		this.logger = logger;
	}

	/// <summary>
	/// Refreshes the server-side datacontext to get all data model changes
	/// </summary>
	public async Task Refresh()
	{
		try
		{
			var result = await httpClient.GetAsync($"{this.baseUri}/refresh");
		}
		catch
		{
			throw;
		}
	}

	public async Task<List<TcProject>> GetProjects(string code)
	{
		var query = @"From T In Project Where T.Code = @Code Select T";

		var jsonRequest = new JObject(new JProperty("query", query),
			new JProperty("parameters",
				new JObject(new JProperty("Code", $"'{code}'"))));

		Func<JObject, List<TcProject>> deserialize = json =>
		{
			return json["value"].Select(jsonItem => TcProject.FromJson(jsonItem)).ToList();
		};

		return await GetResult(jsonRequest, deserialize);
	}

	#region odata

	/// <summary>
	/// Generic method to perform posts against tc web api
	/// </summary>
	/// <param name="entityName">The entity/guid to post against</param>
	/// <param name="payload">The json payload to post</param>
	/// <returns>An instance of HttpResponseMessage</returns>
	public async Task<HttpResponseMessage> PostAsync(string entityName, object payload)
	{
		this.logger.LogInformation($"Posting new object of type {entityName}");
		var jsonPayload = JsonConvert.SerializeObject(payload);
		var jsonContent = new StringContent(jsonPayload, Encoding.UTF8, "application/json");
		var response = await httpClient.PostAsync($"{this.baseUri}/odata/{entityName}", jsonContent);
		if (!response.IsSuccessStatusCode)
		{
			var content = await response.Content.ReadAsStringAsync();
			throw new Exception(content);
		}

		return response;
	}

	/// <summary>
	/// Generic method to perform patch against tc web api
	/// </summary>
	/// <param name="entityName">The entity/guid to post against</param>
	/// <param name="payload">The json payload to post</param>
	/// <returns>An instance of HttpResponseMessage</returns>
	public async Task<HttpResponseMessage> PatchAsync(string entityName, Guid objectId, object payload)
	{
		this.logger.LogInformation($"Patching object of type {entityName} with id '{objectId}'");
		var jsonPayload = JsonConvert.SerializeObject(payload);
		var jsonContent = new StringContent(jsonPayload, Encoding.UTF8, "application/json");
		var response = await httpClient.PatchAsync($"{this.baseUri}/odata/{entityName}(guid'{objectId}')", jsonContent);
		if (!response.IsSuccessStatusCode)
		{
			var content = await response.Content.ReadAsStringAsync();
			throw new Exception(content);
		}

		return response;
	}

	/// <summary>
	/// Generic method to perform delete against tc web api
	/// </summary>
	/// <param name="uri">The entity/guid to post against</param>
	/// <returns>An instance of HttpResponseMessage</returns>
	public async Task<HttpResponseMessage> DeleteAsync(string entityName, Guid objectId)
	{
		return await httpClient.DeleteAsync($"{this.baseUri}/odata/{entityName}(guid'{objectId}')");
	}

	#endregion

	#region helper

	private async Task<T> GetResult<T>(JObject jsonRequest, Func<JObject, T> deserialize)
	{
		var content = new StringContent(jsonRequest.ToString(), Encoding.UTF8, "application/json");
		var response = await httpClient.PostAsync($"{this.baseUri}/select", content);
		var json = JObject.Parse(await response.Content.ReadAsStringAsync());

		if (response.IsSuccessStatusCode)
		{
			var result = deserialize(json);
			return result;
		}

		throw new Exception(json["odata.error"].ToString());
	} 

	#endregion
}
```

## TcProject Class

```cs
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.ComponentModel;

namespace source_code_samples;

public class TcProject : IChangeTracking
{
	public TcProject() => this.AcceptChanges();

	#region Fields

	private string projectName;
	private bool? billable = false;

	#endregion

	#region Properties
	public Guid APP_ProjectUuid { get; set; }

	public string APP_Code { get; set; }

	public string APP_ProjectName
	{
		get => projectName; set
		{
			if (projectName != value)
			{
				projectName = value;
				IsChanged = true;
			}
		}
	}

	public bool? APP_Billable
	{
		get => billable; set
		{
			if (billable != value)
			{
				billable = value;
				IsChanged = true;
			}
		}
	}

	[JsonIgnore]
	public bool IsChanged { get; private set; }

	#endregion

	#region Methods
	public static TcProject FromJson(JToken jsonItem)
	{
		var project = new TcProject();
		project.APP_ProjectUuid = new Guid(jsonItem["APP_ProjectUuid"].Value<string>());
		project.APP_Code = jsonItem["APP_Code"]?.Value<string>();
		project.APP_ProjectName = jsonItem["APP_ProjectName"]?.Value<string>();
		project.APP_Billable = jsonItem["APP_Billable"]?.Value<bool>();

		project.AcceptChanges();
		return project;
	}

	public void AcceptChanges() => IsChanged = false;

	#endregion
}
```

## Settings Class

```cs
namespace source_code_samples
{
	public class Settings
	{
		public string? TimeCockpitBaseUri { get; set; }
	}
}
```