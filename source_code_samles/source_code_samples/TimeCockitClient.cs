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

	#region query
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
	#endregion

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

	#region reporting

	public async Task<Guid> GetReportUuid(HttpClient httpClient, string reportName)
	{
		var query = @"	From I In EntityViewReport 
							Where I.EntityViewReportName = @EntityViewReportName
							Select New With
							{
								I.EntityViewReportUuid
							}";

		var parametersObject = new JObject();
		parametersObject.Add(new JProperty("@EntityViewReportName", $"'{reportName}'"));

		var jsonRequest = new JObject(new JProperty("query", query), new JProperty("parameters", parametersObject));

		try
		{
			var content = new StringContent(jsonRequest.ToString(), Encoding.UTF8, "application/json");
			var result = await httpClient.PostAsync($"https://api.timecockpit.com/select", content);
			var json = JObject.Parse(await result.Content.ReadAsStringAsync());

			if (result.IsSuccessStatusCode)
			{
				if (json["value"].Count() == 1)
				{
					return Guid.Parse(json["value"][0]["USR_EntityViewReportUuid"].Value<string>());
				}
				else
				{
					throw new Exception($"Either none or multiple reports with the name {reportName} were found.");
				}
			}

			throw new Exception(json["odata.error"].ToString());
		}
		catch
		{
			throw;
		}
	}

	#endregion

	#region actions

	/// <summary>
	/// Executes a time cockpit action
	/// </summary>
	/// <param name="actionName">The entity/guid to post against</param>
	/// <param name="payload">The json payload to post</param>
	/// <returns>An instance of HttpResponseMessage</returns>
	public async Task<HttpResponseMessage> ExecuteAction(string actionName, object payload)
	{
		this.logger.LogInformation($"Executing action {actionName}");
		var jsonPayload = JsonConvert.SerializeObject(payload);
		var jsonContent = new StringContent(jsonPayload, Encoding.UTF8, "application/json");
		var response = await httpClient.PostAsync($"{this.baseUri}/action/{actionName}", jsonContent);
		if (!response.IsSuccessStatusCode)
		{
			var content = await response.Content.ReadAsStringAsync();
			throw new Exception(content);
		}

		return response;
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
