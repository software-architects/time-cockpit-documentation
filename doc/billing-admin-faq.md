---
title: Billing Administrator FAQ - Invoicing & Revenue Management
description: Frequently asked questions for billing administrators managing invoices, hourly rates, billing reports, and customer billing in time cockpit.
keywords: [billing administrator, invoice creation, hourly rates, billing faq, revenue tracking, customer invoicing, invoice management, billing reports, unbilled timesheets]
---

# Billing Administrator FAQ

This FAQ answers common questions from billing administrators who create invoices, review billing data, and manage customer billing in time cockpit.

> [!NOTE]
> For general time tracking questions, see the [User FAQ](user-faq.md). For project budget tracking, see the [Project Manager FAQ](project-manager-faq.md).

> [!NOTE]
> Reviewed in April 2026.

## Invoice Creation

### How do I create an invoice from unbilled timesheet entries?

Use **Management -> Billing -> Unbilled Timesheets**.

The standard workflow is:

1. Open **Unbilled Timesheets**.
2. Select the timesheet entries you want to invoice.
3. Run **Create Invoice** from the **Actions** menu.
4. Enter the invoice details.

The standard documentation explains that the action then:

- assigns the selected timesheets to invoice items
- creates invoice items from the selected project-related timesheets
- creates travel-related invoice items when mileage data is present
- copies the concrete valid hourly rate into `Hourly Rate Billed`

After assignment to an invoice, the related timesheet entries become read-only.

**See Also:**
- [Invoicing](project-time-tracking/billing.md)
- [Invoice Data Fields](project-time-tracking/invoice-data-fields.md)
- [Timesheets](project-time-tracking/timesheet.md)

---

### Can I edit or correct an invoice after creation?

Open the invoice in **Management -> Invoices**.

The standard documentation describes invoices as a combination of invoice data and invoice items. It also explains that automatically assigned timesheet entries become read-only after invoicing.

In practice, this means:

- review invoice data such as invoice number, invoice date, service period, billing address, and invoice-report settings in the invoice record
- review generated invoice items carefully before sending the invoice document
- use manual invoice items or manual invoices when the standard automatic generation does not fit your billing case

The standard docs do not describe a dedicated "undo invoice" workflow, so corrections should be reviewed carefully against your accounting process.

**See Also:**
- [Invoicing](project-time-tracking/billing.md)
- [Invoice Data Fields](project-time-tracking/invoice-data-fields.md)

---

### How do I handle retainer and fixed-price contracts?

For billing cases that do not fit the automatic timesheet-to-invoice flow, use manual invoices or custom invoice items.

The standard documentation explicitly describes:

- automatic invoice creation from selected unbilled timesheets
- manual invoices for cases outside that automatic process
- custom invoice items and articles for special billing requirements

A practical standard approach is:

- use automatic invoice creation for time-and-materials billing
- use manual invoices when you bill a fixed amount that is not generated directly from selected timesheets
- use custom invoice items or articles when you need additional non-timesheet billing items

If you still track time for internal analysis on fixed-price or retainer work, keep the time entries for reporting and profitability review, but align the final invoice process with the contract model.

**See Also:**
- [Invoicing](project-time-tracking/billing.md)
- [Invoice Data Fields](project-time-tracking/invoice-data-fields.md)
- [Project Manager FAQ](project-manager-faq.md)

---

## Hourly Rates & Billing Logic

### How do I set and update hourly rates for billing?

In the standard hierarchy, hourly rates can be maintained on customers, projects, and tasks.

The standard documentation describes this inheritance:

- a customer can have a default hourly rate
- a project can override the customer rate
- a task can override the project rate

When you create an invoice from timesheets, time cockpit copies the concrete valid billed rate into the timesheet entry. This is why rate changes after invoicing do not retroactively change the already billed entries.

**See Also:**
- [Customers, Projects & Tasks](project-time-tracking/customer-project-task.md)
- [Invoicing](project-time-tracking/billing.md)
- [Invoice Data Fields](project-time-tracking/invoice-data-fields.md)

---

### How do I track billable vs. non-billable time for billing review?

Use the relevant list depending on the question:

- **Timesheets** for detailed entry review
- **Unbilled Timesheets** for billable entries that are not yet invoiced
- **Budgetary Control of Projects** when you want a project-level financial overview

The standard documentation also notes:

- projects can be marked as billable or not billable
- tasks can be marked as not billable
- timesheet entries expose billable information for invoicing review

This is usually enough to separate billable work from internal or excluded work before creating invoices.

**See Also:**
- [Timesheets](project-time-tracking/timesheet.md)
- [Customers, Projects & Tasks](project-time-tracking/customer-project-task.md)
- [Invoicing](project-time-tracking/billing.md)

---

## Revenue & Reporting

### What billing views should I review regularly?

The most useful standard views for billing administrators are:

- **Unbilled Timesheets** for time entries that are ready for invoicing review
- **Invoices** for created invoices and invoice follow-up
- **Budgetary Control of Projects** for project-level budget and billing context
- **Timesheets** when you need to inspect individual entries behind a billing question

How often you review them depends on your billing cycle. In the product documentation, they mainly map to invoice preparation, invoice review, and project-level billing control.

**See Also:**
- [Invoicing](project-time-tracking/billing.md)
- [Budgetary Control Use Case](use-cases/budgetary-control.md)
- [Data Export](data-exchange/export.md)

---

## Customer & Invoice Data

### How do I manage billing address and invoice details?

The standard invoice fields are described in [Invoice Data Fields](project-time-tracking/invoice-data-fields.md).

Important standard fields include:

- **Invoice Date**
- **Invoice Number**
- **Billing Address**
- **Service Period Start**
- **Service Period End**
- **Discount** settings
- **Payment Received On**
- **Incl. Timesheets on Invoice Report**

The billing address is derived from the customer by default, but it can be overridden per invoice.

**See Also:**
- [Invoice Data Fields](project-time-tracking/invoice-data-fields.md)
- [Invoicing](project-time-tracking/billing.md)

---

### How do I handle multiple billing contacts for one customer?

The standard documentation describes the billing address at customer level and notes that it can be overridden per invoice.

If one customer has multiple billing contacts or billing destinations, the safe standard options are:

- maintain the default billing address on the customer
- override the billing address on individual invoices when needed
- use a project or process convention if different projects of the same customer need different billing handling

If you need a more structured multi-contact billing setup inside time cockpit, review that separately as a customization topic.

**See Also:**
- [Invoice Data Fields](project-time-tracking/invoice-data-fields.md)
- [Customers, Projects & Tasks](project-time-tracking/customer-project-task.md)

---

## Need More Help?

### Billing Administrator Resources

**Related FAQs:**
- [User FAQ](user-faq.md) - General time tracking
- [Project Manager FAQ](project-manager-faq.md) - Budget and project tracking
- [HR Administrator FAQ](hr-administrator-faq.md) - Employee payroll data
- [Developer FAQ](developer-faq.md) - API and customization for billing integrations

**Documentation:**
- [Invoicing](project-time-tracking/billing.md)
- [Invoice Data Fields](project-time-tracking/invoice-data-fields.md)
- [Timesheets](project-time-tracking/timesheet.md)
- [Customers, Projects & Tasks](project-time-tracking/customer-project-task.md)
- [Data Export](data-exchange/export.md)
- [Web API Overview](web-api/overview.md)

**Support:**
- **Email:** support@timecockpit.com

---

*Last updated: April 2026.*
