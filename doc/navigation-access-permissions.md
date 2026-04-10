---
title: Navigation Access Permissions & Menu Structure
description: Comprehensive guide to time cockpit's navigation structure, role-based access control, and menu item permissions.
keywords: [navigation, permissions, roles, menu structure, access control, role-based security, standard permissions]
---

# Navigation Access Permissions & Menu Structure

This document describes time cockpit's navigation structure, which modules, sections, and commands are available to different user roles, and how they map to specific lists and views in the application.

> [!NOTE]
> This documentation applies when the **APP_DefaultPermissions** feature flag is enabled. For accounts created after December 10, 2025, default permissions are enabled automatically. Existing accounts can request activation via support@timecockpit.com.

## Navigation Hierarchy

Time cockpit's navigation follows a three-level hierarchy:

1. **UIModule** - Top-level navigation item (e.g., "Timesheet", "Management", "User")
2. **NavigationSection** - Grouping within a module (e.g., "Accounting", "Holiday")
3. **NavigationCommand** - Specific menu item that opens a list, form, or web view

## Role-Based Access Summary

### Roles Overview

| Role | Primary Focus | Key Responsibilities |
|------|---------------|---------------------|
| **AccountAdmin** | Account Management | User accounts, roles, billing, account settings |
| **BaseDataAdmin** | Master Data | Customers, projects, tasks, global settings, import definitions |
| **BillingAdmin** | Invoicing & Revenue | Invoices, articles, units, companies, project billing |
| **HumanResourcesAdmin** | HR & Employee Data | User details, absences, working time, vacation entitlements |
| **ProjectController** | Project Oversight | Read access to all timesheets, invoices, project data |
| **ProjectManager** | Project Execution | Manage assigned projects, view team timesheets, update tasks |
| **DepartmentLead** | Team Management | Approve absences, view department employee data |
| **NotificationManager** | System Notifications | Manage and send application notifications |
| **User** | Time Tracking | Personal timesheet, absences, expense tracking |

## Navigation-to-List-Name Mapping

For documentation purposes, use these correct navigation paths and deeplinks:

| Navigation Path | List Name | Deeplink URL |
|----------------|-----------|--------------|
| Timesheet → Time Sheets | APP_DefaultTimesheetList | https://web.timecockpit.com/app/lists/entity/APP_Timesheet |
| Management → Customers | APP_DefaultCustomerList | https://web.timecockpit.com/app/lists/entity/APP_Customer |
| Management → Projects | APP_DefaultProjectList | https://web.timecockpit.com/app/lists/entity/APP_Project |
| Management → Tasks | APP_DefaultTaskList | https://web.timecockpit.com/app/lists/entity/APP_Task |
| Management → Invoices | APP_DefaultInvoiceList | https://web.timecockpit.com/app/lists/APP_DefaultInvoiceList |
| Management → Unbilled Timesheets | APP_UnbilledTimesheetsList | https://web.timecockpit.com/app/lists/APP_UnbilledTimesheetsList |
| Management → Budgetary Control of Projects | APP_BudgetaryControlOfProjectsList | https://web.timecockpit.com/app/lists/APP_BudgetaryControlOfProjectsList |
| Management → Budgetary Control of Tasks | APP_BudgetaryControlOfTasksList | https://web.timecockpit.com/app/lists/APP_BudgetaryControlOfTasksList |
| Management → Articles | APP_ArticleList | https://web.timecockpit.com/app/lists/APP_ArticleList |
| Management → Units | APP_UnitList | https://web.timecockpit.com/app/lists/APP_UnitList |
| Management → Companies | APP_CompanyList | https://web.timecockpit.com/app/lists/APP_CompanyList |
| Management → Means of Transport | APP_DefaultMeansOfTransportList | https://web.timecockpit.com/app/lists/APP_DefaultMeansOfTransportList |
| Management → Countries | APP_DefaultCountryList | https://web.timecockpit.com/app/lists/APP_DefaultCountryList |
| Management → Formatting Profiles | APP_DefaultFormattingProfileList | https://web.timecockpit.com/app/lists/APP_DefaultFormattingProfileList |
| Management → Global Settings | APP_DefaultGlobalSettingsList | https://web.timecockpit.com/app/lists/APP_DefaultGlobalSettingsList |
| Management → Import Definitions | APP_DefaultImportDefinitionList | https://web.timecockpit.com/app/lists/APP_DefaultImportDefinitionList |
| Management → Template Queries | APP_DefaultTemplateQueryList | https://web.timecockpit.com/app/lists/APP_DefaultTemplateQueryList |
| Management → Timesheet Templates | APP_DefaultTimesheetTemplateList | https://web.timecockpit.com/app/lists/APP_DefaultTimesheetTemplateList |
| User → User Details | APP_DefaultUserDetailList | https://web.timecockpit.com/app/lists/APP_DefaultUserDetailList |
| User → Weekly Hours of Work | APP_DefaultWeeklyHoursOfWorkList | https://web.timecockpit.com/app/lists/entity/APP_WeeklyHoursOfWork |
| User → Departments | APP_DefaultDepartmentList | https://web.timecockpit.com/app/lists/APP_DefaultDepartmentList |
| User → Legal Holiday Calendars | APP_DefaultLegalHolidayCalendarList | https://web.timecockpit.com/app/lists/entity/APP_LegalHolidayCalendar |
| User → Legal Holidays | APP_DefaultLegalHolidayList | https://web.timecockpit.com/app/lists/entity/APP_LegalHoliday |
| User → Vacation | APP_DefaultVacationList | https://web.timecockpit.com/app/lists/entity/APP_Vacation |
| User → Vacation Entitlement | APP_DefaultVacationEntitlementList | https://web.timecockpit.com/app/lists/entity/APP_VacationEntitlement |
| User → Vacation per Effective Date | APP_VacationPerEffectiveDateList | https://web.timecockpit.com/app/lists/APP_VacationPerEffectiveDateList |
| User → Sick Leave | APP_DefaultSickLeaveList | https://web.timecockpit.com/app/lists/entity/APP_SickLeave |
| User → Compensatory Time | APP_DefaultCompensatoryTimeList | https://web.timecockpit.com/app/lists/entity/APP_CompensatoryTime |
| User → Working Time Weights | APP_DefaultWorkingTimeWeightList | https://web.timecockpit.com/app/lists/APP_DefaultWorkingTimeWeightList |
| User → Overtime Corrections | APP_DefaultOvertimeCorrectionList | https://web.timecockpit.com/app/lists/APP_DefaultOvertimeCorrectionList |
| User → Overtime per Effective Date | APP_OvertimePerEffectiveDateList | https://web.timecockpit.com/app/lists/APP_OvertimePerEffectiveDateList |
| User → Target-Actual Hours Comparison | APP_TargetActualHoursComparisonList | https://web.timecockpit.com/app/lists/APP_TargetActualHoursComparisonList |
| User → Time Report | APP_DefaultTimeReportList | https://web.timecockpit.com/app/lists/APP_DefaultTimeReportList |
| User → Home Office Overview | APP_HomeOfficeOverviewList | https://web.timecockpit.com/app/lists/APP_HomeOfficeOverviewList |
| User → Working Time Limits | APP_DefaultWorkingTimeLimitList | https://web.timecockpit.com/app/lists/APP_DefaultWorkingTimeLimitList |
| User → Working Time Violations | APP_DefaultWorkingTimeViolationList | https://web.timecockpit.com/app/lists/APP_DefaultWorkingTimeViolationList |
| User → Add Roles | APP_DefaultUserRoleList | https://web.timecockpit.com/app/lists/APP_DefaultUserRoleList |
| User → Assign Roles | APP_DefaultUserDetailRoleList | https://web.timecockpit.com/app/lists/APP_DefaultUserDetailRoleList |

## Common Access Scenarios by Role

### BillingAdmin Workflow
**Available Navigation:**
- ✓ Management → Invoices, Unbilled Timesheets, Budgetary Control, Articles, Units, Companies
- ✓ Read access to all timesheets and projects

**Typical Tasks:**
1. View [Unbilled Timesheets](https://web.timecockpit.com/app/lists/APP_UnbilledTimesheetsList)
2. Create invoices from billable time entries
3. Manage [Invoices](https://web.timecockpit.com/app/lists/APP_DefaultInvoiceList)
4. Review [Budgetary Control of Projects](https://web.timecockpit.com/app/lists/APP_BudgetaryControlOfProjectsList)

### HumanResourcesAdmin Workflow
**Available Navigation:**
- ✓ User → User Details, Weekly Hours, Departments, Legal Holidays
- ✓ User → Vacation, Sick Leave, Compensatory Time
- ✓ User → Working Time Limits, Working Time Weights

**Typical Tasks:**
1. Manage [User Details](https://web.timecockpit.com/app/lists/APP_DefaultUserDetailList)
2. Configure [Weekly Hours of Work](https://web.timecockpit.com/app/lists/entity/APP_WeeklyHoursOfWork)
3. Review [Vacation](https://web.timecockpit.com/app/lists/entity/APP_Vacation) requests
4. Set up [Working Time Limits](https://web.timecockpit.com/app/lists/APP_DefaultWorkingTimeLimitList)

### ProjectManager Workflow
**Available Navigation:**
- ✓ Management → Budgetary Control (read-only for assigned projects)
- ✓ Management → Projects and Tasks (edit for assigned projects)

**Typical Tasks:**
1. Update [Projects](https://web.timecockpit.com/app/lists/entity/APP_Project) and [Tasks](https://web.timecockpit.com/app/lists/entity/APP_Task)
2. Monitor [Budgetary Control](https://web.timecockpit.com/app/lists/APP_BudgetaryControlOfProjectsList)
3. Review team timesheets for assigned projects

### DepartmentLead Workflow
**Available Navigation:**
- ✓ User → Vacation, Sick Leave, Compensatory Time (department employees only)
- ✓ User → Time Report, Overtime (department employees only)

**Typical Tasks:**
1. Approve [Vacation](https://web.timecockpit.com/app/lists/entity/APP_Vacation) requests
2. Review [Time Reports](https://web.timecockpit.com/app/lists/APP_DefaultTimeReportList)
3. Monitor team absences

## Related Documentation

- [Default Permissions Overview](employee-time-tracking/default-permissions.md)
- [Billing Administrator FAQ](billing-admin-faq.md)
- [HR Administrator FAQ](hr-administrator-faq.md)
- [Project Manager FAQ](project-manager-faq.md)
- [Department Lead FAQ](department-lead-faq.md)

---

*This documentation is based on the production navigation configuration and data model exported February 9, 2026.*
