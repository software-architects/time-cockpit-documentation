# How To: Import Data From CSV

CSV (Comma Seperated Files) are a common format for data exchange. In this chapter we want to show how you can use time cockpit's [scripting](overview.md) function to write an import script that ready timesheet data from a CSV file.

## Handling CSV in IronPython Scripts

The original Python language contains a native csv module to handle CSV files. Unfortunately it has been written in C. Therefore you cannot use it in IronPython. Instead you could write your own import logic natively in IronPython. As an option you can use any CSV library available for .NET because you can use .NET types directly in IronPython (see also chapter [How To: Use .NET Framework Classes in Scripts](use-dot-net-classes-in-scripts.md)).

> [!NOTE]
The sample script in this chapter uses the CSV reader by Sébastien Lorion. You can find his library including source code at <http://www.codeproject.com/cs/database/CsvReader.asp>. Copyright for the CSV library by Sébastien Lorion, 2005. The library is licensed under MIT Open Source License.

The following sample shows how to import the CSV library into your script:

```
from System.Reflection import Assembly
assemblyPath = r"C:\CSVFramework\LumenWorks.Framework.IO.dll"
assembly = Assembly.LoadFile(assemblyPath)
clr.AddReference(assembly)
from System.IO import StreamReader
from LumenWorks.Framework.IO.Csv import CsvReader
```

> [!NOTE]
time cockpit runs scripts inside a sandbox. Therefore it is not possible to use .NET libraries that target other .NET Framework versions than Microsoft .NET Framework 4.0. At the time of writing the binaries for the CSV library by Sébastien Lorion are not available for Microsoft .NET Framework 4.0. However, you can download Sébastien's source code, switch the target framework to Microsoft .NET Framework 4.0 and build it.

## Import Timesheet Data From CSV

The following sample shows how you can import a CSV file that contains timesheet data.

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

## Running the Script

You can run the import script interactively in time cockpit. Another option is to use time cockpit's [ExecuteScript](automating-scripts.md) command line tool. With this you can e.g. run the import periodically using your preferred scheduler.

> [!NOTE]
We recommend that you use the switches -T and -s. -T means that the script is executing within a database transaction. If any error occurs all changes to the database are undone. -s means that the script uses the time cockpit server database instead of the client database. Run the script without time cockpit only if you explicitly want to be able to run it offline.

```
"C:\Program Files\software architects\time cockpit\time cockpit 2010\TimeCockpit.ExecuteScript.exe" -f "c:\temp\ImportCSV.py" -o "c:\temp\output.txt" -O -s -T
```