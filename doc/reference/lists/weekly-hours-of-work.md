---
title: Weekly Hours of Work
description: Reference for the standard Weekly Hours of Work list in time cockpit, including weekday hours, validity dates, and working-time metadata.
---

# Weekly Hours of Work

The **Weekly Hours of Work** list stores planned hours per weekday and validity periods for a user.

## Typical Audience

This list is typically relevant for:

- employees who review their working-time setup
- HR Admins who maintain planned working time

## Navigation

- Standard navigation: `User -> Weekly Hours of Work`
- Deeplink: `https://web.timecockpit.com/app/lists/entity/APP_WeeklyHoursOfWork`

## Standard Filters

| Filter | Technical Reference | Meaning |
|---|---|---|
| User | `@UserDetail` | Limits the list to one user |

## Columns

| Column | Technical Reference | Meaning | How the Value Is Determined |
|---|---|---|---|
| User | `UserDetailName`, `UserDetailUuid` | User of the working-time record | Display value of the user detail |
| Working Time Category | `APP_WorkingTimeCategoryCode` | Code of the related working-time category | Taken from the linked working-time category |
| Normal Working Hours Configured | `APP_HasConfiguredWorkingTimeWindows` | Whether explicit working-time windows exist | Calculated as `true` if at least one configured start/end window exists during the week |
| Valid From | `APP_ValidFrom` | Start of the validity period | Taken from the working-time record |
| Valid Until | `APP_ValidUntil` | End of the validity period | Taken from the working-time record |
| Description | `APP_Description` | Description of the record | Taken from the working-time record |
| Monday to Sunday | `APP_HoursMonday` ... `APP_HoursSunday` | Planned hours per weekday | Taken from the weekday fields of the record |
| Sum Hours | `APP_SumHours` | Total planned weekly hours | Taken from the record's sum value |
| Lump Sum Overtime per Month | `APP_LumpSumOvertimePerMonth` | Monthly overtime lump sum linked to the plan | Taken from the working-time record |

## Notes

- This list defines planned hours per weekday, not exact daily working windows as clock times.
- A user can have multiple records with different validity periods.

## Related Pages

- [Working Time / Leave](../../employee-time-tracking/working-time.md)
- [Target-Actual Hours Comparison](target-actual-hours-comparison.md)
