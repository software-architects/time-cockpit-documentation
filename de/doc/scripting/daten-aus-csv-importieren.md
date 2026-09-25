---
title: Daten aus CSV importieren - Skriptbeispiele
description: Daten aus CSV-Dateien mit IronPython-Skripten in time cockpit importieren und dabei .NET-Bibliotheken zum Lesen von CSV-Dateien verwenden.
en_page: doc/scripting/import-data-from-csv.md
---
# Anleitung: Daten aus CSV importieren

CSV-Dateien (Comma Separated Values) sind ein gängiges Format für den Datenaustausch. In diesem Kapitel zeigen wir, wie Sie mit der [Scripting](~/doc/scripting/ueberblick.md)-Funktion von time cockpit ein Importskript schreiben, das Zeitbuchungsdaten aus einer CSV-Datei liest.

## CSV in IronPython-Skripten verarbeiten

Die ursprüngliche Sprache Python enthält ein natives csv-Modul zur Verarbeitung von CSV-Dateien. Leider wurde es in C geschrieben. Daher können Sie es in IronPython nicht verwenden. Stattdessen könnten Sie Ihre eigene Importlogik nativ in IronPython schreiben. Alternativ können Sie jede für .NET verfügbare CSV-Bibliothek verwenden, da Sie .NET-Typen in IronPython direkt verwenden können (siehe auch Kapitel [Anleitung: .NET-Framework-Klassen in Skripten verwenden](~/doc/scripting/dotnet-framework-klassen-in-skripten-verwenden.md)).

> [!NOTE]
> Das Beispielskript in diesem Kapitel verwendet den CSV-Reader von Sébastien Lorion. Seine Bibliothek inklusive Quellcode finden Sie unter <http://www.codeproject.com/cs/database/CsvReader.asp>. Copyright für die CSV-Bibliothek von Sébastien Lorion, 2005. Die Bibliothek steht unter der MIT-Open-Source-Lizenz.

Das folgende Beispiel zeigt, wie Sie die CSV-Bibliothek in Ihr Skript importieren:

```
from System.Reflection import Assembly
assemblyPath = r"C:\CSVFramework\LumenWorks.Framework.IO.dll"
assembly = Assembly.LoadFile(assemblyPath)
clr.AddReference(assembly)
from System.IO import StreamReader
from LumenWorks.Framework.IO.Csv import CsvReader
```

> [!NOTE]
> time cockpit führt Skripte in einer Sandbox aus. Daher ist es nicht möglich, .NET-Bibliotheken zu verwenden, die auf eine andere .NET-Framework-Version als Microsoft .NET Framework 4.0 abzielen. Zum Zeitpunkt der Erstellung dieses Texts sind die Binärdateien der CSV-Bibliothek von Sébastien Lorion nicht für Microsoft .NET Framework 4.0 verfügbar. Sie können jedoch den Quellcode von Sébastien herunterladen, das Zielframework auf Microsoft .NET Framework 4.0 umstellen und die Bibliothek kompilieren.

## Zeitbuchungsdaten aus CSV importieren

Das folgende Beispiel zeigt, wie Sie eine CSV-Datei importieren, die Zeitbuchungsdaten enthält.

```
# COPYRIGHT NOTICE: 
# This demo script uses the CSV reader by Sébastien Lorion 
# You can find his library including source code  
#     at http://www.codeproject.com/cs/database/CsvReader.asp. 
# Copyright for the CSV library by Sébastien Lorion, 2005. 
# The library is licensed under MIT Open Source License. 

# Necessary imports to enable access to CSV reading component 
from System.Reflection import Assembly
assemblyPath = r"C:\CSVFramework\LumenWorks.Framework.IO.dll"
assembly = Assembly.LoadFile(assemblyPath)
clr.AddReference(assembly)
from System.IO import StreamReader
from LumenWorks.Framework.IO.Csv import CsvReader

# Read projects from time cockpit database
projects = Context.Select("From P In Project Select New With { " 
    ".CustomerCode = P.Customer.Code, .ProjectCode = P.Code, " 
    ".Project = P }")

# Read current user from database
user = Context.SelectSingle("From U In UserDetail " 
    "Where U.UserDetailUuid = Environment.CurrentUser.UserDetailUuid Select U")

# Create reader to read content of CSV file
fileReader = StreamReader(r"C:\temp\Timesheets.csv")
try:
    # Create component for reading CSV file 
    # Second parameter indicates whether the file has headers
    csvReader = CsvReader(fileReader, True)
    try:
        csvReader.SkipEmptyLines = True

        # Get indexes of source columns based on header. 
        # You can remove these lines if your CSV file has a static structure.
        headers = csvReader.GetFieldHeaders()
        beginTimeIndex = Array.IndexOf(headers, "BeginTime")
        endTimeIndex = Array.IndexOf(headers, "EndTime")
        customerCodeIndex = Array.IndexOf(headers, "CustomerCode")
        projectCodeIndex = Array.IndexOf(headers, "ProjectCode")
        descriptionIndex = Array.IndexOf(headers, "Description")
        if (beginTimeIndex < 0 or endTimeIndex < 0 or customerCodeIndex < 0 
            or projectCodeIndex < 0 or descriptionIndex < 0):
            raise Exception("Missing column(s) in CSV file.")

        while csvReader.ReadNextRecord():
            beginTime = DateTime.TryParse(csvReader[beginTimeIndex])
            if not beginTime[0]:
                raise Exception("Could not parse BeginTime in record {0}".format(
                    csvReader.CurrentRecordIndex))
            endTime = DateTime.TryParse(csvReader[endTimeIndex])
            if not beginTime[0]:
                raise Exception("Could not parse EndTime in record {0}".format(
                    csvReader.CurrentRecordIndex))
            project = [x for x in projects if x.CustomerCode == csvReader[customerCodeIndex]
                and x.ProjectCode == csvReader[projectCodeIndex]]
            if len(project) == 0:
                raise Exception("Error looking up project {0}.{1} (record {2})".format(
                    csvReader[customerCodeIndex],
                    csvReader[projectCodeIndex],
                    csvReader.CurrentRecordIndex))

            timesheet = Context.CreateTimesheet({ "BeginTime": beginTime[1],
                "EndTime": endTime[1], "Project": project[0].Project,
                "Description": csvReader[descriptionIndex], "UserDetail": user })
            Context.SaveObject(timesheet)
    finally:
        csvReader.Close()
finally:
    fileReader.Close()

print "Done!"
```

## Skript ausführen

Sie können das Importskript interaktiv in time cockpit ausführen. Eine weitere Möglichkeit ist das Kommandozeilenwerkzeug [ExecuteScript](/doc/scripting/automating-scripts.html) von time cockpit. Damit können Sie den Import z. B. mit Ihrem bevorzugten Scheduler regelmäßig ausführen.

> [!NOTE]
> Wir empfehlen, die Schalter -T und -s zu verwenden. -T bedeutet, dass das Skript innerhalb einer Datenbanktransaktion ausgeführt wird. Tritt ein Fehler auf, werden alle Änderungen an der Datenbank rückgängig gemacht. -s bedeutet, dass das Skript die Serverdatenbank von time cockpit statt der Client-Datenbank verwendet. Führen Sie das Skript nur dann ohne time cockpit aus, wenn Sie es ausdrücklich offline ausführen können möchten.

```
"C:\Program Files\software architects\time cockpit\time cockpit 2010\TimeCockpit.ExecuteScript.exe" -f "c:\temp\ImportCSV.py" -o "c:\temp\output.txt" -O -s -T
```
