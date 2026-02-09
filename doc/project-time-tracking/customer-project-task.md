---
title: Customer, Project & Task Hierarchy
description: Understand time cockpit's hierarchical data model for customers, projects, and tasks. Learn about hourly rates, budgets, billable projects, and global tasks.
---
# Customer / Project / Task Hierarchy

This chapter describes the default data model that is shipped with time cockpit.

> [!NOTE]
Please note, that you are able to extend entities of the default data model but you cannot delete them. This is necessary to provide upgrades of the default data model. Your changes always stay untouched in case of upgrades. <br/><br/>You cannot change standard lists and forms. If you want to create your own lists and forms please copy the relevant list and form definitions in the module **Customization**, perform your customization in the copy and link it to menu. Please note that changes of standard lists and forms will not be adopted in your copies.

## Business Case: Why Use Customer/Project/Task Hierarchy?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

**The Challenge:** Service-based businesses (consulting, software development, agencies, professional services) face several critical challenges:
- **Revenue Leakage:** Unbilled hours result in lost revenue (industry average: 10-15% of billable time goes uninvoiced)
- **Project Overruns:** Lack of visibility into project progress leads to budget overruns and unprofitable work
- **Resource Misallocation:** Without accurate time data, managers assign resources inefficiently
- **Pricing Uncertainty:** Historical data is missing for accurate future project estimates
- **Client Disputes:** No detailed records to justify invoiced amounts

**The Solution:** Time cockpit's hierarchical data model provides structured time tracking that solves these problems:

**Customer → Project → Task Structure Benefits:**

1. **Accurate Billing & Invoicing**
   - Every timesheet entry links to specific customer work
   - Filter unbilled hours by customer/project for invoice creation
   - Detailed line items justify invoiced amounts
   - Reduces billing disputes (timestamped evidence of work performed)
   - **ROI:** Recovering just 5% of previously unbilled time can increase revenue $50,000+ annually for a small 10-person team

2. **Project Budget Control**
   - Set budgets at project or task level (hours or dollar amounts)
   - Real-time visibility into budget consumption
   - Visual indicators warn when approaching limits (80%, 90%, 100%)
   - Forecast completion based on current velocity
   - **Impact:** Catch overruns early, adjust scope or resources before losses occur

3. **Profitability Analysis**
   - Track actual cost (employee rates) vs. billable amount (customer rates)
   - Calculate margins per project: Profit = Revenue - Cost
   - Identify profitable vs. unprofitable projects
   - **Decision-Making:** Double-down on profitable project types, adjust pricing on low-margin work

4. **Resource & Capacity Planning**
  - See which projects consume most team time
   - Identify over/underutilized team members
   - Balance workload across projects
   - Data-driven hiring decisions (consistent 110% utilization = need more staff)
   - **Efficiency:** Optimize team allocation, reduce idle time, prevent burnout

5. **Improved Estimating**
   - Historical data shows actual time for similar projects
   - Compare estimated vs. actual for continuous improvement
   - Build project estimate database (feature X takes 40 hours on average)
   - **Accuracy:** Estimates improve 30-50% with historical data vs. guessing

6. **Client Transparency & Trust**
   - Detailed project reports show exactly where time was spent
   - Demonstrate value delivered (hours by feature/task)
   - Justify rate increases with data
   - **Relationship:** Clients appreciate transparency, leading to repeat business and referrals

**Workflow Example:**

```
Acme Corp (Customer) - Annual contract: $500k
  ├─ Website Redesign (Project) - Budget: 200 hours, $30k
  │   ├─ Design (Task) - 60 hours planned @ $150/hour
  │   ├─ Development (Task) - 100 hours planned @ $150/hour
  │   └─ Testing (Task) - 40 hours planned @ $100/hour
  └─ Mobile App (Project) - Budget: 300 hours, $45k
      ├─ iOS Development (Task) - 150 hours @ $150/hour
      └─ Android Development (Task) - 150 hours @ $150/hour
```

**As work progresses:**
- Team tracks time to specific tasks
- Project manager monitors actual vs. planned hours
- Warnings appear at 80% budget consumption
- Billing admin creates invoices from tracked hours
- Finance department sees real-time revenue recognition

**Business Metrics Enabled:**

- **Utilization Rate:** (Billable Hours / Total Hours) - Target: 75-85%
- **Realization Rate:** (Billed Amount / Budgeted Amount) - Target: 90-100%
- **Project Margin:** (Revenue - Cost) / Revenue - Target: 30-40%
- **Revenue per Employee:** Annual revenue / FTE count - Track growth over time
- **Days Sales Outstanding (DSO):** Track invoice→payment time - Target: < 45 days

**For Different Organization Sizes:**

**Small Teams (2-10 people):**
- Simple project structure (1-2 levels deep)
- Focus on billable ratio and cash flow
- Monthly invoicing rhythm

**Medium Organizations (10-50 people):**
- Multiple concurrent projects per customer
- Department-level tracking via task assignments
- Need budget control and profitability analysis

**Large Enterprises (50+ people):**
- Complex project portfolios
- Multi-year engagements with milestones
- Integration with ERP/accounting systems
- Advanced analytics and dashboards

**Getting Started:**
1. Define your customers (existing client list)
2. Create projects under each customer (active engagements)
3. Break projects into tasks (work categories or deliverables)
4. Set budgets and hourly rates
5. Train team on selecting correct customer/project/task when tracking time
6. Weekly review: monitor progress, budgets, and unbilled hours

**See Also:**
- [Budgetary Control Use Case](~/doc/use-cases/budgetary-control.md) - Deep dive into budget management
- [Invoicing](billing.md) - Creating invoices from tracked time
- [Project Time Sheets](timesheet.md) - Tracking time to projects

## Customer

In time cockpit, customer, projects and tasks are administered hierarchically. You find the customer on top of this hierarchy.

For each customer you can enter a default hourly rate (`APP_HourlyRate`). If you do not enter a differing hourly rate in a project or a task, the hourly rate of the customer applies to all projects and tasks assigned to the customer.

## Project

Each customer can have assigned various projects.

Per project you can set the project budget can be set in hours (`APP_BudgetInHours`) and the monetary budget (`APP_Budget`). These fields can be used for controlling a project's budget.

For each project you can define an hourly rate (`APP_HourlyRate`) that differs from a customer's hourly rate. If you do not enter a differing rate, the default hourly rate of a customer will be used. You find the effective hourly rate of a project in the calculated property `APP_HourlyRateActual.`

Time cockpit differentiates between billable and not billable projects (`APP_Billable`).

## Tasks

Each project can have assigned various tasks.

For each task you can set the budget in hours (`APP_BudgetInHours`) and the monetary budget (`APP_Budget`). These fields can be used for controlling a project's budget.

For each task you can define an hourly rate (`APP_HourlyRate`) that differs a project's hourly rate. If you do not enter a differing rate, the default hourly rate of a project will be used. You find the effective hourly rate of a project in the calculated property `APP_HourlyRateActual`.

Tasks can me marked as not billable (`APP_NoBilling`).

Since time cockpit version 1.7 you can activate global tasks. Global tasks are tasks which are not assigned to a specific project but are available for all projects (e.g. travel, sales, support, etc.). To activate global tasks in version greater than 1.7 you need to configure the relation between task and project as optional ("nullable"). Global tasks are not activated by default. If you want to use this function please proceed as follows:

- Switch to menu Customization.
- Switch to Server.
- In the entity tree locate the entity APP_Task. Right click the node and click Edit Entity.
- Switch to Validation Rules.
- Double-click the rule APP_ProjectRequired and disable the rule (check the Disable box).
- Save your changes.

After this modification you can create tasks without assigning them to a project. You will see these tasks for each project in the time sheet entry form.

> [!WARNING]
If you customized the time sheet entry form, you have to take the settings for the field Task from the default form in the default time sheet form (`APP_TimesheetForm`) and insert it into your modified form.

> [!WARNING]
If you query tasks, please keep in mind that the relation between entities task and project need not be set ("null"). For example, if you want a report to time sheet entries per project, you cannot access a project via `Timesheet.Task.Project`. You need to use `Timesheet.Task` and `Timesheet.Project`.