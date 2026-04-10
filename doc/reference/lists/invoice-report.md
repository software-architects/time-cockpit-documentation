---
title: Invoice Report
description: Reference for the standard Invoice Report list in time cockpit, including the invoice, invoice-detail, and timesheet fields used by the report.
---

# Invoice Report

The **Invoice Report** list is the data source behind the standard invoice PDF. It collects invoice header data, invoice lines, company data, and optionally the linked timesheets.

## Typical Audience

This reference is mainly useful for:

- Billing Admins
- users who need to understand the standard invoice output

## Navigation

- Standard deeplink: `https://web.timecockpit.com/app/lists/APP_DefaultInvoiceReportList`
- Note: this list is typically used by the invoice PDF workflow and not as a main menu entry.

## Columns

The list itself exposes a compact invoice header view:

| Column | Technical Reference | Meaning | How the Value Is Determined |
|---|---|---|---|
| Invoice Number | `InvoiceNumber` | Number of the invoice | Taken from the invoice record |
| Invoice Date | `InvoiceDate` | Date of the invoice | Taken from the invoice record |
| Description | `Description` | Description of the invoice | Taken from the invoice record |

## Report Context

When the invoice PDF is generated, the report also loads additional datasets:

- company data of the invoicing company
- invoice header data such as customer, service period, payment targets, and totals
- invoice-detail rows ordered by invoice-detail position
- linked timesheets when they are included in the report

## Related Pages

- [Create Invoice](../actions/create-invoice.md)
- [Invoicing](../../project-time-tracking/billing.md)
- [Invoice Data Fields](../../project-time-tracking/invoice-data-fields.md)
