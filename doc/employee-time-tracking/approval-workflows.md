---
title: Approval Workflows - Absence & Timesheet Approvals
description: Complete guide to approval workflows in time cockpit including absence approvals (vacation, sick leave, compensatory time), timesheet approvals, role-based permissions, and automated notifications.
keywords: [approval workflow, absence approval, vacation approval, timesheet approval, workflow automation, approval process, leave request approval, approval permissions, workflow notifications, approval management]
---

# Approval Workflows - Absence & Timesheet Approvals

Implement structured approval workflows for absences, vacation requests, sick leave, and timesheets. Ensure compliance, improve planning visibility, and streamline approval processes with role-based permissions and automatic notifications.

> [!TIP]
> **Want to streamline absence management?** Learn how time cockpit's [employee time tracking features](https://www.timecockpit.com/features/employee-time-tracking/) help you manage absences, overtime, and working time regulations efficiently.

## Overview

Time cockpit supports approval workflows for two main areas:

**1. Absence Approvals**
- Vacation/Special Vacation requests
- Compensatory Time Off
- Sick Leave (retroactive approval)

**2. Timesheet Approvals** (Custom Implementation)
- Weekly/monthly timesheet approval
- Project time approval
- Billable hours verification

Approval workflows provide:
- ✅ **Compliance & Audit Trail**: Document who approved what and when
- ✅ **Workforce Planning**: Visibility into upcoming absences before approval
- ✅ **Accountability**: Clear approval responsibility by role
- ✅ **Automated Notifications**: Automatic alerts for pending approvals and decisions
- ✅ **Team Visibility**: Absence calendar shows approved time off to whole team

## Absence Approval Workflow

### How Absence Approvals Work

**Core Concept:**
When absence approval is enabled, employees create absence requests (vacation, sick leave, compensatory time off) that appear in a **pending approvals list** until a department lead or HR administrator approves or rejects them. Upon approval, the absence appears in the team's absence calendar.

**Workflow Lifecycle:**
```
1. Employee creates absence request
     ↓
2. Department Lead receives notification
     ↓
3. Department Lead reviews in Absence Calendar (sees team conflicts)
     ↓
4. Department Lead approves or rejects
     ↓
5. Employee receives notification of decision
     ↓
6. Approved absence visible in team calendar
```

### Enabling Absence Approvals

**Global Settings Configuration:**

1. Navigate to **[Global Settings](https://web.timecockpit.com/app/forms/entity/APP_GlobalSettings)**
2. Enable approvals per absence type:
   - ☑ **Enable Vacation Approval**
   - ☑ **Enable Compensatory Time Off Approval**
   - ☑ **Enable Sick Leave Approval** (retroactive approval)
3. Click **Save**

**Per-User Configuration:**

Not all employees may require approval (executives, managers):

1. Navigate to **User** → **[User Details](https://web.timecockpit.com/app/lists/APP_DefaultUserDetailList)**
2. Open employee record
3. Check or uncheck **☑ Absence Approval Required**
4. Save

**Result:**
- Users with approval required: Absences must be approved
- Users without approval required: Absences automatically approved

### Absence Types Covered

**[Vacation/Special Vacation](https://web.timecockpit.com/app/forms/entity/APP_Vacation)**
- Annual leave, special vacation (wedding, moving, etc.)
- Most common approval scenario
- Requires advance planning

**[Compensatory Time Off](https://web.timecockpit.com/app/forms/entity/APP_CompensatoryTime)**
- Time off in lieu of overtime worked
- Approval ensures balance is correct
- Similar to vacation approval process

**[Sick Leave](https://web.timecockpit.com/app/forms/entity/APP_SickLeave)**
- Retroactive approval (employee already out)
- Approval documents absence reason for payroll/HR
- May not require advance approval depending on policy

### Who Can Approve Absences

**Department Leads**
- Approve absences for employees in their department(s)
- Can be department lead for multiple departments
- Receive automatic notifications for pending approvals
- View team absences for conflict detection

**HR Administrators**
- Can approve absences on behalf of department leads
- Access all departments (via "Show all users" filter)
- Handle approvals when department leads unavailable
- Manage approval workflow exceptions

**Regular Users/Employees**
- Cannot approve others' absences
- Can only view their own approval status
- See team absences in calendar (without absence type details for privacy)

### Viewing Pending Approvals

**As Department Lead:**

1. Navigate to **[Absence Calendar](https://web.timecockpit.com/app/absence-time-calendar)**
2. **Pending Approvals List** appears above calendar
3. Shows absences requiring your approval:
   - Employee name
   - Absence type (Vacation, Sick Leave, Comp Time)
   - Start and end dates
   - Total days requested
4. Select a row to preview absence in calendar below
5. Calendar automatically jumps to the absence date for context

**Alternative: List View**

1. Navigate to **User** → **[Vacation](https://web.timecockpit.com/app/lists/APP_DefaultVacationList)** (or Sick Leave, Comp Time)
2. Filter:
   - **Department:** Your department (may be automatic)
   - **Is Approved:** False
3. Review list of pending approvals

**As HR Administrator:**

1. Navigate to **[Absence Calendar](https://web.timecockpit.com/app/absence-time-calendar)**
2. Enable **☑ Show All Users** checkbox
3. Optionally filter by:
   - **Department:** Specific department
   - **User:** Specific employee
4. View all pending approvals across organization

### Approving or Rejecting Absences

**Individual Approval (Absence Calendar):**

1. In the **Pending Approvals List**, locate the request
2. Review context:
   - Check calendar below for team conflicts
   - Verify employee has sufficient vacation balance
   - Consider project deadlines and coverage
3. **To approve:**
   - Click **Approve** action button (rightmost column)
   - Absence immediately appears in calendar
   - Employee receives approval notification
4. **To reject:**
   - Click **Reject** action button
   - Provide **rejection reason** in dialog (required)
   - Absence is deleted
   - Employee receives rejection notification with reason

**Batch Approval (Multiple Requests):**

1. Navigate to **User** → **[Vacation](https://web.timecockpit.com/app/lists/APP_DefaultVacationList)**
2. Filter to pending approvals (**Is Approved = False**)
3. **Multi-select** requests (Ctrl+Click)
4. Run **Approve Absence** action from toolbar
5. All selected requests approved simultaneously

**Editing Before Approval:**

If dates need adjustment:
1. Open the absence request
2. Discuss with employee (via notification comment or external communication)
3. Employee cancels original request and creates new one
4. Or: Edit dates directly (if permitted), then approve

### Absence Calendar Visibility by Role

| Role | Can See | Can Approve | Pending Approvals Shown |
|------|---------|-------------|-------------------------|
| **Time Tracking User** | Own department absences (no absence type for privacy) | ❌ No | Own only |
| **Department Lead** | Own dept + departments where they're lead | ✅ Yes (own depts) | Own + department members |
| **HR Administrator** | All users (with "Show all users" filter) | ✅ Yes (on behalf of leads) | All (with filter enabled) |

**Privacy Protection:**
Regular users see that colleagues are absent, but NOT whether it's vacation, sick leave, or compensatory time. This prevents stigma around sick leave.

### Automatic Notifications

**When Absence is Created:**
- **Department Leads** of the requesting user's department receive notification
- Notification appears in **bell icon** (top-right menu)
- Contains: Employee name, absence dates, absence type

**Disabling Notifications (Per Department Lead):**
1. Navigate to **[Department master data](https://web.timecockpit.com/app/lists/APP_DefaultDepartmentList)**
2. Open department record
3. Find department lead's settings
4. Uncheck **☑ Receive Notification** for that department lead
5. Save

**When Absence is Approved/Rejected:**
- **Requesting Employee** receives notification
- Notification includes:
  - Decision (approved or rejected)
  - Approver name
  - Timestamp
  - Rejection reason (if rejected)
- Approved-absence notifications serve as **written confirmation**
- Rejected absences are **deleted automatically**

**Notification Cleanup:**
- Department lead notifications deleted automatically upon approval/rejection
- Employee approval notifications can be kept for records

### Handling Common Approval Scenarios

**Scenario 1: Multiple Team Members Request Same Dates**

**Steps:**
1. Review all pending requests for date conflict
2. Check team capacity:
   - **>70% present**: Often manageable
   - **50-70% present**: Challenging
   - **<50% present**: High risk, consider limiting
3. Consider:
   - First-come, first-served policy
   - Project deadlines and commitments
   - Required skill coverage
   - Seniority or special circumstances
4. Approve what team can accommodate
5. Communicate with employees needing to reschedule

**Scenario 2: Last-Minute Vacation Request**

**Policy considerations:**
- Define "advance notice" requirement (e.g., 2 weeks minimum)
- Evaluate impact on team and projects
- Distinguish emergencies from poor planning

**Approval decision:**
- ✓ Approve if: Coverage available, non-critical period
- ✗ Reject if: Critical deadline, insufficient coverage, policy violation
- 💬 Discuss if: Borderline case, may need date adjustment

**Scenario 3: Retroactive Sick Leave Approval**

**Workflow:**
- Employee returns from sick leave
- Creates sick leave entry for past dates
- Department lead approves retroactively (documents absence)
- Entry appears in past dates on calendar

**Purpose:**
- Compliance documentation
- Payroll accuracy
- Not blocking (employee already took time off)

**Scenario 4: Rejected Request Communication**

**Best practices:**
1. Provide clear, specific rejection reason
2. Suggest alternative dates if possible
3. Follow up with personal conversation (if sensitive)
4. Document decision rationale (for potential disputes)
5. Explain business context (project deadlines, coverage gaps)

### Existing Absences After Enabling Workflow

**Important:** When you first enable the approval workflow, existing absences (including past absences created before activation) will appear as **unapproved** in the absence calendar.

**Required action:**
1. Navigate to pending approvals list
2. Filter to **past** absences (dates in past)
3. **Retroactively approve** all legitimate historical absences
4. This clears the pending list

**Why:** System cannot distinguish between absences created before vs. after workflow activation.

## Timesheet Approval Workflow (Custom Implementation)

Time cockpit does not have built-in timesheet approval like absence approval, but you can implement custom workflows.

### Timesheet Approval Approaches

**Approach 1: Manual Review Process**

**Workflow:**
1. Employees mark timesheets as "Ready for Review" (custom flag)
2. Project managers/department leads review entries weekly
3. Flag as "Approved" when verified (custom flag)
4. Billing admin only invoices entries marked "Approved"

**Implementation:**
- Add custom boolean field to Timesheet entity: "Approved"
- Add custom boolean field: "Ready for Review"
- Train users on workflow

**Approach 2: List-Based Review**

**Configuration:**
1. Create saved list view: "Timesheets Pending Approval"
2. Filter:
   - **Project:** Manager's projects
   - **Approved:** False
   - **Date Range:** This week
3. Manager reviews list weekly
4. Bulk-approve via custom action or manual flag setting

**Approach 3: Action-Based Approval**

**(Advanced - Requires Scripting)**

Create custom action: "Submit Timesheet for Approval"
- Locks timesheet entries (prevent editing)
- Notifies project manager
- Sets status to "Pending Approval"

Create custom action: "Approve Timesheet"
- Available to managers only
- Sets "Approved" flag
- Notifies employee
- Entries now eligible for invoicing

**See:** [Scripting - Actions](../scripting/actions.md), [Data Model Customization](../data-model-customization/overview.md)

### Timesheet Approval Use Cases

**1. Billable Hours Verification**
- Project manager verifies hours are legitimate and billable
- Reviews descriptions for client-appropriate content
- Ensures correct projects/tasks selected
- Prevents overbilling or mis-billing

**2. Budget Compliance**
- Manager checks entries don't exceed task/project budgets
- Flags budget overruns for investigation
- Redirects time to correct budget codes

**3. Payroll Accuracy**
- Supervisor verifies overtime is authorized
- Confirms working time regulations followed
- Approves before payroll export

**4. Client Approval**
- Some contracts require client approval of hours
- Manager forwards approved timesheets to client
- Client provides sign-off before invoicing

## Approval Workflow Best Practices

### 1. Define Clear Policies

**Document policies for:**
- ✓ Advance notice requirements (vacation: 2 weeks, sick leave: same day)
- ✓ Approval turnaround time (manager responds within 24-48 hours)
- ✓ Appeal process (rejected requests can be appealed to HR)
- ✓ Blackout periods (no vacation during fiscal year-end closing)
- ✓ Capacity limits (max 30% of team absent simultaneously)

**Communicate policies:**
- Employee handbook
- Onboarding training
- Manager training
- Periodic reminders

### 2. Set Approval SLAs

**Response time expectations:**
- **Routine vacation requests**: 1-2 business days
- **Urgent requests**: Same day
- **Sick leave (retroactive)**: Weekly batch approval
- **Timesheet approval**: Weekly (before billing cycle)

**Track metrics:**
- Average approval time
- Overdue approvals (>3 days pending)
- Escalations to HR
- Employee satisfaction with approval process

### 3. Train Approvers

**Department lead training should cover:**
- How to access pending approvals
- How to review absence calendar for conflicts
- Approval criteria and policy guidelines
- Common rejection reasons
- Using rejection comments effectively
- Batch approval workflows
- Notification management

**Refresh training:**
- Annually
- When policies change
- For new department leads

### 4. Monitor Approval Backlog

**Weekly dashboard:**
- Number of pending approvals by department
- Oldest pending approval (days)
- Approvers with >10 pending requests
- Approval rate by department lead (% approved)

**Escalation triggers:**
- Pending >5 days → Notify approver
- Pending >10 days → Escalate to HR
- Approver on vacation → Delegate to backup approver

### 5. Provide Visibility

**Employee visibility:**
- Self-service status check (approved/pending/rejected)
- Estimated approval timeframe
- Reason for rejection (required field)
- Appeal process instructions

**Manager visibility:**
- Centralized pending approvals dashboard
- Team absence calendar (approved absences)
- Upcoming absence forecast (next 30/90 days)
- Historical approval patterns (for planning)

### 6. Handle Exceptions Gracefully

**Emergency absences:**
- Allow same-day sick leave entry
- Retroactive approval within 24 hours
- Flexible policy for emergencies (family, medical, etc.)

**Approval delegation:**
- When department lead is on vacation, delegate to backup
- HR admins can approve on behalf of department lead
- Document delegation in system

**Policy overrides:**
- Executives or HR can override rejections (with documentation)
- Audit trail of all overrides
- Review overrides quarterly for policy adjustments

## Business Impact & ROI

### Compliance & Risk Reduction

**Legal requirements:**
- DACH labor laws require documented absence records
- Approval trail satisfies audit requirements
- Prevents compliance fines (€2,000-€10,000 per violation)

**ROI Example:**
Avoiding one €5,000 fine pays for time cockpit for 5+ years for small team.

### Workforce Planning

**Benefits:**
- Department leads see upcoming absences before approving new requests
- Prevents understaffing scenarios
- Reduces emergency contractor hires

**ROI Example:**
20-person department preventing 3 emergency contractor hires/year (€500/day each) = **€4,500 annual savings**

### Faster Approval Cycle

**Time savings:**
- Email-based approvals: 3-7 days average
- Time cockpit approvals: Same-day or next-day

**ROI Example:**
50 employees save 2-3 hours/year on leave request follow-ups = **100-150 hours recovered**

### Reduced Payroll Errors

**Improvement:**
- Centralized absence data eliminates manual spreadsheets
- Reduces payroll errors by 80-90%

**ROI Example:**
30-person team reducing 5 payroll disputes/year (4 hours HR/Finance time each) = **20 hours saved annually**

### Improved Employee Experience

**Satisfaction factors:**
- Real-time status tracking
- Automatic notifications with approval/rejection reasons
- Written confirmation records
- Transparent, consistent process

**ROI Example:**
Improved leave management contributes to retention. Reducing turnover by 1 employee/year (replacement cost = 50-150% salary) = **€25,000-€75,000 saved**

### Audit Readiness

**Time savings:**
- HR teams save 30-40 hours during annual audits
- Instant access to approval history with timestamps, approver names, reasons
- No manual record reconstruction needed

**ROI Example:**
At €50/hour fully-loaded cost = **€1,500-€2,000 saved per audit**

## Related Features

### Employee Time Tracking
- [Absence Time Management](../employee-time-tracking/absence-time-management.md) - Vacation, sick leave, compensatory time
- [Working Time Regulations](../employee-time-tracking/working-time-regulations.md) - Compliance framework
- [Default Permissions](../employee-time-tracking/default-permissions.md) - Role-based access control

### Project Management
- [Budget Tracking](../project-time-tracking/budget-tracking.md) - Project profitability (timesheet approval supports budget control)
- [Customers, Projects & Tasks](../project-time-tracking/customer-project-task.md) - Project hierarchy

### Reporting
- [Built-In Reports](../reporting/built-in-reports.md) - Absence and timesheet reports
- [Custom Reports](../reporting/custom-reports.md) - Approval metrics dashboards

### Advanced
- [Data Model Customization](../data-model-customization/overview.md) - Custom timesheet approval fields
- [Scripting - Actions](../scripting/actions.md) - Custom approval actions and automation
- [Scripting - Triggers](../scripting/triggers.md) - Automated approval notifications

## See Also

**FAQs:**
- [Department Lead FAQ](../department-lead-faq.md) - Role-specific approval questions
- [HR Administrator FAQ](../hr-administrator-faq.md) - HR approval and policy questions
- [Employee FAQ](../employee-faq.md) - Vacation request questions

**API & Automation:**
- [Web API Overview](../web-api/overview.md) - Programmatic approval workflows
- [Scripting Overview](../scripting/overview.md) - Workflow automation

---

*For approval workflow support, contact [support@timecockpit.com](mailto:support@timecockpit.com) or see the [Department Lead FAQ](../department-lead-faq.md) and [HR Administrator FAQ](../hr-administrator-faq.md).*
