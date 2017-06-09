# Time Sheet

In time cockpit you can create, edit and delete time sheet entries in the graphical time sheet calendar. You can also access time sheet entries in tabular form which is especially helpful in following situations:

- Time sheet entries shall be exported e.g. as list enclosed to an invoice.
- You want a tabular list of all time sheets e.g. for a specific invoice.
- You want to export time sheet entries for analysis purposes.

> [!NOTE]
time cockpit is shipped with a sample excel export template for the standard time sheet list (see following register). You find this sample TimesheetListPivotAnalysis.xlsx in the installation directory of time cockpit.

For each time sheet you can define a specific hourly rate (`APP_HourlyRate`) differing from customer, project or task. If you do not enter a specific rate, the default hourly rate of project, customer or task will be used. You find the effective hourly rate of a time sheet in the calculated property `APP_HourlyRateActual`.

Time sheet entries can be marked as not billable (`APP_NoBilling`). You can find if a specific time sheet is billable or not billable in the column `APP_Billable`.