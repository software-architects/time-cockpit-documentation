---
title: Reject Absence
description: Reference for the standard Reject Absence action in time cockpit, including the rejection-reason parameter and the standard deletion behavior.
---

# Reject Absence

The **Reject Absence** action rejects pending absence requests.

It is used for these standard absence types:

- vacation
- sick leave
- compensatory time

## Where the Action Is Available

In the standard setup, this action is available in the pending-approval list above the absence calendar described in [Absence Time Management](../../employee-time-tracking/absence-time-management.md).

It is shown for rows that represent pending team approvals.

Under standard permissions, this action is intended for:

- Department Leads for users in the departments they lead
- HR Admins acting on behalf of department leads

## Before You Start

The action only processes absence entries that are still unapproved.

The acting user must also be allowed to reject the specific absence. In the standard logic, this means:

- the user is an HR Admin, or
- the absence belongs to a user in a department led by the acting user

## Parameters

When you run the action, time cockpit opens a small parameter form with this field:

| Field | Technical Reference | Meaning |
|---|---|---|
| Reason for Rejection | `APP_RejectionReason` | Optional rejection reason stored before the absence is removed |

## What the Action Changes

When the action succeeds, it performs these standard steps:

1. It reloads the selected pending absences.
2. It checks the rejection permission for each selected row.
3. If a reason is entered, it writes the rejection reason to the absence record.
4. It deletes the rejected absence record.

The action applies the same logic to:

- `APP_Vacation`
- `APP_SickLeave`
- `APP_CompensatoryTime`

## Side Effects and Standard Logic

Important standard behaviors:

- Rejected absences are deleted in the standard workflow.
- The rejection reason is optional, but if it is entered, it is saved before deletion.
- The action only targets unapproved absence rows.

In the surrounding standard workflow, the requesting user receives a notification and the rejection reason can be included there.

## Typical Reasons the Action Fails

The standard action stops with a validation error if:

- the current user has no rejection permission for one of the selected users

## Related Pages

- [Absence Calendar](../lists/absence-calendar.md)
- [Absence Time Management](../../employee-time-tracking/absence-time-management.md)
- [Department Lead FAQ](../../department-lead-faq.md)
- [HR Administrator FAQ](../../hr-administrator-faq.md)
