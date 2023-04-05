# ExecuteAction Endpoint

In addition to querying and CRUD operations, the time cockpit Web API also allows you to execute your custom business logic. In time cockpit you custom business logic is called an [Action](~/doc/scripting/actions.md). Similar to [script lists](~/doc/data-model-customization/list.md) in time cockpit, actions are pieces of **IronPython** code that run in your instance of time cockpit. In contract to script lists, actions usually modify time cockpit in one way or the other.

> [!NOTE]
Since an action is a piece of code that runs on our infrastructure, it must be reviewed and digitally [signed](https://www.timecockpit.com/blog/2014/11/27/Why-You-Need-to-Sign-Your-Custom-Code) by software architects. This measure protects our customers from the [noise neighbor problem](https://learn.microsoft.com/en-us/azure/architecture/antipatterns/noisy-neighbor/noisy-neighbor).

## Use Cases

- Perform routine tasks like pre-generating larger amounts of data
- Webhooks (using serverless components like Azure Functions)
- Reuse business logic in both UI and via the Web API.

## Service Endpoint

The address of our query endpoint is <https://api.timecockpit.com/action>. E.g.: `https://api.timecockpit.com/action/USR_SetHomeOfficeFlag`

## Authentication

To use the query endpoint, you first need to authentication against the service. To learn how to authenticate, refer to [authentication](authentication.md).

## C# Sample

The following sample shows some simple C# code to set the home office flag on all time sheet entries of a given day.

```cs
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
```

For reference, the following code shows the USR_SetHomeOfficeFlag.

```python
clr.AddReference("System")

def actionSample(actionContext):
	if actionContext.InputSet <> None:
		for item in actionContext.InputSet:
			item.IsHomeOffice = True
			actionContext.DataContext.SaveObject(item)
			
# SIG 77619404EF9B1418136698A70545893B739EB6C3 YnDP1fjElyujHETGeslDqly+819s4ZboaGH7lg3L5kKwX0ExWN8/ytSvpiAghJORKQ4HPtsfTKUV3HKMQXFd7VvDADHgoAUikSQWbKLzIy7tLxrDW5geKCNzCo7s0zqaGgFZAoE6EYWhUcmbq30c68IRBTjBkaCL2x3JwiLCvMV4YHYfMeIKInZeJAJcs8wXaOklVC2MhizW8Jq2qi7wZVajp0PI3qu/ccyHo/0XG1n77loVwiFsWdrYFMSzQ/O+dDzhXr0qJx+gnUb8ICoVgLm2pO8EiCeQz/ZV5N6vUQYYiISObs8D1xCATUCBqLgh6S95Nj1jyKWU7p/BnPzfug==
```