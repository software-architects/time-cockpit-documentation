---
title: Overtime per Effective Date
description: Reference for the standard Overtime per Effective Date list in time cockpit, including filters, calculated columns, and links to overtime corrections.
---

# Overtime per Effective Date

The **Overtime per Effective Date** list shows each employee's overtime balance as of one selected date. It is useful if you want a snapshot instead of a period-based comparison.

## Typical Audience

This list is typically relevant for:

- employees who review their own balance
- Department Leads who review their team's balance
- HR Admins who review overtime across users

## Navigation

- Standard navigation: `User -> Overtime per Effective Date`
- Deeplink: `https://web.timecockpit.com/app/lists/APP_OvertimePerEffectiveDateList`

## What the List Shows

The list calculates one overtime value per user for the selected effective date.

It is similar to **Target-Actual Hours Comparison**, but the focus is different:

- **Overtime per Effective Date** gives you the overtime balance on one selected date
- **Target-Actual Hours Comparison** compares planned and actual hours for a selected period

## Standard Filters

The standard filter area contains these filters:

| Filter | Technical Reference | Meaning |
|---|---|---|
| Effective Date | `@EffectiveDate` | Date for which the overtime balance is calculated |
| Include Hidden Users | `@IncludeHiddenUsers` | Includes hidden user records when set to `true` |

The standard default for **Effective Date** is the last day of the previous month.

## Columns

The following table documents the visible standard columns.

| Column | Technical Reference | Meaning | How the Value Is Determined |
|---|---|---|---|
| User | `UserDetailName`, `UserDetailUuid` | Employee shown in the row | Display value of the user detail record |
| Overtime | `Overtime` | Overtime balance on the selected date | Calculated by the standard overtime function for the selected user and effective date |
| Overtime Bar | `Overtime` in `DataBarCell` | Visual representation of the overtime balance | Uses the same overtime value as the numeric column and displays it as a bar |
| Overtime Corrections | hyperlink to filtered `APP_OvertimeCorrection` | Drill-down to manual corrections of the shown user | Opens the Overtime Corrections list filtered to the current user |

## How the Overtime Value Is Calculated

The list does not simply sum recorded hours. The overtime value comes from the standard overtime calculation in time cockpit.

In practice, this means the result depends on the user's working-time setup and recorded data, including:

- planned working time
- recorded working time
- absences such as vacation or sick leave
- legal holidays
- overtime corrections

Use this list if you want the current balance on one specific date. Use **Target-Actual Hours Comparison** if you want a period-based comparison.

## Notes

- Hidden users are excluded unless you explicitly include them in the filter.
- The list is read-only. In the standard setup it serves as an analysis list, not as a maintenance list.
- If you need to understand why a balance changed, open the related overtime corrections and compare the result with the user's planned working time and recorded entries.

## Related Pages

- [Working Time / Leave](../../employee-time-tracking/working-time.md)
- [Department Lead FAQ](../../department-lead-faq.md)
- [HR Administrator FAQ](../../hr-administrator-faq.md)
- [Navigation Access Permissions & Menu Structure](../../navigation-access-permissions.md)
