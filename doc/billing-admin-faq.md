---
title: Billing Administrator FAQ - Invoicing & Revenue Management
description: Frequently asked questions for billing administrators managing invoices, hourly rates, billing reports, revenue tracking, and customer billing in time cockpit.
keywords: [billing administrator, invoice creation, hourly rates, billing FAQ, revenue tracking, customer invoicing, time and materials billing, invoice management, billing reports, payment tracking, invoice export]
---

# Billing Administrator FAQ

This FAQ addresses common questions from billing administrators responsible for creating invoices, setting rates, tracking revenue, and managing customer billing in time cockpit.

> [!TIP]
> **Optimizing Invoicing?** Learn about time cockpit's [Project Invoicing features](https://www.timecockpit.com/features/project-invoicing/) and discover how to [maximize project revenue](https://www.timecockpit.com/blog/project-time-tracking-revenue/) through effective time tracking and billing.

> [!NOTE]
> For general time tracking questions, see the [User FAQ](user-faq.md). For project budget tracking, see the [Project Manager FAQ](project-manager-faq.md).

## Invoice Creation

### How do I create an invoice from unbilled timesheet entries?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

The invoicing workflow converts billable timesheet entries into customer invoices:

**Step-by-Step Invoice Creation:**

**1. Identify Unbilled Hours**
1. Navigate to **Timesheet** → **Time Sheets**
2. Apply filters:
   - **Billable:** True (only billable entries)
   - **Billed:** False (not yet invoiced)
   - **Date Range:** Billing period (e.g., last month)
   - **Customer:** (optional) filter to specific customer
   - **Project:** (optional) filter to specific project

**2. Review Timesheet Entries**
- Verify entries have proper project assignments
- Check descriptions are client-appropriate
- Confirm hourly rates are set correctly
- Ensure total hours match expectations

**3. Select Entries for Invoice**
- **All entries:** Select all (Ctrl+A) if invoicing everything
- **Specific entries:** Ctrl+Click to multi-select desired entries
- **By date:** If invoicing specific period
- **By milestone:** If project-based invoicing

**4. Run Create Invoice Action**
1. Click **Create Invoice** in the toolbar
2. **Parameter form appears** prompting for invoice details:
   - **Invoice Number:** Enter number (default shows "will be created automatically")
   - **Invoice Date:** Default is today, adjust if needed
   - **Description:** Optional invoice header text (max 200 characters)
   - **Service Period Start:** Optional start date (defaults to earliest selected timesheet date)
   - **Service Period End:** Optional end date (defaults to latest selected timesheet date)
3. Review parameter values and click **OK**

**5. Action Creates Invoice Automatically**

The action processes selected timesheet entries and creates:
- **Invoice record** with entered parameters
- **Invoice details** (line items) grouped by task and hourly rate
  - Each group becomes one line: Task name, hours, rate, total
  - If journey distance exists, adds travel costs line item
- **Updates timesheet entries**:
  - Sets **Billed** flag to True
  - Sets **Hourly Rate Billed** to lock the rate
  - Links to created invoice

**Post-Creation:**

**Invoice is now in system:**
- Navigate to **Management** → **Invoices** to view
- Export to PDF or Excel for sending to customer
- Entry into accounting system

> [!NOTE]
> The action automatically determines customer, project, and line items from the selected timesheet entries. You only provide invoice metadata (number, date, description, service period) in the parameter form.

**See Also:**
- [Invoicing](project-time-tracking/billing.md)
- [Invoice Data Fields](project-time-tracking/invoice-data-fields.md)
- [Project Time Sheets](project-time-tracking/timesheet.md)
- [Actions Documentation](~/doc/scripting/actions.md)

---

### Can I edit or delete an invoice after creation?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Invoice modification depends on whether it's been sent/paid and company policy:

**Editing Invoice Details:**

**Fields You CAN Edit (Typically):**
1. Navigate to **Management** → **Invoices**
2. Open the invoice record
3. Editable fields (usually):
   - ✓ **Invoice Description:** Header/footer text
   - ✓ **Payment Terms:** Clarification text
   - ✓ **Notes:** Internal notes (not on invoice doc)
   - ✓ **Payment Status:** Mark as paid/unpaid
   - ✓ **Payment Date:** When received
4. Click **Save**

**Fields You CANNOT Edit (Locked):**
- ✗ **Invoice Number:** Fixed once created
- ✗ **Line Items:** Linked timesheet entries
- ✗ **Total Amount:** Calculated from line items
- ✗ **Customer:** Would break accounting trail
- ✗ **Project:** Would break associations

**Why Locked?**
- **Accounting integrity:** Invoice must match timesheet records
- **Audit trail:** Can't retroactively change billed amounts
- **Legal compliance:** Invoices are financial documents

**Deleting an Invoice:**

**Before Sending to Customer:**
1. Navigate to **Management** → **Invoices**
2. Select the invoice
3. Click **Delete** (if available)
4. **Result:**
   - Invoice is deleted
   - Linked timesheet entries revert: **Billed** = False
   - **Hourly Rate Billed** cleared
   - Entries available for new invoice

**After Sending/Payment:**
- **Cannot delete** (or deletion is restricted)
- Must use **credit note/adjustment** process instead
- Preserves financial history

**Correcting Invoice Errors:**

**Scenario 1: Wrong Timesheet Entries Included**

**Before Sending:**
- Delete invoice
- Correct entry selection
- Recreate invoice

**After Sending:**
- Issue **credit note** (negative invoice) to reverse
- Create corrected invoice
- Communicate with customer

**Scenario 2: Wrong Hourly Rate**

**Root Cause:** Rate on timesheet entries incorrect before invoicing

**Fix:**
- **Cannot** change after invoicing (rates locked)
- **Option 1:** Issue credit note + corrected invoice
- **Option 2:** Manual adjustment invoice for difference
- **Future:** Correct rates BEFORE creating invoices

**Scenario 3: Missing Entries (Forgot to Include)**

**Solution:**
1. Entries are still **Billed** = False
2. Create supplemental invoice with missing entries
3. Or wait for next billing cycle
4. Communicate with customer

**Scenario 4: Customer Disputes Invoice**

**Process:**
1. **Investigate:** Review timesheet entries
2. **If error confirmed:**
   - Issue credit note to reverse disputed amount
   - Create corrected invoice if replacement needed
3. **If entries areCorrect:**
   - Provide backup documentation (timesheet details)
   - Negotiate resolution
   - Document outcome

**Credit Notes:**

**Creating a Credit Note:**
1. Navigate to **Management** → **Invoices**
2. Click **New** (create manual invoice)
3. enter **negative amounts** for line items
4. Reference original invoice number
5. Save as credit note

*Note: True credit note functionality may require customization.*

**Unlinking Timesheet Entries (Advanced):**

If you must "unbill" entries:
1. Navigate to **Timesheet** → **Time Sheets**
2. Filter to the invoice: **Invoice** = [Invoice Number]
3. Open each entry
4. Set **Billed** = False
5. Clear **Invoice** relation
6. Clear **Hourly Rate Billed**
7. Save

*Warning: This breaks audit trail and should only be done before customer receives invoice, with proper authorization.*

**Best Practices:**

**Before Creating Invoice:**
- ✓ Double-check timesheet entry accuracy
- ✓ Review hourly rates
- ✓ Verify project assignments
- ✓ Confirm billing period is correct
- ✓ Get project manager approval (if required)

**After Creating Invoice:**
- ✓ Review PDF/export before sending
- ✓ Verify math (hours × rates = total)
- ✓ Check invoice number sequence
- ✓ Mark invoice as "sent" when delivered

**See Also:**
- [Invoicing](project-time-tracking/billing.md)
- [Invoice Data Fields](project-time-tracking/invoice-data-fields.md)

---

### How do I handle retainer and fixed-price contracts?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Retainer and fixed-price billing differs from time-and-materials and requires special handling:

**Retainer Contracts (Monthly Fixed Amount for Up-To-X-Hours):**

**Example:** Customer pays $10,000/month for up to 50 hours of service

**Tracking Approach:**

**1. Track Actual Time**
- Team tracks time to the retainer project as usual
- All hours are **Billable** = True
- Ensures you know actual usage

**2. Monthly Invoice Process**
- **If under cap (e.g., 40 hours tracked):**
  - Create invoice for fixed amount ($10,000)
  - Note hours used: "40 of 50 hours used"
  - Mark all 40 hours as **Billed** = True

- **If at cap (exactly 50 hours):**
  - Create invoice for fixed amount ($10,000)
  - Note: "50 of 50 hours used"
  - Mark all 50 hours as **Billed** = True

- **If over cap (60 hours tracked):**
  - **Option A - Included:** Invoice fixed amount, eat the overage (good faith)
  - **Option B - Billable:** Invoice fixed amount + $2,000 for 10 overage hours
  - **Option C - Carry forward:** Bank 10 hours toward next month
  - (Depends on contract terms)

**3. Manual Invoice Creation**

Some retainers don't use actual timesheet entries:
1. Navigate to **Management** → **Invoices**
2. Click **New**
3. Manually enter:
   - **Customer**
   - **Invoice Number**
   - **Line Item:** "Monthly Retainer - February 2026"
   - **Amount:** $10,000
   - **Date range covered in description**
4. Save

Then separately mark timesheet entries as "billed" for tracking:
1. Navigate to **Timesheet** → **Time Sheets**
2. Filter to retainer project, this month
3. Multi-select all entries
4. Set **Billed** = True
5. Save

**Fixed-Price Contracts (One-Time Project, Agreed Total Price):**

**Example:** Website project for $50,000 regardless of hours spent

**Tracking Approach:**

**1. Track Actual Time**
- Team tracks all time to project
- Hours tell you actual cost vs. agreed price (profitability)
- Entries are generally **Billable** = True

**2. Milestone-Based Invoicing**

**Contract might specify:**
- 30% deposit upfront: $15,000
- 40% at design approval: $20,000
- 30% at final delivery: $15,000

**Invoice Process:**
1. **Milestone reached**
2. Create **manual invoice** (not from timesheet entries)
3. Navigate to **Management** → **Invoices** → **New**
4. Enter:
   - **Customer**
   - **Project**
   - **Line Item:** "Milestone 1 - Design Phase Complete"
   - **Amount:** $20,000
5. Save

**Mark timesheet entries as billed:**
1. Filter timesheet entries for this milestone period
2. Multi-select entries
3. Set **Billed** = True (so they don't appear in "unbilled" reports)
4. Optionally link **Invoice** relation for tracking

**3. Completion-Based Invoicing**

Invoice full amount at project completion:
1. Manual invoice for $50,000 at end
2. Mark all project timesheet entries as **Billed** = True

**Tracking Profitability on Fixed-Price:**

**Calculate:**
```
Internal Cost = Total Hours Tracked × Employee Hourly Cost Rate
Revenue = Fixed Price Agreed
Profit = Revenue - Internal Cost
Margin % = (Profit / Revenue) × 100
```

**Example:**
```
Fixed Price: $50,000
Hours Tracked: 500
Avg Internal Cost Rate: $75/hour
Internal Cost: 500 × $75 = $37,500
Profit: $50,000 - $37,500 = $12,500
Margin: 25%
```

**Use insights for future pricing.**

**Combination Contracts:**

**Some contracts mix models:**
- Retainer: $5,000/month for ongoing support (20 hours)
- Plus: Time-and-materials for project work at $150/hour

**Solution:**
- Separate projects in time cockpit:
  - Project: "Customer A - Retainer"
  - Project: "Customer A - Project Work"
- Invoice retainer monthly (fixed)
- Invoice project work separately (time-based)

**Subscription/Recurring Revenue:**

**For SaaS or recurring services:**
- Not tied to time tracking at all
- Create invoices manually each period
- Don't mark timesheet entries as "billed" (doesn't apply)
- Track time for internal analysis only

**See Also:**
- [Invoicing](project-time-tracking/billing.md)
- [Customers, Projects & Tasks](project-time-tracking/customer-project-task.md)
- [Project Manager FAQ](project-manager-faq.md#how-do-i-handle-partially-billed-projects)

---

## Hourly Rates & Pricing

### How do I set and update hourly rates for billing?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Hourly rates determine how much you bill customers for time worked:

**Rate Hierarchy (Priority Order):**

Time cockpit checks rates in this order:
1. **Task-specific rate** (highest priority)
2. **Project default rate**
3. **Employee/User rate**
4. **Company default rate** (lowest priority, fallback)

**Setting Project-Level Rates:**

1. Navigate to **Management** → **Projects**
2. Open the project
3. Set **Default Hourly Rate:** $150 (example)
4. Save

**All timesheet entries** for this project use $150 unless overridden.

**Setting Task-Level Rates (More Granular):**

1. Navigate to **Management** → **Tasks**
2. Open the task
3. Set **Hourly Rate:** $200 (example)
4. Save

**Why use task rates?**
- Different rates for different work types:
  - Senior Developer Work: $200/hour
  - Junior Developer Work: $100/hour
  - Project Management: $150/hour
  - Testing: $80/hour

**Setting Employee/User Rates:**

1. Navigate to **User** → **User Details**
2. Open employee record
3. Set **Default Hourly Rate:** $125 (example)
4. Save

**Note:** This is typically internal cost rate (for profitability), not the billable rate. Billable rates are usually set on projects/tasks.

**Updating Rates Mid-Project:**

**Scenario:** Project rate increases from $150 to $175/hour

**Update Project:**
1. Navigate to **Management** → **Projects**
2. Open project
3. Change **Default Hourly Rate:** $175
4. Save

**Impact:**
- **Future timesheet entries:** Use $175
- **Past entries:** Still show original rate ($150)
- **Invoiced entries:** Locked at invoiced rate (cannot change)

**If you need to retroactively adjust past unbilled entries:**
1. Navigate to **Timesheet** → **Time Sheets**
2. Filter to project + date range + **Billed** = False
3. Edit entries individually or use bulk update:
   - Multi-select entries
   - Set **Hourly Rate Actual:** $175
4. Save

**Customer-Specific Rates:**

**Different customers, different rates:**

**Approach 1: Project-Level Rates**
- Customer A projects: Set rate $150
- Customer B projects: Set rate $200
- Each project gets customer-specific rate

**Approach 2: Rate Tables (Requires Customization)**
- Create rate table entity:
  - Customer
  - Service Type (Development, Consulting, etc.)
  - Hourly Rate
- Lookup rate when creating timesheet entries
- Requires scripting/customization

**Blended Rates vs. Role-Based Rates:**

**Blended Rate (Simple):**
- One rate for all team members on project: $150/hour
- Customer billed same rate regardless of who works
- Set on project level

**Role-Based Rate (Complex):**
- Senior Developer: $200/hour
- Mid-Level Developer: $150/hour
- Junior Developer: $100/hour
- Set on task level or per employee

**Discounts:**

**Scenario:** Customer gets 10% discount

**Option 1: Adjust Project Rate**
- Regular rate: $150
- Discounted rate: $135 ($150 × 0.90)
- Set project rate to $135

**Option 2: Discount at Invoice Level**
- Create invoice with regular rates
- Add manual line item: "10% Discount: -$1,500"
- Adjust invoice manually (requires manual invoice editing)

**Currency:**

Time cockpit stores amounts without currency symbols:
- You manage currency through:
  - Invoice notes ("All amounts in USD")
  - Accounting system export
  - Customer agreements

Multi-currency requires:
- Separate projects per currency? Or
- Custom fields for currency tracking

**Rate Change Communication:**

**Notifying Customers:**
1. Update contracts/SOWs
2. Communicate rate change (typically 30-60 days notice)
3. Update project rates in time cockpit
4. Document effective date

**See Also:**
- [Customers, Projects & Tasks](project-time-tracking/customer-project-task.md)
- [Invoice Data Fields](project-time-tracking/invoice-data-fields.md)
- [Invoicing](project-time-tracking/billing.md)

---

### How do I track billable vs. non-billable time for profitability?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Understanding billable ratio is key to service business profitability:

**Billable vs. Non-Billable Defined:**

**Billable Time:**
- Client work that generates revenue
- Appears on invoices
- Examples: Development, consulting, meetings with client, design work

**Non-Billable Time:**
- Work not charged to clients
- Internal overhead
- Examples: Internal meetings, training, sales, admin tasks, proposals

**Setting Billability:**

**Timesheet Entry Level:**
Each entry has **Billable** checkbox:
- ✓ Checked = Billable (will be invoiced)
- ✗ Unchecked = Non-billable (internal time)

**Task Level Default:**
Set default billability on tasks:
1. Navigate to **Management** → **Tasks**
2. Open task
3. Set **Default Billable:** True or False
4. Save

When employees select this task, **Billable** flag inherits this default (but can be overridden per entry).

**Tracking Billable Ratio:**

**Formula:**
```
Billable Ratio = (Billable Hours / Total Hours) × 100
```

**Example:**
```
Employee works 40 hours:
- 30 hours billable client work
- 10 hours non-billable (meetings, admin)
Billable Ratio = (30 / 40) × 100 = 75%
```

**Target Ratios:**

industry benchmarks:
- **Professional Services:** 70-85% billable
- **Consulting:** 65-80% billable
- **Software Development:** 60-75% billable
- **Agencies:** 70-85% billable

**Reporting Billable Ratio:**

**Individual Level:**
1. Navigate to **Timesheet** → **Time Sheets**
2. Filter: **User Detail** = Employee, **Date Range** = Month
3. **Group by Billable**
4. View subtotals:
   - Billable: True → X hours
   - Billable: False → Y hours
5. Calculate ratio

**Project Level:**
1. Filter to **Project**
2. Group by **Billable**
3. View:
   - Total billable hours for project
   - Total non-billable hours (overhead)
   - Ratio tells you project efficiency

**Company/Department Level:**
1. Generate report: **Billable vs. Non-Billable Time**
2. Date range: Month, quarter, year
3. Metrics:
   - Total billable hours (all employees)
   - Total non-billable hours
   - Company-wide billable ratio

**Improving Billable Ratio:**

**If Ratio is Low (<60%):**

**Diagnose:**
1. Export timesheet data
2. Analyze non-billable time by category:
   - Internal meetings: X hours
   - Training: Y hours
   - Admin: Z hours
   - Sales/proposals: A hours

**Actions:**
- **Reduce meetings:** Streamline internal meetings
- **Charge for some activities:** Can training be billable? Can proposals?
- **Improve efficiency:** Automate admin tasks
- **Increase client work:** Sales and marketing to get more projects
- **Right-size staff:** If not enough client work, may be overstaffed

**Billability by Activity Type:**

**Common Categories:**

**Always Billable:**
- Client deliverable work (code, design, content)
- Client meetings and calls
- Required project documentation
- Deployment and support (if in SOW)

**Sometimes Billable (Contract-Dependent):**
- Travel time
- Email correspondence with client
- Internal planning meetings about client project
- Training on client-specific technology

**Never Billable:**
- Internal company meetings (all-hands, HR)
- Generic training (not client-specific)
- Sales and proposals (not yet won)
- Administrative tasks (timesheets, expenses)
- vacation, sick leave

**Utilization vs. Billable Ratio:**

**Utilization Rate:**
```
Utilization = (Hours Worked / Available Hours) × 100
```

Example: 40 hours worked / 40 hours available = 100% utilization

**Billable Ratio:**
```
Billable Ratio = (Billable Hours / Hours Worked) × 100
```

Example: 30 billable / 40 worked = 75% billable ratio

**Combined Metric:**
```
Billable Utilization = (Billable Hours / Available Hours) × 100
```

Example: 30 billable / 40 available = 75% billable utilization

**This is the key profitability metric** - what % of available time generates revenue.

**Tracking Over Time:**

**Monthly Trend:**
- Track billable ratio each month
- Look for:
  - **Declining:** May indicate staffing issues, too much overhead, or reduced client work
  - **Increasing:** Good trend, more efficient
  - **Seasonal:** Some industries have seasonal patterns (low in summer, high in fall)

**Employee Comparison:**
- Compare billable ratios across employees
- Identify top performers (high billable ratio)
- Coach low performers or reassign work

**See Also:**
- [Project Time Sheets](project-time-tracking/timesheet.md)
- [Invoicing](project-time-tracking/billing.md)
- [Project Manager FAQ](project-manager-faq.md#how-do-i-track-actual-costs-versus-billable-amounts)

---

## Revenue & Reporting

### What billing reports should I review regularly?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Consistent reporting ensures revenue accuracy and cash flow management:

**Weekly Reports (Monday - 15 minutes):**

**1. Unbilled Hours Review**
- **Purpose:** Track revenue not yet invoiced
- **Report:** Timesheet list filtered **Billable** = True, **Billed** = False
- **Metrics:**
  - Total unbilled hours
  - Total unbilled amount (hours × rates)
  - Age of unbilled hours (how far back)
- **Action:**
  - Identify what's ready to invoice
  - Follow up on old unbilled hours (> 60 days)

**Monthly Reports (First Week of Month - 1 hour):**

**2. Monthly Invoicing Report**
- **Purpose:** Invoice all billable work from previous month
- **Report:** Same as above, filter to **Date Range** = Last month
- **Process:**
  - Generate invoices for all customers
  - Review total monthly revenue
  - Ensure no missed unbilled hours
- **Action:** Complete monthly invoicing

**3. Revenue by Customer**
- **Purpose:** Understand revenue mix
- **Report:** Invoices grouped by Customer
- **Metrics:**
  - Total invoiced amount per customer
  - % of revenue per customer
  - Customer ranking (top 10 customers)
- **Action:**
  - Identify top customers (revenue concentration risk)
  - Target growth with mid-tier customers

**4. Revenue by Project**
- **Purpose:** Project profitability and completion tracking
- **Report:** Invoices grouped by Project
- **Metrics:**
  - Revenue generated per project
  - Project budget vs. invoiced (% complete)
- **Action:**
  - Identify profitable projects
  - Flag projects approaching budget limits

**5. Billing Cycle Compliance**
- **Purpose:** Ensure timely invoicing
- **Report:** Age of unbilled hours
- **Metrics:**
  - 0-30 days old: X hours (current)
  - 31-60 days old: Y hours (delayed)
  - 61+ days old: Z hours (very delayed - risk!)
- **Action:**
  - Invoice immediately for 61+ days
  - Understand why delays happen (approval issues? project disputes?)

**Quarterly Reports (Strategic Review - 2 hours):**

**6. Quarterly Revenue Analysis**
- **Purpose:** Financial planning and forecasting
- **Report:** Total invoices for quarter
- **Metrics:**
  - Total revenue Q1 vs. Q2 vs. Q3 vs. Q4
  - Growth rate quarter-over-quarter
  - Average invoice size
  - Average days to payment
- **Action:**
  - Report to finance/leadership
  - Forecast next quarter
  - Identify trends

**7. Customer Payment Status**
- **Purpose:** Accounts receivable and cash flow
- **Report:** Invoice list with payment status
- **Metrics:**
  - Total invoiced vs. total paid
  - Outstanding invoices (unpaid)
  - Overdue invoices (past due date)
  - Average days to payment
- **Action:**
  - Follow up on overdue invoices
  - Flag customers with payment issues
  - Coordinate with finance/AR team

**8. Billable Ratio / Utilization**
- **Purpose:** Operational efficiency
- **Report:** Billable vs. non-billable time
- **Metrics:**
  - Company-wide billable ratio
  - By department
  - By employee
  - Trend over quarter
- **Action:**
  - Identify efficiency opportunities
  - Right-size staffing
  - Improve processes

**Ad-Hoc Reports:**

**When Needed:**
- **Customer rate card:** All active projects/rates for a customer
- **Project profitability:** One project's complete revenue vs. cost analysis
- **Employee billing performance:** Top billing employees for recognition
- **Invoice dispute resolution:** Detailed timesheet backup for specific invoice

**Report Dashboard:**

**Create saved views for quick access:**
- "Unbilled Hours - This Month"
- "Invoices Created Last Month"
- "Overdue Invoices"
- "Revenue by Customer - YTD"

**Reporting Rhythm Template:**
```
Monday Morning (15 min):
 □ Check unbilled hours
 □ Note anything ready to invoice

First Monday of Month (1 hour):
 □ Create all invoices for previous month
 □ Review monthly revenue
 □ Check for payment delays

First Week of Quarter (2 hours):
 □ Quarterly revenue report
 □ Update forecasts
 □ Present to leadership
```

**Integration with Accounting:**

**Export invoice data to:**
- QuickBooks
- Xero
- SAP
- Custom ERP

See: [Data Export](data-exchange/export.md) and [Web API](web-api/overview.md)

**See Also:**
- [Invoicing](project-time-tracking/billing.md)
- [Built-In Reports](reporting/built-in-reports.md)
- [Data Export](data-exchange/export.md)

---

## Customer & Account Management

### How do I manage multiple billing contacts for one customer?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Large customers often have different billing contacts for different projects or departments:

**Customer Structure:**

Time cockpit has:
- **Customer** entity (company level)
- **Projects** under customer

**Billing contact information typically stored at customer level:**
- Billing address
- Accounts payable contact
- Email for invoice delivery

**Multiple Contacts Scenarios:**

**Scenario 1: Different Projects, Different Billing Contacts**

**Example:**
- Customer: Acme Corp
  - Project A (IT Department) → Bill to: it-billing@acme.com
  - Project B (Marketing Department) → Bill to: marketing-billing@acme.com

**Solution 1: Custom Field on Project**
1. Add custom field to Project entity: "Billing Contact Email"
2. Set on each project
3. When creating invoice, manually note billing contact
4. Export invoice and send to correct contact

**Solution 2: Separate "Customers" per Department**
1. Create:
   - Customer: "Acme Corp - IT"
   - Customer: "Acme Corp - Marketing"
2. Projects under respective customer
3. Each has own billing address
4. Invoices separate by department

**Scenario 2: Multiple Billing Addresses (Different Locations)**

**Example:**
- Acme Corp
  - US Office (billing address: New York)
  - EU Office (billing address: London)

**Solution:**
- Separate customer records:
  - "Acme Corp USA"
  - "Acme Corp EU"
- Or custom field for alternate billing address on project

**Scenario 3: Same Contact, Different Purchase Orders**

**Example:**
- Same customer, same billing contact
- Multiple projects require separate POs on invoices

**Solution:**
1. Add custom field to Project: "Purchase Order Number"
2. When creating invoice, include PO number in invoice description
3. Customer's AP can match invoice to PO

**Contact Management Best Practice:**

**Primary Billing Contact (Customer Level):**
- Name
- Email
- Phone
- Billing address

**Project-Specific Notes:**
- Custom field or description: "Invoice to: John Smith (john@acme.com), PO #12345"

**Communication:**
- Note billing contact preferences
  - Email invoices? Or mail hard copy?
  - CC: additional people?
  - Specific invoice format requirements?

**Invoice Delivery:**

**Email Invoices:**
1. Export invoice to PDF
2. Email to billing contact manually
   - Or use email automation (requires integration)
3. Note sent date in invoice record

**Accounting System Integration:**
- Export invoices to QuickBooks/Xero
- Accounting system handles invoice delivery

**See Also:**
- [Customers, Projects & Tasks](project-time-tracking/customer-project-task.md)
- [Invoicing](project-time-tracking/billing.md)
- [Invoice Data Fields](project-time-tracking/invoice-data-fields.md)

---

## Need More Help?

### Billing Administrator Resources

**Related FAQs:**
- [User FAQ](user-faq.md) - General time tracking
- [Project Manager FAQ](project-manager-faq.md) - Budget and project tracking
- [HR Administrator FAQ](hr-administrator-faq.md) - Employee payroll data
- [Developer FAQ](developer-faq.md) - API & customization for billing integrations

**Documentation:**
- [Invoicing](project-time-tracking/billing.md)
- [Invoice Data Fields](project-time-tracking/invoice-data-fields.md)
- [Project Time Sheets](project-time-tracking/timesheet.md)
- [Customers, Projects & Tasks](project-time-tracking/customer-project-task.md)
- [Data Export](data-exchange/export.md)
- [Web API Overview](web-api/overview.md)

**Support:**
- **Email:** support@timecockpit.com  
- **Billing Training:** Request billing-specific training sessions
- **Integration Consulting:** Get help with accounting system integration

---

*This FAQ is regularly updated with billing and revenue insights. Last updated: February 2026.*
