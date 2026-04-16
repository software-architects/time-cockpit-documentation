---
title: Unbilled Timesheets
description: Reference for the standard Unbilled Timesheets list in time cockpit, including filters, columns, and the Create Invoice action.
---

# Unbilled Timesheets

The **Unbilled Timesheets** list shows billable timesheets that are not yet assigned to an invoice. It is the standard starting point for creating invoices from recorded work.

## Typical Audience

Under standard permissions, this list is typically relevant for:

- Billing Admins
- Project Managers
- Project Controllers

## Navigation

- Standard navigation: `Management -> Billing -> Unbilled Timesheets`
- Deeplink: `https://web.timecockpit.com/app/lists/APP_UnbilledTimesheetsList`

## What the List Shows

The list is based on timesheets. It keeps the standard project and billing context, but applies filters that focus on billable and still unbilled work.

By default, the list:

- groups entries by customer and project
- filters to `Billable = true`
- filters to `Billed = false`

## Standard Filters

The standard filter area contains these filters:

| Filter | Technical Reference | Meaning |
|---|---|---|
| User | `APP_UserDetail` | Limits the list to one user |
| Customer | `APP_Project.APP_Customer` | Limits the list to one customer |
| Project | `APP_Project` | Limits the list to one project |
| Task | `APP_Task` | Limits the list to one task |
| Description | `APP_Description` | Searches in the timesheet description |
| From | `@BeginTime` | Shows entries on or after the selected date |
| To | `@EndTime` | Shows entries up to the selected date |
| Billable | `APP_Billable` | Defaults to `true` |
| Billed | `APP_Billed` | Defaults to `false` |

## Columns

The following table documents the visible standard columns.

| Column | Technical Reference | Meaning | How the Value Is Determined |
|---|---|---|---|
| User | `APP_UserDetail`, query alias `UserDetailName` | User who recorded the timesheet | Display value of the related user detail |
| Customer | `APP_Project.APP_Customer`, query alias `CustomerName` | Customer of the related project | Display value of the customer linked through the project |
| Project | `APP_Project`, query alias `ProjectName` | Related project | Display value of the project |
| Task | `APP_Task`, query alias `TaskName` | Related task | Display value of the task |
| Date | `APP_BeginTime`, shown as `APP_Timesheet.APP_DateActual` | Calendar date of the timesheet | Based on the begin date of the timesheet |
| Begin Time | `APP_BeginTimeActual` | Recorded start time | Taken from the timesheet's actual begin time |
| End Time | `APP_EndTimeActual` | Recorded end time | Taken from the timesheet's actual end time |
| Description | `APP_Description` | Free-text description | Taken directly from the timesheet |
| Location | `APP_Location` | Location or place of work | Taken directly from the timesheet |
| Hours | `APP_DurationInHours` | Duration of the timesheet | Calculated duration in hours of the timesheet |
| Hourly Rate | `APP_HourlyRateActual` | Effective hourly rate used for billing-related calculations | Taken from the timesheet's actual hourly rate |
| Revenue | `APP_Revenue` | Calculated revenue of the timesheet | Standard revenue value of the timesheet, typically based on duration and effective hourly rate |
| Billable | `APP_Billable` | Indicates whether the timesheet is billable | Taken from the timesheet |
| Billed | `APP_Billed` | Indicates whether the timesheet is already assigned to billing | Taken from the timesheet |
| Fixed Price | `APP_Project.APP_FixedPrice` | Indicates whether the related project is fixed price | Taken from the related project |

## Grouping

The standard list groups rows by:

1. customer
2. project

This makes it easier to select a set of timesheets for a single invoice.

## Standard Action

### Create Invoice

The most important standard action on this list is `Create Invoice`.

In the standard workflow, the action:

- takes the selected timesheets
- creates or fills invoice items
- assigns the selected timesheets to the invoice context

After timesheets are assigned to an invoice or invoice item, they become read-only in the standard billing workflow.

For the full invoicing workflow, see [Invoicing](../../project-time-tracking/billing.md).

## Notes

- The list is meant for billable work that still has to be invoiced.
- If you need all timesheets instead of only billable and unbilled ones, use [Timesheets](../../project-time-tracking/timesheet.md).
- The column values come from the underlying timesheet and its related customer, project, task, and invoice context.

## Related Pages

- [Invoicing](../../project-time-tracking/billing.md)
- [Billing Administrator FAQ](../../billing-admin-faq.md)
- [Navigation Access Permissions & Menu Structure](../../navigation-access-permissions.md)
