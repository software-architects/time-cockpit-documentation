---
title: Project Budget Tracking & Profitability Analysis
description: Comprehensive guide to tracking project budgets, monitoring costs vs. revenue, analyzing profitability, and forecasting project completion in time cockpit.
keywords: [project budget tracking, budget monitoring, cost tracking, profitability analysis, budget forecast, project costs, billable vs non-billable, budget variance, project margin, budget control]
---

# Project Budget Tracking & Profitability Analysis

Monitor project budgets in real-time, track actual costs versus billable amounts, and forecast project completion to ensure profitability and prevent budget overruns.

> [!TIP]
> **Want to maximize project profitability?** Learn how time cockpit helps you [boost project profitability](https://www.timecockpit.com/blog/benefits-of-project-time-tracking/) and track [essential project KPIs](https://www.timecockpit.com/blog/project-timetracking-kpis/). Explore our [Project Time Tracking features](https://www.timecockpit.com/features/project-time-tracking/).

## Overview

Effective project budget tracking requires monitoring multiple dimensions:
- **Hour-based budgets**: Track hours consumed vs. planned hours
- **Cost-based budgets**: Monitor actual costs vs. planned revenue
- **Real-time profitability**: Compare billable amounts to internal costs
- **Forecast completion**: Predict overruns before they happen

Time cockpit provides built-in **Budgetary Control** lists that aggregate timesheet and invoice data for comprehensive budget analysis.

## Setting Up Project Budgets

### Hour-Based Budgets

Track project budgets in terms of hours allocated:

1. Navigate to **Management** → **[Projects](https://web.timecockpit.com/app/lists/APP_DefaultProjectList)**
2. Open your project (or create new)
3. Set budget fields:
   - **Planned Duration (Hours):** Total hours budgeted (e.g., 100 hours)
   - **Budget Type:** Hour-based
4. Click **Save**

**When to use hour-based budgets:**
- Time-and-materials projects
- Internal projects (no customer billing)
- When tracking team capacity allocation

### Cost-Based Budgets

Track project budgets in monetary terms:

1. In the project record, set:
   - **Planned Revenue:** Total budget amount (e.g., $50,000)
   - **Budget Type:** Amount-based
2. Ensure hourly rates are configured for accurate cost tracking
3. Click **Save**

**When to use cost-based budgets:**
- Fixed-price projects
- When customer cares about total cost not hours
- Projects with mixed billing rates

### Task-Level Budgets (Granular Control)

For detailed budget allocation:

1. Navigate to **Management** → **[Tasks](https://web.timecockpit.com/app/lists/APP_DefaultTaskList)**
2. For each task, set:
   - **Planned Duration:** Hours allocated to this specific task
   - **Planned Revenue:** Amount allocated (optional)
3. Save each task

**Benefits of task-level budgets:**
- Identify which phases consume most budget
- Track progress at granular level
- Alert team when specific tasks approach limits
- Improve future estimating

## Monitoring Budget Consumption

### Budgetary Control Lists

Time cockpit provides two powerful built-in views:

**[Budgetary Control of Projects](https://web.timecockpit.com/app/lists/APP_BudgetaryControlOfProjectsList)**

Navigate to **Management** → **Projects** → Select list view **Budgetary Control**

**Key Columns:**
- **Planned vs. Actual**: Compare budgeted vs. tracked hours/costs
- **Remaining**: Hours/budget still available
- **% Consumed**: Progress indicator (ProgressPercent, ProgressBillablePercent)
- **Forecast**: Projected final hours/costs based on current trend
- **Revenue**: Total billable amount from timesheets
- **Costs**: Internal costs based on employee hourly rates
- **Margin**: Revenue - Costs (profitability)

**[Budgetary Control of Tasks](https://web.timecockpit.com/app/lists/APP_BudgetaryControlOfTasksList)**

Similar to project-level view but shows task-level detail for granular monitoring.

### Visual Indicators

Budget consumption status is typically indicated by:
- **🟢 Green**: On track, under budget (< 80% consumed)
- **🟡 Yellow**: Approaching limit (80-100% consumed)
- **🔴 Red**: Over budget or projected overrun (> 100%)

### Key Metrics Explained

#### Hours
```python
Total hours logged across all timesheets, regardless of billability
```

#### Billable Hours
```python
Only counts hours that are:
- Marked as billable (APP_Billable = True)
- Have an actual hourly rate > 0
```

**Why this matters**: You may have timesheets on billable projects that aren't themselves billable (internal meetings, setup time, etc.)

#### Budget in Hours
If `BudgetInHours` isn't directly set, calculated as:
```
Budget / HourlyRate = BudgetInHours
```

#### Progress Percentage
Two key metrics:
- **ProgressBillablePercent**: `Billable Hours / Budget Hours × 100`
- **ProgressPercent**: `Total Hours / Budget Hours × 100`

**Example:**
- Budget: 100 hours
- Total hours tracked: 80 hours → 80% progress
- Billable hours: 70 hours → 70% billable progress
- **Insight**: 10 hours were non-billable overhead

#### Revenue
```python
Sum of all timesheet revenue
Each timesheet: Revenue = Duration × HourlyRateActual
```

#### Unbilled Revenue
```python
Revenue from timesheets that are:
- Billable (APP_Billable = True)
- Not yet billed (APP_Billed = False)
```

**Business importance**: This is money you've earned but not yet invoiced - represents accounts receivable pipeline.

#### Costs
```python
Internal cost = Sum(Duration × Employee's Internal Hourly Rate)
```

Shows your actual labor cost (what you pay employees), not what you charge customers.

#### Effective Hourly Rate
```python
Average revenue per hour = Total Revenue / Total Hours
```

**Use case**: Compare against project's planned hourly rate.

**Example:**
- Planned rate: €100/hour
- Effective rate: €85/hour
- **Insight**: Some hours were non-billable or discounted

## Tracking Costs vs. Billable Amounts

Understanding project profitability requires tracking both internal costs and customer billing:

### Dual Rate System

**Employee/User Cost Rate (Internal):**
1. Navigate to **User** → **[User Details](https://web.timecockpit.com/app/lists/APP_DefaultUserDetailList)**
2. Open employee record
3. Set **Default Hourly Rate:** Their internal cost rate (e.g., $75/hour)
4. Save

**Project/Task Billable Rate (Customer-facing):**
1. Navigate to **Management** → **[Projects](https://web.timecockpit.com/app/lists/APP_DefaultProjectList)** or **[Tasks](https://web.timecockpit.com/app/lists/APP_DefaultTaskList)**
2. Set **Hourly Rate:** Customer billing rate (e.g., $150/hour)
3. Save

### Profitability Calculation

**Formula:**
```
Margin = Total Billable Amount - Total Internal Cost
Margin % = (Margin / Total Billable Amount) × 100
```

**Example:**
```
Project: Website Development
- 100 hours tracked
- Internal cost rate: $75/hour → Total Cost: $7,500
- Billable rate: $150/hour → Total Revenue: $15,000
- Margin: $15,000 - $7,500 = $7,500
- Margin %: ($7,500 / $15,000) × 100 = 50%
```

### Profitability Analysis Methods

**Option 1: Budgetary Control View**
The built-in list automatically shows:
- **Revenue**: What you bill customers
- **Costs**: What you pay employees
- **Margin**: Calculated difference

**Option 2: Custom Report**
Create a report aggregating:
- `Sum(Duration × HourlyRateActual)` = Total Internal Cost
- `Sum(Duration × HourlyRateBilled)` = Total Revenue
- Difference = Project Profit

**Option 3: Manual Analysis**
Export timesheet data to Excel and create pivot tables showing profitability by:
- Project
- Customer
- Task type
- Team member
- Time period

### Business Impact

**Identify profitable vs. unprofitable projects:**
- Focus sales efforts on high-margin project types
- Reduce or discontinue low-margin offerings

**Optimize resource allocation:**
- Assign junior staff to high-margin projects (increases margin further)
- Assign senior staff only where expertise is necessary

**Adjust pricing for future projects:**
- Use historical margin data to inform proposals
- Build in appropriate profit margins

**Spot scope creep:**
- Budget variance indicates expanding project scope
- Renegotiate with customer or reduce deliverables

## Forecasting Project Completion

Predict completion dates and budget overruns before they happen using velocity-based forecasting.

### Using Budgetary Control Forecast

1. Navigate to **Management** → **Projects** → **Budgetary Control** view
2. Review forecast columns:
   - **Forecast Hours**: Projected total hours at current pace
   - **Budget Variance**: Difference between planned and forecast

### Forecast Calculation Method

Time cockpit calculates forecasts using velocity patterns:

**Method 1: Percentage Complete**
```
Forecast = Actual Hours / % Project Complete
```

**Example:**
- Planned Budget: 100 hours
- 50% complete
- Actual Hours: 60 hours
- Forecast: 60 / 0.5 = **120 hours** (20 hours over budget)

**Method 2: Time-Based Velocity**
```
Forecast = (Actual Hours / Days Elapsed) × Total Project Days
```

**Example:**
- Planned: 100 hours over 10 weeks
- After 5 weeks: 60 hours tracked
- Velocity: 60 / 5 = 12 hours/week
- Forecast: 12 × 10 = **120 hours**

### Manual Velocity Calculation

1. Calculate hourly weekly: `Total Actual Hours / Weeks Elapsed`
2. Calculate remaining weeks: `Remaining Hours / Hours per Week`
3. Projected completion: `Current Date + Remaining Weeks`

### Early Warning Signs

**🚨 Budget Risk Indicators:**
- **Forecast > Planned Budget**: Will exceed budget at current pace
- **Velocity decreasing**: Team slowing down (complexity, blockers, fatigue)
- **Non-billable time increasing**: Overhead growing, efficiency declining
- **Effective rate < planned rate**: Discounting or non-billable work creeping in

### Corrective Actions

When forecasts predict overruns:

**1. Reduce Scope**
- Cut non-essential features
- Defer nice-to-have items to Phase 2
- Renegotiate deliverables with customer

**2. Increase Efficiency**
- Remove blockers and bottlenecks
- Improve processes and workflows
- Reduce meeting overhead
- Automate repetitive tasks

**3. Add Resources** (if budget allows)
- Bring in additional team members
- **Warning**: May temporarily decrease efficiency (onboarding time)

**4. Renegotiate Budget**
- Present data-driven case to customer
- Show actuals vs. plan with justification
- Request budget increase or timeline extension

### Regular Review Cadence

**Weekly Review** (for short projects < 3 months):
- Check forecast vs. plan
- Identify blockers
- Adjust allocation

**Bi-weekly Review** (for medium projects 3-6 months):
- Trend analysis
- Milestone tracking
- Stakeholder updates

**Monthly Review** (for long projects 6+ months):
- Strategic adjustments
- Resource reallocation
- Contract amendments if needed

## Preventing Budget Overruns

### Approach 1: Visibility & Monitoring (Recommended)

**Set task-level budgets:**
1. Configure budgets in [Management → Tasks](https://web.timecockpit.com/app/lists/APP_DefaultTaskList)
2. Communicate budgets to team members
3. Make budgets visible in task descriptions

**Monitor regularly:**
- Weekly budget review meetings
- Share Budgetary Control reports with team
- Flag tasks approaching limits (80%+)

### Approach 2: Proactive Notifications

Set up alerts when tasks approach budget limits:
- **80% threshold**: Warning notification to assignee
- **90% threshold**: Escalation to project manager
- **100% threshold**: Require manager approval for additional time

**Implementation**: Requires customization via scripting or workflows

### Approach 3: Permission-Based Controls (Advanced)

Use permissions to restrict time entry when budgets are exceeded:
- Create validation rules on timesheet entries
- Block saves when task budget is exceeded
- Require manager override for legitimate overages

**Implementation**: Requires [data model customization](../data-model-customization/entity.md)

### Best Practice Workflow

**Planning Phase:**
1. Set realistic task budgets based on historical data
2. Communicate budgets to assignees
3. Explain the "why" behind budget constraints (profitability, customer expectations, etc.)

**Execution Phase:**
1. Daily standup: Team reports hours spent vs. remaining
2. Mid-task check-in at ~50% budget consumed
3. Visual dashboards showing budget consumption
4. Celebrate early completion under budget

**Variance Management:**
1. When approaching limit: Assess remaining work realistically
2. Request budget increase if needed (with data-driven justification)
3. Or reduce task scope to fit budget
4. Document lessons learned for future estimating

### Cultural Approach

Rather than rigid controls, foster budget awareness:
- ✅ Make budgets visible and transparent
- ✅ Celebrate teams that deliver under budget
- ✅ Discuss budget variances in retrospectives (learning focus, not blame)
- ✅ Treat budgets as planning tools, not punishment mechanisms
- ✅ Encourage early escalation of budget concerns

## Invoice Data Cross-Reference

The Budgetary Control lists also query invoice data separately to cross-validate revenue:

### Why Separate Invoice Queries?

**Timesheet Revenue** ≠ **Invoice Revenue** because:
- Invoices may include fixed-price items, expenses, or articles (not from timesheets)
- Invoices may have discounts or adjustments applied
- Timesheets might not all be billed yet
- Exchange rate differences for international invoices

### Billed Revenue from Invoices

```python
Sum of invoice total amounts for project
Represents actual invoiced amount (what customer was billed)
```

### Billed Hours from Invoices

```python
Sum of invoice detail quantities where unit = "hour"
Only counts time-based invoice items, not lump-sum entries
```

### Unbilled Hours from Invoices

```python
Unbilled Hours = Budget Hours - Billed Hours from Invoices
```

**Warning**: Can be negative if you've invoiced more than budgeted (common in time-and-materials overruns)

### Using Both Metrics

**Compare:**
- **Unbilled Revenue** (from timesheets): Work completed but not yet invoiced
- **Billed Revenue** (from invoices): What customer has been invoiced
- **Paid Revenue** (from payment tracking): What you've actually collected

**Full revenue lifecycle:**
```
Work Done → Timesheet (Unbilled Revenue)
  ↓
Invoice Sent → Invoice (Billed Revenue)
  ↓
Payment Received → Paid Revenue (Cash)
```

## Performance Considerations

The budgetary control lists can be slow for large datasets because they:
1. Query all timesheets (potentially thousands of records)
2. Query all invoices separately
3. Perform grouping and calculations in Python scripts
4. Build result objects in memory

### Optimization Tips

**Always use filters:**
- Filter by customer, project, or date range to limit data
- Close completed projects (filtered out by default)
- Exclude unbillable projects if not relevant

**For very large tenants:**
- Consider pre-calculating summary values in nightly batch jobs
- Create materialized views or cache results
- Use custom reports with database-level aggregation instead of Python

## Permissions

The Budgetary Control lists respect role-based permissions:

**Access is limited to:**
- **Billing Admin role**: See all projects
- **Project Controller role**: See all projects
- **Project Manager role**: See only projects where they are Manager1 or Manager2

Regular users (employees) won't see these lists in the navigation.

See: [Permissions Guide](../data-model/permissions-guide.md)

## Related Features

### Project Management
- [Customers, Projects & Tasks](customer-project-task.md) - Setting up project hierarchy
- [Hourly Rates](hourly-rates.md) - Configuring billing and cost rates
- [Project Time Sheets](timesheet.md) - Tracking time to projects

### Invoicing
- [Invoice Creation & Billing Workflow](billing.md) - Creating invoices from timesheet data
- [Invoice Data Fields](invoice-data-fields.md) - Understanding invoice fields

### Reporting
- [Built-In Reports](../reporting/built-in-reports.md) - Standard project reports
- [Custom Reports](../reporting/custom-reports.md) - Creating tailored budget reports

### Advanced
- [Budgetary Control Use Case](../use-cases/budgetary-control.md) - Technical deep dive into calculation logic
- [Data Model Customization](../data-model-customization/overview.md) - Building custom budget controls
- [Scripting Overview](../scripting/overview.md) - Automating budget notifications

## See Also

**FAQs:**
- [Project Manager FAQ](../project-manager-faq.md) - Role-specific budget tracking questions
- [Billing Administrator FAQ](../billing-admin-faq.md) - Revenue and invoicing questions

**API & Integration:**
- [Web API Overview](../web-api/overview.md) - Accessing budget data programmatically
- [TCQL Query Language](../tcql/overview.md) - Querying budget data

---

*For budget tracking support, contact [support@timecockpit.com](mailto:support@timecockpit.com) or see the [Project Manager FAQ](../project-manager-faq.md).*
