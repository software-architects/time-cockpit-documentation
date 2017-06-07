# How To: Export Data To Microsoft Excel

For reporting purposes it is often necessary to automatically export data into Microsoft Office Excel. You could for instance create a timesheet export script that automatically creates an excel pivot table report per user and sends this report via email.

time cockpit supports two ways of exporting data to Microsoft Office Excel:

- Use time cockpit's [built-in export function](~/doc/data-exchange/export.md).
- In case you need something very special (e.g. special formatting of the resulting Microsoft Office Excel file) you can use Microsoft Office automation in [IronPython](http://ironpython.net/).

## Using Built-In Microsoft Office Excel Export Function

The following sample shows how to export the result of a [TCQL query](~/doc/tcql/overview.md) using an export [template file](~/doc/data-exchange/export.md) inside a script:

> [!NOTE]
The Export method shown in the code below expects either a template file or a list definition. If you specify a template the list definition is ignored. If you do not specify a template file you have to specify a list definition (i.e. template is automatically built based on the list definition).

```
clr.AddReference("TimeCockpit.Data.Export")
from TimeCockpit.Data.Export.Excel import *
from System.Threading import CancellationToken

resultingRows = Context.Select("From T In Timesheet Where T.APP_BeginTime > #2010-01-01# Select T")
sourceList = Context.Model.ModelEntityViews["APP_TimesheetList"].Configuration.Columns

XlsxExporter2.ExportToFile(
  "c:\\temp\\Template.xlsx",    # Path to template file  
  "c:\\temp\\export.xlsx",      # Target file name
  resultingRows,                # Rows that should be exported (has to be a list of entity objects)
  sourceList,                   # List definition that acts as the source for the export
  None,                         # Reserved; always pass None here
  CancellationToken(False))     # Cancellation token that could be used to cancel the export
```

## Using Microsoft Office Automation in a Script

The following sample shows how to generate an Microsoft Office Excel file using Microsoft Office automation. The script loads a template workbook, creates one sheet per user by copying a worksheet and fills the sheet with time sheet rows. Holidays and weekends are specially formatted.

[!code-python[Export time sheet entries to excel](code/export-time-sheet-entries-per-user-to-excel.py)]

## Using an Action to Integrate Microsoft Office Excel Export in the User Interface

You can convert an export script into an [Action](xref:TimeCockpit.Data.DataModel.Actions.ModelAction) to offer a button in time cockpit's user interface that exports the data of the selected row in a list. The following example shows how the sample shown above can be added as an action to the entity APP_UserDetail:

> [!NOTE]
Note that the action's code must only contain one top level `def` statement! If you need helper functions you have to define them as nested functions inside the one and only top level function (see sample code below).

[!code-python[Export time sheet entries to excel action](code/export-time-sheet-entries-per-user-to-excel-action.py)]