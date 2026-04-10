---
title: Absence Calendar
description: Reference for the standard absence calendar list in time cockpit, including filters, visibility rules, and approval actions.
---

# Absence Calendar

The **Absence Calendar** list combines vacation, sick leave, and compensatory time entries in one calendar-oriented list. It is especially useful for pending approvals and cross-user visibility.

## Typical Audience

This list is typically relevant for:

- employees who check their own pending requests
- Department Leads who review approvals in their departments
- HR Admins who review absences across users

## Navigation

- Standard deeplink: `https://web.timecockpit.com/app/lists/APP_DefaultAbsenceTimeCalendarList`
- Note: this list is used by absence and approval workflows, but it is not a dedicated main-menu entry in the standard navigation configuration.

## Standard Filters

| Filter | Technical Reference | Meaning |
|---|---|---|
| From | `@BeginTime` | Start of the calendar interval |
| To | `@EndTime` | End of the calendar interval |
| User | `@UserDetail` | Limits the list to one user |
| Department | `@Department` | Limits the list to one department |
| Show All Users | `@ShowAllUsers` | HR-only option to widen the result |
| Show Only Pending List | `@ShowOnlyPendingList` | Internal mode used to focus on pending requests |

## Columns

| Column | Technical Reference | Meaning | How the Value Is Determined |
|---|---|---|---|
| Category | `PendingAbsenceType` | Pending category of the row | Set to categories such as own pending requests or pending team approvals |
| Department | `DepartmentName` | Department of the absent user | Taken from the user's department |
| User | `UserDetailName`, `UserDetailUuid` | User shown in the row | Display value of the user detail |
| Absence | `AbsenceTypeDisplayName` | Friendly name of the absence type | Derived from the absence entity and adjusted for special vacation |
| Description | `AbsenceDescription` | Description of the absence | Shown directly if the current user is allowed to see it; otherwise the row is generalized |
| Begin | `BeginTime` | Start of the absence | Taken from the absence record and formatted as day or date/time |
| End | `EndTime` | End of the absence | Taken from the absence record and formatted as day or date/time |
| Approved | `Approved` | Approval state visible in the list | Derived from the absence record and approval configuration |
| Approve | `APP_ApproveAbsenceAction` | Standard approval action | Visible for pending team approvals |
| Reject | `APP_RejectAbsenceAction` | Standard rejection action | Visible for pending team approvals |

## Notes

- The list merges three absence types: vacation, sick leave, and compensatory time.
- Visibility depends on the current user's role, department scope, and whether the row belongs to the current user.
- If a viewer is not allowed to see details, the list can generalize the absence text.

## Related Pages

- [Absence Time Management](../../employee-time-tracking/absence-time-management.md)
- [Vacation](vacation.md)
- [Sick Leave](sick-leave.md)
- [Compensatory Time](compensatory-time.md)
