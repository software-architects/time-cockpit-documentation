---
title: Budgetary Control of Tasks
description: Reference for the standard Budgetary Control of Tasks list in time cockpit, including filters, calculated columns, and drill-down links.
---

# Budgetary Control of Tasks

The **Budgetary Control of Tasks** list gives you a task-level view of budget consumption, performed hours, unbilled hours, and invoiced hours.

## Typical Audience

Under standard permissions, this list is typically relevant for:

- Billing Admins
- Project Managers
- Project Controllers

## Navigation

- Standard navigation: `Management -> Billing -> Budgetary Control of Tasks`
- Deeplink: `https://web.timecockpit.com/app/lists/APP_BudgetaryControlOfTasksList`

## Standard Filters

| Filter | Technical Reference | Meaning |
|---|---|---|
| Customer | `@Customer` | Limits the list to one customer |
| Project | `@Project` | Limits the list to one project |
| Task | `@Task` | Limits the list to one task |
| From | `@EffortFrom` | Includes effort on or after the selected date |
| To | `@EffortTo` | Includes effort up to the selected date |
| Only With Unbilled Hours | `@OnlyWithUnbilledHours` | Shows only rows that still contain unbilled billable hours |
| Include Closed Projects | `@IncludeClosedProjects` | Includes closed projects |
| Include Closed | `@IncludeClosed` | Includes closed tasks |

## Columns

| Column | Technical Reference | Meaning | How the Value Is Determined |
|---|---|---|---|
| Project | `ProjectName`, `ProjectUuid` | Project of the task row | Taken from the related project |
| Task | `TaskName`, `TaskUuid` | Task of the row | Taken from the task. Rows without a task are shown as a separate no-task row. |
| Budget in Hours | `BudgetInHours` | Hours budget of the task | Taken from the task budget in hours |
| Billable Hours | `PositveBillableHoursTotal` | Billable hours on the task | Sum of timesheet hours that are billable and have a positive hourly rate |
| Open Hours in Budget | `BudgetInHours - PositveBillableHoursTotal` | Remaining task budget in hours | Calculated as budget in hours minus billable hours |
| Billable Progress % | `ProgressPositveBillablePercent` | Billable progress against the task budget | Billable hours divided by budget in hours |
| Performed Hours | `TotalHours` | All performed hours on the task | Sum of all included timesheet hours |
| Performed Progress % | `ProgressTotalHoursPercent` | Overall performed progress against the task budget | Performed hours divided by budget in hours |
| Unbilled Billable Hours | `ActualPositveBillableHours` | Billable hours not yet billed | Sum of billable, unbilled timesheet hours with a positive hourly rate |
| Unbilled Revenue | `RevenueUnbilled` | Revenue not yet billed | Sum of revenue from billable, unbilled timesheets |
| Actual Hourly Rate | `EffectiveHourlyRate` | Effective revenue per hour | Revenue divided by total hours |
| Billed Hours from Invoices | `BilledHoursFromInvoices` | Invoiced hours linked to the task | Sum of invoice-detail quantity where the unit is `hour` |
| Unbilled Hours from Invoices | `UnbilledHoursFromInvoices` | Remaining budget hours compared with invoice-detail hours | Budget in hours minus billed hours from invoices |
| Timesheet Entries | filtered `APP_Timesheet` link | Drill-down to underlying timesheets | Opens the standard timesheet list filtered to the current project and task |

## Notes

- The list includes dedicated rows for project time that is not assigned to a task.
- If the task has no hours budget, percentage values stay at `0`.
- The list combines task master data, timesheets, and invoice details in one result set.

## Related Pages

- [Budgetary Control of Projects](budgetary-control-of-projects.md)
- [Unbilled Timesheets](unbilled-timesheets.md)
- [Invoicing](../../project-time-tracking/billing.md)
