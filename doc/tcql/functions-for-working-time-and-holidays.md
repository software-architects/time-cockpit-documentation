# Functions for Working Time and Holidays (TCQL)

Since Version 1.7 time cockpit has been able to calculate planned working hours and data about remaining paid time off for vacations. This chapter describes the functions that time cockpit contains to do this kind of calculations in TCQL statements or scripts.

> [!NOTE]
Note that you can only use this function in [TCQL Queries](xref:tcql). You cannot use them in in-memory [expressions](expression-language.md) (e.g. value-based coloring in timesheet calendar) or calculated properties (<xref:TimeCockpit.Data.DataModel.CalculatedProperty>).

## RemainingVacationWeeks

Use the function `RemainingVacationWeeks` to calculate the remaining paid time off for vacations.

### Parameters

Parameter | Description
--- | ---
userUuid | ID of the user for which the function calculates the result.
effectiveDate | Effective date for which the function calculates the result.

### Examples

The following TCQL query shows the remaining paid time off for all users in the database:

```
From U In UserDetail
Select New With
{
        .User = U,
        .RemainingPaidTimeOff = :RemainingVacationWeeks(U.APP_UserDetailUuid, #2011-12-31#)
}
```

The following TCQL query shows the remaining paid time off for the current user. It shows the result for end of June and end of December. Note that the example uses [Environment.CurrentUser](expression-language.md) to get the current time cockpit user.

```
From U In UserDetail
Where U.UserDetailUuid = Environment.CurrentUser.UserDetailUuid
Select New With
{
        .RemainingPTO_2011_06 = :RemainingVacationWeeks(U.APP_UserDetailUuid, #2011-06-30#),
        .RemainingPTO_2011_12 = :RemainingVacationWeeks(U.APP_UserDetailUuid, #2011-12-31#)
}
```

## PlannedHoursOfWork

Use the function `PlannedHoursOfWork` to calculate the planned hours of work for a given user and time span.

### Parameters

Parameter | Description
--- | ---
userUuid | ID of the user for which the function calculates the result.
beginTime | Begin date/time (inclusive) for which the function calculates the result.
endTime | End date/time (inclusive) for which the function calculates the result.
includeLumpSumOvertime | Indicating whether the result should include the lump sum for overtime defined for the user.

### Examples

The following TCQL query compares the planned hours of work and the actual hours of work:

```
From U In UserDetail
Select New With
{
        .User = U,
        .PlannedHoursOfWork = :PlannedHoursOfWork(U.UserDetailUuid, #2011-01-01#, #2011-12-31#, True),
        .ActualHoursOfWork = :ActualHoursOfWork(U.UserDetailUuid, #2011-01-01#, #2011-12-31#, True),
        .Deviation = :ActualHoursOfWork(U.UserDetailUuid, #2011-01-01#, #2011-12-31#, True) 
                - :PlannedHoursOfWork(U.UserDetailUuid, #2011-01-01#, #2011-12-31#, True)
}
```

## ActualHoursOfWork

Use the function ActualHoursOfWork to calculate the total hours of actual work for a given user and time span.

### Parameters

Parameter | Description
--- | ---
userUuid | ID of the user for which the function calculates the result.
beginTime | Begin date/time (inclusive) for which the function calculates the result.
endTime | End date/time (inclusive) for which the function calculates the result.
includeWeights | Indicating whether the function takes working time weights into account.

> [!NOTE]
You can assign a weight to a timesheet using the relation `APP_Timesheet.APP_WorkingTimeWeight`. You have to maintain the available weights in the entity `APP_WorkingTimeWeight`.

### Examples

For examples see example section in chapter [PlannedHoursOfWork](#plannedhoursofwork).

## Overtime

Use the function Overtime to calculate the overtime hours for a given user and effective date.

### Parameters

Parameter | Description
--- | ---
userUuid | ID of the user for which the function calculates the result.
effectiveDate | Effective date for which the function calculates the result.
includeWeights | Indicating whether the function takes working time weights into account.
includeLumpSumOvertime | Indicating whether the result should include the lump sum for overtime defined for the user.

> [!NOTE]
You can assign a weight to a timesheet using the relation `APP_Timesheet.APP_WorkingTimeWeight`. You have to maintain the available weights in the entity `APP_WorkingTimeWeight`.

### Examples

The following TCQL query shows the overtime for all users in the database:

```
From U In UserDetail
Select New With
{
        .User = U,
        .Overtime = :Overtime(U.UserDetailUuid, #2011-12-31#, True, True)
}
```

## AverageHoursOfWorkPerDay
Use the function AverageHoursOfWorkPerDay to calculate the average planned hours of work per working day for a given user and effective date. Examples:

- Weekly hours of work: Monday to Friday 7.7 hours<br/>
Result: 7.7 hours
- Weekly hours of work: Monday to Thursday 8 hours, Friday 6 hours<br/>
Result: 7.6 hours
- Weekly hours of work: Monday to Wednesday 4 hours<br/>
Result: 4 hours

### Parameters

Parameter | Description
--- | ---
userUuid | ID of the user for which the function calculates the result.
effectiveDate | Effective date for which the function calculates the result.

### Examples

The following TCQL query shows the average working time for all users in the database:

```
From U In UserDetail
Select New With
{
        .User = U,
        .HoursPerDay = :AverageHoursOfWorkPerDay(U.UserDetailUuid, #2011-12-31#)
}
```