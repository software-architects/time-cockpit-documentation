---
title: Vacation per Effective Date
description: Reference for the standard Vacation per Effective Date list in time cockpit, including balance calculation and drill-down links.
---

# Vacation per Effective Date

The **Vacation per Effective Date** list shows the remaining vacation balance of each user as of one selected date.

## Typical Audience

This list is typically relevant for:

- employees who check their current balance
- Department Leads who review team balances
- HR Admins who review balances across users

## Navigation

- Standard navigation: `User -> Vacation per Effective Date`
- Deeplink: `https://web.timecockpit.com/app/lists/APP_VacationPerEffectiveDateList`

## Standard Filters

| Filter | Technical Reference | Meaning |
|---|---|---|
| Effective Date | `@EffectiveDate` | Date for which the remaining balance is calculated |
| Include Hidden Users | `@IncludeHiddenUsers` | Includes hidden users |

## Columns

| Column | Technical Reference | Meaning | How the Value Is Determined |
|---|---|---|---|
| User | `UserDetailName`, `UserDetailUuid` | User shown in the row | Display value of the user detail |
| Remaining Leave in Weeks | `RemainingWeeks` | Vacation balance on the selected date | Calculated with the standard remaining-vacation function |
| Balance Bar | `RemainingWeeks` in `DataBarCell` | Visual representation of the balance | Uses the same remaining-weeks value as the numeric column |
| Vacation | filtered `APP_Vacation` link | Drill-down to vacation entries of the user | Opens the vacation list filtered to the current user |
| Vacation Entitlement | filtered `APP_VacationEntitlement` link | Drill-down to entitlement records of the user | Opens the entitlement list filtered to the current user |

## Notes

- This list is useful for a single-date snapshot.
- If you need a detailed timeline of entitlements, deductions, and vacation usage, open the vacation list of the user.

## Related Pages

- [Vacation](vacation.md)
- [Vacation Entitlement](vacation-entitlement.md)
- [Absence Time Management](../../employee-time-tracking/absence-time-management.md)
