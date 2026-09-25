---
title: Mit C# auf die API zugreifen - .NET-Integration
description: Aus C# und anderen .NET-Sprachen auf die API von time cockpit zugreifen, inklusive Projektreferenzen, Datenkontext und Verbindung zum Server-Datenspeicher.
en_page: doc/scripting/use-c-sharp-to-access-time-cockpit-api.md
---
# Anleitung: Mit C# auf die API von time cockpit zugreifen

Sie können nicht nur mit [IronPython](http://ironpython.net/) auf die API von time cockpit zugreifen, sondern auch mit Ihrer bevorzugten .NET-Programmiersprache (z. B. C#).

> [!NOTE]
> Beachten Sie, dass sich der Code in diesem Beispiel mit dem [Server-Datenspeicher](~/doc/erste-schritte/systemarchitektur.md#zentrale-datenspeicherung) eines Benutzers verbindet. Das ist die empfohlene Vorgehensweise, um Schnittstellen umzusetzen, die Daten importieren oder exportieren.

## Projektreferenzen

Bevor Sie aus C# auf den Datenspeicher von time cockpit zugreifen können, müssen Sie Ihrem Projekt bestimmte Referenzen hinzufügen:

> [!NOTE]
> Die in dieser Liste genannten Assemblies finden Sie im Installationsverzeichnis von time cockpit.

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

## Definition des Webservice-Endpunkts

time cockpit verwendet einen Webservice, um den [Server-Datenspeicher](~/doc/erste-schritte/systemarchitektur.md#zentrale-datenspeicherung) des Benutzers zu ermitteln. Daher muss der Webservice-Endpunkt in der Konfigurationsdatei der Anwendung definiert werden:

[!code-xml[Web service configuration](code/web-service-configuration.xml)]

## Daten abfragen

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
