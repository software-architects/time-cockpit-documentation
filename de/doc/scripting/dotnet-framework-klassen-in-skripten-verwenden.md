---
title: .NET-Klassen in Skripten verwenden - Framework-Zugriff
description: .NET-Framework-Klassen in IronPython-Skripten für time cockpit verwenden und aus Python auf .NET-Bibliotheken, Generics und weitere Funktionen zugreifen.
en_page: doc/scripting/use-dot-net-classes-in-scripts.md
---
# Anleitung: .NET-Framework-Klassen in Skripten verwenden

[IronPython](http://ironpython.net/) unterstützt die Verwendung von .NET-Framework-Klassen in Skripten. Das ist äußerst nützlich, wenn Sie Schnittstellen umsetzen möchten, die Daten in time cockpit importieren oder aus time cockpit exportieren.

## .NET-Klassen verfügbar machen

Wenn Sie .NET-Klassen in einem Python-Skript verwenden möchten, müssen Sie zuerst eine Referenz auf die DLL hinzufügen, die die entsprechenden .NET-Klassen enthält. Dazu rufen Sie clr.AddReference auf (Details zum Laden von Assemblies in IronPython finden Sie im entsprechenden Kapitel der [IronPython-Dokumentation](http://ironpython.net/ironpython/documentation/dotnet/dotnet.html#id31)).

Nachdem Sie die Assemblies geladen haben, müssen Sie die Namespaces mit der Python-Anweisung `import` importieren (Details zum Importieren von .NET-Namespaces in IronPython finden Sie im entsprechenden Kapitel der [IronPython-Dokumentation](http://ironpython.net/ironpython/documentation/dotnet/dotnet.html#id34)).

## Fortgeschrittene Themen

Sie können auch fortgeschrittene C#- oder .NET-Funktionen wie Generics, verschachtelte Typen usw. in Python verwenden. Details finden Sie in der [Dokumentation von IronPython](http://ironpython.net/ironpython/documentation/dotnet/dotnet.html#id33).

## Zeitbuchungen in eine Textdatei exportieren

Das folgende Beispiel zeigt, wie Sie Zeitbuchungen in eine Textdatei exportieren:

```
clr.AddReference("mscorlib")
from System.IO import StreamWriter, File
from System import DateTime

timesheets = Context.SelectWithParams({
  "Query": "From T In Timesheet Where T.BeginTime >= @BeginTime And T.EndTime <= @EndTime Select T",
  "@BeginTime": DateTime(2010, 1, 1),
  "@EndTime": DateTime(2010, 1, 31) })

writer = StreamWriter("c:\\temp\\export.txt")
try:
  for timesheet in timesheets:
    writer.WriteLine(timesheet.BeginTime.ToString() + ";" 
      + timesheet.EndTime.ToString() + ";"
      + timesheet.Description)
finally:
  writer.Dispose()

print File.ReadAllText("c:\\temp\\export.txt")

print "Done!"
```

## Länder aus einem REST-Service importieren

Das folgende Beispiel zeigt, wie Sie Länder aus einem REST-Service importieren:

```
clr.AddReference("System")
from System.Net import WebRequest
from System.IO import StreamReader
from TimeCockpit.Data.QueryLanguage import QueryParameter

def download_text(url):
  req = WebRequest.Create(url)
  resp = req.GetResponse()
  try:
    respStream = resp.GetResponseStream()
    try:
      streamReader = StreamReader(respStream)
      return streamReader.ReadToEnd()
    finally:
      streamReader.Close()
  finally:
    respStream.Close()

countries = {}
content = download_text("http://download.geonames.org/export/dump/countryInfo.txt")
for line in content.splitlines():
  if not line.startswith("#"):
    columns = line.split("\t")
    countries[columns[0]] = {"IsoCode": columns[0], "EnglishName": columns[4], "Currency": columns[10], "Continent": columns[8], "GermanName": columns[4]}

for country in countries:
  germanCountryInfo = download_text("http://ws.geonames.org/countryInfoCSV?lang=de&country=%(countryIsoCode)s" % { "countryIsoCode": country })
  if len(germanCountryInfo) > 0:
    germanLines = germanCountryInfo.splitlines()
    if len(germanLines) >= 2:
      countries[country]["GermanName"] = germanLines[1].split("\t")[4]

  dbCountry = Context.SelectSingleWithParams({"Query": "From C In Country Where C.IsoCode = @IsoCode Select C", "@IsoCode": country})
  if dbCountry == None:
    dbCountry = Context.CreateCountry()
    dbCountry.IsoCode = country
  dbCountry.Name = countries[country]["EnglishName"]
  dbCountry.Currency = countries[country]["Currency"]
  dbCountry.GermanName = countries[country]["GermanName"]
  Context.SaveObject(dbCountry)

print "Done!"
```
