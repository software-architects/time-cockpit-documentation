---
title: Standard Permissions - Role-Based Access Control
description: Learn about time cockpit's predefined standard permissions and roles. Understand Account Admin, Project Controller, Team Lead, and Time Tracking User roles.
---
# Standard Permissions in time cockpit

## Overview

**time cockpit** provides predefined standard permissions to streamline user access management. These roles cover common use cases and can be customized to meet specific needs. Below is an overview of the new standard permissions.

## Previous Standard Permissions

Prior to the enhanced permission model, **time cockpit** offered a minimal implementation of standard permissions with only three basic roles:

- **Tenant Admin**: Managed account settings, downloaded license invoices, and added/deactivated users
- **Admin**: Managed roles and role-user assignments, customized the data model, executed TCQL queries, and managed global settings
- **Time Tracking User**: Had unrestricted read/write access to all remaining functionality

This simplified model required organizations to configure detailed permissions themselves. The new standard permissions provide a more granular and comprehensive role-based access control system.

## Activation of New Standard Permissions

- **New customers**: The new standard permissions are automatically activated
- **Existing customers** (accounts created before December 10, 2025): The new standard permissions are **not** automatically activated to preserve existing custom permission configurations. To activate them, contact support@timecockpit.com. Note that existing custom permissions must be reviewed and reconciled with the new standard permissions.

## New Standard Permissions

To simplify the initial configuration, the standard roles in **time cockpit** have been revised. These roles encompass various responsibilities and facilitate effective management.

### Roles and Permissions

| **Internal Name** | **Display Name** | **Permissions** | **Target Audience** |
|-------------------|------------------|-----------------|---------------------|
| `AccountAdmin` | **Account Admin** | Manage account settings, user roles, add new users, and activate/deactivate existing users. | Administrators responsible for general account management |
| `CustomizationAdmin` | **Customization Admin** | Manage the data model in **time cockpit**, use impersonation, and access the TCQL editor. | Users customizing the data model and creating complex queries |
| `BaseDataAdmin` | **Base Data Admin** | Manage base data entities and global settings (global settings, formatting profiles, import definitions, template queries) as well as master data such as customers, projects, countries, departments, vehicles, companies, articles, units, invoice numbers, and holiday calendars. Note: Some entities are shared with Billing Admin (articles, units, countries, customers, companies, invoice numbers) and HR Admin (departments, holiday calendars). | Administrators managing key organizational data |
| `BillingAdmin` | **Billing Admin** | Manage all billing-related entities including creating and deleting invoices, accessing timesheets of all users, and managing companies, articles, units, invoice numbers, customers, and countries. Note: Some entities are shared with Base Data Admin. | Users overseeing billing and financial data |
| `HumanResourcesAdmin` | **Human Resources Admin** | Manage all entities required for attendance time tracking including user data and planned working times, absence times (vacation, time-off, sick leave), vacation entitlements, overtime corrections, maximum working times, working time weightings, departments, and holiday calendars. Note: Departments and holiday calendars are shared with Base Data Admin. | Administrators responsible for HR and attendance management |
| `DepartmentLead` | **Department Lead** | Approve or reject absence requests for employees in their department(s) and view time tracking data including timesheets, absence times (vacation, sick leave, compensatory time), overtime corrections, vacation entitlements, weekly hours of work, and user details for their department employees. Note: Approval/rejection is implemented via actions that bypass standard write permissions. | Department managers responsible for approving absences and monitoring their team's time tracking |
| `ProjectController` | **Project Controller** | View all time tracking data across the organization including all timesheets, invoices, invoice details, and user details. | Controllers and auditors who need comprehensive oversight of project-related time tracking and billing data |
| `ProjectManager` | **Project Manager** | Manage projects they are assigned to as project manager or deputy, including updating project information and managing tasks. View data for assigned projects such as timesheets, invoices, and invoice details. | Users who manage specific projects and need visibility and control over those projects |
| `NotificationManager` | **Notification Manager** | Send and manage application notifications. | Users handling communication tasks within the application |
| `User` | **Time Tracking User** | Access and use all time tracking features for their own user, including managing time tracking and absence times within the open booking period, and managing activities. | End users tracking their own working hours |

---

## Customization Options

The standard permissions are designed to cover common use cases. However, if special requirements arise, permissions can be customized to meet the specific needs of your organization.

---

## Technical Permission Details

The following table provides detailed technical information about how permissions are implemented in the data model. Each permission is defined using TCQL (Time Cockpit Query Language) expressions that determine access rights based on user roles and context.

| **Entity Name** | **Permission Name** | **Description** | **Condition/Logic (TCQL)** |
|-----------------|---------------------|-----------------|----------------------------|
| APP_Article | APP_ReadPermission | Base Data and Billing Admins can read articles | `'BaseDataAdmin' In Set('CurrentUserRoles') Or 'BillingAdmin' In Set('CurrentUserRoles')` |
| APP_Article | APP_WritePermission | Base Data and Billing Admins can write articles | `'BaseDataAdmin' In Set('CurrentUserRoles') Or 'BillingAdmin' In Set('CurrentUserRoles')` |
| APP_CalendarWeekRule | APP_WriteCalendarWeekRule | Calendar week rules cannot be modified | `0 = 1` |
| APP_Company | APP_WritePermission | Base Data and Billing Admins can write companies | `'BaseDataAdmin' In Set('CurrentUserRoles') Or 'BillingAdmin' In Set('CurrentUserRoles')` |
| APP_CompensatoryTime | APP_ReadPermission | HR Admins, Department Leads (for their department), and users (for their own records) can read compensatory time | `'HumanResourcesAdmin' In Set('CurrentUserRoles') Or ('DepartmentLead' In Set('CurrentUserRoles') And Current.UserDetail.Department In Set('APP_MyDepartmentsAsLead')) Or ('User' In Set('CurrentUserRoles', 'Code') And Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid)` |
| APP_CompensatoryTime | APP_WritePermission | HR Admins can write after booking completion date; Users can write their own if not approved and after booking completion date | `'HumanResourcesAdmin' In Set('CurrentUserRoles') And :Date(Current.BeginTime) > :GetBookingCompletionDate() Or ('User' In Set('CurrentUserRoles') And Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid And (Current.APP_IsApproved=False Or Current.UserDetail.APP_IsAbsenceApprovalRequired <> True) And :Date(Current.BeginTime) > :GetBookingCompletionDate())` |
| APP_Country | APP_WritePermission | Base Data and Billing Admins can write countries | `'BaseDataAdmin' In Set('CurrentUserRoles') Or 'BillingAdmin' In Set('CurrentUserRoles')` |
| APP_CultureInfo | APP_WriteCultureInfo | Only system mode can write culture info | `:GetIsInSystemMode()` |
| APP_Customer | APP_WritePermission | Base Data and Billing Admins can write customers | `'BaseDataAdmin' In Set('CurrentUserRoles') Or 'BillingAdmin' In Set('CurrentUserRoles')` |
| APP_Department | APP_WritePermission | Base Data and HR Admins can write departments | `'BaseDataAdmin' In Set('CurrentUserRoles') Or 'HumanResourcesAdmin' In Set('CurrentUserRoles')` |
| APP_DepartmentLead | APP_WritePermission | Base Data and HR Admins can write department lead assignments | `'BaseDataAdmin' In Set('CurrentUserRoles') Or 'HumanResourcesAdmin' In Set('CurrentUserRoles')` |
| APP_FeatureFlag | APP_WritePermission | Admins can write feature flags | `'Admin' In Set('CurrentUserRoles')` |
| APP_FormattingProfile | APP_ReadPermission | Users can read global formatting profiles or their own | `Current.APP_UserDetail = Null Or Current.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.UserDetailUuid` |
| APP_FormattingProfile | APP_WritePermission | Base Data Admins can write global or own profiles; Users can write only their own | `'BaseDataAdmin' In Set('CurrentUserRoles') And (Current.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.APP_UserDetailUuid Or Current.APP_UserDetail = Null) Or (Current.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.APP_UserDetailUuid)` |
| APP_FormattingProfileColor | APP_ReadPermission | Users can read colors for global formatting profiles or their own | `Current.APP_FormattingProfile.APP_UserDetail = Null Or Current.APP_FormattingProfile.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.UserDetailUuid` |
| APP_FormattingProfileColor | APP_WritePermission | Base Data Admins can write colors for global or own profiles; Users can write only their own | `'BaseDataAdmin' In Set('CurrentUserRoles') And (Current.APP_FormattingProfile.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.APP_UserDetailUuid Or Current.APP_FormattingProfile.APP_UserDetail = Null) Or (Current.APP_FormattingProfile.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.APP_UserDetailUuid)` |
| APP_GlobalSettings | APP_WritePermission | Base Data Admins can write global settings | `'BaseDataAdmin' In Set('CurrentUserRoles')` |
| APP_ImportDefinition | APP_WritePermission | Base Data Admins can write import definitions | `'BaseDataAdmin' In Set('CurrentUserRoles')` |
| APP_Invoice | APP_ReadPermission | Billing Admins and Project Controllers can read all; Project Managers can read their project invoices | `'BillingAdmin' In Set('CurrentUserRoles') Or 'ProjectController' In Set('CurrentUserRoles') Or ('ProjectManager' In Set('CurrentUserRoles') And (Current.APP_Project.APP_Manager1 = Environment.CurrentUser.UserDetailUuid Or Current.APP_Project.APP_Manager2 = Environment.CurrentUser.UserDetailUuid))` |
| APP_Invoice | APP_WritePermission | Billing Admins can write invoices | `'BillingAdmin' In Set('CurrentUserRoles')` |
| APP_InvoiceDetail | APP_ReadPermission | Billing Admins and Project Controllers can read all; Project Managers can read their project invoice details | `'BillingAdmin' In Set('CurrentUserRoles') Or 'ProjectController' In Set('CurrentUserRoles') Or ('ProjectManager' In Set('CurrentUserRoles') And (Current.APP_Invoice.APP_Project.APP_Manager1 = Environment.CurrentUser.UserDetailUuid Or Current.APP_Invoice.APP_Project.APP_Manager2 = Environment.CurrentUser.UserDetailUuid))` |
| APP_InvoiceDetail | APP_WritePermission | Billing Admins can write invoice details | `'BillingAdmin' In Set('CurrentUserRoles')` |
| APP_InvoiceNumber | APP_ReadPermission | Base Data and Billing Admins can read invoice numbers | `'BaseDataAdmin' In Set('CurrentUserRoles') Or 'BillingAdmin' In Set('CurrentUserRoles')` |
| APP_InvoiceNumber | APP_WritePermission | Base Data and Billing Admins can write invoice numbers | `'BaseDataAdmin' In Set('CurrentUserRoles') Or 'BillingAdmin' In Set('CurrentUserRoles')` |
| APP_LegalHoliday | APP_WritePermission | Base Data and HR Admins can write legal holidays | `'BaseDataAdmin' In Set('CurrentUserRoles') Or 'HumanResourcesAdmin' In Set('CurrentUserRoles')` |
| APP_LegalHolidayCalendar | APP_WritePermission | Base Data and HR Admins can write holiday calendars | `'BaseDataAdmin' In Set('CurrentUserRoles') Or 'HumanResourcesAdmin' In Set('CurrentUserRoles')` |
| APP_MeansOfTransport | APP_WritePermission | Base Data Admins can write means of transport | `'BaseDataAdmin' In Set('CurrentUserRoles')` |
| APP_Notification | APP_ReadPermission | Notification Managers can read all; Users can read their own notifications | `'NotificationManager' In Set('CurrentUserRoles') Or Current.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.UserDetailUuid` |
| APP_Notification | APP_WritePermission | Notification Managers can write notifications | `'NotificationManager' In Set('CurrentUserRoles')` |
| APP_NotificationState | APP_ReadPermission | Notification Managers can read all; Users can read their own notification states | `'NotificationManager' In Set('CurrentUserRoles') Or Current.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.UserDetailUuid` |
| APP_NotificationState | APP_WritePermission | Notification Managers can write all; Users can write their own notification states | `'NotificationManager' In Set('CurrentUserRoles') Or Current.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.UserDetailUuid` |
| APP_OvertimeCorrection | APP_ReadPermission | HR Admins, Department Leads (for their department), and users (for their own records) can read overtime corrections | `'HumanResourcesAdmin' In Set('CurrentUserRoles') Or ('DepartmentLead' In Set('CurrentUserRoles') And Current.UserDetail.Department In Set('APP_MyDepartmentsAsLead')) Or ('User' In Set('CurrentUserRoles', 'Code') And Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid)` |
| APP_OvertimeCorrection | APP_WritePermission | HR Admins can write overtime corrections | `'HumanResourcesAdmin' In Set('CurrentUserRoles')` |
| APP_Project | APP_UpdatePermission | Project Managers can update projects they manage | `'ProjectManager' In Set('CurrentUserRoles') And (Current.APP_Manager1 = Environment.CurrentUser.UserDetailUuid Or Current.APP_Manager2 = Environment.CurrentUser.UserDetailUuid)` |
| APP_Project | APP_WritePermission | Billing and Base Data Admins can write projects | `'BillingAdmin' In Set('CurrentUserRoles') Or 'BaseDataAdmin' In Set('CurrentUserRoles')` |
| APP_SickLeave | APP_ReadPermission | HR Admins, Department Leads (for their department), and users (for their own records) can read sick leave | `'HumanResourcesAdmin' In Set('CurrentUserRoles') Or ('DepartmentLead' In Set('CurrentUserRoles') And Current.UserDetail.Department In Set('APP_MyDepartmentsAsLead')) Or ('User' In Set('CurrentUserRoles', 'Code') And Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid)` |
| APP_SickLeave | APP_WritePermission | HR Admins can write after booking completion date; Users can write their own if not approved and after booking completion date | `'HumanResourcesAdmin' In Set('CurrentUserRoles') And :Date(Current.BeginTime) > :GetBookingCompletionDate() Or ('User' In Set('CurrentUserRoles') And Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid And (Current.APP_IsApproved=False Or Current.UserDetail.APP_IsAbsenceApprovalRequired <> True) And :Date(Current.BeginTime) > :GetBookingCompletionDate())` |
| APP_Task | APP_WritePermission | Billing Admins, Base Data Admins, and Project Managers (for their projects) can write tasks | `'BillingAdmin' In Set('CurrentUserRoles') Or 'BaseDataAdmin' In Set('CurrentUserRoles') Or ('ProjectManager' In Set('CurrentUserRoles') And (Current.APP_Project.APP_Manager1 = Environment.CurrentUser.UserDetailUuid Or Current.APP_Project.APP_Manager2 = Environment.CurrentUser.UserDetailUuid))` |
| APP_TemplateQuery | APP_WritePermission | Base Data Admins can write template queries | `'BaseDataAdmin' In Set('CurrentUserRoles')` |
| APP_Timesheet | APP_ReadPermission | Billing Admins, HR Admins, and Project Controllers can read all; Users can read their own; Department Leads and Project Managers can read their respective timesheets | `'BillingAdmin' In Set('CurrentUserRoles') Or 'HumanResourcesAdmin' In Set('CurrentUserRoles') Or 'ProjectController' In Set('CurrentUserRoles') Or ('User' In Set('CurrentUserRoles') And (Current.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.APP_UserDetailUuid Or ('DepartmentLead' In Set('CurrentUserRoles') And Current.APP_UserDetail.Department In Set('APP_MyDepartmentsAsLead')) Or ('ProjectManager' In Set('CurrentUserRoles') And (Current.APP_Project.APP_Manager1 = Environment.CurrentUser.APP_UserDetailUuid Or Current.APP_Project.APP_Manager2 = Environment.CurrentUser.APP_UserDetailUuid))))` |
| APP_Timesheet | APP_WritePermission | HR Admins can write after booking completion date; Users can write their own after booking completion date | `'HumanResourcesAdmin' In Set('CurrentUserRoles') And :Date(Current.BeginTime) > :GetBookingCompletionDate() Or ('User' In Set('CurrentUserRoles') And Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid And :Date(Current.BeginTime) > :GetBookingCompletionDate())` |
| APP_TimesheetSuggestion | APP_ReadPermission | Users can read timesheet suggestions they sent or received | `Current.APP_Sender.APP_UserDetailUuid = Environment.CurrentUser.UserDetailUuid Or Current.APP_Receiver.APP_UserDetailUuid = Environment.CurrentUser.UserDetailUuid` |
| APP_TimesheetSuggestion | APP_WritePermission | Timesheet suggestions cannot be directly written | `1 = 0` |
| APP_TimesheetTemplate | APP_ReadPermission | Base Data Admins can read all; Users can read their own templates | `'BaseDataAdmin' In Set('CurrentUserRoles') Or Current.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.APP_UserDetailUuid` |
| APP_TimesheetTemplate | APP_WritePermission | Users can write their own timesheet templates | `Current.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.APP_UserDetailUuid` |
| APP_Unit | APP_WritePermission | Base Data and Billing Admins can write units | `'BaseDataAdmin' In Set('CurrentUserRoles') Or 'BillingAdmin' In Set('CurrentUserRoles')` |
| APP_UserDetail | APP_ReadPermission | Account Admins, HR Admins, Billing Admins, Base Data Admins, and Project Controllers can read all; Users can read their own; Department Leads can read their department employees | `'AccountAdmin' In Set('CurrentUserRoles') Or 'HumanResourcesAdmin' In Set('CurrentUserRoles') Or 'BillingAdmin' In Set('CurrentUserRoles') Or 'BaseDataAdmin' In Set('CurrentUserRoles') Or 'ProjectController' In Set('CurrentUserRoles') Or ('User' In Set('CurrentUserRoles', 'Code') And (Current.UserDetailUuid = Environment.CurrentUser.UserDetailUuid Or ('DepartmentLead' In Set('CurrentUserRoles') And Current.Department In Set('APP_MyDepartmentsAsLead'))))` |
| APP_UserDetail | APP_WritePermission | HR Admins and Account Admins can write user details; Users can write their own | `'HumanResourcesAdmin' In Set('CurrentUserRoles') Or 'AccountAdmin' In Set('CurrentUserRoles') Or ('User' In Set('CurrentUserRoles', 'Code') And Current.UserDetailUuid = Environment.CurrentUser.UserDetailUuid)` |
| APP_UserDetailRole | APP_PreventUserDeletingOwnAdminRole | Account Admins cannot delete their own Account Admin role | `'AccountAdmin' In Set('CurrentUserRoles', 'Code') And ((Current.UserRole.Code = 'AccountAdmin' And Current.APP_UserDetail.APP_UserDetailUuid <> Environment.CurrentUser.APP_UserDetailUuid) Or (Current.UserRole.Code <> 'AccountAdmin'))` |
| APP_UserDetailRole | APP_ReadPermission | Account Admins can read all role assignments; Users can read their own | `'AccountAdmin' In Set('CurrentUserRoles') Or (Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid)` |
| APP_UserRole | APP_DeletePermission | Protected roles cannot be deleted | `Current.Code Not In('User', 'Admin', 'AccountAdmin', 'BaseDataAdmin', 'NotificationManager')` |
| APP_UserRole | APP_InsertPermission | Account Admins can insert user roles | `'AccountAdmin' In Set('CurrentUserRoles')` |
| APP_UserRole | APP_ReadPermission | All users can read user roles | `1=1` |
| APP_UserRole | APP_UpdatePermission | Account Admins can update user roles | `'AccountAdmin' In Set('CurrentUserRoles')` |
| APP_Vacation | APP_ReadPermission | HR Admins, Department Leads (for their department), and users (for their own records) can read vacation | `'HumanResourcesAdmin' In Set('CurrentUserRoles') Or ('DepartmentLead' In Set('CurrentUserRoles') And Current.UserDetail.Department In Set('APP_MyDepartmentsAsLead')) Or ('User' In Set('CurrentUserRoles', 'Code') And Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid)` |
| APP_Vacation | APP_WritePermission | HR Admins can write after booking completion date; Users can write their own if not approved and after booking completion date | `'HumanResourcesAdmin' In Set('CurrentUserRoles') And :Date(Current.BeginTime) > :GetBookingCompletionDate() Or ('User' In Set('CurrentUserRoles') And Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid And (Current.APP_IsApproved=False Or Current.UserDetail.APP_IsAbsenceApprovalRequired <> True) And :Date(Current.BeginTime) > :GetBookingCompletionDate())` |
| APP_VacationEntitlement | APP_ReadPermission | HR Admins, Department Leads (for their department), and users (for their own records) can read vacation entitlement | `'HumanResourcesAdmin' In Set('CurrentUserRoles') Or ('DepartmentLead' In Set('CurrentUserRoles') And Current.UserDetail.Department In Set('APP_MyDepartmentsAsLead')) Or ('User' In Set('CurrentUserRoles', 'Code') And Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid)` |
| APP_VacationEntitlement | APP_WritePermission | HR Admins can write vacation entitlement | `'HumanResourcesAdmin' In Set('CurrentUserRoles')` |
| APP_WeeklyHoursOfWork | APP_ReadPermission | HR Admins, Department Leads (for their department), and users (for their own records) can read weekly hours of work | `'HumanResourcesAdmin' In Set('CurrentUserRoles') Or ('DepartmentLead' In Set('CurrentUserRoles') And Current.UserDetail.Department In Set('APP_MyDepartmentsAsLead')) Or ('User' In Set('CurrentUserRoles', 'Code') And Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid)` |
| APP_WeeklyHoursOfWork | APP_WritePermission | HR Admins can write weekly hours of work | `'HumanResourcesAdmin' In Set('CurrentUserRoles')` |
| APP_WorkingTimeLimit | APP_WritePermission | HR Admins can write working time limits that are not pre-configured | `'HumanResourcesAdmin' In Set('CurrentUserRoles') And Current.IsPreConfigured <> True` |
| APP_WorkingTimeWeight | APP_WritePermission | HR Admins can write working time weights | `'HumanResourcesAdmin' In Set('CurrentUserRoles')` |