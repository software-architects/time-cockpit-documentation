# Web API
Time cockpit offers a web-based API. HTTP, REST and JSON can be used to access and modify information, execute business logic or generating a report without depending on our .NET SDK. This service is publicly hosted and customers do not have to perform any additional installation or configuration steps.

The time cockpit API provides various endpoints:

- [OData Endpoint](odata.md): Supports filtered queries, metadata reflection, and data manipulation (i.e. insert, update, delete)
- Query Endpoint: Supports querying time cockpit data using the [time cockpit query language](~/doc/tcql/overview.md) (TCQL).
- List Endpoint: Execute time cockpit [lists](~/doc/data-model-customization/lists.md). Lists are used to display data in a tabular form in the UI, but their data can also be fetched using the Web API.
- Action Endpoint: Execute time cockpit [actions](~/doc/data-model-customization/lists.md). An action is custom business logic that is hosted in your time cockpit tenant.
- Reporting Endpoint: Execute a time cockpit [SSRS report](~/doc/reporting/overview.md).

## Base Address

The base address of our web API is https://api.timecockpit.com. It is only accessible via HTTPS and you need to authenticate before you can use the API.

## Authentication

Three forms of authentication are currently supported:

- [Token authentication](http://en.wikipedia.org/wiki/Access_token) offers a simple and efficient way to authenticate web requests. A header is used to transfer the access token and identify the bearer.
- [Basic authentication](http://en.wikipedia.org/wiki/Basic_access_authentication) with username and password is used by tools that do not offer token authentication (e.g. [OData in Excel](http://office.microsoft.com/en-001/excel-help/connect-to-an-odata-feed-HA104019824.aspx)) and to initially acquire authentication tokens.
- [PAT authentication](https://en.wikipedia.org/wiki/Personal_access_token).

> [!WARNING]
We strongly discourage to use token or basic authentication. These methods of authentication will be disabled in the forseeable future. We strongly recommend to autenticate using PATs.

To learn how to authenticate against our Web API refer to [authentication](authentication.md).