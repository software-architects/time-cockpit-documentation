---
title: Assign to Existing Outgoing Invoice
description: Reference for the standard Assign to Existing Outgoing Invoice action in time cockpit, including prerequisites, parameters, and standard side effects.
---

# Assign to Existing Outgoing Invoice

The **Assign to Existing Outgoing Invoice** action assigns selected timesheets to an already existing outgoing invoice.

## Where the Action Is Available

In the standard setup, this action is used from:

- [Management -> Billing -> Unbilled Timesheets](https://web.timecockpit.com/app/lists/APP_UnbilledTimesheetsList)

Under standard permissions, this action is intended for **Billing Admins**.

## Before You Start

The selected timesheets must:

- not already be billed
- have a project
- belong to the same project as the target invoice

If one or more selected timesheets are already billed, or if the project does not match the selected invoice, the action stops with a validation error.

## Parameters

When you run the action, time cockpit lets you select this parameter:

| Field | Technical Reference | Meaning |
|---|---|---|
| Outgoing Invoice | `APP_Invoice` | Existing invoice to which the selected timesheets should be assigned |

## What the Action Changes

When the action succeeds, it performs these standard steps:

1. It loads the selected outgoing invoice.
2. It checks whether all selected timesheets belong to the same project as that invoice.
3. It assigns the selected timesheets to the existing invoice.
4. It copies the current hourly rate into `APP_HourlyRateBilled` for billable timesheets.
5. It stores `0` in `APP_HourlyRateBilled` for non-billable timesheets.

## Side Effects and Standard Logic

Important standard behaviors:

- The action does not create a new invoice.
- The action does not create new invoice lines by itself.
- The action updates the invoice link on the selected timesheets.
- The billed hourly rate is frozen on the timesheet, just like in the standard invoice-creation workflow.

## Typical Reasons the Action Fails

The standard action stops with a validation error if:

- one of the selected timesheets is already billed
- one of the selected timesheets has no project
- one of the selected timesheets belongs to a different project than the selected invoice

## Related Pages

- [Unbilled Timesheets](../lists/unbilled-timesheets.md)
- [Create Invoice](create-invoice.md)
- [Invoicing](../../project-time-tracking/billing.md)
- [Billing Administrator FAQ](../../billing-admin-faq.md)
