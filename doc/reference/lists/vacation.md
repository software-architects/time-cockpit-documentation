---
title: Vacation
description: Reference for the standard Vacation list in time cockpit, including vacation entries, entitlement rows, deductions, and remaining-balance context.
---

# Vacation

The **Vacation** list is more than a raw list of vacation requests. It combines vacation entries with entitlement and deduction rows so that you can follow the balance over time.

## Typical Audience

This list is typically relevant for:

- employees who review their own vacation history
- Department Leads who review team requests
- HR Admins who review and maintain vacation data

## Navigation

- Standard navigation: `User -> Vacation`
- Deeplink: `https://web.timecockpit.com/app/lists/entity/APP_Vacation`

## Standard Filters

| Filter | Technical Reference | Meaning |
|---|---|---|
| User | `@UserDetail` | User whose vacation history is shown |
| Since | `@YearParam` | Start year for the displayed timeline |

## Columns

| Column | Technical Reference | Meaning | How the Value Is Determined |
|---|---|---|---|
| User | `UserDetailName` | User of the row | Display value of the user detail |
| Is Whole Day | `IsWholeDay` | Whether the absence row is full day | Taken from vacation rows; hidden for non-vacation rows |
| From | `BeginTime` | Start of the row | For vacation rows this is the absence start; for entitlement and deduction rows it is the entitlement date |
| To | `EndTime` | End of the row | For vacation rows this is the absence end |
| Description | `Description` | Description of the row | Taken from the vacation or entitlement record, with a default text for entitlement rows |
| Special Leave | `SpecialLeave` | Whether the vacation row is special leave | Taken from the vacation record |
| Number of Weeks | `NumberOfWeeks` | Weeks added or consumed by the row | Vacation rows use the calculated vacation duration in weeks and are negative. Entitlement rows use the stored entitlement value. |
| Remaining Weeks | `RemainingWeeks` | Remaining vacation balance after the row | Calculated with the standard remaining-vacation function at the row's effective date |
| Approved | `IsApproved` | Approval state of a vacation row | Taken from the vacation record and shown when vacation approval is active |

## Notes

- The list combines different row types such as vacation, entitlement, and deduction.
- Vacation rows reduce the balance, so they are shown with negative week values.
- Entitlement rows can add or deduct weeks depending on the value of the entitlement record.

## Related Pages

- [Vacation Entitlement](vacation-entitlement.md)
- [Vacation per Effective Date](vacation-per-effective-date.md)
- [Absence Time Management](../../employee-time-tracking/absence-time-management.md)
