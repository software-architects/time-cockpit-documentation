---
title: Standard Permissions - Role-Based Access Control
description: Understand the default permission model in time cockpit, the standard roles, and the technical permission rules behind them.
---
# Standard Permissions in time cockpit

## Overview

Time cockpit includes a default permission model with predefined roles for common responsibilities such as account administration, base data maintenance, billing, HR, project management, and time tracking.

This page gives an overview of the standard roles and keeps the technical permission rules for reference.

> [!NOTE]
> Reviewed in April 2026.

## Previous Standard Permissions

Before the current default permission model, time cockpit used a simpler role setup with only a few basic roles:

- **Tenant Admin**: Managed account settings, downloaded license invoices, and added or deactivated users
- **Admin**: Managed roles and role assignments, customized the data model, executed TCQL queries, and managed global settings
- **Time Tracking User**: Had broad access to the remaining standard functionality

## Activation of Default Permissions

- **New customers**: Default permissions are activated automatically.
- **Existing customers** (accounts created before December 10, 2025): Default permissions are not activated automatically, so existing custom permissions are not changed unintentionally. To activate them, contact [support@timecockpit.com](mailto:support@timecockpit.com).

For the corresponding navigation reference, see [Navigation Access Permissions & Menu Structure](../navigation-access-permissions.md).

## Standard Roles

| **Internal Name** | **Display Name** | **Permissions** | **Typical Use** |
|-------------------|------------------|-----------------|-----------------|
| `AccountAdmin` | **Account Admin** | Manage account settings, user roles, add new users, and activate or deactivate users. | General account administration |
| `CustomizationAdmin` | **Customization Admin** | Manage the data model, use impersonation, and access the TCQL editor. | Data model and customization work |
| `BaseDataAdmin` | **Base Data Admin** | Manage master data and shared configuration such as customers, projects, countries, departments, vehicles, companies, articles, units, invoice numbers, holiday calendars, import definitions, template queries, and global settings. | Shared organizational data |
| `BillingAdmin` | **Billing Admin** | Manage billing-related entities including invoices, invoice details, companies, articles, units, invoice numbers, and access to all timesheets needed for billing. | Billing and invoicing |
| `HumanResourcesAdmin` | **Human Resources Admin** | Manage user details, planned working times, absences, vacation entitlements, overtime corrections, working time limits, working time weights, departments, and holiday calendars. | HR and attendance management |
| `DepartmentLead` | **Department Lead** | Approve or reject absence requests for department employees and review their time tracking data. | Department-level approvals and oversight |
| `ProjectController` | **Project Controller** | Read time tracking and billing data across the organization. | Controlling and auditing |
| `ProjectManager` | **Project Manager** | Manage assigned projects and tasks and review project-related timesheets, invoices, and invoice details. | Project execution |
| `NotificationManager` | **Notification Manager** | Send and manage application notifications. | Notification workflows |
| `User` | **Time Tracking User** | Use time tracking and absence features for the current user within the open booking period. | End-user self-service |

## Customization Options

The default permissions cover common standard scenarios. If your tenant has special requirements, you can extend or adjust the permission model through customization.

## Technical Permission Details

The following table keeps the technical permission rules from the data model. Each rule is defined with TCQL expressions that determine access rights based on roles and context.

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
