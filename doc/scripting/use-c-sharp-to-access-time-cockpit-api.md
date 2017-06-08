# How To: Use C# to Access time cockpit API

You can not only access time cockpit's API using [IronPython](http://ironpython.net/), you can also use your favorite .NET programming language (e.g. C#).

> [!NOTE]
Note that the code in this example connects to a user's [server data store](~/doc/getting-started/system-architecture.md#central-data-storage). This is the recommended procedure for implementing interfaces that import or export data.

## Project References

Before you can access the time cockpit data store from C# you have to add certain references to your project:

> [!NOTE]
You can find the assemblies mentioned in this list in time cockpit's installation directory.

- Antlr3.Runtime
- Antlr3.StringTemplate
- IronPython
- log4net.dll
- Microsoft.Dynamic
- Microsoft.Scripting
- Newtonsoft.Json.Net35
- System.CoreEx.dll
- System.Data.SqlServerCe.dll
- System.Reactive.dll
- TimeCockpit.Common
- TimeCockpit.Data
- TimeCockpit.Data.QueryLanguage
- TimeCockpit.Data.RoutingService

## Web Service Endpoint Definition

time cockpit uses a web service to locate the user's [server data store](~/doc/getting-started/system-architecture.md#central-data-storage). Therefore it is necessary to define the web service endpoint in the program's application config file:

[!code-xml[Web service configuration](code/web-service-configuration.xml)]

## Select Data

```cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TimeCockpit.Data;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                var dataContext = DataContext.Create("user@demo.com", "myPassword");
                var projects = dataContext.Select("From P In Project Select P").Cast<dynamic>();
                projects.ToList().ForEach(p => Console.WriteLine(p.ProjectName));
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception: {0}", ex.ToString());
            }

            Console.ReadKey();
        }
    }
}
```