---
title: Absence Time Management - Vacation & Leave
description: Manage vacation, sick leave, and compensatory time in time cockpit. Track absence time, calculate remaining leave, and manage entitlements.
---

# Absence Approval Workflow (Vacation, Compensatory Time Off, Sick Leave)

Time cockpit supports an absence approval workflow that can be enabled in [Global Settings](https://web.timecockpit.com/app/forms/entity/APP_GlobalSettings) per absence type. This helps organizations manage leave requests consistently and review pending approvals in the [absence calendar](https://web.timecockpit.com/app/absence-time-calendar).

> [!TIP]
> Discover how time cockpit's [employee time tracking features](https://www.timecockpit.com/features/employee-time-tracking/) help you manage absences, overtime, and working time regulations efficiently.

> [!NOTE]
> Absence approvals are controlled in two places:
> - Global Settings (per absence type)
> - User master data (per user via "Absence approval required")

## Business Case: Why Use Structured Absence Management?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

### The Challenge: Manual Leave Tracking Costs

Without structured absence management, organizations struggle with:

- **Compliance Risks**: Inaccurate leave records can lead to labor law violations and costly fines. In Germany, Austria, and Switzerland, employers face penalties of €2,000-€10,000 per violation for failure to track working time and absences accurately.
- **Workforce Planning Gaps**: Department leads don't have visibility into upcoming absences, leading to understaffing, missed deadlines, and rushed emergency coverage.
- **Payroll Errors**: Manual spreadsheets for vacation accruals result in 15-20% error rates, causing overpayments, underpayments, and employee disputes.
- **Employee Dissatisfaction**: Paper-based approval processes with unclear status create frustration. Employees report waiting 3-7 days for approval responses when using email-based systems.
- **Audit Nightmares**: When auditors request leave documentation, HR teams spend 40+ hours reconstructing records from emails and spreadsheets.

### The Solution: Automated Absence Workflow

Time cockpit's absence management system provides:

- Centralized digital leave requests (vacation, sick leave, compensatory time off)
- Role-based approval workflows (department leads, HR admins)
- Automatic notifications for pending approvals and decisions
- Real-time absence calendar showing team availability
- Audit-ready documentation with approval history
- Integration with working time regulations and entitlement calculations

### 6 Key Benefits with ROI

**1. Legal Compliance & Risk Reduction**  
Automatic audit trails for all absences satisfy labor law requirements in DACH regions. Reduces compliance risk exposure by documenting who approved what and when.

*ROI Example*: Avoiding a single €5,000 fine for inadequate absence documentation pays for time cockpit for 5+ years for a small team.

**2. Improved Workforce Planning**  
Department leads see upcoming absences in the absence calendar before approving new requests, preventing understaffing scenarios.

*ROI Example*: A 20-person department preventing just 3 emergency contractor hires per year (at €500/day each) saves €4,500 annually through better absence visibility.

**3. Faster Approval Cycle**  
Automatic notifications reduce approval time from 3-7 days (email) to same-day or next-day responses.

*ROI Example*: Employees save 2-3 hours per year on leave request follow-ups. For 50 employees, that's 100-150 hours of productive time recovered.

**4. Reduced Payroll Errors**  
Centralized absence data eliminates manual vacation accrual spreadsheets, reducing payroll errors by 80-90%.

*ROI Example*: A 30-person team reducing 5 payroll disputes per year (averaging 4 hours of HR/Finance time each) saves 20 hours annually.

**5. Employee Experience & Transparency**  
Employees track request status in real-time, receive automatic approval/rejection notifications with reasons, and maintain written confirmation records.

*ROI Example*: Improved leave management contributes to employee retention. Reducing turnover by just 1 employee per year (replacement cost = 50-150% of salary) can save €25,000-€75,000.

**6. Audit Readiness**  
Complete approval history with timestamps, approver names, and rejection reasons available instantly for audits or legal disputes.

*ROI Example*: HR teams save 30-40 hours during annual audits by providing absence reports instead of reconstructing records. At €50/hour fully loaded cost, that's €1,500-€2,000 saved per audit.

### Workflow Example: Developer Requests Vacation

**Scenario**: Sarah (software developer) wants to take 2 weeks vacation in August. Her department lead is Michael, and she works in the Development department.

**Traditional Process (Email-Based)**:
1. Sarah emails Michael requesting August 15-26 off (5 minutes)
2. Michael checks team calendar in another system, discusses with colleagues (30 minutes)
3. Michael replies to Sarah 4 days later with approval (email lost in inbox)
4. Sarah manually enters dates into HR spreadsheet (10 minutes)
5. HR admin reconciles spreadsheet with email approvals monthly (2 hours/month for 30 employees)

**Total time**: ~50 minutes per request + ongoing reconciliation overhead

**Time Cockpit Process**:
1. Sarah creates vacation absence in time cockpit (2 minutes)
2. Michael receives automatic notification with calendar view showing team absences (0 minutes - passive)
3. Michael reviews pending approvals in absence calendar, sees no conflicts, clicks "Approve" (3 minutes)
4. Sarah receives approval notification automatically (0 minutes - passive)
5. Vacation automatically reduces Sarah's entitlement balance (0 minutes - automatic)
6. Absence appears in team calendar for planning (0 minutes - automatic)

**Total time**: ~5 minutes per request, no reconciliation needed

**Time savings**: 45 minutes per vacation request × 80 vacation requests/year (30 employees × ~2.5 requests) = **60 hours saved annually**

### Business Metrics to Track

Monitor these KPIs to measure absence management effectiveness:

- **Absence Rate** = (Total Absence Days ÷ Total Available Working Days) × 100  
  *Target*: 3-5% for vacation, 2-4% for sick leave (varies by industry)

- **Vacation Utilization Rate** = (Vacation Days Taken ÷ Vacation Days Entitled) × 100  
  *Target*: 85-95% (ensures employees actually take earned vacation)

- **Approval Cycle Time** = Average days from absence request to approval/rejection  
  *Target*: <1 day for routine requests

- **Payroll Error Rate** = (Absence-Related Payroll Corrections ÷ Total Payroll Runs) × 100  
  *Target*: <2%

- **Audit Preparation Time** = Hours spent preparing absence documentation for audits  
  *Target*: <5 hours per audit with automated systems

These metrics are available through time cockpit's [built-in reports](../reporting/overview.md) and can be exported for executive dashboards.

### For Different Organization Sizes

**Small Teams (2-10 employees)**:  
Even small teams benefit from centralized absence tracking. Primary value is transparency (team calendar) and avoiding vacation conflicts. Consider enabling approvals only for vacation; auto-approve sick leave to reduce admin overhead.

**Medium Teams (10-50 employees)**:  
Enable full approval workflow for all absence types. Department leads should approve for their teams. This size typically sees the highest ROI from workforce planning improvements.

**Large Teams (50+ employees)**:  
Essential for compliance and audit readiness. Use HR-Admin role to handle approvals on behalf of department leads in high-volume periods. Invest in training department leads to use filters effectively in the absence calendar.

### Getting Started with Absence Approval Workflow

1. **Enable Globally**: Navigate to [Global Settings](https://web.timecockpit.com/app/forms/entity/APP_GlobalSettings) and enable approvals for vacation, compensatory time off, and/or sick leave.

2. **Configure Per User**: In user master data, check "Absence approval required" for users who need approval (typically all employees except executives).

3. **Assign Department Leads**: In department master data, assign department leads who can approve absences for their teams.

4. **Train Department Leads**: Show department leads how to review pending approvals in the [absence calendar](https://web.timecockpit.com/app/absence-time-calendar) and use the approval/rejection actions.

5. **Retroactive Approval**: If you have existing absences from before enabling the workflow, ask department leads to approve them retroactively to clear the pending list.

6. **Monitor Adoption**: Track approval cycle time and ensure department leads respond to pending requests within 1-2 days.

See also: [Absence Calendar](absence-calendar.md), [Vacation & Leave Entitlements](leave-entitlements.md), [Working Time Regulations](working-time-regulations.md)

## Absence types covered by approvals

The approval workflow can be enabled separately for all three absence types in time cockpit:

- [Vacation/Special Vacation](https://web.timecockpit.com/app/forms/entity/APP_Vacation)
- [Compensatory Time Off](https://web.timecockpit.com/app/forms/entity/APP_CompensatoryTime)
- [Sick Leave](https://web.timecockpit.com/app/forms/entity/APP_SickLeave)

Once you enable approvals for a category, users must have their absences of that category approved by either their supervisor (the department lead of their assigned department; the Department-Lead role is required) or a user with the HR-Admin role.

## When is an absence approval required?

Approvals are only required for users who have this enabled in their user master data via the checkbox "Absence approval required".

For users where absence approval is not required, newly created absences are automatically marked as approved (as long as the approval workflow is enabled in Global Settings for the corresponding absence type).

> [!TIP]
> If approvals are enabled globally but a user does not require approval, their new absences will be approved automatically.

## Important: Existing absences after enabling approvals

From the moment you enable the workflow in Global Settings and in user master data, unapproved absences (including absences in the past created before enabling this feature) are shown as unapproved in the absence calendar depending on permissions. Completed absences from before the activation must therefore be approved retroactively.

> [!IMPORTANT]
> After enabling the workflow, older absences may appear as unapproved and might need retroactive approval.

## Absence calendar visibility by user role

The following table provides a quick overview of what each role can see and do in the absence calendar.

| Role | Absences shown in calendar | Absence type visible for colleagues | Pending approvals list | Can approve / reject | Additional filters |
|---|---|---:|---:|---:|---|
| Time Tracking User | Assigned department | No | Own only | No | — |
| Department Lead | Own department + departments where user is department lead | Yes | Own + users in department lead's department | Yes | — |
| Human Resources Admin | Assigned department (default) | Yes | Own only (default) | Yes (on behalf of department leads) | Show all users, Department, User |

### Time Tracking User

Sees all absences of users in their assigned department in the absence calendar. For colleagues' absences, the absence type (Vacation, Sick Leave, Compensatory Time Off) is intentionally not visible. In the list above the calendar, only the user's own unapproved absences are shown.

> [!NOTE]
> This privacy setting prevents users from identifying whether a colleague is on vacation, sick leave, or compensatory time off.

### Department Lead

Sees all absences of users in their own assigned department and also absences of users in any departments where the user is assigned as department lead. Each user can be assigned to only one department (in user master data). However, a user can be assigned as department lead in multiple departments (department master data).

In the absence list, the department lead sees their own unapproved absences as well as unapproved absences of users in the department of the department lead.

### Human Resources Admin

Sees all absences of users in their assigned department in the absence calendar. In the list of unapproved absences, only the user's own unapproved absences are shown.

As a Human Resources Admin, you can approve absences for all users on behalf of department leads. To do this, you can use the additional filters:

- Checkbox "Show all users"

When you enable this checkbox, the absence calendar loads absences for all users and the list shows all unapproved absences. To narrow down the data, you can use the two filter fields Department and User:

- Dropdown "Department"
- Dropdown "User"

> [!TIP]
> Use "Show all users" only when needed, then narrow down with Department and User to keep the calendar and approval list manageable.

## Approving and rejecting absences

Department Leads and Human Resources Admins can approve or reject absences with pending approval in the list above the absence calendar. This is done using the two actions in the rightmost columns.

Before approving or rejecting, you can select a row to preview the absence in the calendar below. The calendar automatically jumps to the start date of the absence. This makes it easier to compare it with existing absences of other users in the same department and consider overlaps during the approval decision.

> [!TIP]
> Select an absence in the list to highlight it in the calendar and jump directly to the relevant date range.

View as Human Resources Admin:

![Absence Time Calendar](images/absence-time-calendar.png "Absence Time Calendar")

## Automatic notifications in the approval workflow

When a user creates a new absence, the department leads of that user are automatically informed about the pending approval via a notification in time cockpit (bell icon in the top-right menu). If needed, notifications for department leads can be disabled per department lead in the department master data.

![Disable Receive Notification](images/department-lead-receive-notification.png "Disable Receive Notification")

If an absence is approved or rejected, the notifications created for the department leads are automatically deleted.

After approval or rejection, the requesting user also receives a notification including when and by whom the absence was processed. In case of rejection, the processing person can provide a rejection reason, which is included in the notification to the requesting user.

Additionally, when an absence is rejected, it is deleted. Notifications for approved absences are not automatically deleted and can be kept as written confirmation.

> [!WARNING]
> Rejected absences are deleted. Approved-absence notifications are kept and can serve as written confirmation.

![Absence Time Notification](images/absence-time-notification.png "Absence Time Notification")