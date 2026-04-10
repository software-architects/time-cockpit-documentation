---
title: Working Time Limits
description: Reference for the standard Working Time Limits list in time cockpit, including daily, weekly, and break-related validation settings.
---

# Working Time Limits

The **Working Time Limits** list stores the validation models that are used for working-time checks.

## Typical Audience

This list is typically relevant for:

- HR Admins
- administrators who configure working-time validation

## Navigation

- Standard navigation: `User -> Working Time Limits`
- Deeplink: `https://web.timecockpit.com/app/lists/entity/APP_WorkingTimeLimit`

## Columns

| Column | Technical Reference | Meaning | How the Value Is Determined |
|---|---|---|---|
| Code | `APP_Code` | Technical code of the limit set | Taken from the working-time-limit record |
| Name | `APP_WorkingTimeLimitName` | Display name of the limit set | Taken from the working-time-limit record |
| Country | `APP_Country` | Country linked to the limit set | Taken from the related country |
| Daily Working Time Check Is Active | `APP_DailyWorkingTimeCheckIsActive` | Whether daily checks are enabled | Taken from the record |
| Max Daily Working Hours | `APP_MaxDailyWorkingHours` | Daily limit without travel extensions | Taken from the record |
| Max Daily Working Hours Including Active Travel Time | `APP_MaxDailyWorkingHoursIncludingActiveTravelTime` | Daily limit when active travel time is included | Taken from the record |
| Max Daily Working Hours Including Active and Passive Travel Time | `APP_MaxDailyWorkingHoursIncludingActiveAndPassiveTravelTime` | Daily limit when all travel time is included | Taken from the record |
| Weekly Working Time Check Is Active | `APP_WeeklyWorkingTimeCheckIsActive` | Whether weekly checks are enabled | Taken from the record |
| Max Weekly Working Hours | `APP_MaxWeeklyWorkingHours` | Weekly limit | Taken from the record |
| Max Weekly Working Hours Including Active and Passive Travel Time | `APP_MaxWeeklyWorkingHoursIncludingActiveAndPassiveTravelTime` | Extended weekly limit | Taken from the record |
| Break Check Is Active | `APP_BreakCheckIsActive` | Whether break validation is enabled | Taken from the record |
| Minimum Break Length in Minutes | `APP_MinBreakLengthInMinutes` | Required break duration | Taken from the record |
| Break After Hours | `APP_BreakAfterHours` | Threshold after which a break is required | Taken from the record |

## Related Pages

- [Working Time Violations](working-time-violations.md)
- [Working Time / Leave](../../employee-time-tracking/working-time.md)
