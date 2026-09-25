---
title: Daten aus SQL Server importieren - ADO.NET
description: Daten aus externen SQL-Server-Datenbanken mit IronPython und ADO.NET in time cockpit importieren und anschließend wie alle anderen Daten synchronisieren.
en_page: doc/scripting/import-data-from-sql-server.md
---
# Anleitung: Daten aus SQL Server importieren

[IronPython](http://ironpython.net/) unterstützt die Verwendung von .NET-Framework-Klassen in Skripten. Daher ist es auch möglich, mit IronPython über ADO.NET auf Datenbanken zuzugreifen. Mit diesem Ansatz kann time cockpit also beliebige Daten aus externen Datenquellen importieren. Sobald Daten auf diese Weise importiert wurden, werden sie automatisch wie alle anderen Daten in time cockpit synchronisiert.

## ADO.NET verfügbar machen

Um ADO.NET-Funktionen in IronPython zu verwenden, muss eine Referenz auf `System.Data` hinzugefügt werden. Zusätzlich müssen die benötigten Namespaces importiert werden. Der Einfachheit halber importieren wir alle Namespaces der Referenz `System.Data`.

```
clr.AddReference("System.Data")
from System.Data import *
```

## Daten aus SQL Server abrufen

Das folgende Beispiel zeigt, wie Sie eine Verbindung zu einer entfernten SQL-Server-Datenbank herstellen, Daten aus der Datenbank abrufen und die abgerufenen Daten über die Datenschicht von time cockpit speichern.

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

Nachdem die Prozedur definiert ist, kann sie mit der folgenden Codezeile aufgerufen werden:

```
importFromDb("Data Source=[servername];Initial Catalog=[catalogname];User ID=[username]@[servername];Password=[password]")
```
