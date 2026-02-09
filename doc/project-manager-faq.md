---
title: Project Manager FAQ - Budget Tracking & Team Time
description: Project manager FAQ for time cockpit: tracking budgets, monitoring team time, managing billable hours, and ensuring project profitability.
keywords: [project manager time tracking, project budget tracking, team time management, billable hours report, project profitability, budget monitoring, project time overview, resource allocation, milestone tracking, project invoicing, team productivity]
---

# Project Manager FAQ

This FAQ addresses common questions from project managers using time cockpit to track project budgets, monitor team time, ensure billing accuracy, and maintain project profitability.

> [!TIP]
> **New to Project Time Tracking?** Learn how time cockpit helps you [boost project profitability](https://www.timecockpit.com/blog/benefits-of-project-time-tracking/) and track [essential project KPIs](https://www.timecockpit.com/blog/project-timetracking-kpis/). Explore our [Project Time Tracking features](https://www.timecockpit.com/features/project-time-tracking/).

> [!NOTE]
> For general time tracking questions, see the [User FAQ](user-faq.md). For developer/API questions, see the [Developer FAQ](developer-faq.md).

## Budget Tracking & Planning

### How do I set up project budgets to track hours and costs?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Effective budget tracking starts with proper project configuration:

**Setting Hour-Based Budgets:**
1. Navigate to **Management** → **Projects**
2. Open your project (or create new)
3. Set budget fields:
   - **Planned Duration (Hours):** Total hours budgeted
   - **Budget Type:** Hour-based
4. Click **Save**

**Setting Cost-Based Budgets:**
1. In the project record, set:
   - **Planned Revenue:** Total budget amount
   - **Budget Type:** Amount-based
2. Ensure hourly rates are configured for accurate cost tracking
3. Click **Save**

**Task-Level Budgets (Granular Control):**
1. Navigate to **Management** → **Tasks**
2. For each task, set:
   - **Planned Duration:** Hours allocated to this specific task
   - **Planned Revenue:** Amount allocated (optional)
3. Save each task

**Budget Monitoring:**
View budget consumption in the **Budgetary Control** list:
- Navigate to **Management** → **Projects** → Select list view **Budgetary Control**
- Columns show:
  - **Planned vs. Actual:** Compare budgeted vs. tracked hours/costs
  - **Remaining:** Hours/budget still available
  - **% Consumed:** Progress indicator
  - **Forecast:** Projected final hours/costs based on current trend

**Visual Indicators:**
- **Green:** On track, under budget
- **Yellow:** Approaching limit (typically 80-90%)
- **Red:** Over budget or projected overrun

**See Also:**
- [Customers, Projects & Tasks](project-time-tracking/customer-project-task.md)
- [Budgetary Control Use Case](use-cases/budgetary-control.md)
- [Project Time Sheets](project-time-tracking/timesheet.md)

---

### How can I see which team members are tracking time to my projects?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Monitor team activity across your projects to understand resource allocation:

**Method 1: Project-Filtered Timesheet List**
1. Navigate to **Timesheet** → **Time Sheets**
2. Apply filters:
   - **Project:** Select your project
   - **Date Range:** This week/month/custom
3. View the list showing:
   - **User Detail:** Who tracked the time
   - **Duration:** Hours per entry
   - **Task:** What they worked on
   - **Description:** Activity details

**Method 2: Group by User**
1. In the timesheet list (filtered to your project)
2. Drag the **User Detail** column to the grouping area (top of list)
3. Entries are now grouped by team member
4. Each group shows subtotals of hours per person

**Method 3: Built-In Reports**
1. Navigate to **Reporting** → **Built-In Reports**
2. Select **Project Time by Employee** report
3. Filter to your project
4. Generate report showing:
   - Hours per team member
   - Breakdown by task
   - Billable vs. non-billable time
   - Daily/weekly trends

**Method 4: Project Details Related Records**
1. Navigate to **Management** → **Projects**
2. Open your project
3. Scroll to **Time Sheets** tab/section
4. View all timesheet entries with user information

**Understanding Team Allocation:**
- **Active Contributors:** Team members with recent entries
- **Time Distribution:** See if work is balanced or concentrated
- **Task Coverage:** Identify which tasks have attention
- **Productivity Patterns:** Weekly trends and peak activity days

**See Also:**
- [Project Time Sheets](project-time-tracking/timesheet.md)
- [Built-In Reports](reporting/built-in-reports.md)
- [Customers, Projects & Tasks](project-time-tracking/customer-project-task.md)

---

### How do I track actual costs versus billable amounts?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Understanding project profitability requires tracking both your internal costs and what you bill to customers:

**Key Concepts:**
- **Actual Cost:** What you pay the employee (internal cost rate)
- **Billable Amount:** What you charge the customer (billable hourly rate)
- **Margin:** Difference between billable amount and actual cost

**Timesheet Entry Fields:**
Each timesheet entry has:
- **Hourly Rate Actual:** Internal cost rate (what it costs you)
- **Hourly Rate Billed:** Customer rate (what you charge)
- **Duration:** Hours worked
- **Total Cost:** Duration × Actual rate
- **Total Billable:** Duration × Billed rate

**Setting Up Dual Rates:**

**Employee/User Cost Rate:**
1. Navigate to **User** → **User Details**
2. Open employee record
3. Set **Default Hourly Rate:** Their internal cost rate
4. Save

**Project/Task Billable Rate:**
1. Navigate to **Management** → **Projects** or **Tasks**
2. Set **Hourly Rate:** Customer billing rate
3. Save

**When to Use Each:**
- **Hourly Rate Actual** = Employee salary cost (for profitability analysis)
- **Hourly Rate Billed** = Customer invoice rate (for revenue tracking)

**Profitability Analysis:**

**Option 1: Manual Calculation**
```
Margin = Total Billable - Total Cost
Margin % = (Margin / Total Billable) × 100
```

**Option 2: Custom Report**
Create a report showing:
- Sum of (Duration × Hourly Rate Actual) = Total Internal Cost
- Sum of (Duration × Hourly Rate Billed) = Total Revenue
- Difference = Project Profit

**Option 3: Project Summary View**
1. Navigate to **Management** → **Projects**
2. View columns (if configured):
   - **Total Actual Cost**
   - **Total Billable Amount**
   - **Margin**
   - **Margin %**

**Business Impact:**
- Identify profitable vs. unprofitable projects
- Optimize resource allocation (assign junior staff where margins allow)
- Adjust pricing for future projects
- Spot scope creep through budget variance

**See Also:**
- [Project Time Sheets](project-time-tracking/timesheet.md)
- [Invoice Data Fields](project-time-tracking/invoice-data-fields.md)
- [Built-In Reports](reporting/built-in-reports.md)

---

### How can I forecast project completion based on current velocity?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Project forecasting helps predict completion dates and budget overruns before they happen:

**Using Budgetary Control Forecast:**
1. Navigate to **Management** → **Projects** → **Budgetary Control** view
2. Review forecast columns:
   - **Forecast Hours:** Projected total hours at current pace
   - **Forecast Duration:** Estimated completion time
   - **Budget Variance:** Difference between planned and forecast

**Forecast Calculation Method:**
Time cockpit calculates forecasts using:
```
Forecast = (Actual Hours / % Project Complete) 
        or
Forecast = (Actual Hours / Days Elapsed) × Total Project Days
```

**Example:**
- **Planned Budget:** 100 hours
- **50% complete** 
- **Actual Hours:** 60 hours
- **Forecast:** 60 / 0.5 = **120 hours** (20 hours over budget)

**Manual Velocity Calculation:**
1. Calculate hours per week: Total Actual Hours / Weeks Elapsed
2. Calculate remaining weeks: Remaining Hours / Hours per Week
3. Projected completion: Current Date + Remaining Weeks

**Early Warning Signs:**
- **Forecast > Planned Budget:** Project will exceed budget at current pace
- **Velocity decreasing:** Team is slowing down (complexity, blockers)
- **Non-billable time increasing:** Overhead growing

**Adjusting to Stay on Budget:**
1. **Reduce scope:** Cut non-essential features
2. **Increase efficiency:** Remove blockers, improve processes
3. **Add resources:** More team members (if budget allows)
4. **Renegotiate:** Discuss budget increase with customer

**Regular Review Cadence:**
- **Weekly:** For short projects (< 3 months)
- **Bi-weekly:** For medium projects (3-6 months)
- **Monthly:** For long projects (6+ months)

**See Also:**
- [Budgetary Control Use Case](use-cases/budgetary-control.md)
- [Customers, Projects & Tasks](project-time-tracking/customer-project-task.md)
- [Built-In Reports](reporting/built-in-reports.md)

---

### How do I prevent team members from exceeding task budgets?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Budget enforcement requires a combination of visibility, communication, and optional technical controls:

**Approach 1: Visibility & Monitoring (Recommended)**
1. **Set task-level budgets** in [Management → Tasks](https://web.timecockpit.com/app/lists/APP_DefaultTaskList)
2. **Communicate budgets** to team members
3. **Monitor regularly:**
   - Weekly budget review meetings
   - Share Budgetary Control reports with team
   - Flag tasks approaching limits

**Approach 2: Proactive Notifications**
Set up alerts when tasks approach budget limits:
- Requires customization (scripting or workflows)
- Example: Send email when task reaches 80% budget
- Notify both team member and project manager

**Approach 3: Permission-Based Controls (Advanced)**
Use permissions to restrict time entry when budgets are exceeded:
- Requires data model customization
- Create validation rules on timesheet entries
- Block saves when task budget is exceeded
- Requires manager override for legitimate overages

**Best Practice Workflow:**
1. **Planning Phase:**
   - Set realistic task budgets
   - Communicate budgets to assignees
   - Explain the "why" behind budget constraints

2. **Execution Phase:**
   - Daily standup: Team reports hours spent
   - Mid-task check-in at ~50% budget consumed
   - Visual dashboards showing budget consumption

3. **Variance Management:**
   - When approaching limit: Assess remaining work
   - Request budget increase if needed (with justification)
   - Or reduce task scope to fit budget

**Cultural Approach:**
Rather than rigid controls, foster budget awareness:
- Make budgets visible in task descriptions
- Celebrate teams that deliver under budget
- Discuss budget variances in retrospectives
- Treat budgets as planning tools, not punishment

**Technical Enforcement (If Needed):**
Add calculated field to timesh entry form showing:
- "Task Budget: 20h | Used: 18h | Remaining: 2h"
- Visual warning when approaching limit
- Require manager approval for entries exceeding budget

**See Also:**
- [Customers, Projects & Tasks](project-time-tracking/customer-project-task.md)
- [Budgetary Control Use Case](use-cases/budgetary-control.md)
- [Data Model Customization](data-model-customization/entity.md)

---

## Team Time Management

### How can I see my team's daily/weekly time summary?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Get quick overviews of team time tracking for standups, status reports, and capacity planning:

**Daily Summary:**
1. Navigate to **Timesheet** → **Time Sheets**
2. Apply filters:
   - **Date:** Today (or specific date)
   - **User Detail:** If filtering to your team, use user filter or department filter
3. **Group by User Detail** (drag column to grouping area)
4. View collapsed groups showing total hours per person

**Weekly Summary:**
1. Same as above, but set **Date Range:** This week or specific week
2. Group by **User Detail**
3. Optionally add secondary grouping by **Date** to see daily breakdown within the week

**Built-In Report Method:**
1. Navigate to **Reporting** → **Built-In Reports**
2. Select **Time by User and Date** report (or similar)
3. Set date range
4. Filter to your team (department, project, or individual users)
5. Generate report

**Calendar View for Team:**
1. Navigate to **Timesheet** → **Time Sheet Calendar**
2. Use **User Selection** dropdown to switch between team members
3. Manually review each person's calendar
4. Note: Limited multi-user view in calendar

**Custom Dashboard (Advanced):**
Create a customized list or form showing:
- Team member names
- Total hours per day/week
- Breakdown by project
- Absence indicators (vacation, sick leave)

**Use Cases:**
- **Daily Standup:** Quick overview of yesterday's hours
- **Weekly Status:** Report to stakeholders on team utilization
- **Capacity Planning:** Identify underutilized or overloaded team members
- **Absence Coverage:** See who's available vs. on vacation

**Exporting Summaries:**
- Export filtered list to Excel
- Create pivot tables for deeper analysis
- Share with stakeholders or other teams

**See Also:**
- [Built-In Reports](reporting/built-in-reports.md)
- [Time Sheet Calendar](timesheet-calendar/calendar.md)
- [Standard Print View](reporting/standard-print-view.md)

---

### Can I see if team members are tracking enough hours per project?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Monitor team contribution levels to ensure projects are adequately staffed and effort is distributed appropriately:

**Project Hours by Team Member:**
1. Navigate to **Reporting** → **Built-In Reports**
2. Select **Project Time by Employee** report
3. Filter to your project
4. Set date range (week, month, or project-to-date)
5. Review hours per team member

**Analyzing the Results:**
- **Total Hours:** Overall project contribution
- **Weekly Average:** Hours per week per person
- **Distribution:** Is workload balanced?
- **Trends:** Increasing or decreasing contribution over time?

**Expected vs. Actual Hours:**
Compare tracked hours against planned allocation:

**Example Analysis:**
```
Project Plan: 40 hours/week total, 4 team members = 10h each
Actual Tracking:
- Alice: 12h/week (120% of plan)
- Bob: 8h/week (80% of plan)
- Carol: 15h/week (150% of plan) ← Potential overwork
- Dave: 5h/week (50% of plan) ← Underutilized
```

**Common Issues & Causes:**

**Undertracking (Low Hours):**
- Team member on multiple projects (time split elsewhere)
- Vacation or absence
- Ramping up (new team member)
- Forgetting to track time accurately
- Blocked or waiting on dependencies

**Overtracking (Excess Hours):**
- Taking on extra work to meet deadlines
- Inefficiency or scope creep
- Working overtime (check for burnout risk)
- Time entry errors (duplicates, wrong project)

**Action Steps:**

**For Undertracking:**
1. One-on-one discussion: Understand barriers
2. Check other project commitments
3. Adjust allocation or project plan
4. Provide training if time tracking is inconsistent

**For Overtracking:**
1. Review workload and deadlines
2. Assess if scope has expanded unexpectedly
3. Consider adding resources or extending timeline
4. Monitor for burnout or quality issues

**Balanced Team Metrics:**
Track overall team health:
- **Utilization Rate:** (Tracked Hours / Available Hours) × 100
- **Project Capacity:** Total team hours available vs. required
- **Velocity:** Hours tracked per sprint/iteration

**See Also:**
- [Project Time Sheets](project-time-tracking/timesheet.md)
- [Built-In Reports](reporting/built-in-reports.md)
- [Time Report](employee-time-tracking/time-report.md)

---

### How do I handle team members who forget to track time?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Consistent time tracking is essential for accurate project management. Here's how to encourage and enforce it:

**Prevention Strategies:**

**1. Set Clear Expectations**
- Communicate time tracking policy during onboarding
- Explain **why** accurate tracking matters (billing, planning, fairness)
- Define **when** to track: daily, real-time, end-of-week deadlines
- Specify **what** to track: all work time, including meetings and admin

**2. Make Tracking Easy**
- Train team on calendar shortcuts and efficient workflows
- Suggest timesheet templates for recurring activities
- Enable Outlook integration to pre-populate entries
- Provide quick reference guides

**3. Build Habits**
- Set daily reminders (end-of-day notification)
- Integrate into standup: "Did everyone log yesterday's time?"
- Create team accountability (public dashboards showing completion)

**Detection Methods:**

**Identify Missing Time Entries:**
1. Navigate to **Employee Time Tracking** → **Time Report**
2. Filter to your team and current week
3. Look for:
   - **Days with < 8 hours** tracked (assuming full-time)
   - **Empty days** (no entries)
   - **Gaps** in time sheet calendar visualization

**Automated Detection (Requires Customization):**
- Create a report showing "Users with < 40 hours this week"
- Schedule weekly emails to managers listing incomplete timesheets
- Use data model triggers to flag missing entries

**Corrective Actions:**

**Individual Follow-Up:**
1. Send friendly reminder: "I noticed you haven't logged time for Tuesday"
2. Ask if there were issues: technical problems, forgotten, on vacation?
3. Request retroactive entry with accurate information
4. Reinforce importance for project tracking

**Recurring Issues:**
1. **One-on-one discussion:** Understand root cause
   - Is the process unclear?
   - Is it seen as busywork?
   - Are there technical barriers?
2. **Provide support:**
   - Extra training session
   - Simplified templates
   - Buddy system with diligent tracker
3. **Set consequences (if policy-based):**
   - Link to performance reviews
   - Require manager approval for late entries
   - Escalate to HR if persistent non-compliance

**Team-Wide Improvements:**
- Share metrics: "Team is at 95% time tracking completion this month!"
- Gamification: Recognize consistent trackers
- Retrospectives: Discuss time tracking pain points and solve together

**Time Reconstruction:**
When entries are missing, use supporting data:
- **Outlook Calendar:** Meeting blocks indicate time spent
- **Signal Tracker:** Activity logs show PC usage patterns (if enabled)
- **Project Notes:** Documentation provides clues to work done
- **Colleague Confirmation:** Ask teammates about collaboration time

**See Also:**
- [Working with Timesheet Entries](timesheet-calendar/working-with-timesheet-entries.md)
- [Time Sheet Templates](timesheet-calendar/timesheet-templates.md)
- [Time Report](employee-time-tracking/time-report.md)

---

## Billing & Invoicing

### How do I ensure all billable hours are invoiced?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Prevent revenue leakage by systematically tracking and invoicing all billable work:

**Pre-Invoice Checklist:**

**1. Verify Billable Flag is Set Correctly**
1. Navigate to **Timesheet** → **Time Sheets**
2. Filter to your project and date range
3. Review the **Billable** column
4. Check for entries that should be billable but aren't:
   - Internal meetings marked non-billable (should they be?)
   - Development work accidentally unchecked
5. Correct any errors before invoicing

**2. Identify Unbilled Entries**
1. In [Timesheet → Time Sheets](https://web.timecockpit.com/app/lists/APP_DefaultTimesheetList), filter:
   - **Project:** Your project
   - **Billable:** True
   - **Billed:** False
   - **Date Range:** Billing period (e.g., last month)
2. Review the count and total hours
3. Verify this matches your expectations

**3. Check for Edge Cases**
Look for unbilled time that might be hiding:
- **Multiple Projects:** Same customer, different projects
- **Expense Entries:** Non-time entries that should be invoiced
- **Older Periods:** Filter by wider date ranges to catch stragglers
- **All Team Members:** Ensure you're seeing everyone's time, not just yours

**Monthly Billing Workflow:**

**Week 1 of Month (for Previous Month):**
1. **Export unbilled hours:
   - Filter: Billable=True, Billed=False, Date=Last Month
   - Group by Project
2. **Review with team leads:**
   - Confirm hours are accurate
   - Identify any non-billable work mistakenly included
3. **Get customer approvals** (if required by contract)

**Week 2 of Month:**
1. **Create invoices** using Create Invoice action
2. **Verify invoice totals** match expected amounts
3. **Review line items** for completeness

**Before Finalizing:**
1. **Double-check unbilled list** (should now be empty for that period)
2. **Review project budget:**
   - Does billed amount match deliverables?
   - Are we within approved budget?
3. **Export invoice** for accounting system

**Common Missed Billable Hours:**

- **Ad-hoc customer requests:** Quick 30-minute calls not logged
- **Email correspondence:** Extended email threads solving customer issues
- **Deployment and setup:** Technical work outside main project scope
- **Travel time:** Should it be billable per contract?
- **Revisions:** Additional rounds of changes beyond scope

**Preventing Leakage:**

**1. Real-Time Tracking**
- Track time immediately when work happens
- Don't reconstruct weeks later (easy to forget billable work)

**2. Template for Common Billable Tasks**
Create templates for:
- "Customer Support Call"
- "Bug Fix"
- "Code Review"
All marked billable by default

**3. Weekly Review**
- Every Friday: Review the week's entries
- Catch missing billable time while fresh in memory

**4. Contract-Based Tracking**
Document contract terms:
- What is billable vs. included?
- Is travel billable?
- Are revisions included or extra?
Educate team on these rules

**Audit Reports:**

**Monthly Reconciliation:**
```
Total Project Hours Tracked: 120
- Billable Hours: 100
- Non-Billable Hours: 20

Total Invoiced to Date: 95 hours
Unbilled Remaining: 5 hours ← Investigate these!
```

**See Also:**
- [Invoicing](project-time-tracking/billing.md)
- [Project Time Sheets](project-time-tracking/timesheet.md)
- [Invoice Data Fields](project-time-tracking/invoice-data-fields.md)

---

### How do I create invoices for multiple projects at once?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

When working with retainer clients or managing multiple project streams, batch invoicing saves time:

**Scenario 1: Multiple Projects, Same Customer**

**Single Invoice Approach:**
1. Navigate to **Timesheet** → **Time Sheets**
2. Filter:
   - **Customer:** Select the customer
   - **Billable:** True
   - **Billed:** False
   - **Date Range:** Billing period
3. Select **all timesheet entries** across all projects
4. Click **Create Invoice** action
5. Enter invoice parameters (number, date, description, service period)
6. Click **OK**

**Result:**
- One invoice created automatically
- Line items grouped by task/hourly rate across projects
- Customer sees consolidated billing

> [!WARNING]
> The standard Create Invoice action requires all timesheet entries to be from the **same project**. To invoice multiple projects together, you need a custom action or create separate invoices per project.

**Separate Invoices Approach:**
If customer requires separate invoices per project:
1. Filter to **Customer + Project A**
2. Create Invoice A
3. Filter to **Customer + Project B**
4. Create Invoice B
5. Repeat for each project

**Scenario 2: Multiple Customers, Batch Processing**

**Monthly Billing Run:**
1. Create a list of all customers requiring invoices
2. For each customer:
   - Filter timesheet entries (Customer, Billable=True, Billed=False, This Month)
   - Review hours and amounts
   - Create invoice
   - Move to next customer

**Efficiency Tips:**
- **Use Excel export** to get overview of all unbilled hours by customer/project
- **Sort by customer** to process in batches
- **Save filter presets** for monthly billing criteria

**Scenario 3: Retainer Billing**

For fixed monthly retainer with hourly cap:
1. Filter to customer and date range
2. **Check total hours** against retainer cap
3. If under cap: Invoice all hours
4. If over cap:
   - Invoice only up to cap amount
   - Mark excess hours as non-billable or carry forward
   - Or bill excess if contract allows

**Batch Workflow Template:**

```
Monthly Billing Checklist:
□ Week 1: Export unbilled hours by customer
□ Week 1: Team review for accuracy
□ Week 2: Create invoices (batch process)
  Customer A - Projects 1, 2: Single invoice
  Customer B - Project 3: Invoice
  Customer C - Projects 4, 5, 6: Single invoice
□ Week 2: QA invoice amounts and line items
□ Week 2: Export to accounting system
□ Week 3: Send invoices to customers
□ Track payment status
```

**Advantages of Consolidated Invoices:**
- **Simpler for customer:** One payment, one document
- **Lower transaction fees:** Single payment vs. multiple
- **Easier reconciliation:** Customer sees full picture

**When to Use Separate Invoices:**
- **Different payment terms** per project
- **Different billing addresses** or cost centers
- **Customer requirement** for separate POs/invoices
- **Contract-specific invoicing** (each project has own terms)

**See Also:**
- [Invoicing](project-time-tracking/billing.md)
- [Customers, Projects & Tasks](project-time-tracking/customer-project-task.md)
- [Data Export](data-exchange/export.md)

---

### What reports should I review regularly as a project manager?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Establish a reporting rhythm to stay on top of project health, team productivity, and financial performance:

**Daily Reports (Quick Checks)**

**1. Team Time Tracking Completion**
- **Report:** Timesheet entries for yesterday
- **Purpose:** Ensure team is tracking time consistently
- **Action:** Send reminders to anyone missing entries
- **Time:** 5 minutes

**Weekly Reports (Monday or Friday)**

**2. Project Hours Summary**
- **Report:** Time by project and user (this week)
- **Purpose:** Weekly team utilization, project progress
- **Metrics:**
  - Total hours per project
  - Hours per team member
  - Billable vs. non-billable ratio
- **Action:** Identify underutilized projects or people
- **Time:** 15 minutes

**3. Budget Burn Rate**
- **Report:** Budgetary Control list
- **Purpose:** Track project budget consumption
- **Metrics:**
  - % budget consumed vs. % project complete
  - Forecast to completion
  - Projects approaching budget limits
- **Action:** Flag at-risk projects for scope adjustment
- **Time:** 10 minutes

**4. Billable Hours Review**
- **Report:** Billable vs. non-billable time by project
- **Purpose:** Ensure profitability targets
- **Metrics:**
  - % billable time per project
  - Non-billable hours trends
- **Action:** investigate low billable percentages
- **Time:** 10 minutes

**Monthly Reports (End of Month)**

**5. Project Profitability Analysis**
- **Report:** Project revenue vs. cost (if cost tracking enabled)
- **Purpose:** Understand which projects are profitable
- **Metrics:**
  - Total billable amount
  - Total internal cost
  - Margin and margin %
- **Action:** Identify patterns for future pricing
- **Time:** 30 minutes

**6. Unbilled Hours Report**
- **Report:** Billable=True, Billed=False entries
- **Purpose:** Prepare for monthly invoicing
- **Metrics:**
  - Unbilled hours by customer/project
  - Total unbilled revenue
- **Action:** Create invoices for the month
- **Time:** 20 minutes

**7. Team Utilization**
- **Report:** Hours tracked per person per project
- **Purpose:** Resource planning and allocation
- **Metrics:**
  - Total hours per person
  - Project distribution
  - Billable rate (billable hours / total hours)
- **Action:** Rebalance workloads, plan hiring
- **Time:** 20 minutes

**Quarterly Reports (Strategic Planning)**

**8. Project Portfolio Review**
- **Report:** All projects - budget, timeline, status
- **Purpose:** Portfolio health and strategic decisions
- **Metrics:**
  - Projects completed vs. in progress
  - Average project margin
  - Resource allocation across portfolio
- **Action:** Decide project priorities, capacity planning
- **Time:** 1-2 hours

**9. Customer Analysis**
- **Report:** Time and revenue by customer
- **Purpose:** Customer relationship and account management
- **Metrics:**
  - Total hours per customer
  - Total revenue per customer
  - Customer profitability
- **Action:** Focus on top customers, improve low-margin accounts
- **Time:** 30 minutes

**Report Dashboard Setup:**

Create saved views/filters for each report:
1. Navigate to the relevant list
2. Apply filters and grouping
3. Save the view with a descriptive name
4. Access quickly from favorites or bookmarks

**Reporting Rhythm Example:**
```
Monday Morning:
- Check last week's hours (coffee + 15 min review)
- Review budget status for activ projects
- Plan week based on bandwidth

Friday Afternoon:
- Verify team tracked full week
- Note any budget concerns for Monday discussion
- Queue up monthly invoicing (if end of month)

Monthly (First Week):
- Create all invoices for previous month
- Review project profitability
- Generate stakeholder reports
```

**See Also:**
- [Built-In Reports](reporting/built-in-reports.md)
- [Standard Print View](reporting/standard-print-view.md)
- [Time Report](employee-time-tracking/time-report.md)

---

## Project Setup & Organization

### How should I structure projects and tasks for best tracking?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Effective project structure makes tracking, reporting, and billing much easier:

**Hierarchy Basics:**
```
Customer
  └─ Project (major engagement)
      └─ Task (work categories within project)
```

**Project Granularity:**

**Option 1: Project per Major Deliverable**
```
Customer: Acme Corp
  ├─ Project: Website Redesign
  ├─ Project: Mobile App Development
  └─ Project: Ongoing Support & Maintenance
```
**Use when:** Distinct budgets, separate invoicing, different teams

**Option 2: Single Project with Task Breakdown**
```
Customer: Acme Corp
  └─ Project: Digital Transformation
      ├─ Task: Website Redesign
      ├─ Task: Mobile App Development
      └─ Task: Training & Documentation
```
**Use when:** Unified budget, single contract, same team

**Task Structuring Strategies:**

**Strategy 1: By Deliverable/Feature**
```
Project: E-commerce Platform
  ├─ Task: User Authentication
  ├─ Task: Product Catalog
  ├─ Task: Shopping Cart
  └─ Task: Payment Integration
```
**Advantages:** Clear feature tracking, easy to budget per feature

**Strategy 2: By Activity Type**
```
Project: E-commerce Platform
  ├─ Task: Design
  ├─ Task: Development
  ├─ Task: Testing
  ├─ Task: Project Management
  └─ Task: Meetings & Communication
```
**Advantages:** Understand effort distribution, identify overhead

**Strategy 3: By Sprint/Phase**
```
Project: E-commerce Platform
  ├─ Task: Sprint 1 (Aug 1-15)
  ├─ Task: Sprint 2 (Aug 16-31)
  └─ Task: Sprint 3 (Sep 1-15)
```
**Advantages:** Time-boxed tracking, agile workflow alignment

**Strategy 4: Hybrid Approach**
```
Project: E-commerce Platform
  ├─ Task: Development - User Auth
  ├─ Task: Development - Product Catalog
  ├─ Task: Testing - User Auth
  ├─ Task: Project Management
  └─ Task: Client Meetings
```
**Advantages:** Granular tracking, clear deliverable + activity

**Best Practices:**

**1. Limit Task Count**
- **Ideal:** 5-15 tasks per project
- **Too few:** Hard to track specific work
- **Too many:** Overhead of selecting correct task

**2. Use Consistent Naming**
```
Good:
  - Development - Feature Name
  - Testing - Feature Name
  - Design - Feature Name

Confusing:
  - Coding stuff
  - Some testing
  - Design work
```

**3. Define Billable vs. Non-Billable Tasks**
- Set **Default Billable** flag on tasks
- Example:
  - Development tasks: Billable = True
  - Internal meetings: Billable = False
  - Client meetings: Billable = True

**4. Budget at Appropriate Level**
- **Project budget:** Overall engagement cost
- **Task budgets:** Detailed milestone tracking
- Choose based on contract and reporting needs

**5. Align with Invoicing**
- If invoicing by milestone → Structure tasks as milestones
- If hourly billing → Structure by activity type
- If value-based → High-level project, minimal task breakdown

**Ongoing Support & Retainer Projects:**

For continuous work without clear end date:
```
Customer: Acme Corp
  └─ Project: Ongoing Support - 2026
      ├─ Task: Bug Fixes
      ├─ Task: Feature Enhancements
      ├─ Task: Consulting & Advice
      └─ Task: Emergency Support
```

Create new projects yearly for clean reporting:
- Ongoing Support - 2025
- Ongoing Support - 2026
- Ongoing Support - 2027

**Project Lifecycle:**

**1. Planning Phase**
- Create customer (if new)
- Create project with estimated budget
- Define task structure
- Set hourly rates

**2. Execution Phase**
- Team tracks time to tasks
- Monitor budget consumption
- Adjust if scope changes

**3. Closing Phase**
- Final invoice creation
- Archive or mark project as complete
- Retrospective: Review actual vs. planned

**See Also:**
- [Customers, Projects & Tasks](project-time-tracking/customer-project-task.md)
- [Budgetary Control Use Case](use-cases/budgetary-control.md)
- [Project Time Sheets](project-time-tracking/timesheet.md)

---

## Need More Help?

### Project Manager Resources

**Related FAQs:**
- [User FAQ](user-faq.md) - General time tracking questions
- [Billing Administrator FAQ](billing-admin-faq.md) - Invoice details and billing processes
- [Developer FAQ](developer-faq.md) - API & customization for advanced workflows

**Documentation:**
- [Project Time Tracking](project-time-tracking/customer-project-task.md)
- [Budgetary Control Deep Dive](use-cases/budgetary-control.md)
- [Built-In Reports](reporting/built-in-reports.md)
- [Invoicing Guide](project-time-tracking/billing.md)

**Support:**
- **Email:** support@timecockpit.com  
- **Custom Training:** Request project management specific training
- **Consulting:** Optimize your project structure and workflows

---

*This FAQ is regularly updated with project manager insights. Last updated: February 2026.*
