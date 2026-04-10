---
title: Create Invoice
description: Reference for the standard Create Invoice action in time cockpit, including prerequisites, parameters, and standard side effects.
---

# Create Invoice

The **Create Invoice** action creates a new outgoing invoice from selected unbilled timesheets.

## Where the Action Is Available

In the standard setup, this action is used from:

- [Management -> Billing -> Unbilled Timesheets](https://web.timecockpit.com/app/lists/APP_UnbilledTimesheetsList)

Under standard permissions, the action is intended for **Billing Admins**.

## Before You Start

The action only works if all selected timesheets meet the standard validation rules.

The selected timesheets must:

- have a project
- belong to the same project
- not already be billed
- have a revenue value, which in practice means the hourly-rate-based billing information must be available

The tenant setup must also be complete enough for invoice creation. In particular:

- a company with country information must exist
- the article with code `serviceTime` must exist
- if mileage has to be billed, the article with code `travelCosts` must exist

## Parameters

When you run the action, time cockpit opens a parameter form with these standard fields:

| Field | Technical Reference | Meaning |
|---|---|---|
| Invoice Date | `APP_InvoiceDate` | Date stored on the new invoice |
| Invoice Number | `APP_InvoiceNumber` | Invoice number to use if you set one explicitly |
| Invoice Description | `APP_InvoiceDescription` | Description stored on the invoice |
| Service Start Date | `APP_ServiceStartDate` | Optional start date of the service period |
| Service End Date | `APP_ServiceEndDate` | Optional end date of the service period |

The standard parameter form also offers actions to set the invoice number manually or automatically.

If you leave the service period empty, time cockpit derives it from the first and last selected timesheet date.

## What the Action Changes

When the action succeeds, it performs these standard steps:

1. It creates a new invoice for the project of the selected timesheets.
2. It stores the invoice date, invoice number settings, optional description, and optional service period.
3. It assigns the selected timesheets to the new invoice.
4. It copies the current billing rate into `APP_HourlyRateBilled` for billable timesheets.
5. It creates invoice lines for service time, grouped by task and hourly rate.
6. It optionally creates an additional travel-cost line if the selected timesheets contain journey distance.
7. It updates the invoice cost value based on the hourly cost rates of the involved users.

## Side Effects and Standard Logic

Some standard behaviors are easy to miss:

- **Service period fallback:** If no service dates are entered, the action uses the earliest and latest selected timesheet date.
- **Grouping of invoice lines:** Service lines are grouped by task and hourly rate, not necessarily one line per timesheet.
- **Hourly rate freeze:** The billed hourly rate is copied into the timesheet so later rate changes do not change already billed data.
- **VAT handling for abroad:** If the customer's country differs from the invoicing company's country, the action sets the VAT rate of the generated invoice lines to `0`.
- **Travel costs:** If journey distance is present, the action can add a separate invoice line based on the `travelCosts` article.

## Typical Reasons the Action Fails

The standard action stops with a validation error if:

- a selected timesheet has no billing-ready revenue value
- a selected timesheet has no project
- the selection contains more than one project
- one of the selected timesheets is already billed
- required billing master data such as company country or standard articles is missing

## Related Pages

- [Unbilled Timesheets](../lists/unbilled-timesheets.md)
- [Invoicing](../../project-time-tracking/billing.md)
- [Invoice Data Fields](../../project-time-tracking/invoice-data-fields.md)
- [Billing Administrator FAQ](../../billing-admin-faq.md)
