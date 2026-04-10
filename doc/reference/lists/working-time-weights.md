---
title: Working Time Weights
description: Reference for the standard Working Time Weights list in time cockpit, including the weight values used in working-time calculations.
---

# Working Time Weights

The **Working Time Weights** list stores weighting definitions that influence working-time calculations.

## Typical Audience

This list is typically relevant for:

- HR Admins
- administrators who configure working-time behavior

## Navigation

- Standard navigation: `User -> Working Time Weights`
- Deeplink: `https://web.timecockpit.com/app/lists/entity/APP_WorkingTimeWeight`

## Columns

| Column | Technical Reference | Meaning | How the Value Is Determined |
|---|---|---|---|
| Name | `APP_WorkingTimeWeightName` | Name of the weighting definition | Taken from the record |
| Description | `APP_Description` | Description of the weighting definition | Taken from the record |
| Weight | `APP_Weight` | Numeric weight used in calculations | Taken from the record |
| Is Break | `APP_IsBreak` | Whether the weighting represents a break | Taken from the record |

## Related Pages

- [Target-Actual Hours Comparison](target-actual-hours-comparison.md)
- [Working Time / Leave](../../employee-time-tracking/working-time.md)
