---
title: ExecuteAction-API - Eigene Geschäftslogik ausführen
description: time cockpit Aktionen über die Web API ausführen. Eigene IronPython-Geschäftslogik und Webhooks nutzen, Routineaufgaben automatisieren.
en_page: doc/web-api/executeaction.md
---
# ExecuteAction-Endpunkt

Zusätzlich zu Abfragen und CRUD-Operationen können Sie über die Web API von time cockpit auch Ihre eigene Geschäftslogik ausführen. In time cockpit heißt eigene Geschäftslogik [Aktion](/doc/scripting/actions.html). Ähnlich wie [Skriptlisten](~/doc/datenmodell-anpassung/liste.md) in time cockpit sind Aktionen **IronPython**-Code, der in Ihrer time cockpit Instanz läuft. Im Gegensatz zu Skriptlisten verändern Aktionen time cockpit üblicherweise auf die eine oder andere Weise.

> [!NOTE]
> Da eine Aktion Code ist, der auf unserer Infrastruktur läuft, muss sie von software architects geprüft und digital [signiert](https://www.timecockpit.com/blog/2014/11/27/Why-You-Need-to-Sign-Your-Custom-Code) werden. Diese Maßnahme schützt unsere Kunden vor dem [Noisy-Neighbor-Problem](https://learn.microsoft.com/en-us/azure/architecture/antipatterns/noisy-neighbor/noisy-neighbor).

## Anwendungsfälle

- Routineaufgaben durchführen, z. B. größere Datenmengen vorab generieren
- Webhooks (mit serverlosen Komponenten wie Azure Functions)
- Geschäftslogik sowohl in der Benutzeroberfläche als auch über die Web API wiederverwenden.

## Service-Endpunkt

Die Adresse unseres Query-Endpunkts ist <https://api.timecockpit.com/action>. Beispiel: `https://api.timecockpit.com/action/USR_SetHomeOfficeFlag`

## Authentifizierung

Um den Query-Endpunkt zu verwenden, müssen Sie sich zuerst beim Dienst authentifizieren. Wie Sie sich authentifizieren, lesen Sie unter [Authentifizierung](~/doc/web-api/authentifizierung.md).

## C#-Beispiel

Das folgende Beispiel zeigt einfachen C#-Code, der das Home-Office-Kennzeichen bei allen Zeitbuchungen eines bestimmten Tages setzt.

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

Zur Referenz zeigt der folgende Code die Aktion USR_SetHomeOfficeFlag.

```python
clr.AddReference("System")

def actionSample(actionContext):
	if actionContext.InputSet <> None:
		for item in actionContext.InputSet:
			item.IsHomeOffice = True
			actionContext.DataContext.SaveObject(item)
			
# SIG 77619404EF9B1418136698A70545893B739EB6C3 YnDP1fjElyujHETGeslDqly+819s4ZboaGH7lg3L5kKwX0ExWN8/ytSvpiAghJORKQ4HPtsfTKUV3HKMQXFd7VvDADHgoAUikSQWbKLzIy7tLxrDW5geKCNzCo7s0zqaGgFZAoE6EYWhUcmbq30c68IRBTjBkaCL2x3JwiLCvMV4YHYfMeIKInZeJAJcs8wXaOklVC2MhizW8Jq2qi7wZVajp0PI3qu/ccyHo/0XG1n77loVwiFsWdrYFMSzQ/O+dDzhXr0qJx+gnUb8ICoVgLm2pO8EiCeQz/ZV5N6vUQYYiISObs8D1xCATUCBqLgh6S95Nj1jyKWU7p/BnPzfug==
```
