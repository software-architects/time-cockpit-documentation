---
title: Project Manager FAQ - Budgets, Project Time, and Billing Review
description: Project manager FAQ for time cockpit: maintain projects and tasks, review project time, monitor budgets, and prepare billing handoff.
keywords: [project manager, project budget, project time, budgetary control, billable hours, tasks, projects, invoicing]
---

# Project Manager FAQ

This FAQ answers common questions from project managers who maintain projects and tasks, review project-related time tracking, and monitor project budgets in time cockpit.

> [!NOTE]
> For general time tracking questions, see the [User FAQ](user-faq.md). For developer/API questions, see the [Developer FAQ](developer-faq.md).

> [!NOTE]
> Reviewed in April 2026.

## Budget Tracking & Planning

### How do I set up project budgets to track hours and costs?

In the default setup, project managers maintain projects and tasks and review the result in the budgetary-control lists.

A typical setup is:

1. Maintain the project in **Management -> Projects**.
2. Maintain tasks in **Management -> Tasks** if you want a more detailed breakdown.
3. Review the project in **Management -> Budgetary Control of Projects**.
4. Review individual tasks in **Management -> Budgetary Control of Tasks** when you need more detail.

The budgetary-control lists combine timesheet data and invoice data and show project-level and task-level budget tracking in one place.

**See Also:**
- [Customers, Projects & Tasks](project-time-tracking/customer-project-task.md)
- [Budgetary Control Use Case](use-cases/budgetary-control.md)
- [Timesheets](project-time-tracking/timesheet.md)

---

### How can I see which team members are tracking time to my projects?

Use the [Timesheets](project-time-tracking/timesheet.md) list and filter it to the relevant project and period.

This lets you review:

- which users tracked time
- which tasks were used
- how many hours were entered
- whether entries are billable or already billed

Depending on your view configuration, you can also sort, group, or export the filtered result.

**See Also:**
- [Timesheets](project-time-tracking/timesheet.md)
- [Customers, Projects & Tasks](project-time-tracking/customer-project-task.md)

---

### How do I track actual costs versus billable amounts?

Use the budgetary-control lists for this comparison.

The standard documentation explains that these lists combine:

- hours from timesheet data
- internal costs based on employee hourly rates
- revenue and invoice-related values from billing data

For day-to-day work, start with **Budgetary Control of Projects** and move to **Budgetary Control of Tasks** if you need a more detailed breakdown.

**See Also:**
- [Budgetary Control Use Case](use-cases/budgetary-control.md)
- [Timesheets](project-time-tracking/timesheet.md)
- [Invoicing](project-time-tracking/billing.md)

---

### How can I forecast project completion based on current progress?

Use **Budgetary Control of Projects** as the main standard view for ongoing project review.

It helps you compare the current tracked hours with the configured budget and the related billing data. For a finer breakdown, use **Budgetary Control of Tasks**.

The standard documentation focuses on the calculated metrics in these lists, not on a separate project-planning workflow. In practice, the lists are most useful for spotting projects or tasks that are consuming more hours than expected.

**See Also:**
- [Budgetary Control Use Case](use-cases/budgetary-control.md)
- [Customers, Projects & Tasks](project-time-tracking/customer-project-task.md)

---

### How do I prevent team members from exceeding task budgets?

In standard time cockpit, the safe default is visibility and review, not automatic blocking.

A practical standard workflow is:

1. Maintain the relevant task structure in **Management -> Tasks**.
2. Review **Budgetary Control of Tasks** regularly.
3. Follow up when a task is approaching or exceeding its budget.

If you need hard limits or automatic warnings when users book against a task, that usually requires customization.

**See Also:**
- [Budgetary Control Use Case](use-cases/budgetary-control.md)
- [Customers, Projects & Tasks](project-time-tracking/customer-project-task.md)
- [Developer FAQ](developer-faq.md)

---

## Team Time Management

### How can I see my team's daily or weekly time summary?

Use the [Timesheets](project-time-tracking/timesheet.md) list with a project filter and the relevant date range.

For a quick summary:

1. Filter to the project.
2. Set the date range to the day or week you want to review.
3. Review the resulting entries directly in the list.
4. Group or export the result if you need a condensed handoff or a follow-up analysis.

This keeps the answer project-focused instead of switching to employee-specific working-time reports.

**See Also:**
- [Timesheets](project-time-tracking/timesheet.md)
- [Data Export](data-exchange/export.md)

---

### Can I see if team members are tracking enough hours per project?

Yes. The most direct standard view is the project-filtered [Timesheets](project-time-tracking/timesheet.md) list.

Use it together with **Budgetary Control of Projects** or **Budgetary Control of Tasks**:

- the time-sheet list shows the detailed entries
- the budgetary-control lists show the accumulated project or task totals

This combination is usually enough to see whether a project has the expected level of activity and whether one task or one contributor needs a closer look.

**See Also:**
- [Timesheets](project-time-tracking/timesheet.md)
- [Budgetary Control Use Case](use-cases/budgetary-control.md)

---

### How do I handle team members who forget to track time?

From a project-manager perspective, the most reliable standard approach is to review project-related time entries regularly and follow up on gaps.

A simple workflow is:

1. Filter [Timesheets](project-time-tracking/timesheet.md) to the project and the relevant period.
2. Review whether the expected contributors have entries for that period.
3. Follow up with the affected users if entries are missing.
4. Recheck the list after the missing time has been entered.

The product documentation supports the review of project time entries, but it does not define a built-in escalation workflow for missing bookings.

**See Also:**
- [Timesheets](project-time-tracking/timesheet.md)
- [Working with Timesheet Entries](timesheet-calendar/working-with-timesheet-entries.md)

---

## Billing & Invoicing

### How do I ensure all billable hours are invoiced?

In the default permission model, invoicing is usually handled by users with the **BillingAdmin** role. As a project manager, your standard contribution is to review the project-related time entries before billing.

The relevant checks are usually:

- billable vs. non-billable entries in the time-sheet list
- billed vs. unbilled status where visible in the current view
- budgetary-control values for project review

If you also have billing permissions, use the invoicing workflow described in [Invoicing](project-time-tracking/billing.md), especially the **Unbilled Time Sheets** list.

**See Also:**
- [Invoicing](project-time-tracking/billing.md)
- [Timesheets](project-time-tracking/timesheet.md)
- [Billing Administrator FAQ](billing-admin-faq.md)

---

### How do I create invoices for multiple projects at once?

In the default setup, this is usually a **BillingAdmin** task, not a pure project-manager task.

If you have the necessary billing permissions, start with **Management -> Billing -> Unbilled Time Sheets** and filter the relevant timesheet entries before creating the invoice.

The standard documentation explains the invoice creation workflow and how generated invoice items are built from the selected timesheet entries. Because billing structures can vary, review the generated invoice carefully before finalizing it.

**See Also:**
- [Invoicing](project-time-tracking/billing.md)
- [Billing Administrator FAQ](billing-admin-faq.md)

---

### What reports should I review regularly as a project manager?

The most useful standard views for project managers are:

- [Timesheets](project-time-tracking/timesheet.md) for detailed project-related time entries
- [Budgetary Control Use Case](use-cases/budgetary-control.md) for project-level and task-level budget review
- [Customers, Projects & Tasks](project-time-tracking/customer-project-task.md) for maintaining the project structure
- [Invoicing](project-time-tracking/billing.md) if you are also involved in billing review

How often you review them depends on your internal process. In the product documentation, they mainly map to project maintenance, budget review, project-time review, and billing handoff.

**See Also:**
- [Timesheets](project-time-tracking/timesheet.md)
- [Budgetary Control Use Case](use-cases/budgetary-control.md)
- [Billing Administrator FAQ](billing-admin-faq.md)

---

## Project Setup & Organization

### How should I structure projects and tasks for best tracking?

Use the standard **Customer -> Project -> Task** structure and keep it aligned with how you want to track time and review budgets.

A practical rule of thumb is:

- create separate projects when you need separate project-level tracking or billing context
- use tasks when you need a more detailed breakdown inside one project
- keep task names specific enough for useful reporting

If you want to track budgets per year, it is usually better to create a separate project for each year and maintain a dedicated budget in each of those projects.

The standard documentation also notes that tasks can be marked as not billable. This can help when you want the task structure to reflect both billable and non-billable work.

**See Also:**
- [Customers, Projects & Tasks](project-time-tracking/customer-project-task.md)
- [Budgetary Control Use Case](use-cases/budgetary-control.md)
- [Timesheets](project-time-tracking/timesheet.md)

---

## Need More Help?

### Project Manager Resources

**Related FAQs:**
- [User FAQ](user-faq.md) - General time tracking questions
- [Billing Administrator FAQ](billing-admin-faq.md) - Invoice details and billing processes
- [Developer FAQ](developer-faq.md) - API and customization for advanced workflows

**Documentation:**
- [Project Time Tracking](project-time-tracking/customer-project-task.md)
- [Budgetary Control Deep Dive](use-cases/budgetary-control.md)
- [Invoicing Guide](project-time-tracking/billing.md)
- [Timesheets](project-time-tracking/timesheet.md)

**Support:**
- **Email:** support@timecockpit.com

---

*Last updated: April 2026.*
