---
title: Compensatory Time
description: Reference for the standard Compensatory Time list in time cockpit, including filters and the visible leave fields.
---

# Compensatory Time

The **Compensatory Time** list shows compensatory-time entries for a selected user and period.

## Typical Audience

This list is typically relevant for:

- employees who review their own entries
- Department Leads who review team entries
- HR Admins who review and maintain compensatory-time data

## Navigation

- Standard navigation: `User -> Compensatory Time`
- Deeplink: `https://web.timecockpit.com/app/lists/entity/APP_CompensatoryTime`

## Standard Filters

| Filter | Technical Reference | Meaning |
|---|---|---|
| User | `@UserDetail` | User whose entries are shown |
| Since | `@YearParam` | Start year for the displayed entries |

## Columns

| Column | Technical Reference | Meaning | How the Value Is Determined |
|---|---|---|---|
| User | `APP_UserDetail` | User of the entry | Taken from the compensatory-time record |
| Is Whole Day | `APP_IsWholeDay` | Whether the entry is full day | Taken from the compensatory-time record |
| From | `APP_BeginTime` | Start of the entry | Taken from the compensatory-time record |
| To | `APP_EndTime` | End of the entry | Taken from the compensatory-time record |
| Description | `APP_Description` | Description of the entry | Taken from the compensatory-time record |
| Approved | `APP_IsApproved` | Approval state | Taken from the record and shown when compensatory-time approval is active |

## Related Pages

- [Absence Time Management](../../employee-time-tracking/absence-time-management.md)
- [Absence Calendar](absence-calendar.md)
