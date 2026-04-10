---
title: Time Cockpit User FAQ - Common Questions & Answers
description: Common time cockpit user questions on time tracking, projects, vacation, billing, and account settings with concise how-to answers.
keywords: [time tracking faq, timesheet questions, time cockpit help, vacation request, timesheets, absence management, invoice help, user questions]
---

# Time Cockpit User FAQ

This FAQ answers common questions from time cockpit users. It focuses on everyday product usage and points to role-specific FAQs when a topic depends on permissions.

> [!NOTE]
> Looking for developer-specific questions about the API, data model, or customizations? See the [Developer FAQ](developer-faq.md).

> [!NOTE]
> Reviewed in April 2026.

## Daily Time Tracking

### How do I create a new timesheet entry?

In the standard calendar, you can create a timesheet entry in several ways:

- double-click at the point where the entry should begin
- click **+ Add** in the calendar toolbar
- press `CTRL + I`

Then enter the details in the form and save the entry.

**See Also:**
- [Working with Timesheet Entries](timesheet-calendar/working-with-timesheet-entries.md)
- [Time Sheet Calendar](timesheet-calendar/calendar.md)

---

### How do I copy timesheet entries to another day?

In week or work-week view, you can copy a timesheet entry by drag and drop while holding `CTRL`.

This creates a copy of the selected entry at the target time.

**See Also:**
- [Working with Timesheet Entries](timesheet-calendar/working-with-timesheet-entries.md)
- [Time Sheet Calendar](timesheet-calendar/calendar.md)

---

### What's the difference between billable and non-billable time?

The billable flag controls whether a timesheet entry is relevant for invoicing.

- **Billable** entries can be used in invoicing.
- **Non-billable** entries stay in time tracking, but are excluded from invoice creation.

Projects can be billable or not billable, and tasks can also be marked as not billable.

**See Also:**
- [Timesheets](project-time-tracking/timesheet.md)
- [Invoicing](project-time-tracking/billing.md)

---

### How do I fix overlapping timesheet entries?

Open the affected day or week in the calendar and edit the overlapping entries.

You can:

- open the entry form and change begin or end time
- drag the upper or lower border of an entry in the calendar
- move an entry by drag and drop

**See Also:**
- [Working with Timesheet Entries](timesheet-calendar/working-with-timesheet-entries.md)
- [Time Sheet Calendar](timesheet-calendar/calendar.md)

---

### Can I use time cockpit on mobile devices?

Yes. The web client runs in modern browsers and has a responsive interface for desktops, laptops, and tablets.

If you want quick access, you can also install time cockpit as a Progressive Web App from the browser.

The standard web client requires an internet connection.

**See Also:**
- [Web Client](getting-started/web-client.md)

---

### How do I use timesheet templates?

In the standard workflow, templates are created from an existing timesheet entry:

1. Create and save a normal timesheet entry.
2. Right-click it and choose **Save as template**.
3. Give the template a name.

You can later drag the template into the calendar to create new entries more quickly.

**See Also:**
- [Time Sheet Templates](timesheet-calendar/timesheet-templates.md)
- [Working with Timesheet Entries](timesheet-calendar/working-with-timesheet-entries.md)

---

## Projects, Rates, and Budgets

### How do I set up a new customer, project, and task?

If your role includes the necessary permissions, use the standard hierarchy **Customer -> Project -> Task**.

- Maintain customers first.
- Create projects under the customer.
- Create tasks under the project if you need more detailed tracking.

**See Also:**
- [Customers, Projects & Tasks](project-time-tracking/customer-project-task.md)
- [Project Manager FAQ](project-manager-faq.md)

---

### How do I track time against project budgets?

If you have access to the project-management views, use **Budgetary Control of Projects** or **Budgetary Control of Tasks**.

These standard lists combine timesheet and invoice data and are the main product views for budget review.

**See Also:**
- [Budgetary Control Use Case](use-cases/budgetary-control.md)
- [Project Manager FAQ](project-manager-faq.md)

---

### How do I see all time tracked for a specific project?

Use the [Timesheets](project-time-tracking/timesheet.md) list and filter it to the project and the relevant period.

This gives you the detailed entries behind the project.

**See Also:**
- [Timesheets](project-time-tracking/timesheet.md)
- [Data Export](data-exchange/export.md)

---

### How do I assign hourly rates to customers, projects, or tasks?

In the standard hierarchy, hourly rates can be maintained on customers, projects, and tasks.

- a customer can define the default rate
- a project can override the customer rate
- a task can override the project rate

**See Also:**
- [Customers, Projects & Tasks](project-time-tracking/customer-project-task.md)
- [Billing Administrator FAQ](billing-admin-faq.md)

---

## Vacation & Absence

### How do I request vacation time?

Use **User -> Vacation**.

You can also create a vacation request from the **Time Sheet Calendar**. This is especially helpful if you want to choose the dates while looking at your existing entries and visible absence times in the calendar.

1. Create a new vacation entry.
2. Enter the relevant dates.
3. Save the record.

If the approval workflow is enabled, the request is reviewed by the configured approver and you receive a notification after approval or rejection.

**See Also:**
- [Absence Time Management](employee-time-tracking/absence-time-management.md)
- [Employee FAQ](employee-faq.md)

---

### What's the difference between vacation and sick leave?

In standard time cockpit, they are separate absence types.

- **Vacation** counts against vacation entitlement.
- **Sick Leave** is tracked separately from vacation.
- **Compensatory Time Off** is tracked as a third separate absence type.

All three absence types can also be created from the **Time Sheet Calendar** and can be recorded either as full-day absences or as hourly absences.

**See Also:**
- [Absence Time Management](employee-time-tracking/absence-time-management.md)
- [Working Time / Leave Management](employee-time-tracking/working-time.md)

---

### How do I check my vacation balance?

You can check your vacation balance in two practical ways:

1. In the **Time Sheet Calendar**.
   If your calendar layout shows the sidebar summary, you can see your current balances directly there. In your screenshot, this is the `Remaining Vacation` value. Depending on your configuration, you can also open additional details from the calendar.

2. In **User -> Vacation**.
   The standard vacation list lets you review your vacation entries and the related history in the same place.

If you do not see either view, check with HR or your administrator because visibility depends on permissions and tenant configuration.

**See Also:**
- [Absence Time Management](employee-time-tracking/absence-time-management.md)
- [Time Sheet Calendar](timesheet-calendar/calendar.md)
- [Working Time / Leave Management](employee-time-tracking/working-time.md)
- [HR Administrator FAQ](hr-administrator-faq.md)

---

### How long does vacation approval take?

Time cockpit supports the approval workflow, but it does not define a product-wide approval deadline.

Use the vacation list and your notifications to check whether the request is still pending or has already been processed.

**See Also:**
- [Absence Time Management](employee-time-tracking/absence-time-management.md)
- [Department Lead FAQ](department-lead-faq.md)

---

## Billing & Invoicing

### How do I create an invoice from timesheet entries?

If you have billing permissions, use **Management -> Billing -> Unbilled Timesheets**.

1. Select the relevant unbilled timesheet entries.
2. Run **Create Invoice** from the **Actions** menu.
3. Enter the invoice details.

This is the standard invoicing workflow described in the billing documentation.

**See Also:**
- [Invoicing](project-time-tracking/billing.md)
- [Billing Administrator FAQ](billing-admin-faq.md)

---

### Can I edit timesheet entries after they've been billed?

Once timesheet entries are assigned to an invoice item or invoice, they become read-only.

If you need corrections after invoicing, review the process with your billing administrator.

**See Also:**
- [Invoicing](project-time-tracking/billing.md)
- [Billing Administrator FAQ](billing-admin-faq.md)

---

### How do I export invoice data to my accounting system?

Use the standard export options for the relevant invoice or list view, or use the Web API if you have a custom integration.

The exact downstream accounting workflow depends on your external system.

**See Also:**
- [Data Export](data-exchange/export.md)
- [Web API Overview](web-api/overview.md)
- [Billing Administrator FAQ](billing-admin-faq.md)

---

### How do I handle partially billed projects?

If you have the necessary permissions, invoice only the selected subset of unbilled timesheet entries for the project.

A practical standard approach is to filter **Unbilled Timesheets** by project, date range, or another relevant criterion and then create the invoice from the selected entries.

**See Also:**
- [Invoicing](project-time-tracking/billing.md)
- [Billing Administrator FAQ](billing-admin-faq.md)

---

## Account & Settings

### How do I change my password?

The exact process depends on how your tenant is configured.

- If you sign in through Microsoft, use your Microsoft account process.
- If you use a time-cockpit-managed password, go to `https://web.timecockpit.com` and click **Reset password**.

**See Also:**
- [Account Management](account-management/account-management.md)
- [Web Client](getting-started/web-client.md)

---

### What if I have technical problems or can't log in?

First check whether the problem is related to your login method, browser, or permissions. If the issue persists, contact your internal administrator or `support@timecockpit.com`.

**See Also:**
- [Web Client](getting-started/web-client.md)
- [Account Management](account-management/account-management.md)

---

## Need More Help?

### Related FAQs
- [Project Manager FAQ](project-manager-faq.md)
- [HR Administrator FAQ](hr-administrator-faq.md)
- [Department Lead FAQ](department-lead-faq.md)
- [Billing Administrator FAQ](billing-admin-faq.md)
- [Employee FAQ](employee-faq.md)

### Documentation
- [For Users - Full Documentation](for-users.md)
- [For Developers - API & Customization](for-developers.md)
- [Developer FAQ](developer-faq.md)

### Support
- **Email:** support@timecockpit.com

---

*Last updated: April 2026.*
