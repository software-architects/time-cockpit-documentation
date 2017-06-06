import clr
clr.AddReferenceByName('Microsoft.Office.Interop.Excel, Version=11.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c')
clr.AddReference("System.Core")
from Microsoft.Office.Interop import *
from Microsoft.Office.Interop.Excel import *
from System import *
from System.Linq import Enumerable

def ExportTimesheetProtocolToExcel(actionContext):
  # Helper function that sets the background of the entire row 
  def ColorizeRow(cell):
    cell.EntireRow.Interior.ThemeColor = XlThemeColor.xlThemeColorDark1
    cell.EntireRow.Interior.TintAndShade = -0.249977111117893 

  # Helper function that checks if a certain day if no working day 
  def IsDayOff(day, holidays):
    return day.DayOfWeek == DayOfWeek.Saturday or day.DayOfWeek == DayOfWeek.Sunday \
      or Enumerable.Count(holidays, lambda h: h.LegalHolidayDate.Day == day.Day) > 0 

  # Helper function that colorizes the entire day if the day is off 
  def HandleRowColor(currentDayDate, cell, holidays):
    if IsDayOff(currentDayDate, holidays):
      ColorizeRow(cell)

  # Creates an Excel worksheet for a specific user and month 
  def AddWorksheet(user, year, month, workbook):
    # Get all timesheets for the user
    timesheets = Context.SelectWithParams({
      "Query": "From T In Timesheet Where T.UserDetail.Username = @Username And :Year(T.BeginTime) = @YearFilter And :Month(T.BeginTime) = @MonthFilter Order By T.BeginTime Select T",
      "@Username": user.Username,
      "@YearFilter": Decimal(year),
      "@MonthFilter": Decimal(month) })

    # Get holidays for the corresponding month
    holidays = Context.SelectWithParams({
      "Query": "From H In LegalHoliday Where :Year(H.LegalHolidayDate) = @YearFilter And :Month(H.LegalHolidayDate) = @MonthFilter Order By H.LegalHolidayDate Select H",
      "@YearFilter": Decimal(year),
      "@MonthFilter": Decimal(month) })

    # Add sheet for user
    workbook.Worksheets["Tabelle1"].Copy(Before = workbook.Worksheets[1])
    ws = workbook.Worksheets[1]
    ws.Name = user.Lastname + ", " + user.Firstname
    ws.Activate()

    rowIndex = 2
    totalWorkingHours = 0
    hoursPerDay = user.WeeklyHoursOfWork / 5
    prevDay = 0 

    # Loop over all days of the month 
    for currentDay in range(1, DateTime(year, month, 1).AddMonths(1).AddDays(-1).Day + 1):
      currentDayDate = DateTime(year, month, currentDay)
      dailyTimesheets = Enumerable.Where(timesheets, lambda t: t.BeginTime.Day == currentDay)

      if Enumerable.Count(dailyTimesheets) > 0:
        # There are timesheets for this day 
        for timesheet in dailyTimesheets:
          # Add row for timesheet
          HandleRowColor(currentDayDate, ws.Cells[rowIndex, 1], holidays)
          if prevDay != timesheet.BeginTime.Day:
            # Don't repeat day index for mulitple rows of the same day
            ws.Cells[rowIndex, 1].Value2 = timesheet.BeginTime.Day
          ws.Cells[rowIndex, 2].Value2 = timesheet.BeginTime
          ws.Cells[rowIndex, 3].Value2 = timesheet.EndTime
          ws.Cells[rowIndex, 4].Value2 = timesheet.DurationInHours / 24
          ws.Cells[rowIndex, 5].Value2 = timesheet.Description
          totalWorkingHours = totalWorkingHours + timesheet.DurationInHours
          prevDay = timesheet.BeginTime.Day
          rowIndex = rowIndex + 1 
      else:
        # There are no timesheets for this day
        HandleRowColor(currentDayDate, ws.Cells[rowIndex, 1], holidays)
        ws.Cells[rowIndex, 1].Value2 = currentDay 
        rowIndex = rowIndex + 1 

    # Add sums
    ws.Cells[rowIndex,2].Value2 = 'Gesamt:'
    ws.Cells[rowIndex,4].Value2 = (totalWorkingHours)/ 24
    rowIndex = rowIndex + 1 

  # make sure that input set contains at least one object 
  if (Enumerable.Count[EntityObject](actionContext.InputSet) > 0):
    # Open Excel (visible just for demo purposes)
    ex = Excel.ApplicationClass()   
    ex.Visible = True
    ex.DisplayAlerts = False   
    workbook = ex.Workbooks.Open(r"C:\temp\MonthlyReport.xlsx")

    for user in actionContext.InputSet:
      AddWorksheet( user, 2017, 5, workbook )