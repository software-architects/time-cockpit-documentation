---
title: Sick Leave
description: Reference for the standard Sick Leave list in time cockpit, including filters and the visible leave fields.
---

# Sick Leave

The **Sick Leave** list shows sick-leave entries for a selected user and period.

## Typical Audience

This list is typically relevant for:

- employees who review their own entries
- Department Leads who review team entries
- HR Admins who review and maintain sick-leave data

## Navigation

- Standard navigation: `User -> Sick Leave`
- Deeplink: `https://web.timecockpit.com/app/lists/entity/APP_SickLeave`

## Standard Filters

| Filter | Technical Reference | Meaning |
|---|---|---|
| User | `@UserDetail` | User whose entries are shown |
| Since | `@YearParam` | Start year for the displayed entries |
| Include Hidden Users | `@IncludeHiddenUsers` | Includes hidden users |

## Columns

| Column | Technical Reference | Meaning | How the Value Is Determined |
|---|---|---|---|
| User | `UserDetailName`, `UserDetailUuid` | User of the entry | Display value of the user detail |
| Is Whole Day | `APP_IsWholeDay` | Whether the entry is full day | Taken from the sick-leave record |
| From | `APP_BeginTime` | Start of the sick leave | Taken from the sick-leave record |
| To | `APP_EndTime` | End of the sick leave | Taken from the sick-leave record |
| Description | `APP_Description` | Description of the entry | Taken from the sick-leave record |
| Approved | `APP_IsApproved` | Approval state | Taken from the sick-leave record and shown when sick-leave approval is active |

## Related Pages

- [Absence Time Management](../../employee-time-tracking/absence-time-management.md)
- [Absence Calendar](absence-calendar.md)
