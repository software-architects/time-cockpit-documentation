---
title: Target-Actual Hours Comparison
description: Reference for the standard Target-Actual Hours Comparison list in time cockpit, including period filters and the main planned-vs-actual calculations.
---

# Target-Actual Hours Comparison

The **Target-Actual Hours Comparison** list compares planned hours and actual hours for a selected period and shows the resulting deviation per user.

## Typical Audience

This list is typically relevant for:

- employees who review their own period result
- Department Leads who compare target and actual hours for their team
- HR Admins who review deviations across users

## Navigation

- Standard navigation: `User -> Target-Actual Hours Comparison`
- Deeplink: `https://web.timecockpit.com/app/lists/APP_TargetActualHoursComparisonList`

## Standard Filters

| Filter | Technical Reference | Meaning |
|---|---|---|
| Start Date | `@StartDate` | Start of the comparison period |
| End Date | `@EndDate` | End of the comparison period |
| Consider Working Time Weight | `@IncludeWeights` | Includes working-time weights in the actual-hours calculation |
| Include Hidden Users | `@IncludeHiddenUsers` | Includes hidden users |

## Columns

| Column | Technical Reference | Meaning | How the Value Is Determined |
|---|---|---|---|
| User | `UserDetailName`, `UserDetailUuid` | User shown in the row | Display value of the user detail |
| Target Hours | `PlannedHoursOfWork` | Planned hours for the period | Calculated with the standard planned-hours function without overtime lump sum |
| Target Hours Including Overtime | `PlannedHoursOfWorkIncludingLumpSumOvertime` | Planned hours including monthly overtime lump sum | Calculated with the standard planned-hours function including lump-sum overtime |
| Actual Hours | `ActualHoursOfWork` | Actual worked hours for the period | Calculated with the standard actual-hours function and the selected weight setting |
| Deviation | `Deviation` | Difference between target and actual | Calculated with the standard overtime function for the selected period |
| Deviation % | derived `DataBarCell` | Relative deviation | For negative deviation, the list compares it with target hours. For positive deviation, it compares it with target hours including overtime. |

## Notes

- This list is period-based. If you need a single-date snapshot, use [Overtime per Effective Date](overtime-per-effective-date.md).
- The actual-hours value can change depending on whether working-time weights are included.
- Hidden users are excluded unless the corresponding filter is enabled.

## Related Pages

- [Overtime per Effective Date](overtime-per-effective-date.md)
- [Time Report](time-report.md)
- [Working Time / Leave](../../employee-time-tracking/working-time.md)
