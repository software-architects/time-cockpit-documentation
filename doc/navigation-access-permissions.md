---
title: Navigation Access Permissions & Menu Structure
description: Reference for standard navigation paths, role-based access, and verified deeplinks in time cockpit.
keywords: [navigation, permissions, roles, menu structure, access control, default permissions]
---

# Navigation Access Permissions & Menu Structure

Reviewed in April 2026.

This page describes the standard navigation structure in time cockpit when `APP_DefaultPermissions` is enabled. It shows which roles typically work with which menu areas and maps common menu items to their verified deeplinks.

> [!NOTE]
> Reviewed in April 2026.

> [!NOTE]
> This documentation applies when the **APP_DefaultPermissions** feature flag is enabled. For accounts created after December 10, 2025, default permissions are enabled automatically. Existing accounts can request activation via [support@timecockpit.com](mailto:support@timecockpit.com).

> [!NOTE]
> Deeplinks in this page are based on the production navigation configuration exported on February 9, 2026. Entity-based navigation commands use `/app/lists/entity/APP_*`, direct list commands use `/app/lists/APP_*List`, and form commands use `/app/forms/entity/APP_*`.

## Navigation Hierarchy

Time cockpit's navigation follows three levels:

1. **Module**: Top-level navigation item such as `Timesheet`, `Management`, or `User`
2. **Section**: Grouping within a module such as `Billing`
3. **Command**: Menu item that opens a list or form

## Role-Based Access Summary

### Roles Overview

| Role | Primary Focus | Key Responsibilities |
|------|---------------|---------------------|
| **AccountAdmin** | Account Management | User accounts, roles, billing, account settings |
| **BaseDataAdmin** | Master Data | Customers, projects, tasks, global settings, import definitions |
| **BillingAdmin** | Invoicing & Revenue | Invoices, articles, units, companies, project billing |
| **HumanResourcesAdmin** | HR & Employee Data | User details, absences, working time, vacation entitlements |
| **ProjectController** | Project Oversight | Read access to all timesheets, invoices, and project data |
| **ProjectManager** | Project Execution | Manage assigned projects, view project-related timesheets, update tasks |
| **DepartmentLead** | Team Management | Approve absences, review department time tracking data |
| **NotificationManager** | System Notifications | Manage and send application notifications |
| **User** | Time Tracking | Personal timesheets, absences, and related self-service functions |

## Verified Navigation Mapping

| Navigation Path | Navigation Target | Deeplink URL |
|----------------|-------------------|--------------|
| Timesheet -> Timesheets | APP_Timesheet | https://web.timecockpit.com/app/lists/entity/APP_Timesheet |
| Management -> Customers | APP_Customer | https://web.timecockpit.com/app/lists/entity/APP_Customer |
| Management -> Projects | APP_Project | https://web.timecockpit.com/app/lists/entity/APP_Project |
| Management -> Tasks | APP_Task | https://web.timecockpit.com/app/lists/entity/APP_Task |
| Management -> Billing -> Invoices | APP_Invoice | https://web.timecockpit.com/app/lists/entity/APP_Invoice |
| Management -> Billing -> Unbilled Timesheets | APP_UnbilledTimesheetsList | https://web.timecockpit.com/app/lists/APP_UnbilledTimesheetsList |
| Management -> Billing -> Budgetary Control of Projects | APP_BudgetaryControlOfProjectsList | https://web.timecockpit.com/app/lists/APP_BudgetaryControlOfProjectsList |
| Management -> Billing -> Budgetary Control of Tasks | APP_BudgetaryControlOfTasksList | https://web.timecockpit.com/app/lists/APP_BudgetaryControlOfTasksList |
| Management -> Billing -> Articles | APP_Article | https://web.timecockpit.com/app/lists/entity/APP_Article |
| Management -> Billing -> Units | APP_Unit | https://web.timecockpit.com/app/lists/entity/APP_Unit |
| Management -> Billing -> Companies | APP_Company | https://web.timecockpit.com/app/lists/entity/APP_Company |
| Management -> Countries | APP_Country | https://web.timecockpit.com/app/lists/entity/APP_Country |
| Management -> Means of Transport | APP_MeansOfTransport | https://web.timecockpit.com/app/lists/entity/APP_MeansOfTransport |
| Management -> Global Settings | APP_GlobalSettings | https://web.timecockpit.com/app/forms/entity/APP_GlobalSettings |
| Management -> Timesheet Templates | APP_TimesheetTemplate | https://web.timecockpit.com/app/lists/entity/APP_TimesheetTemplate |
| Management -> Template Queries | APP_TemplateQuery | https://web.timecockpit.com/app/lists/entity/APP_TemplateQuery |
| Management -> Import Definitions | APP_DefaultImportDefinitionList | https://web.timecockpit.com/app/lists/APP_DefaultImportDefinitionList |
| User -> User Details | APP_UserDetail | https://web.timecockpit.com/app/lists/entity/APP_UserDetail |
| User -> Weekly Hours of Work | APP_WeeklyHoursOfWork | https://web.timecockpit.com/app/lists/entity/APP_WeeklyHoursOfWork |
| User -> Departments | APP_Department | https://web.timecockpit.com/app/lists/entity/APP_Department |
| User -> Legal Holiday Calendars | APP_LegalHolidayCalendar | https://web.timecockpit.com/app/lists/entity/APP_LegalHolidayCalendar |
| User -> Legal Holidays | APP_LegalHoliday | https://web.timecockpit.com/app/lists/entity/APP_LegalHoliday |
| User -> Vacation | APP_Vacation | https://web.timecockpit.com/app/lists/entity/APP_Vacation |
| User -> Vacation Entitlement | APP_VacationEntitlement | https://web.timecockpit.com/app/lists/entity/APP_VacationEntitlement |
| User -> Vacation per Effective Date | APP_VacationPerEffectiveDateList | https://web.timecockpit.com/app/lists/APP_VacationPerEffectiveDateList |
| User -> Sick Leave | APP_SickLeave | https://web.timecockpit.com/app/lists/entity/APP_SickLeave |
| User -> Compensatory Time | APP_CompensatoryTime | https://web.timecockpit.com/app/lists/entity/APP_CompensatoryTime |
| User -> Working Time Weights | APP_WorkingTimeWeight | https://web.timecockpit.com/app/lists/entity/APP_WorkingTimeWeight |
| User -> Overtime Corrections | APP_OvertimeCorrection | https://web.timecockpit.com/app/lists/entity/APP_OvertimeCorrection |
| User -> Overtime per Effective Date | APP_OvertimePerEffectiveDateList | https://web.timecockpit.com/app/lists/APP_OvertimePerEffectiveDateList |
| User -> Target-Actual Hours Comparison | APP_TargetActualHoursComparisonList | https://web.timecockpit.com/app/lists/APP_TargetActualHoursComparisonList |
| User -> Time Report | APP_DefaultTimeReportList | https://web.timecockpit.com/app/lists/APP_DefaultTimeReportList |
| User -> Home Office Overview | APP_HomeOfficeOverviewList | https://web.timecockpit.com/app/lists/APP_HomeOfficeOverviewList |
| User -> Working Time Limits | APP_WorkingTimeLimit | https://web.timecockpit.com/app/lists/entity/APP_WorkingTimeLimit |
| User -> Working Time Violations | APP_DefaultWorkingTimeViolationList | https://web.timecockpit.com/app/lists/APP_DefaultWorkingTimeViolationList |
| User -> Add Roles | APP_UserRole | https://web.timecockpit.com/app/lists/entity/APP_UserRole |
| User -> Assign Roles | APP_UserDetailRole | https://web.timecockpit.com/app/lists/entity/APP_UserDetailRole |

## Common Access Scenarios by Role

### BillingAdmin Workflow

**Available Navigation:**
- Management -> Billing -> Invoices, Unbilled Timesheets, Budgetary Control of Projects, Articles, Units, Companies
- Read access to all timesheets and projects

**Typical Tasks:**
1. Open [Unbilled Timesheets](https://web.timecockpit.com/app/lists/APP_UnbilledTimesheetsList)
2. Create invoices from billable timesheets
3. Manage [Invoices](https://web.timecockpit.com/app/lists/entity/APP_Invoice)
4. Review [Budgetary Control of Projects](https://web.timecockpit.com/app/lists/APP_BudgetaryControlOfProjectsList)

### HumanResourcesAdmin Workflow

**Available Navigation:**
- User -> User Details, Weekly Hours of Work, Departments, Legal Holidays
- User -> Vacation, Sick Leave, Compensatory Time
- User -> Working Time Limits, Working Time Weights

**Typical Tasks:**
1. Manage [User Details](https://web.timecockpit.com/app/lists/entity/APP_UserDetail)
2. Configure [Weekly Hours of Work](https://web.timecockpit.com/app/lists/entity/APP_WeeklyHoursOfWork)
3. Review [Vacation](https://web.timecockpit.com/app/lists/entity/APP_Vacation) requests
4. Set up [Working Time Limits](https://web.timecockpit.com/app/lists/entity/APP_WorkingTimeLimit)

### ProjectManager Workflow

**Available Navigation:**
- Management -> Billing -> Budgetary Control of Projects and Budgetary Control of Tasks for assigned projects
- Management -> Projects and Tasks for assigned projects

**Typical Tasks:**
1. Update [Projects](https://web.timecockpit.com/app/lists/entity/APP_Project) and [Tasks](https://web.timecockpit.com/app/lists/entity/APP_Task)
2. Monitor [Budgetary Control of Projects](https://web.timecockpit.com/app/lists/APP_BudgetaryControlOfProjectsList)
3. Review project-related timesheets

### DepartmentLead Workflow

**Available Navigation:**
- User -> Vacation, Sick Leave, and Compensatory Time for department employees
- User -> Time Report, Overtime Corrections, and Overtime per Effective Date for department employees

**Typical Tasks:**
1. Approve [Vacation](https://web.timecockpit.com/app/lists/entity/APP_Vacation) requests
2. Review [Time Report](https://web.timecockpit.com/app/lists/APP_DefaultTimeReportList)
3. Monitor team absences and overtime

## Related Documentation

- [Default Permissions Overview](employee-time-tracking/default-permissions.md)
- [Billing Administrator FAQ](billing-admin-faq.md)
- [HR Administrator FAQ](hr-administrator-faq.md)
- [Project Manager FAQ](project-manager-faq.md)
- [Department Lead FAQ](department-lead-faq.md)

---

*This documentation is based on the production navigation configuration and data model exported on February 9, 2026.*
