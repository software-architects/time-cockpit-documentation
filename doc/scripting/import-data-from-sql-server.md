---
title: Import Data from SQL Server - ADO.NET
description: Import data from external SQL Server databases into time cockpit using IronPython and ADO.NET. Access remote databases and sync data.
---
# How To: Import Data From SQL Server

[IronPython](http://ironpython.net/) supports using .NET Framework classes from within scripts. Therefore it is also possible to IronPython to access databases with ADO.NET. That is, time cockpit can import any data from external data sources using this approach. Once data is imported via this approach, it automatically synced as any other data in time cockpit

## Making ADO.NET Available

To use ADO.NET features in IronPython, a reference to `System.Data` has to be added. Additionally we need to import the necessary namespaces. For the sake of simplicity, we import all namespaces of the `System.Data` reference.

```
clr.AddReference("System.Data")
from System.Data import *
```

## Fetch Data From SQL Server

The following sample shows how to establish a connection to remote SQL Server database, how to fetch some data from the database and how to save the fetched data via the time cockpit data layer.

```
clr.AddReference("System") 
clr.AddReference("System.Data")

from System.Data import *

# ########################## 
# importFromDb 
# fetches data from a database, creates a TimesheetBackup object for each record and saves it to the current context. 
# ########################## 
def importFromDb(connectionstring):
  #create a connection to a Sql Server database 
  try:
    Context.BeginTransaction()
    connection = SqlClient.SqlConnection(connectionstring)
    try:
      connection.Open()
      try:
        command = SqlClient.SqlCommand("select * from myschema.Timesheet", connection)
        reader = command.ExecuteReader()
        while reader.Read():
          timesheet = Context.CreateTimesheetBackup()
          timesheet.Description = reader["Description"]
          Context.SaveObject(timesheet)
        Context.TryCommitTransaction()
      finally:
        reader.Close()
        reader.Dispose()
        command.Dispose()
    finally:
      connection.Close()
      connection.Dispose()
  except:
    Context.TryRollbackTransaction()
  print "DONE!"
```

After defining the procedure, it can be called via the following line of code:

```
importFromDb("Data Source=[servername];Initial Catalog=[catalogname];User ID=[username]@[servername];Password=[password]")
```