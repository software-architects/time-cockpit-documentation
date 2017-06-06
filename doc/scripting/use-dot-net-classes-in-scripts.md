# How To: Use .NET Framework Classes in Scripts

[IronPython](http://ironpython.net/) supports using .NET Framework classes from within scripts. This is extremely useful if you want to implement interfaces that import/export data from/to time cockpit.

## Making .NET Classes Available

If you want to use .NET classes in a Python script you first have to add a reference to the DLL that contains the corresponding .NET classes. You can do that by calling clr.AddReference (for details about loading assemblies in IronPython see the corresponding chapter in the [IronPython documentation](http://ironpython.net/ironpython/documentation/dotnet/dotnet.html#id31)).

After you have loaded the assemblies you have to import that namespaces using Python's `import` statement (for details about importing .NET namespaces in IronPython see the corresponding chapter in the [IronPython documentation](http://ironpython.net/ironpython/documentation/dotnet/dotnet.html#id34)).

## Advanced Topics

You can use advanced C# or .NET features like generics, nested types, etc. in Python, too. See [IronPython's documentation](http://ironpython.net/ironpython/documentation/dotnet/dotnet.html#id33) for details.

## Export Timesheets Into a Text File

The following example shows how to export timesheets into a text file:

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

## Import Countries From REST Service

The following example shows how to import countries from a REST service:

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