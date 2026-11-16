---
title: TCQL Functions - Working Time & Holidays
description: Use TCQL functions in time cockpit to calculate planned working hours, remaining vacation weeks, overtime, and actual hours of work.
---
# Functions for Working Time and Holidays (TCQL)

Since Version 1.7 time cockpit has been able to calculate planned working hours and data about remaining paid time off for vacations. This chapter describes the functions that time cockpit contains to do this kind of calculations in TCQL statements or scripts.

> [!NOTE]
> Note that you can only use this function in [TCQL Queries](xref:tcql). You cannot use them in in-memory [expressions](expression-language.md) (e.g. value-based coloring in timesheet calendar) or calculated properties (<xref:TimeCockpit.Data.DataModel.CalculatedProperty>).

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
> You can assign a weight to a timesheet using the relation `APP_Timesheet.APP_WorkingTimeWeight`. You have to maintain the available weights in the entity `APP_WorkingTimeWeight`.

### Examples

For examples see example section in chapter [PlannedHoursOfWork](#plannedhoursofwork).

## Overtime

Use the function Overtime to calculate the working time balance (overtime hours) of a user, either on an effective date or as its change within a time range.

The function has two forms:

```
:Overtime(userUuid, effectiveDate, includeWeights, includeLumpSumOvertime[, useLegacyOvertimeCalculation])
:Overtime(userUuid, startDate, endDate, includeWeights, includeLumpSumOvertime[, useLegacyOvertimeCalculation])
```

With five arguments, the type of the third argument decides the form: a date selects the time range form, a Boolean value the effective date form with `useLegacyOvertimeCalculation`.

### Parameters

Parameter | Description
--- | ---
userUuid | ID of the user for which the function calculates the result.
effectiveDate | Effective date for which the function calculates the balance.
startDate | First day of the time range (time range form only).
endDate | Last day of the time range (time range form only).
includeWeights | Indicating whether the function takes working time weights into account.
includeLumpSumOvertime | Indicating whether the result should include the lump sum for overtime defined for the user.
useLegacyOvertimeCalculation | Optional. `True` selects the previous calculation, `False` the current one. If you omit it, the current calculation is used.

> [!NOTE]
> You can assign a weight to a timesheet using the relation `APP_Timesheet.APP_WorkingTimeWeight`. You have to maintain the available weights in the entity `APP_WorkingTimeWeight`.

### How the Balance Is Calculated

The balance on an effective date starts at the last overtime correction of the user (or at zero) and applies the following months one after another. In a month with fewer actual hours than planned hours, the difference is subtracted. In a month with more actual hours than planned hours, the excess is handled as follows:

- **Current calculation:** the excess first reduces a negative balance carried over from the previous months until it reaches zero. Only the remainder is absorbed by the lump sum overtime; what exceeds the lump sum is added to the balance.
- **Previous calculation** (`useLegacyOvertimeCalculation = True`): the lump sum overtime always absorbs the excess first; what exceeds the lump sum is added to the balance. Every month is evaluated on its own, independent of the balance it starts from, which keeps the calculation simple, consistent and easy to retrace. With a negative balance, however, hours worked to reduce it are first absorbed by the lump sum, so the negative balance is reduced only by what exceeds the lump sum.

The lump sum overtime is a threshold per month. For an effective date within a month, the month counts up to the effective date with its lump sum prorated by working days, so a balance within a month is an intermediate value.

### Time Range Form

With the current calculation, the time range form returns by definition the balance at `endDate` minus the balance on the day before `startDate`, both calculated as by the effective date form with the same arguments. Therefore:

- an overtime correction that is effective within the range is included in the result,
- ranges that start within a month add up: balance before the range plus the result of the range equals the balance at the end of the range.

With the previous calculation, the range is self-contained: it is calculated from the months within it alone, starting from a balance of zero, so the balance before the range does not affect it. Overtime corrections within the range are not applied.

### Overtime2

`:Overtime2` takes the same arguments in both forms and returns the same values as `:Overtime`. `:Overtime` is substituted into the query before it is executed, so its arguments other than `userUuid` must be constants or query parameters. `:Overtime2` is evaluated in memory on the loaded rows, as the standard lists do with `Current.UserDetailUuid`.

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

The following TCQL query shows the change of the balance in the first quarter of 2011, including overtime corrections effective in that quarter:

```
From U In UserDetail
Select New With
{
        .User = U,
        .OvertimeInPeriod = :Overtime(U.UserDetailUuid, #2011-01-01#, #2011-03-31#, True, True)
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