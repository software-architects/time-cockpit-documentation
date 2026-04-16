---
title: Time Report
description: Reference for the standard Time Report list in time cockpit, including filters, visible columns, and the main calculation context behind the report.
---

# Time Report

The **Time Report** list creates a day-by-day report for one user in a selected period. It combines attendance, planned hours, absences, overtime context, and vacation context.

## Typical Audience

This list is typically relevant for:

- employees who review their own month
- Department Leads who review one employee at a time
- HR Admins who need a compact daily overview

## Navigation

- Standard navigation: `User -> Time Report`
- Deeplink: `https://web.timecockpit.com/app/lists/APP_DefaultTimeReportList`

## Standard Filters

| Filter | Technical Reference | Meaning |
|---|---|---|
| User | `@UserDetail` | User for whom the report is generated |
| From | `@BeginTime` | Start date of the report |
| To | `@EndTime` | End date of the report |

## Visible Columns

| Column | Technical Reference | Meaning | How the Value Is Determined |
|---|---|---|---|
| Date | `Date` | Report day | One row per day in the selected interval |
| Working Time | `WorkingTime` | Working hours of the day | Calculated from the user's recorded entries for the day |
| Breaks | `Breaks` | Break summary text | Built from the day's attendance situation |
| Break Time | `BreakTime` | Break duration | Calculated break duration for the day |
| Home Office | `IsHomeOfficeDay` | Whether the day counts as a home-office day | Set when the relevant entries of the day are home-office entries and the feature is visible |
| Text | `Text` | Daily context text | Built from absences, holidays, and other daily conditions |
| Time Sheet Entries | filtered `APP_Timesheet` link | Drill-down to the day's timesheets | Opens the timesheet list for the selected user and day |

## Additional Report Values

The list also calculates additional values that are mainly used by the report output and summary logic, for example:

- overtime at the begin and end of the period
- overtime within the period
- target hours in the month
- actual hours in the month
- remaining vacation at the begin and end of the period
- taken vacation and new vacation entitlement in the period

These values come from standard working-time, overtime, vacation, legal-holiday, and absence calculations.

## Notes

- The standard report expects one user at a time.
- The start and end dates must be in the same year.
- The report combines timesheets, weekly hours of work, holidays, vacation, sick leave, compensatory time, and overtime corrections.

## Related Pages

- [Working Time / Leave](../../employee-time-tracking/working-time.md)
- [Overtime per Effective Date](overtime-per-effective-date.md)
- [Target-Actual Hours Comparison](target-actual-hours-comparison.md)
