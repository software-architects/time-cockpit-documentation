# Query Endpoint

Besides offering an [OData](odata.md) endpoint for CRUD operations, time cockpit also offers an endpoint that is solely for querying data. The query endpoint allows you to post queries to the Web API using time cockpit's proprietary TCQL language. For more information on the language refer to [TCQL](~/doc/tcql/overview.md).

## Service Endpoint

The address of our query endpoint is <https://api.timecockpit.com/select>.

## Authentication

To use the query endpoint, you first need to authentication against the service. To learn how to authenticate, refer to [authentication](authentication.md).

## When to Use

While convenient, there are scenarios where the OData endpoint does not suffice. E.g. complex joins, or using custom time cockpit domain logic in a query. In these cases, we recommend the query endpoint. 

> [!NOTE]
If you are using the query endpoint you must map the json result to an object yourself.

## REST Sample

```
POST https://api.timecockpit.com/select
Authorization: Bearer <PAT or Token>
Content-Type: application/json;charset=UTF-8
Accept: application/json

{
    "query": "From T In Project Where T.Code = @Code Select T",
    "parameters": 
    {
        "Code": "'testproject'"
    }
}
```

## C# Sample

The following sample shows some simple C# code to fetch a time cockpit project with a certain project code. Note that you can use plain TCQL with all its features just like if you were writing a query in the full client.

> [!NOTE]
This code uses a class `TcProject` which does the mapping between the json response from the time cockpit API and the domain object `TcProject`. Please refer [TimeCockpitClient](timecockpit-client.md) for a complete reference.

```cs
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
```