---
title: Approve Absence
description: Reference for the standard Approve Absence action in time cockpit, including where it is available, permission checks, and standard side effects.
---

# Approve Absence

The **Approve Absence** action approves pending absence requests.

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

The acting user must also be allowed to approve the specific absence. In the standard logic, this means:

- the user is an HR Admin, or
- the absence belongs to a user in a department led by the acting user

## Parameters

This action has no user-facing parameter form in the standard setup.

## What the Action Changes

When the action succeeds, it performs these standard steps:

1. It reloads the selected pending absences.
2. It checks the approval permission for each selected row.
3. It sets the approval timestamp to the current UTC time.
4. It stores the current user as approver.

The action applies the same logic to:

- `APP_Vacation`
- `APP_SickLeave`
- `APP_CompensatoryTime`

## Side Effects and Standard Logic

Important standard behaviors:

- The action only targets unapproved absence rows.
- It writes the approver and approval timestamp directly on the absence record.
- It respects department-lead scope and HR-admin scope per selected user.

In the surrounding standard workflow, approval also affects the pending-approval view and related notifications described in [Absence Time Management](../../employee-time-tracking/absence-time-management.md).

## Typical Reasons the Action Fails

The standard action stops with a validation error if:

- the current user has no approval permission for one of the selected users

## Related Pages

- [Absence Calendar](../lists/absence-calendar.md)
- [Absence Time Management](../../employee-time-tracking/absence-time-management.md)
- [Department Lead FAQ](../../department-lead-faq.md)
- [HR Administrator FAQ](../../hr-administrator-faq.md)
