---
title: Hourly Rate Management & Pricing Configuration
description: Complete guide to configuring hourly rates for billing, understanding rate hierarchy, managing customer-specific pricing, role-based rates, and rate change workflows in time cockpit.
keywords: [hourly rates, billing rates, project pricing, rate management, customer rates, role-based pricing, rate hierarchy, pricing configuration, billable rates, rate updates, pricing strategy]
---

# Hourly Rate Management & Pricing Configuration

Configure and manage hourly rates for accurate billing, profitability tracking, and customer invoicing. Understand rate hierarchies, update strategies, and pricing workflows.

> [!TIP]
> **Optimizing your pricing strategy?** Learn how to [maximize project revenue](https://www.timecockpit.com/blog/project-time-tracking-revenue/) through effective rate management. Explore our [Project Invoicing features](https://www.timecockpit.com/features/project-invoicing/).

## Overview

Hourly rates in time cockpit serve two critical purposes:

**1. Customer Billing (Billable Rates)**
- What you charge customers for work performed
- Appears on invoices
- Determines project revenue

**2. Internal Costing (Cost Rates)**
- What each hour costs your business (employee salary, overhead)
- Used for profitability analysis
- Does not appear on customer invoices

**Key principle:**
```
Profit = Billable Rate - Cost Rate
Margin % = (Profit / Billable Rate) × 100
```

## Rate Hierarchy & Priority

Time cockpit uses a cascading rate system with clear priority order:

### Rate Priority (Highest to Lowest)

**1. Task-Specific Rate** (Highest Priority)
- Set on individual tasks
- Most granular control
- Overrides all other rates

**2. Project Default Rate**
- Set on projects
- Applies to all tasks/entries for that project (unless task rate specified)
- Most common approach

**3. Employee/User Rate**
- Set on employee record
- Typically used for internal cost rate (not billable rate)
- Fallback when no project/task rate exists

**4. Company Default Rate** (Lowest Priority, Fallback)
- Global default rate (configured in settings)
- Used when no other rates are set
- Safety net to prevent zero-rate entries

### How Rate Selection Works

When creating a timesheet entry, time cockpit determines the rate by checking in order:

```
Entry for Task A on Project B by Employee C:

1. Does Task A have an hourly rate? → Use it ✓
2. If not, does Project B have a default rate? → Use it
3. If not, does Employee C have a default rate? → Use it
4. If not, use company default rate → Last resort
```

**Example:**
- Employee: John (default rate: $125/hour internal cost)
- Project: Client Website (default rate: $150/hour)
- Task: "Senior Development" (specific rate: $200/hour)
- Task: "Junior Development" (no specific rate)

**Result:**
- John's time on "Senior Development" → Billed at $200/hour (task rate)
- John's time on "Junior Development" → Billed at $150/hour (project rate)

## Setting Hourly Rates

### Project-Level Rates

Best for: Standard rates across entire project

**Configuration:**
1. Navigate to **Management** → **[Projects](https://web.timecockpit.com/app/lists/APP_DefaultProjectList)**
2. Open the project
3. Set **Default Hourly Rate:** (e.g., $150)
4. Click **Save**

**Effect:**
- All timesheet entries for this project use $150 (unless task rate overrides)
- Simple, consistent pricing
- Easy to manage

**Use cases:**
- Fixed rate for customer (regardless of who works)
- Blended rate across team
- Simple time-and-materials billing

### Task-Level Rates (Granular Control)

Best for: Different rates for different work types

**Configuration:**
1. Navigate to **Management** → **[Tasks](https://web.timecockpit.com/app/lists/APP_DefaultTaskList)**
2. Open the task
3. Set **Hourly Rate:** (e.g., $200)
4. Click **Save**

**Use cases:**
- **Role-based pricing:**
  - Senior Developer Work: $200/hour
  - Mid-Level Developer Work: $150/hour
  - Junior Developer Work: $100/hour
  - QA/Testing: $80/hour
  - Project Management: $150/hour

- **Service-based pricing:**
  - Consulting/Advisory: $250/hour
  - Implementation: $150/hour
  - Support: $100/hour  
  - Training: $120/hour

- **Complexity-based pricing:**
  - Architecture & Design: $200/hour
  - Standard Development: $150/hour
  - Bug Fixes: $100/hour

### Employee/User Rates (Internal Cost)

Best for: Profitability tracking and cost analysis

**Configuration:**
1. Navigate to **User** → **[User Details](https://web.timecockpit.com/app/lists/APP_DefaultUserDetailList)**
2. Open employee record  
3. Set **Default Hourly Rate:** (e.g., $75/hour internal cost)
4. Click **Save**

**Important:**
- This is typically the **internal cost rate** (not billable rate)
- Represents employee salary + benefits + overhead per hour
- Used for calculating project profitability
- Does NOT appear on customer invoices

**Calculation of internal cost rate:**
```
Annual Salary + Benefits + Overhead / Billable Hours per Year

Example:
$120,000 salary + $30,000 benefits/overhead = $150,000
$150,000 / 2,000 billable hours/year = $75/hour internal cost
```

**See:** [Budget Tracking](budget-tracking.md#tracking-costs-vs-billable-amounts) for profitability analysis

## Updating Rates Mid-Project

### Scenario: Rate Increase During Project

**Challenge:** Project rate needs to increase from $150 to $175/hour

**Steps:**
1. Navigate to **Management** → **[Projects](https://web.timecockpit.com/app/lists/APP_DefaultProjectList)**
2. Open the project
3. Change **Default Hourly Rate:** from $150 to $175
4. Click **Save**

**Impact:**
- ✅ **Future timesheet entries:** Use new rate ($175)
- ℹ️ **Past unbilled entries:** Still show original rate ($150)
- 🔒 **Invoiced entries:** Locked at invoiced rate (cannot change)

### Retroactively Adjusting Unbilled Entries

If you need past entries to use the new rate:

**Steps:**
1. Navigate to **Timesheet** → **[Time Sheets](https://web.timecockpit.com/app/lists/APP_DefaultTimesheetList)**
2. Apply filters:
   - **Project:** Select your project
   - **Date Range** Set to affected period
   - **Billed:** = False (only unbilled entries)
3. **Multi-select entries** (Ctrl+Click or Select All)
4. **Bulk update** (if supported) or edit individually:
   - Set **Hourly Rate Actual:** $175
5. Click **Save**

**Warning:** Cannot change rates on already-invoiced entries (they're locked for audit trail)

### Handling Rate Change Communication

**Customer notification workflow:**
1. **Contract amendment:** Update SOW with new rate
2. **Advance notice:** Notify customer 30-60 days before effective date
3. **Documentation:** Set effective date in project notes
4. **Update in system:** Change project rate on effective date
5. **Invoice clarity:** First invoice with new rate should note the change

**Internal tracking:**
- Document rate change date in project description
- Use project custom fields for rate history (if configured)
- Generate report of pre/post rate change hours

## Customer-Specific Pricing Strategies

### Approach 1: Project-Level Rates (Simple)

One project = one rate

**Setup:**
- Customer A, Project 1: Set rate $150
- Customer A, Project 2: Set rate $150
- Customer B, Project 1: Set rate $200
- Customer B, Project 2: Set rate $200

**Pros:**
- ✅ Simple to manage
- ✅ No customization needed
- ✅ Clear per-project pricing

**Cons:**
- ❌ Repetitive if many projects per customer
- ❌ Must update each project separately for rate changes

### Approach 2: Customer Rate Tables (Advanced)

Requires: Custom entity and scripting

**Concept:**
Create custom "Rate Card" entity:
- Customer (relation)
- Service Type (Development, Consulting, Support, etc.)
- Hourly Rate

**Lookup logic:**
When creating timesheet entry, script looks up rate from rate card based on:
- Current customer
- Current task/service type
- Effective date (for historical rates)

**Pros:**
- ✅ Centralized rate management
- ✅ Historical rate tracking
- ✅ Complex pricing models supported

**Cons:**
- ❌ Requires development (scripting)
- ❌ More complex to maintain
- ❌ Needs customization expertise

**See:** [Data Model Customization](../data-model-customization/overview.md), [Scripting Actions](../scripting/actions.md)

## Pricing Models

### Blended Rate Model

**Concept:** One rate for all team members on project

**Setup:**
- Project: "Client Website Design"
- Rate: $150/hour (blended rate)
- All team members bill at $150 regardless of seniority

**When to use:**
- Customer prefers simple, predictable pricing
- Team composition may fluctuate
- Junior and senior staff balance out
- Reduces rate negotiation complexity

**Example:**
```
Team:
- Senior Developer (internal cost: $100/hour)
- Mid Developer (internal cost: $75/hour)
- Junior Developer (internal cost: $50/hour)

Blended billable rate: $150/hour (all three)

Customer pays same rate regardless of who works
Internal profit margin varies (50%, 100%, 200%)
```

### Role-Based Rate Model

**Concept:** Different rates based on employee seniority/role

**Setup:**
Create tasks by role:
- Task: "Senior Development" → Rate: $200/hour
- Task: "Mid-Level Development" → Rate: $150/hour
- Task: "Junior Development" → Rate: $100/hour
- Task: "QA/Testing" → Rate: $80/hour

Employees select appropriate task when tracking time.

**When to use:**
- Customer wants to control costs (uses juniors for simple work)
- Transparency about who's working
- Industry standard (e.g., legal, consulting)
- Complex projects with diverse skill requirements

**Example:**
```
Project: Enterprise System Integration

Tasks with rates:
- Architecture & Planning: $250/hour (senior architects)
- Backend Development: $150/hour (mid-level engineers)
- Frontend Development: $120/hour (junior/mid developers)
- Testing: $80/hour (QA team)
- Project Management: $175/hour (PM)

Customer gets itemized invoice showing hours by role
Optimizes cost (right person for right job)
```

### Service-Based Rate Model

**Concept:** Different rates for different services/deliverables

**Setup:**
Tasks organized by service type:
- Task: "Consulting & Advisory" → Rate: $250/hour
- Task: "Development & Implementation" → Rate: $150/hour
- Task: "Support & Maintenance" → Rate: $100/hour
- Task: "Training & Documentation" → Rate: $120/hour

**When to use:**
- Diverse service offerings
- Value-based pricing (strategy = higher rate)
- Mixed contract types (retainer support + project development)

## Special Pricing Scenarios

### Discounted Rates

**Scenario:** Customer receives 10% discount

**Option 1: Adjust Project Rate**
- Regular rate: $150/hour
- Discounted rate: $135/hour ($150 × 0.90)
- Set project rate directly to $135

**Pros:** Timesheet entries show discounted rate immediately
**Cons:** Doesn't show original rate (for analysis)

**Option 2: Discount at Invoice Level**
- Create invoice with regular rates ($150/hour)
- Add manual invoice line item: "10% Discount: -$1,500"
- Invoice total reflects discount

**Pros:** Maintains standard rate on timesheets, shows discount separately
**Cons:** Manual adjustment required per invoice

**Option 3: Custom Field Tracking**
- Set project rate to discounted amount ($135)
- Add custom field "Standard Rate" = $150
- Use for internal reporting

### Multi-Currency Pricing

**Challenge:** Time cockpit stores amounts without currency symbols

**Strategies:**

**Approach 1: Separate Projects per Currency**
- Customer ABC - USD Projects (rates in USD)
- Customer ABC - EUR Projects (rates in EUR)
- Track separately, invoice separately

**Approach 2: Custom Fields**
- Add custom field "Currency" to Project entity
- Document rate currency in project notes
- Invoice notes state currency: "All amounts in USD"

**Approach 3: Accounting System Integration**
- Export timesheets to accounting system
- Handle currency conversion in accounting system
- Maintain single-currency data in time cockpit

**See:** [Data Exchange](../data-exchange/export.md), [Web API](../web-api/overview.md)

### Fixed-Price Projects (No Hourly Rate Billing)

For fixed-price projects, hourly rates still matter for internal tracking:

**Setup:**
- Set project rate = 0 (or internal cost rate for profitability analysis)
- Track time normally
- Mark timesheet entries as billable (for tracking)
- Create invoice manually with fixed amount (not from timesheets)

**Purpose:** Understand actual hours spent vs. fixed price to:
- Calculate effective hourly rate: `Fixed Price / Total Hours`
- Determine profitability: `Fixed Price - (Hours × Internal Cost)`
- Improve future estimating

**See:** [Budget Tracking](budget-tracking.md), [Billing Administrator FAQ](../billing-admin-faq.md#how-do-i-handle-retainer-and-fixed-price-contracts)

## Rate Management Best Practices

### 1. Document Rate Assumptions

**In project notes, document:**
- ✓ Current rate and effective date
- ✓ Rate change history
- ✓ Currency (if multi-currency)
- ✓ Discount applied (if any)
- ✓ Special pricing terms

**Example project description:**
```
Rate: $150/hour (effective 2026-01-01)
Previous rate: $135/hour (2025-01-01 to 2025-12-31)
Currency: USD
Discount: 10% volume discount applied
```

### 2. Regular Rate Reviews

**Quarterly rate review checklist:**
- □ Compare rates to market rates (competitor analysis)
- □ Review profitability by project/customer
- □ Identify unprofitable rates (margin too low)
- □ Plan rate increases for next contract renewals
- □ Update employee cost rates (salary changes)

### 3. Profitability-Driven Pricing

**Before setting rate, calculate:**
```
Target Margin: 40%
Internal Cost: $75/hour
Required Billable Rate = $75 / (1 - 0.40) = $125/hour minimum
```

**Margin targets by industry:**
- Software/IT Services: 35-50%
- Consulting: 40-60%
- Professional Services: 30-45%

### 4. Granularity vs. Simplicity

**Too simple:** Single company-wide rate
- ❌ Not competitive (some services overpriced, some underpriced)
- ❌ Low margin on complex work
- ❌ Customers may shop around

**Too complex:** Different rate for every employee for every service
- ❌ Impossible to manage
- ❌ Confusing to customers
- ❌ Administrative burden

**Optimal:** 3-5 rate tiers
- Senior/Specialized: $200-250/hour
- Mid-Level/Standard: $125-175/hour
- Junior/Support: $75-100/hour

### 5. Transparency with Customers

**Rate communication:**
- ✅ Clearly state rates in contracts/SOWs
- ✅ Explain rate tiers (if role-based)
- ✅ Provide rate card upfront
- ✅ Give advance notice of rate increases
- ✅ Document in writing (no surprises)

## Rate-Related Fields on Timesheet Entries

### Hourly Rate Actual

**Purpose:** Billable rate used for revenue calculation

**Set by:**
- Automatically populated based on rate hierarchy (task → project → user)
- Can be manually overridden per entry (if permissions allow)

**Used for:**
- Invoice line item amounts
- Revenue calculation: `Duration × Hourly Rate Actual = Revenue`
- Effective rate analysis

### Hourly Rate Billed

**Purpose:** Locks the rate when entry is invoiced

**Set by:**
- Automatically set when invoice is created
- Copied from "Hourly Rate Actual" at time of invoicing

**Used for:**
- Audit trail (prevents rate changes after invoicing)
- Historical rate tracking
- Ensures invoice accuracy

**Important:** Once `Hourly Rate Billed` is set (entry is invoiced), the rate cannot be changed.

### Internal Cost Rate (UserDetail.DefaultHourlyRate)

**Purpose:** Employee cost for profitability calculation

**Used for:**
- Profitability analysis: `Revenue - (Duration × Cost Rate) = Profit`
- Resource allocation decisions
- Pricing strategy (ensure rates cover costs + margin)

**Not visible on:** Customer invoices

## Automation & Integration

### Automatic Rate Assignment

**Triggers/Actions can automate rate setting:**

**Example use case: "Ensure no zero-rate entries"**

```python
# Trigger on Timesheet Save
if timesheet.HourlyRateActual == 0:
    if timesheet.Task and timesheet.Task.HourlyRate:
        timesheet.HourlyRateActual = timesheet.Task.HourlyRate
    elif timesheet.Project and timesheet.Project.DefaultHourlyRate:
        timesheet.HourlyRateActual = timesheet.Project.DefaultHourlyRate
    else:
        timesheet.HourlyRateActual = GetCompanyDefaultRate()
```

**See:** [Scripting - Triggers](../scripting/triggers.md), [Scripting - Actions](../scripting/actions.md)

### Rate Import/Export

**Bulk rate updates:**
1. Export projects/tasks to Excel via [Data Export](../data-exchange/export.md)
2. Update rates in Excel
3. Import back via [Data Import](../data-exchange/import.md)

**API access:**
- Update rates programmatically via [Web API](../web-api/overview.md)
- Sync rates from external pricing system
- Automate rate increases based on CPI or contracts

## Reporting & Analysis

### Rate Analysis Reports

**Questions to answer:**
- What's our effective hourly rate by project? (Revenue / Hours)
- Which projects have highest/lowest rates?
- What's our average billable rate by customer?
- Are we applying correct rates (vs. contracted rates)?

**Built-in reports:**
- Navigate to **Reporting** → **[Built-In Reports](https://web.timecockpit.com/app/lists/APP_DefaultReportsList)**
- Revenue reporting shows rates implicitly (Revenue / Hours = Effective Rate)

**Custom reports:**
- Create SSRS reports with rate analysis
- Export to Excel for pivot table analysis

**See:** [Built-In Reports](../reporting/built-in-reports.md), [Custom Reports](../reporting/custom-reports.md)

### Rate Compliance Auditing

**Verify correct rates are being used:**
1. Export unbilled timesheet entries
2. Check `Hourly Rate Actual` against contracted rates (from contracts)
3. Identify discrepancies (too high or too low)
4. Correct before invoicing

**Common issues:**
- ❌ Employee selected wrong task (wrong rate applied)
- ❌ Project rate not updated after contract changed
- ❌ Manual override incorrectly applied
- ❌ Missing rate (zero-rate entries)

## Related Features

### Project Management
- [Budget Tracking](budget-tracking.md) - Profitability analysis using rates
- [Customers, Projects & Tasks](customer-project-task.md) - Setting up project hierarchy

### Invoicing
- [Invoice Creation & Billing Workflow](billing.md) - How rates flow into invoices
- [Invoice Data Fields](invoice-data-fields.md) - Understanding invoice amounts

### Reporting
- [Built-In Reports](../reporting/built-in-reports.md) - Rate and revenue reports
- [Custom Reports](../reporting/custom-reports.md) - Creating rate analysis reports

### Advanced
- [Data Model Customization](../data-model-customization/overview.md) - Building custom rate tables
- [Scripting - Actions](../scripting/actions.md) - Automating rate logic
- [Scripting - Triggers](../scripting/triggers.md) - Enforcing rate rules

## See Also

**FAQs:**
- [Billing Administrator FAQ](../billing-admin-faq.md) - Rate management questions
- [Project Manager FAQ](../project-manager-faq.md) - Profitability questions

**API & Integration:**
- [Web API Overview](../web-api/overview.md) - Updating rates programmatically
- [Data Exchange - Export](../data-exchange/export.md) - Bulk rate changes

---

*For rate configuration support, contact [support@timecockpit.com](mailto:support@timecockpit.com) or see the [Billing Administrator FAQ](../billing-admin-faq.md).*
