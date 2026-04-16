---
title: Home Office Overview
description: Reference for the standard Home Office Overview list in time cockpit, including the day-count logic and detail drill-down.
---

# Home Office Overview

The **Home Office Overview** list counts home-office days per user for a selected period.

## Typical Audience

This list is typically relevant for:

- employees who review their own home-office days
- Department Leads who review team totals
- HR Admins who review telework totals

## Navigation

- Standard navigation: `User -> Home Office Overview`
- Deeplink: `https://web.timecockpit.com/app/lists/APP_HomeOfficeOverviewList`

## Standard Filters

| Filter | Technical Reference | Meaning |
|---|---|---|
| User | `@UserDetailFilter` | Limits the list to one user |
| Include Hidden Users | `@IncludeHiddenUsers` | Includes hidden users |
| From | `@BeginTimeFilter` | Start of the counting period |
| To | `@EndTimeFilter` | End of the counting period |

## Columns

| Column | Technical Reference | Meaning | How the Value Is Determined |
|---|---|---|---|
| User | `Fullname`, `UserDetailUuid` | User shown in the row | Display value of the user detail |
| Telework Days | `HomeOfficeCount` | Number of counted home-office days | A day counts only if it contains at least one relevant home-office timesheet and no relevant non-home-office timesheet |
| Details | link to `HomeOfficeDetailList` | Drill-down to the detailed records | Opens the detail list with the same user and date filters |

## Notes

- The count is date-based, not entry-based.
- A mixed day with both home-office and non-home-office entries does not count as a full home-office day in the standard logic.

## Related Pages

- [Time Report](time-report.md)
- [Working Time / Leave](../../employee-time-tracking/working-time.md)
