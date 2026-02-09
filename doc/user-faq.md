---
title: Time Cockpit User FAQ - Common Questions & Answers
description: Common time cockpit user questions on time tracking, projects, vacation, billing, and account settings with step-by-step answers and solutions.
keywords: [time tracking faq, timesheet questions, time cockpit help, how to track time, vacation request, create invoice, project time tracking, absence management, time entry help, billing FAQ, time cockpit guide, user questions]
---

# Time Cockpit User FAQ

This FAQ provides answers to common questions from time cockpit users. Whether you're tracking time, managing projects, requesting vacation, or creating invoices, you'll find practical step-by-step solutions here.

> [!NOTE]
> Looking for developer-specific questions about the API, data model, or customizations? See the [Developer FAQ](developer-faq.md).

## Daily Time Tracking

### How do I create a new timesheet entry?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

You can create timesheet entries using the graphical calendar interface in multiple ways:

**Method 1: Click and Drag (Day/Week View)**
1. Navigate to **Timesheet** → **Time Sheet Calendar**
2. Click in the calendar at your start time
3. Drag down to your end time
4. Release to create the entry
5. Fill in the form: description, customer, project, task (if applicable)
6. Click **Save**

**Method 2: Manual Entry**
1. In the Time Sheet Calendar, click **New Timesheet Entry** in the toolbar
2. Select the date
3. Enter begin and end time (or duration)
4. Add description and select project information
5. Click **Save**

**Duration-based vs. Time-based entries:** You can track time using specific start/end times or just enter a duration. Time-based entries help detect overlaps and gaps in your schedule.

**See Also:**
- [Working with Timesheet Entries](timesheet-calendar/working-with-timesheet-entries.md)
- [Time Sheet Calendar](timesheet-calendar/calendar.md)

---

### How do I copy timesheet entries to another day?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Copying entries saves time when you work on the same tasks across multiple days:

1. Navigate to the **Week** or **Work Week** view in the calendar
2. Select the timesheet entry you want to copy
3. Hold **Ctrl** and drag the entry to the target day and time
4. Release to create the copy
5. Adjust times and description if needed

**Alternative Method using Copy/Paste:**
1. Right-click the timesheet entry
2. Select **Copy**
3. Navigate to the target date
4. Right-click in the calendar
5. Select **Paste**

**Tip:** Use timesheet templates for recurring activities. See [Time Sheet Templates](timesheet-calendar/timesheet-templates.md) for automated copying.

**See Also:**
- [Time Sheet Calendar](timesheet-calendar/calendar.md)
- [Time Sheet Templates](timesheet-calendar/timesheet-templates.md)

---

### What's the difference between billable and non-billable time?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

The **billable** flag determines whether a timesheet entry should be invoiced to a customer:

**Billable Time (Billable = True):**
- Work that will be charged to the customer
- Appears in invoice reports
- Has hourly rate applied when creating invoices
- Examples: Client meetings, development work, consulting

**Non-Billable Time (Billable = False):**
- Internal work not charged to customers
- Excluded from invoices
- Still tracked for project analysis
- Examples: Internal meetings, training, administrative tasks

**Setting Billability:**
1. Open a timesheet entry
2. Check or uncheck the **Billable** checkbox
3. Save the entry

**Default Behavior:** When you select a project and task, billability is inherited from the task settings. You can override this per entry.

**Business Impact:** Tracking billable vs. non-billable time helps you:
- Understand project profitability
- Identify time spent on overhead
- Optimize resource allocation
- Generate accurate customer invoices

**See Also:**
- [Project Time Sheets](project-time-tracking/timesheet.md)
- [Invoicing](project-time-tracking/billing.md)

---

### How do I fix overlapping timesheet entries?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Time cockpit's graphical calendar visualizes overlaps to help you spot booking mistakes:

**Identifying Overlaps:**
- Overlapping entries appear stacked or shaded in the calendar
- Visual indicators show time conflicts

**Fixing Overlaps:**
1. **Switch to Day View** for detailed visualization
2. **Identify which entries need adjustment** - check begin/end times
3. **Adjust times by dragging:**
   - Click and drag the top or bottom edge of an entry
   - Or double-click to edit times manually
4. **Split entries if needed:**
   - If you worked on multiple tasks simultaneously, reduce duration to match actual time spent
5. **Verify no overlaps remain** - entries should not stack visually

**Common Causes:**
- Forgot to stop timer before starting new task
- Manual entry errors in begin/end times
- Copy/paste without adjusting times

**Prevention:** Use duration-based entries for tasks that don't need exact times, or stop active timers before starting new ones.

**See Also:**
- [Time Sheet Calendar](timesheet-calendar/calendar.md)
- [Working with Timesheet Entries](timesheet-calendar/working-with-timesheet-entries.md)

---

### Can I track time offline or on mobile?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

**Offline Capability:**
Time cockpit requires an internet connection for the web client. However:
- Changes are saved immediately to the cloud
- Brief connection interruptions are handled gracefully
- Desktop client (if available) may have offline capabilities

**Mobile Access:**
- Access time cockpit via mobile web browser at https://web.timecockpit.com
- Responsive design adapts to mobile screens
- Create, edit, and view timesheet entries on the go
- Full calendar functionality available

**Best Practices for Mobile:**
1. Use simplified views (Day view works best on small screens)
2. Create quick entries and add details later
3. Bookmark the web app on your home screen for quick access

**See Also:**
- [Web Client](getting-started/web-client.md)

---

### How do I use timesheet templates?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Timesheet templates automate recurring time entries, saving you time on repetitive tasks:

**Creating a Template:**
1. Navigate to **Timesheet** → **Time Sheet Templates**
2. Click **New**
3. Fill in the template details:
   - **Description** (e.g., "Daily Standup")
   - **Duration** or **Begin/End Time**
   - **Customer, Project, Task** (if applicable)
   - **Recurrence pattern** (daily, weekly, specific days)
4. Click **Save**

**Applying Templates:**
Templates can be applied automatically or manually:
- **Automatic:** Configure templates to create entries on schedule
- **Manual:** Select a template and apply it to specific dates

**Use Cases:**
- Daily standup meetings
- Weekly status reports
- Recurring client check-ins
- Regular administrative tasks

**Tip:** Templates save the structure but you can adjust individual entries after creation (e.g., change duration or add notes).

**See Also:**
- [Time Sheet Templates](timesheet-calendar/timesheet-templates.md)
- [Working with Timesheet Entries](timesheet-calendar/working-with-timesheet-entries.md)

---

## Project Management

### How do I set up a new customer and project?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Time cockpit organizes work using a three-level hierarchy: **Customer → Project → Task**

**Creating a Customer:**
1. Navigate to **Management** → **Customers**
2. Click **New**
3. Fill in customer details:
   - **Customer Name** (required)
   - **Customer Number** (optional, for invoicing)
   - **Contact information**
   - **Billing address**
4. Click **Save**

**Creating a Project:**
1. Navigate to **Management** → **Projects**
2. Click **New**
3. Fill in project details:
   - **Project Name** (required)
   - **Customer** (select from dropdown)
   - **Project Code** (optional identifier)
   - **Budget** (hours or amount, if tracking budget)
   - **Begin/End Date** (project timeline)
4. Click **Save**

**Creating Tasks (Optional):**
1. Navigate to **Management** → **Tasks**
2. Click **New**
3. Fill in task details:
   - **Task Name** (e.g., "Development", "Meeting", "Analysis")
   - **Project** (select parent project)
   - **Default Billable** flag
   - **Hourly Rate** (if different from project default)
4. Click **Save**

**Hierarchy Example:**
```
Customer: Acme Corp
  └─ Project: Website Redesign
      ├─ Task: Design
      ├─ Task: Development
      └─ Task: Testing
```

**See Also:**
- [Customers, Projects & Tasks](project-time-tracking/customer-project-task.md)
- [Project Time Sheets](project-time-tracking/timesheet.md)

---

### How do I track time against project budgets?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Budget tracking helps you monitor project progress and avoid cost overruns:

**Setting Up Project Budgets:**
1. Open the **Project** you want to budget
2. Set budget type:
   - **Hour Budget:** Total hours allocated to project
   - **Amount Budget:** Total dollar value allocated
3. Enter budget values
4. Save the project

**Tracking Budget Consumption:**
1. Navigate to **Management** → **Projects**
2. View the **Budgetary Control** list
3. Columns show:
   - **Planned Budget** (original allocation)
   - **Actual Time/Cost** (tracked so far)
   - **Remaining Budget**
   - **% Consumed**
   - **Forecast** (projected completion)

**Visual Indicators:**
- Green: Under budget, on track
- Yellow: Approaching budget limit (typically 80-90%)
- Red: Over budget or projected overrun

**Task-Level Budgets:**
You can also set budgets on individual tasks within a project for granular control.

**Best Practices:**
- Review budgets weekly during project execution
- Set up alerts for budget thresholds (requires customization)
- Track non-billable time separately to understand true project cost
- Use budgets for planning future similar projects

**See Also:**
- [Customers, Projects & Tasks](project-time-tracking/customer-project-task.md)
- [Budgetary Control Use Case](use-cases/budgetary-control.md) (Developer documentation)

---

### How do I see all time tracked for a specific project?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

View project time using the report and list features:

**Method 1: Timesheet List Filtered by Project**
1. Navigate to **Timesheet** → **Time Sheets**
2. Click the **Filter** icon in the toolbar
3. Select **Project** filter
4. Choose your project from the dropdown
5. Click **Apply**

The list now shows all timesheet entries for that project with:
- User who tracked the time
- Date and duration
- Task and description
- Billable status
- Hourly rates

**Method 2: Project Details View**
1. Navigate to **Management** → **Projects**
2. Find and open your project
3. Scroll to the **Time Sheets** section (related records)
4. View all associated timesheet entries

**Method 3: Built-in Reports**
1. Navigate to **Reporting**
2. Select a project-focused report such as:
   - **Project Time by Employee**
   - **Project Summary Report**
   - **Billable vs. Non-Billable Time by Project**
3. Filter to your specific project
4. Generate the report

**Export Options:**
- Export filtered lists to Excel for further analysis
- Print reports for stakeholder meetings
- Use the Web API to integrate with external tools

**See Also:**
- [Project Time Sheets](project-time-tracking/timesheet.md)
- [Built-In Reports](reporting/built-in-reports.md)
- [Data Export](data-exchange/export.md)

---

### How do I assign hourly rates to projects and tasks?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Hourly rates determine billing amounts when you create invoices:

**Rate Hierarchy:**
Time cockpit uses a cascading rate system:
1. **Task-specific rate** (highest priority)
2. **Project default rate**
3. **User/Employee rate**
4. **Company default rate** (lowest priority)

**Setting Project-Level Rates:**
1. Navigate to **Management** → **Projects**
2. Open the project
3. Set **Default Hourly Rate** field
4. Save

**Setting Task-Level Rates:**
1. Navigate to **Management** → **Tasks**
2. Open the task
3. Set **Hourly Rate** field (overrides project rate)
4. Save

**Setting User/Employee Rates:**
1. Navigate to **User** → **User Details**
2. Open the employee record
3. Set **Default Hourly Rate**
4. Save

**When Rates Are Applied:**
- Timesheet entries inherit the rate based on the hierarchy above
- Rates are stored in the **Hourly Rate Actual** field on each timesheet entry
- When creating invoices, the rate is copied to **Hourly Rate Billed**
- You can manually override rates on individual entries if needed

**Multiple Rates for Different Roles:**
Some organizations need different rates for the same person on different tasks (e.g., senior developer rate vs. training rate). Use task-level rates for this scenario.

**See Also:**
- [Customers, Projects & Tasks](project-time-tracking/customer-project-task.md)
- [Invoicing](project-time-tracking/billing.md)
- [Invoice Data Fields](project-time-tracking/invoice-data-fields.md)

---

## Vacation & Absence

### How do I request vacation time?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Vacation requests follow an approval workflow in time cockpit:

**Submitting a Vacation Request:**
1. Navigate to **User** → **Vacation**
2. Click **New**
3. Fill in the vacation details:
   - **User Detail:** Your name (pre-filled)
   - **Begin Date:** First day of vacation
   - **End Date:** Last day of vacation
   - **Vacation Type:** Full day, half day AM, half day PM
   - **Description:** Optional notes (e.g., "Family trip")
4. Click **Save**

**Approval Process:**
- Your request is visible to your department lead or HR administrator
- They review and approve/reject the request
- You receive notification when status changes
- Approved vacations appear in the calendar view

**Vacation Balance:**
Your current vacation entitlement and balance are visible in:
- **User** → **User Details** → Your record → Vacation balance fields
- Vacation list shows consumed vs. remaining days

**Calendar Visualization:**
Approved vacation time appears in the Time Sheet Calendar as colored blocks, preventing time entry conflicts.

**See Also:**
- [Absence Time Management](employee-time-tracking/absence-time-management.md)
- [Default Permissions](employee-time-tracking/default-permissions.md)

---

### What's the difference between vacation and sick leave?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Time cockpit treats these as separate tracked entities with different rules:

**Vacation (APP_Vacation):**
- **Planned absence** - known in advance
- **Consumes vacation balance** - deducted from annual entitlement
- **Requires approval** before taking time off
- **Scheduled** - has begin/end dates
- Examples: Annual leave, personal days, holiday time

**Sick Leave (APP_SickLeave):**
- **Unplanned absence** - occurs when you're ill
- **Does not consume vacation balance** - tracked separately
- **May require approval** after the fact (depending on company policy)
- **Reported retroactively** - entered after absence
- May require doctor's note for extended periods

**Compensatory Time Off (APP_CompensatoryTime):**
A third absence type for time off earned by working extra hours:
- Earned through overtime
- Acts like vacation (planned, requires approval)
- Separate balance from vacation

**Tracking in Calendar:**
All absence types appear in your Time Sheet Calendar with different visual indicators, blocking time entry during those periods.

**Approval Workflows:**
- Vacation: Approved before absence
- Sick Leave: Typically approved after return
- Compensatory Time: Approved before use (after being earned)

**See Also:**
- [Absence Time Management](employee-time-tracking/absence-time-management.md)
- [Working Time / Leave Management](employee-time-tracking/working-time.md)

---

### How do I check my vacation balance?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Your vacation balance shows entitlement, used days, and remaining days:

**Viewing Your Balance:**
1. Navigate to **User** → **User Details**
2. Find and open your user record
3. Look for vacation-related fields:
   - **Yearly Vacation Entitlement:** Total days per year
   - **Vacation Used:** Days consumed so far this year
   - **Vacation Remaining:** Available balance
   - **Vacation Carried Forward:** Unused days from previous year (if applicable)

**Alternative: Vacation List View**
1. Navigate to **User** → **Vacation**
2. The list shows all your vacation entries with status
3. Summary totals may appear at the bottom (if configured)

**Balance Calculation:**
```
Remaining = Entitlement + Carried Forward - Used - Pending Approved
```

**Important Notes:**
- Balance updates when vacation requests are **approved**, not when created
- Pending requests are shown separately
- Some organizations have expiration dates for carried-forward vacation
- Part-time employees may have prorated entitlements

**Fiscal Year vs. Calendar Year:**
Your organization may track vacation by fiscal year instead of calendar year. Check with HR for your company's policy.

**See Also:**
- [Absence Time Management](employee-time-tracking/absence-time-management.md)
- [Working Time / Leave Management](employee-time-tracking/working-time.md)

---

### How long does vacation approval take?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Approval timing depends on your organization's workflow and who has approval permissions:

**Typical Approval Workflow:**
1. **You submit** vacation request
2. **Department Lead reviews** - receives notification
3. **Approval/Rejection** - usually within 1-3 business days
4. **You're notified** of the decision

**Who Can Approve:**
By default, these roles can approve vacation:
- **Department Leads:** Can approve for their department members
- **HR Administrators:** Can approve for all employees

**Checking Approval Status:**
1. Navigate to **User** → **Vacation**
2. Find your request in the list
3. Check the **Approved** column:
   - Checkmark = Approved
   - Empty = Pending
   - X or "Rejected" = Denied

**Approved Timestamp:**
The **Approved Timestamp** field shows exactly when it was approved and the **Approver** field shows who approved it.

**Best Practices:**
- Submit requests well in advance (2+ weeks for planned vacation)
- Add notes explaining urgent requests
- Follow up with your lead if no response after 2-3 days
- Check company policies for required notice periods

**See Also:**
- [Absence Time Management](employee-time-tracking/absence-time-management.md)
- [Default Permissions](employee-time-tracking/default-permissions.md)

---

## Billing & Invoicing

### How do I create an invoice from timesheet entries?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Time cockpit's invoicing workflow converts billable timesheet entries into customer invoices:

**Prerequisites:**
- Timesheet entries must have:
  - Customer and Project assigned
  - Billable flag set to True
  - Not already billed (Billed = False)
  - Hourly rates configured

**Creating an Invoice:**
1. Navigate to **Timesheet** → **Time Sheets**
2. **Filter to unbilled entries:**
   - Click Filter icon
   - Set **Billed = False** and **Billable = True**
   - Optionally filter by Customer, Project, or date range
3. **Select timesheet entries** to include in the invoice
4. Click **Create Invoice** action in the toolbar
5. **Review invoice details:**
   - Customer information
   - Project
   - Line items (timesheet entries)
   - Total hours
   - Total amount (hours × hourly rates)
6. **Set invoice metadata:**
   - Invoice number
   - Invoice date
   - Due date
   - Payment terms
7. Click **Save**

**What Happens:**
- Selected timesheet entries are marked as **Billed = True**
- Entries are linked to the invoice (APP_Invoice field populated)
- **Hourly Rate Billed** is set (locked for historical accuracy)
- Invoice is ready for export or printing

**See Also:**
- [Invoicing](project-time-tracking/billing.md)
- [Invoice Data Fields](project-time-tracking/invoice-data-fields.md)
- [Project Time Sheets](project-time-tracking/timesheet.md)

---

### Can I edit timesheet entries after they've been billed?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

**Short Answer:** You can edit some fields, but billing-related fields are typically locked for audit compliance.

**Editable After Billing:**
- **Description:** You can update entry descriptions
- **Internal Notes:** Add notes for documentation
- **Tags/Categories:** If your data model has custom fields

**Locked After Billing:**
- **Duration/Begin/End Time:** Cannot change hours already invoiced
- **Hourly Rate Billed:** Locked to preserve invoice accuracy
- **Project/Task Assignment:** Cannot reassign billed entries
- **Billable Flag:** Cannot change from True to False

**Why Fields Are Locked:**
- **Audit Trail:** Invoices and timesheets must match for accounting
- **Legal Compliance:** Prevents retroactive billing changes
- **Financial Accuracy:** Ensures invoice totals remain correct

**If You Need Changes:**
1. **For minor corrections:** Contact your billing administrator
2. **For significant errors:** May require:
   - Unassigning the invoice (advanced action, admin-only)
   - Creating a credit note or adjustment invoice
   - Proper documentation of the change

**Best Practice:**
Review timesheet entries carefully **before** creating invoices to avoid locked-in errors.

**See Also:**
- [Invoicing](project-time-tracking/billing.md)
- [Invoice Data Fields](project-time-tracking/invoice-data-fields.md)

---

### How do I export invoice data to my accounting system?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Time cockpit provides multiple export options for integrating with accounting software:

**Method 1: Excel Export**
1. Navigate to **Management** → **Invoices**
2. Select the invoices you want to export
3. Click **Export to Excel** in the toolbar
4. Open the Excel file
5. Import into your accounting system (varies by software)

**Method 2: CSV Export for Batch Import**
1. Navigate to **Invoices** list
2. Filter to the invoices needed (e.g., by date range, customer)
3. Use **Export** action
4. Select **CSV** format
5. Map CSV columns to your accounting system's import template

**Method 3: Web API Integration (Automated)**
For ongoing automated sync:
- Use the time cockpit Web API to query invoice data
- Set up scheduled jobs to pull new invoices
- Transform data to your accounting system's format
- Post via your accounting system's API

**Available Invoice Data:**
- Invoice number and date
- Customer information (name, address, tax ID)
- Line items (description, quantity/hours, rate, amount)
- Subtotals, tax amounts, total amount
- Payment terms and due date

**Common Accounting Systems:**
- **QuickBooks:** Export to CSV, import via QuickBooks import tool
- **Xero:** Use Excel export, import invoices via Xero
- **DATEV (Germany):** Export to DATEV-compatible CSV format
- **Custom ERP:** Use Web API for direct integration

**See Also:**
- [Data Export](data-exchange/export.md)
- [Web API Overview](web-api/overview.md) (for developers)
- [Invoice Data Fields](project-time-tracking/invoice-data-fields.md)

---

### How do I handle partially billed projects?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Many projects span multiple billing periods or milestones, requiring partial invoicing:

**Scenario:** You have 100 hours tracked on a project, but only want to invoice 40 hours this month.

**Approach 1: Filter by Date Range**
1. Navigate to **Timesheet** → **Time Sheets**
2. Filter timesheet entries:
   - **Project** = Your project
   - **Billable** = True
   - **Billed** = False
   - **Date Range** = This month only
3. Select the filtered entries
4. Run **Create Invoice** action

**Approach 2: Manual Selection**
1. Navigate to **Timesheet** → **Time Sheets**
2. Filter to your project's unbilled entries
3. **Manually select** specific entries to invoice (Ctrl+Click)
4. Run **Create Invoice** action on selection

**Approach 3: Milestone-Based Billing**
1. Organize tasks by milestone or deliverable
2. Filter timesheet entries by task
3. Invoice complete tasks/milestones at a time

**Tracking What's Been Billed:**
- The **Billed** flag shows which entries are invoiced
- The **Invoice** relation links entries to specific invoices
- Unbilled hours are clearly visible in the project budget view

**Time & Materials vs. Fixed Price:**
- **Time & Materials:** Bill all tracked hours → use date range filtering
- **Fixed Price:** Bill milestone amounts → may involve manual adjustments or retainer entries

**See Also:**
- [Invoicing](project-time-tracking/billing.md)
- [Project Time Sheets](project-time-tracking/timesheet.md)

---

## Account & Settings

### How do I change my password?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

**For Azure AD / Microsoft 365 Authentication:**
If your organization uses Azure AD (Microsoft 365) for time cockpit login:
1. Password changes are managed through Microsoft
2. Go to https://account.microsoft.com
3. Sign in with your work account
4. Navigate to **Security** → **Password**
5. Follow Microsoft's password change process

Changes take effect immediately for time cockpit login.

**For Time Cockpit-Specific Accounts:**
If you have a time cockpit-specific login (less common):
1. Contact your time cockpit administrator
2. They can reset your password through **User** → **User Details**
3. You'll receive a password reset email

**Best Practices:**
- Use a strong, unique password (12+ characters, mixed case, numbers, symbols)
- Enable multi-factor authentication (MFA) if available
- Don't share your password with colleagues
- Change password if you suspect compromise

**See Also:**
- [Account Management](account-management/account-management.md)
- [Web Client](getting-started/web-client.md)

---

### How do I customize which columns appear in lists?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Time cockpit lists are highly customizable to show the data most relevant to you:

**Customizing Column Display:**
1. Navigate to any list (e.g., **Timesheet** → **Time Sheets**)
2. Right-click on any column header
3. Select **Column Chooser**
4. A panel appears with available columns
5. **Add columns:**
   - Drag column names from the chooser to the header row
6. **Remove columns:**
   - Drag column headers back to the chooser
7. **Reorder columns:**
   - Drag headers left/right to reorder
8. **Resize columns:**
   - Drag column border to adjust width

**Saving Your View:**
- Changes are saved automatically per user
- Your customization persists across sessions
- Different lists have independent column configurations

**Column Options:**
- Standard fields (begin time, end time, duration, description)
- Project information (customer, project, task)
- Billing data (billable, billed, hourly rates, amounts)
- Custom fields (if your data model has custom properties)

**Sorting and Grouping:**
- Click column header to sort ascending/descending
- Drag column to the grouping area (top of list) to group by that field

**Reset to Default:**
Right-click column header → **Reset Column Layout**

**See Also:**
- [Standard Print View](reporting/standard-print-view.md)

---

### Can I change the language/culture settings?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Time cockpit supports multiple languages and regional formats:

**Changing Your Language:**
1. Navigate to **User** → **User Details**
2. Open your user record
3. Find the **Culture Info** field
4. Select your preferred language/culture:
   - English (US): en-US
   - English (UK): en-GB
   - German (Germany): de-DE
   - German (Austria): de-AT
   - German (Switzerland): de-CH
5. Click **Save**
6. **Log out and log back in** for changes to take effect

**What Changes:**
- **Interface Language:** Menus, buttons, labels
- **Date Format:** MM/DD/YYYY (US) vs. DD.MM.YYYY (Europe)
- **Time Format:** 12-hour vs. 24-hour clock
- **Number Format:** Decimal separator (. vs. ,)
- **Currency Symbol:** $, €, CHF, etc.

**Regional Settings:**
Culture settings also affect:
- First day of week (Sunday vs. Monday)
- Working time regulations (if region-specific)
- Public holidays (country-specific calendars)

**Note:** Some content (like help documentation) may only be available in English.

**See Also:**
- [Account Management](account-management/account-management.md)
- [Working Time Regulations](employee-time-tracking/working-time-regulations.md)

---

## Need More Help?

If you didn't find the answer to your question, try these resources:

### Role-Specific FAQs
- [Project Manager FAQ](project-manager-faq.md) - Budget tracking, team time, invoicing
- [HR Administrator FAQ](hr-administrator-faq.md) - Vacation policies, absence approval, employee management
- [Department Lead FAQ](department-lead-faq.md) - Team oversight, absence approval
- [Billing Administrator FAQ](billing-admin-faq.md) - Invoice creation, rates, billing reports
- [Employee FAQ](employee-faq.md) - Basic time entry, vacation requests, mobile usage

### Documentation
- [For Users - Full Documentation](for-users.md)
- [For Developers - API & Customization](for-developers.md)
- [Developer FAQ](developer-faq.md)

### Support
- **Email:** support@timecockpit.com
- **Knowledge Base:** Browse the full documentation
- **Training:** Request customized training sessions

---

*This FAQ is regularly updated. Last updated: February 2026.*
