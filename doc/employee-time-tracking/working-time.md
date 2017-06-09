# Working Time

Tracking working time is the core function of time cockpit. Many organizations would also like to use that data for calculating overtime, vacations and much more. In time cockpit you can set planned hours of work, vacation entitlement and consumption, and overtime for every employee. On this base time cockpit calculates the deviation between planned and actual hours of work and the remaining leave for any date.

> [!NOTE]
The comparison of actual and planned hours of work, the calculation of overtime and remaining leave are optional functions of time cockpit and do not have to be used. For these functions it is necessary that all working hours are tracked (that means it is not enough to track for example only billable hours).

## Weekly Hours of Work
Before version 1.7 of time cockpit only the current planned hours of work per week could be stored. They were used to display a chart of planned and actual hours of work in the time tracking calendar. If the planned hours per week were changed, the calculated planned hours per day, week and month were changed also for the past.

Since version 1.7 time cockpit supports historical weekly hours of work. That means you can tell time cockpit from when until when the planned weekly hours of work are valid. You can manage the weekly hours of work in the list of **User Details** in the hyperlink **Weekly Hours of Work**.

Planned hours of work are stored per week day. You can split the weekly working time equally on all working days (e.g. for full-time employees) or you can define different hours for every day (e.g. for an employee that only works on Monday and Tuesday). For control purposes time cockpit will show you the sum of all days. Additionally you can specify the included overtime hours per month (only relevant if you want to calculate overtime).

> [!WARNING]
Please note, that the validity periods **must not overlap**. It is not allowed to specify 38.5 weekly hours of work for 1/1/2013 until 12/31/2013 and 40 weekly hours of work for 12/1/2013 until 12/31/2014. For December 2013 both values would be valid and time cockpit is not able to calculate the correct planned hours of work.

In [TCQL queries](~/tcql/overview.md) you are able to calculate the planned hours of work for an employee with help of the function [AverageHoursOfWorkPerDay](~/doc/tcql/functions-for-working-time-and-holidays.md#averagehoursofworkperday).

## Vacation Entitlement

To enable time cockpit to calculate the remaining leave for each employee, you have to gather the vacation entitlement per employee in weeks. When you hire a new employee you can for example enter 5 weeks of vacation entitlement for the first year. One year later you have to add a new entitlement of 5 weeks. Another option is to capture vacation entitlements for all employees at the first day of the calendar of accounting year.

You may also enter negative values for the vacation entitlement. Use negative values if you pay out unused vacations or you need to correct the current vacation entitlement for another reason.

> [!NOTE]
Please note that time cockpit does not ensure that legal obligations are fulfilled.

You can manage vacations in the menu item **Vacation Entitlement**.

## Vacation Management

The menu item **Vacations** allows you the manage vacations of your employees. Remaining leave calculation is based on weeks. Employees are entitled to get a certain number of weeks of vacation. In many cases it is not possible to calculate vacations in days instead of weeks because of part time employees that have different hours of work on each day or because of changing weekly hours of work. The rules of the calculation of remaining leave are as follows:

Every use of vacation is automatically converted into weeks. Therefor the planned hours for each day are considered (see Weekly Hours of Work). Non-all-day vacations are converted into weeks, too.
Legal holidays during vacations do not reduce the remaining leave. In chapter HowTo: Add Holidays Using Script you find information on how to automatically create legal holidays with a Python script.
Vacations that are marked as Special Leave do not reduce the remaining leave. You can use special leaves to grant extra paid vacation for special reasons like marriage or house moving.

> [!NOTE]
Please note that time cockpit also allows you to manage sick-leaves and compensatory time. There are a separate menu items for **Sick Leave** and **Compensatory Time**.

> [!NOTE]
Please note that time cockpit has no rules for automatic expiration of vacation entitlements. You have to solve this manually by entering a negative vacation entitlement.
For querying vacation data you can use two pre-defined lists in time cockpit:

- The list **Vacations** shows the history of vacation entitlement, vacation usage and remaining leave for one employee.
- The list **Remaining Leave** shows a list of all employees with the corresponding remaining leave for an effective date.

In [TCQL queries](~/tcql/overview.md) you can calculate the remaining leave for an employee with the function [RemainingVacationWeeks](~/doc/tcql/functions-for-working-time-and-holidays.md#remainingvacationweeks).

## Legal Holidays

The menu items **Public Holiday Calendar** and **Holidays** allow you to define multiple holiday calendars with different legal holidays. Use the menu item **User Details** to assign a holiday calendar to a user.

## Planned Hours of Work

Since version 1.7 time cockpit is able to calculate the planned hours of work for an employee for a specific period of time. The following data is used:

- The [weekly hours of work](#weekly-hours-of-work) for the employee. Time cockpit is able to calculate the employee’s planned hours of work inclusive or exclusive the included overtime per month. The list Target/Actual Comparison contains both values.
- [Used vacation and sick leave](#vacation-management) for the employee.
- All [legal holidays](#legal-holidays) that are captured in time cockpit.

> [!WARNING]
Please note that the date of joining and the date of separation are not considered for the calculation. Only the validity period of the Weekly Hours of Work is used.

The **Target/Actual Comparison** list shows you the planned and actual hours of work per employee. For deviations between actual and planned hours the following rules are used:

- If an employee has worked less hours than the calculated planned hours excl. included overtime, the deviation between actual hours and planned hours excl. included overtime is displayed (negative value).
- If an employee has worked more hours than the calculated planned hours incl. included overtime, the deviation between actual hours and planned hours incl. included overtime is displayed (positive value).
- If the actual hours are between the calculated planned hours excl. included overtime and planned hours incl. included overtime, the deviation is 0.

In [TCQL queries](~/tcql/overview.md) you can calculate the planned hours of work for an employee for a specific period of time with the function [PlannedHoursOfWork](~/doc/tcql/functions-for-working-time-and-holidays.html#plannedhoursofwork).

## Actual Hours of Work

The actual hours of work are calculated by summarizing all time sheet entries. If there are overlapping time sheet entries, the hours are not counted twice. If you create for example a time sheet entry from 9am to 11am and another one from 10am to 12am only 3 hours are counted. Since version 1.7 you can optionally specify a working time weight for each time sheet entry (e.g. 150% for time sheet entries on Saturday and Sunday). You can manage the available working time weights at the menu item **Working Time Weight**. When calculation the actual hours of work the duration in hours for a time sheet entry is multiplied with the working time weight (if available).

> [!NOTE]
Please note that time cockpit does not provide functions to evaluate working time weights automatically. You have to specify the weight for each time sheet entry manually. You can model your effective calculation rules for working time weights in Scripts and Actions. If you have questions, please contact us at support@timecockpit.com.

In [TCQL queries](~/tcql/overview.md) you can query the actual hours of work for an employee with the function [ActualHoursOfWork](~/doc/tcql/functions-for-working-time-and-holidays.html#actualhoursofwork).

## Overtime Calculation

The list **Overtime** is similar to the list **Target/Actual Comparison**. In the **Target/Actual Comparison** list you can chose a time range for the calculation of actual and planned hours of work, whereas the **Overtime** list calculates the overtime from the joining date of the employee on.

The overtime is calculated considering the Working Time Weight and the [Included Overtime](#weekly-hours-of-work).

There is a menu item **Overtime Correction**, that allows you to manually set the overtime for an employee for a specific date (e.g. to correct incomplete time sheet entries or when paying out overtime).

> [!NOTE]
Please note, that the overtime correction represents the number of overtime for the specified date. If you enter 100, that means the employee has 100 hours overtime at the specified date. It does not mean that the number of overtime is reduced or increased by 100 hours.

In [TCQL queries](~/tcql/overview.md) you can calculate the overtime with the function [Overtime](~/doc/tcql/functions-for-working-time-and-holidays.html#overtime).

> [!WARNING]
Please note that the date of joining and the date of separation are not considered for the calculation. Only the validity period of the Weekly Hours of Work is used.

## Special Cases for Planned Hours and Overtime

Usually the weekly hours of work change at the end of a month. For this case enter the last of the month for **Valid Until** for the first record and the first of the next month for **Valid From** for the second record.

If the weekly hours of work are changed the calculation for overtime is more complex. In this case time cockpit divides the included overtime by the number of working days in the month (considering vacation, legal holidays and sick leave). If an employee works 3 days per week for the first two weeks in January and 5 days per week for the second two weeks in January, there are approximately 7 working days in the first half and 12 working days in the second half of January. The included overtime is divided by 19 (17 + 12).

It is also possible that additionally the included overtime has changed. If there are 4 hours of included overtime in the first two weeks and 15 hours of included overtime in the second two weeks of January for the previous sample, time cockpit gets and overtime of 7 / 19 * 4 for the first two weeks and 12 / 19 * 15 for the second two weeks. Please note that time cockpit splits the overtime evenly on all working days even if the employee works for example 6 hours on Monday, 8 hours on Tuesday, etc.

There is another special case when an employee has no working days for a whole month because of vacation. In this case there is no working day with planned hours of work. Therefore there are no days to split the included overtime. The planned working time for such months is always 0 (incl. and excl. included overtime). If an employee captures time sheet entries for such a month, every hours automatically counts as overtime.