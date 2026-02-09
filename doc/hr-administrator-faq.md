---
title: HR Administrator FAQ - Employee & Absence Management
description: HR administrator FAQ for time cockpit: vacation policies, absence approvals, working time regulations, employee onboarding, and compliance.
keywords: [HR time tracking, vacation policy management, absence approval, employee onboarding, working time regulations, sick leave management, HR administrator guide, employee management, time tracking compliance, vacation balance, leave management, HR FAQ]
---

# HR Administrator FAQ

This FAQ addresses common questions from HR administrators managing employees, vacation policies, absence approvals, working time regulations, and compliance in time cockpit.

> [!NOTE]
> For general time tracking questions, see the [User FAQ](user-faq.md). For developer/API questions, see the [Developer FAQ](developer-faq.md).

## Employee Management & Onboarding

### How do I add a new employee to time cockpit?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Setting up a new employee involves creating their user account and configuring employment details:

**Step 1: Create User Account**
1. Navigate to **User** → **User Details**
2. Click **New**
3. Fill in user information:
   - **Username:** Employee's email or login name
   - **First Name** and **Last Name**
   - **Email:** For notifications and login
   - **Culture Info:** Language preference (en-US, de-DE, etc.)
   - **Hidden:** Leave unchecked (makes user visible in selections)
4. Click **Save**

**Step 2: Set Authentication**
If using Azure AD / Microsoft 365:
- User authenticates with their Microsoft account
- No password management needed in time cockpit
- User must be in your Azure AD tenant

If using time cockpit authentication:
- Set initial password (employee changes on first login)
- Configure password policy per your security requirements

**Step 3: Configure Employment Details**
1. In the same user record, set employment fields:
   - **Employee Number:** Internal HR identifier
   - **Department:** Assign to organizational unit
   - **Department Lead:** Select their manager (for approval workflows)
   - **Cost Center:** If tracking by cost center
   - **Hire Date:** Employment start date

**Step 4: Set Working Time Model**
1. **Weekly Hours of Work:** Standard hours per week (e.g., 40)
2. **Weekly Working Time Model:** Define work schedule
   - Navigate to **User** → **Weekly Hours of Work**
   - Create or select model (Mon-Fri 8h/day, part-time, etc.)
   - Assign to employee

**Step 5: Configure Vacation Entitlement**
1. In user record, set:
   - **Yearly Vacation Entitlement:** Days per year (e.g., 20)
   - **Vacation Carried Forward:** Any transfer from previous employer
   - **Vacation Year Start:** Calendar year or fiscal year start

**Step 6: Set Permissions & Roles**
1. Assign roles based on responsibilities:
   - **Standard User:** Time tracking only
   - **Project Manager:** Access to project data
   - **Department Lead:** Team approval rights
   - **HR Admin:** Full employee management
   - **Billing Admin:** Invoice creation
2. Configure custom permissions if using advanced permission model

**Step 7: Set Hourly Rate (If Tracking Costs)**
1. **Default Hourly Rate:** Internal cost rate for profitability analysis
2. This is separate from billable rates (set on projects/tasks)

**Verification Checklist:**
- □ User can log in successfully
- □ Appears in user selection dropdown
- □ Department assignment correct
- □ Working time model appropriate (full-time/part-time)
- □ Vacation balance initialized
- □ Can create timesheet entries
- □ Permissions appropriate for their role

**Offboarding (Employee Leaves):**
1. Set **End Date** in employment details
2. Check **Hidden** flag to remove from user selection
3. Do not delete user (preserves historical data)
4. Revoke access permissions or deactivate Azure AD account

**See Also:**
- [Account Management](account-management/account-management.md)
- [Working Time / Leave Management](employee-time-tracking/working-time.md)
- [Default Permissions](employee-time-tracking/default-permissions.md)

---

### How do I set up different working time models (full-time, part-time)?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Working time models define expected hours per week and daily schedules for employees:

**Common Working Time Models:**

**1. Full-Time (40 hours/week, 8 hours/day)**
```
Monday:    8:00 - 17:00 (1 hour lunch break) = 8h
Tuesday:   8:00 - 17:00 (1 hour lunch break) = 8h
Wednesday: 8:00 - 17:00 (1 hour lunch break) = 8h
Thursday:  8:00 - 17:00 (1 hour lunch break) = 8h
Friday:    8:00 - 17:00 (1 hour lunch break) = 8h
Total: 40 hours/week
```

**2. Part-Time (20 hours/week, 50%)**
```
Monday:    8:00 - 12:00 = 4h
Tuesday:   8:00 - 12:00 = 4h
Wednesday: 8:00 - 12:00 = 4h
Thursday:  8:00 - 12:00 = 4h
Friday:    8:00 - 12:00 = 4h
Total: 20 hours/week
```

**3. Compressed Week (40 hours, 4 days)**
```
Monday:    7:00 - 17:30 (30 min break) = 10h
Tuesday:   7:00 - 17:30 (30 min break) = 10h
Wednesday: 7:00 - 17:30 (30 min break) = 10h
Thursday:  7:00 - 17:30 (30 min break) = 10h
Friday:    Off
Total: 40 hours/week
```

**Creating a Working Time Model:**

1. Navigate to **User** → **Weekly Hours of Work**
2. Click **New**
3. **Name the model:** e.g., "Full-Time 40h", "Part-Time 50%", "4-Day Week"
4. Set **Total Weekly Hours:** 40, 20, 30, etc.
5. Define **Daily Hours:**
   - **Monday Hours:** 8
   - **Tuesday Hours:** 8
   - Continue for each day
   - Set to 0 for non-working days
6. Set **Break Times** (if applicable):
   - Unpaid break duration (e.g., 1 hour lunch)
   - This affects expected working time calculation
7. Click **Save**

**Assigning Model to Employee:**
1. Navigate to **User** → **User Details**
2. Open employee record
3. Set **Weekly Working Time Model:** Select from dropdown
4. Set **Weekly Hours:** Should match model total (auto-filled)
5. Save

**How Models Are Used:**

**Overtime Calculation:**
```
Overtime = Actual Hours Tracked - Expected Hours (from model)
```
Example: Employee works 45h in a week with 40h model = 5h overtime

**Vacation Proration:**
Part-time employees get prorated vacation:
```
Actual Entitlement = Full-Time Days × (Part-Time % / 100)
```
Example: 20 days full-time, 50% part-time = 10 days vacation

**Time Report:**
The time report shows expected vs. actual hours based on assigned model

**Flexible Working Arrangements:**

**Remote Work / Hybrid Model:**
- Use same hours, employee can note location in timesheet description
- Or create custom fields for tracking remote vs. office days

**Flextime (No Fixed Schedule):**
- Set weekly total: 40h
- Set daily distribution to 0 or average
- Focus on weekly total, not daily breakdown

**Shift Work:**
Create multiple models for different shifts:
- Early Shift: 6:00 - 14:30
- Late Shift: 14:00 - 22:30
- Night Shift: 22:00 - 6:30

**Change Over Time:**

**Permanent Change (Promotion, Part-Time Adjustment):**
1. Update employee's **Weekly Working Time Model**
2. Set **Effective Date** if tracking change date
3. Historical overtimeCalculations remain based on old model

**Temporary Change (Temporary Part-Time):**
- Consider creating time-limited model assignment
- Or note in employee record description
- Requires customization for date-range model assignment

**See Also:**
- [Working Time / Leave Management](employee-time-tracking/working-time.md)
- [Working Time Regulations](employee-time-tracking/working-time-regulations.md)
- [Time Report](employee-time-tracking/time-report.md)

---

### How do I bulk update employee information?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

For organizational changes affecting multiple employees, bulk updates save significant time:

**Method 1: Excel Export/Import (Recommended for Large Changes)**

**Export Current Data:**
1. Navigate to **User** → **User Details**
2. Select **all employees** or filter to affected group
3. Click **Export to Excel**
4. Save the Excel file

**Modify in Excel:**
1. Open the exported file
2. Update the relevant columns:
   - Department
   - Department Lead
   - Hourly rates
   - Working time models
   - Vacation entitlement
3. Save the file

**Import Updated Data:**
1. Navigate to **Data Exchange** → **Import**
2. Select **User Details** as target entity
3. Upload your modified Excel file
4. Map columns to time cockpit fields
5. **Preview import:** Review changes before committing
6. Click **Execute Import**
7. Verify success and check for any errors

**Method 2: Multi-Select Edit (For Simple Field Updates)**

1. Navigate to **User** → **User Details**
2. Use filters to select affected employees
3. **Multi-select:** Ctrl+Click or Shift+Click to select multiple
4. Right-click → **Edit Selected** (if available)
5. Change common field(s)
6. Save to apply to all selected

*Note: Multi-select editing capabilities depend on your time cockpit version and configuration.*

**Method 3: Custom Script (Advanced)**

For complex bulk updates, use the scripting environment:

```python
# Example: Bulk update department for all employees in old department
dc = context.DataContext
query = """
From U In APP_UserDetail 
Where U.APP_Department.APP_DepartmentName = 'Old Department'
Select U
"""
users = dc.Select(query)

new_dept_query = """
From D In APP_Department 
Where D.APP_DepartmentName = 'New Department'
Select D
"""
new_dept = dc.SelectSingle(new_dept_query)

for user in users:
    user.APP_Department = new_dept
    dc.SaveObject(user)
```

For help with scripts, contact support@timecockpit.com or see [Developer FAQ](developer-faq.md).

**Common Bulk Update Scenarios:**

**Scenario 1: Department Reorganization**
- Update department assignments for affected employees
- Update department lead references
- Export → Excel → Update Department column → Import

**Scenario 2: Annual Vacation Increase**
- Increase yearly vacation entitlement across all employees
- Export → Excel → Update Vacation Entitlement → Import

**Scenario 3: Companywide Hourly Rate Adjustment**
- Update internal cost rates for profitability tracking
- Export → Excel → Update Default Hourly Rate → Import

**Scenario 4: Working Time Model Change**
- Transition employees from one model to another
- Create new model first
- Export → Excel → Update Weekly Working Time Model ID → Import

**Best Practices:**

**Before Bulk Updates:**
1. **Backup first:** Export current data before making changes
2. **Test on subset:** Try bulk update on 2-3 employees first
3. **Communicate:** Notify affected employees of upcoming changes
4. **Document:** Record what changed, when, and why

**During Import:**
1. **Preview carefully:** Review import preview for unexpected changes
2. **Check mappings:** Ensure Excel columns map to correct fields
3. **Validate references:** Department, lead, and model references must exist
4. **Handle errors:** Review error messages and fix data issues

**After Bulk Updates:**
1. **Verify changes:** Spot-check several employee records
2. **Run reports:** Generate employee list to confirm updates
3. **Monitor:** Watch for any issues employees report after change
4. **Rollback plan:** Know how to revert if problems arise (restore from backup export)

**Fields Commonly Bulk Updated:**
- ✓ Department
- ✓ Department Lead
- ✓ Hourly Rate
- ✓ Vacation Entitlement
- ✓ Working Time Model
- ✓ Culture Info (language)
- ✓ Cost Center
- ✗ Username (risky, handle individually)
- ✗ Authentication (handle via Azure AD, not bulk)

**See Also:**
- [Data Import](data-exchange/import.md)
- [Data Export](data-exchange/export.md)
- [Developer FAQ](developer-faq.md) - Scripting guidance

---

## Vacation & Absence Policy

### How do I configure vacation policies and entitlements?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Vacation policies vary by jurisdiction and company. Here's how to configure time cockpit to match your policy:

**Basic Vacation Configuration:**

**Setting Individual Entitlement:**
1. Navigate to **User** → **User Details**
2. Open employee record
3. Set vacation fields:
   - **Yearly Vacation Entitlement:** Days per year (e.g., 20, 25, 30)
   - **Vacation Year Start Date:** Calendar year (Jan 1) or fiscal year start
   - **Vacation Carried Forward:** Unused from previous year
4. Save

**Common Policies:**

**Policy 1: Fixed Annual Entitlement**
- Each employee gets same number of days (e.g., 20 days/year)
- Set **Yearly Vacation Entitlement:** 20 for all employees
- Use bulk update for new hire batches

**Policy 2: Seniority-Based Entitlement**
- Years of service increase vacation days
- Examples:
  - 0-5 years: 20 days
  - 5-10 years: 25 days
  - 10+ years: 30 days
- Manually update entitlement when employees hit milestones
- Consider annual review cycle

**Policy 3: Part-Time Prorated**
- Part-time employees get proportional vacation
- Calculation: Full-Time Days × (Part-Time % / 100)
- Example: 50% employee gets 10 days if full-time gets 20
- Set **Yearly Vacation Entitlement** to prorated amount

**Vacation Year Start:**

**Calendar Year (January 1):**
- Set **Vacation Year Start:** January 1
- Balances reset each January 1
- Matches most countries' legal requirements

**Fiscal Year:**
- Set **Vacation Year Start:** To your fiscal year start (e.g., July 1)
- Useful if budgeting and reporting use fiscal year

**Employment Anniversary:**
- Requires customization
- Each employee's vacation year starts on hire date
- Complex but avoids year-end vacation rushes

**Carryover Policies:**

**Policy 1: No Carryover (Use It or Lose It)**
- Unused vacation expires at year-end
- System resets to full entitlement
- Employees forfeit unused days
- *Check local labor laws - this may be illegal in some jurisdictions*

**Policy 2: Limited Carryover**
- Allow carrying forward up to X days
- Example: Max 5 days carried forward
- Set manually in **Vacation Carried Forward** field at year-end
- Requires annual process to avoid unused days expiring

**Policy 3: Unlimited Carryover**
- All unused vacation rolls forward
- Accumulates over years
- Track as **Vacation Carried Forward**
- Monitor for employees with excessive unused balances

**Policy 4: Carryover with Expiration**
- Carried-forward days must be used by specific date (e.g., March 31)
- Requires manual tracking or customization
- Note expiration dates in employee records

**Accrual Policies:**

**Immediate Entitlement:**
- Employees get full year entitlement on day one
- Set **Yearly Vacation Entitlement** immediately

**Monthly Accrual:**
- Employees earn vacation each month
- Calculation: Yearly Entitlement / 12 per month
- Example: 24 days/year = 2 days/month
- Requires customization or manual adjustment of entitlement

**Pro-Rated for New Hires:**
- Mid-year hires get partial year entitlement
- Calculation: (Full Year Entitlement / 365) × Days Employed
- Example: Hired July 1, 20 days/year = ~10 days first year
- Set custom **Yearly Vacation Entitlement** for first year

**Special Vacation Types:**

Beyond standard vacation, you may track:
- **Personal Days:** Emergency or personal time off
- **Floating Holidays:** Company-specific flexible days
- **Sabbatical:** Extended leave after years of service

These can be tracked similar to vacation or as separate entities depending on company policy.

**Compliance Considerations:**

**European Union:**
- Minimum 4 weeks (20 days for 5-day week) required by law
- Cannot be waived or paid out (in most countries)
- Must be used, not just accrued

**United States:**
- No federal vacation requirement
- Company policy determines entitlement
- State laws may apply

**Other Jurisdictions:**
- Check local labor laws for minimum requirements
- Some countries require vacation payout on termination
- Holidays vs. vacation may be regulated separately

**See Also:**
- [Absence Time Management](employee-time-tracking/absence-time-management.md)
- [Working Time / Leave Management](employee-time-tracking/working-time.md)

---

### How do I approve or reject vacation requests?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

As an HR administrator, you can approve vacation requests for all employees (department leads can approve for their teams):

**Viewing Pending Requests:**

1. Navigate to **User** → **Vacation**
2. **Filter to pending:**
   - **Is Approved:** False or Unchecked
3. Sort by **Begin Date** to prioritize upcoming vacations
4. Review list of pending requests

**Approving Requests:**

**Individual Approval:**
1. In the Vacation list, find the request
2. Open the vacation record (double-click or select)
3. Review details:
   - **Employee** requesting vacation
   - **Begin and End Date**
   - **Total Days** (calculated)
   - **Description/Reason** (if provided)
   - **Employee's Vacation Balance** - check they have enough days
4. If approved:
   - Check the **Is Approved** checkbox (or set **Approved Timestamp**)
   - **Approver** field autofills with your user
   - Click **Save**
5. Employee receives notification (if configured)

**Batch Approval:**
1. In the Vacation list, multi-select multiple requests (Ctrl+Click)
2. Run **Approve Absence** action from toolbar
3. All selected vacations are approved simultaneously
4. Verified automatic balance deduction

**Rejecting Requests:**

1. Open the vacation record
2. **Option 1:** Delete the request (if rejecting completely)
3. **Option 2:** Add comment in description explaining rejection, then communicate to employee
4. *Note: Formal rejection workflow requires customization*

**Approval Considerations:**

**Check Vacation Balance:**
- Verify employee has sufficient remaining vacation days
- Balance shown in employee's User Detail record
- If insufficient, discuss with employee before rejecting

**Check Team Coverage:**
- Are multiple team members requesting same dates?
- Will absence impact project deadlines?
- Coordinate with department lead or project manager

**Check Company Blackout Dates:**
- Peak business periods (year-end, project launches)
- Company-wide events or mandatory attendance dates
- Document blackout policies for consistency

**Notice Period:**
- Was sufficient advance notice given per policy?
- Emergency/short-notice requests may need special handling
- Balance flexibility with business needs

**Approval Workflow Example:**

```
Employee Submits Request
    ↓
Department Lead Reviews (if applicable)
    ↓ (if approved or no department lead)
HR Administrator Reviews
    ↓
Check: Sufficient Balance? Acceptable Dates? Policy Compliance?
    ↓
Approved → Mark in System → Employee Notified
    or
Rejected → Communicate Reason → Employee Can Resubmit
```

**Automated Notifications (If Configured):**
- Employee receives email/notification upon approval
- Calendar entry appears in their Time Sheet Calendar
- Balance automatically decremented

**Handling Special Cases:**

**Retroactive Vacation:**
- Employee forgot to submit request
- Approve but note in system for record-keeping

**Vacation Exceeding Balance:**
- Discuss with employee: 
  - Can they delay vacation to accrue more?
  - Use unpaid leave for excess days?
  - Advance next year's vacation (if policy allows)?
- Document decision

**Cancellations:**
- Employee needs to cancel approved vacation
- Reopen the vacation record
- Uncheck **Is Approved** or delete if not yet taken
- Balance is restored

**Overlapping Requests:**
- Multiple team members off simultaneously
- Approve based on:
  - First come, first served
  - Business impact assessment
  - Rotating priority if regular conflict

**Reporting:**

**Who's Out When:**
1. Navigate to **User** → **Vacation**
2. Filter:
   - **Is Approved:** True
   - **Date Range:** Upcoming weeks/months
3. Group by **Begin Date**
4. Share with managers for planning

**Approval Activity:**
- Track your approval metrics
- Avg time to approve request
- Rejection rate and reasons
- Use for process improvement

**See Also:**
- [Absence Time Management](employee-time-tracking/absence-time-management.md)
- [Default Permissions](employee-time-tracking/default-permissions.md)

---

### How do I handle sick leave and medical absences?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Sick leave management differs from vacation due to its unplanned nature and potential regulatory requirements:

**Recording Sick Leave:**

**Employee Self-Service (Preferred):**
1. Employee navigates to **User** → **Sick Leave**
2. Clicks **New**
3. Fills in:
   - **User Detail:** Their name (pre-filled)
   - **Begin Date:** First day of illness
   - **End Date:** Last day of illness (or return date)
   - **Description:** Optional notes about illness (respect privacy)
4. Submits for approval

**HR Entry (If Employee Unable):**
1. Navigate to **User** → **Sick Leave**
2. Click **New**
3. Select **User Detail:** Employee's name
4. Enter absence dates
5. Mark as **Approved** (if HR is authorizing)
6. Save

**Sick Leave vs. Vacation:**

| Aspect | Sick Leave | Vacation |
|--------|-----------|----------|
| **Planning** | Unplanned, reactive | Planned, proactive |
| **Balance** | Separate tracking (or unlimited) | Consumes vacation balance |
| **Approval Timing** | After absence (retroactive) | Before absence (advance) |
| **Documentation** | May require medical note | No documentation needed |
| **Compensation** | May be paid/unpaid by law | Typically paid |

**Sick Leave Policies:**

**Policy 1: Unlimited Sick Days**
- No cap on sick days per year
- Paid sick leave as needed
- Common in EU countries with social insurance
- Track in time cockpit for absence records only

**Policy 2: Fixed Annual Sick Days**
- X days per year (e.g., 10 sick days)
- Unpaid after exhausted
- Track balance similar to vacation
- Requires customization for balance tracking

**Policy 3: Short-Term Disability Integration**
- Company pays for X days (e.g., 5 days)
- Insurance/disability coverage kicks in after
- Track separately for payroll purposes
- Note transition date in records

**Medical Documentation:**

**Doctor's Note Requirements:**
Many jurisdictions require medical certificates for:
- Absences longer than 3 consecutive days
- Pattern of frequent single-day absences
- Return to work after serious illness

**Tracking Documentation:**
1. Add note in sick leave record: "Medical certificate on file"
2. Store actual documents in HR file system (outside time cockpit)
3. Or use custom field "Medical Certificate Provided: Yes/No"

**Approval Process:**

**Standard Sick Leave (1-5 days):**
1. Employee calls in sick (phone/email to manager)
2. Creates sick leave entry when able
3. HR or department lead approves retroactively
4. No documentation required (depending on policy)

**Extended Sick Leave (>5 days):**
1. Employee or family contacts HR
2. Medical documentation required
3. HR creates sick leave entry
4. Coordinate with payroll/insurance
5. Document communication and updates
6. Plan for return-to-work date

**Serious Illness/Long-Term Disability:**
1. Open-ended sick leave entry
2. Regular check-ins with employee
3. Coordinate with:
   - Insurance providers
   - Disability benefits
   - Legal requirements (FMLA in US, EU directives)
4. Update end date when return date known

**Calendar Visualization:**

Sick leave appears in Time Sheet Calendar:
- Visual indicator (different color than vacation)
- Prevents time entry during sick days
- Team can see absence for planning

**Sick Leave Patterns & Monitoring:**

**Frequent Short Absences:**
- May indicate:
  - Chronic health issue
  - Workplace dissatisfaction
  - Burnout or stress
  - Pattern abuse (rare)

**HR Response:**
1. Review absence history
2. Private conversation with employee
3. Offer support: healthcare resources, EAP, accommodations
4. Document discussions
5. Follow company discipline policy if abuse suspected

**Reporting:**

**Track Sick Leave Metrics:**
- Total sick days per employee per year
- Department sick leave trends
- Seasonal patterns (flu season)
- Absence rate: (Sick Days / Total Work Days) × 100

**Use For:**
- Workforce planning
- Health & wellness program evaluation
- Identifying departments with high stress/burnout
- Budget forecasting

**Return to Work:**

**After Extended Absence:**
1. Update sick leave end date when employee returns
2. May require:
   - Fitness-for-duty certification from doctor
   - Phased return (part-time initially)
   - Workplace accommodations
3. Check-in meeting with employee and manager
4. Document return date and any accommodations

**Payroll Coordination:**

- Sick leave days affect payroll processing
- Communicate absences to payroll system
- Note paid vs. unpaid sick leave
- Track interaction with disability benefits

**See Also:**
- [Absence Time Management](employee-time-tracking/absence-time-management.md)
- [Working Time / Leave Management](employee-time-tracking/working-time.md)
- [Time Report](employee-time-tracking/time-report.md)

---

### What's the difference between vacation, sick leave, and compensatory time off?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Time cockpit tracks three distinct types of paid absence, each with different rules and purposes:

**1. Vacation (APP_Vacation)**

**Purpose:** Planned rest and personal time

**Characteristics:**
- **Planned in advance**
- **Requires approval before taking time**
- **Consumes vacation balance** (deducted from annual entitlement)
- **Paid time off**
- **Earned:** Based on employment (annual entitlement)
- **Use:** Employee discretion for rest, travel, personal matters

**Workflow:**
1. Employee requests vacation (future dates)
2. Manager/HR approves or denies
3. Balance decremented upon approval
4. Appears in calendar as scheduled absence

**Example:** Employee requests Aug 15-19 for family vacation, approved 2 weeks in advance.

---

**2. Sick Leave (APP_SickLeave)**

**Purpose:** Absence due to illness or medical reasons

**Characteristics:**
- **Unplanned** (occurs when illness happens)
- **Approval after the fact** (retroactive)
- **Does NOT consume vacation balance** (separate tracking)
- **Paid or unpaid** depending on policy and jurisdiction
- **Earned:** May be unlimited or capped by policy
- **Use:** Only for genuine illness or medical appointments

**Workflow:**
1. Employee calls in sick (day-of notification)
2. Employee creates sick leave entry when able
3. Manager/HR approves retroactively for record-keeping
4. Medical documentation may be required (extended absence)

**Example:** Employee wakes up with flu on Monday, calls manager, creates sick leave entry Monday-Wednesday, submits doctor's note for Wednesday.

---

**3. Compensatory Time Off (APP_CompensatoryTime)**

**Purpose:** Time off earned by working extra hours (overtime)

**Characteristics:**
- **Earned through overtime work** (time-bank system)
- **Planned when taken** (requires approval like vacation)
- **Separate balance from vacation** (tracked independently)
- **Alternative to overtime pay**
- **Must be earned before used**
- **Use:** Employee chooses when to take banked time

**Workflow:**
1. Employee works overtime (e.g., works 50h in 40h week = 10h overtime)
2. HR adds 10h to compensatory time balance
3. Employee requests to use compensatory time (future date)
4. Manager approves
5. Balance decremented when taken

**Example:** Employee works late evenings for project launch (15 hours overtime accumulated), takes compensatory day off the following month.

---

**Comparison Table:**

| Feature | Vacation | Sick Leave | Compensatory Time |
|---------|----------|------------|-------------------|
| **Timing** | Planned ahead | Unplanned | Planned ahead |
| **Approval** | Before absence | After absence | Before absence |
| **Balance Source** | Annual entitlement | Separate/unlimited | Earned from overtime |
| **Requires Medical Doc** | No | Sometimes | No |
| **Use Case** | Rest, travel | Illness | Overtime compensation |
| **Compensation** | Paid | Paid (usually) | Paid (time-for-time) |

---

**Balance Tracking:**

**Vacation Balance:**
```
Starting Balance: 20 days
- Used: 5 days
- Carried Forward: 2 days
= Current Balance: 17 days
```

**Sick Leave Balance:**
- Often unlimited (no balance tracking)
- Or tracked separately from vacation
- Not displayed as "balance" in most policies

**Compensatory Time Balance:**
```
Starting Balance: 0 hours
+ Overtime Earned: 20 hours
- Compensatory Time Taken: 8 hours
= Current Balance: 12 hours remaining
```

---

**Legal & Policy Considerations:**

**Vacation:**
- Legally required in many countries (EU: 4+ weeks minimum)
- Must be taken (cannot be forfeited in some jurisdictions)
- May require payout on termination

**Sick Leave:**
- Regulated by local laws (e.g., paid sick leave mandates)
- Employee privacy rights apply (medical details confidential)
- May integrate with disability insurance

**Compensatory Time:**
- Alternative to overtime pay (must comply with labor laws)
- Exempt vs. non-exempt employees (US FLSA rules)
- Must be used within specified period (e.g., 6 months)

---

**When to Use Which:**

**Scenario 1: Employee wants long weekend**
→ **Vacation** (planned personal time)

**Scenario 2: Employee has flu**
→ **Sick Leave** (unplanned illness)

**Scenario 3: Employee worked Saturday for project deadline**
→ **Compensatory Time** (overtime compensation as time off)

**Scenario 4: Employee has doctor appointment**
→ **Sick Leave** OR partial day vacation (policy-dependent)

**Scenario 5: Employee worked extra evenings all week, wants to leave early Friday**
→ **Compensatory Time** (using banked hours)

---

**See Also:**
- [Absence Time Management](employee-time-tracking/absence-time-management.md)
- [Working Time / Leave Management](employee-time-tracking/working-time.md)
- [Working Time Regulations](employee-time-tracking/working-time.regulations.md)

---

## Compliance & Reporting

### How do I run reports to monitor working time compliance?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Working time compliance reporting helps ensure adherence to labor laws and company policies:

**Key Compliance Reports:**

**1. Time Report (Overtime & Shortages)**

**Purpose:** Identify employees working too many or too few hours

1. Navigate to **Employee Time Tracking** → **Time Report**
2. Set parameters:
   - **User(s):** All, department, or individual
   - **Date Range:** Week, month, year
3. Review columns:
   - **Expected Hours:** Based on working time model
   - **Actual Hours:** Tracked time
   - **Difference:** Over/under hours
   - **Vacation/Sick Leave:** Excluded from expected
4. **Look for:**
   - Consistent overtime (burnout risk, cost)
   - Shortages (time tracking issues or part-time)
   - Patterns (same employees every week)

**Actions:**
- Employees consistently over 40h: Address workload
- Employees consistently under expected: Investigate (are they tracking accurately?)

---

**2. Working Time Violations**

**Purpose:** Detect breaks in labor law compliance (rest periods, maximum hours)

1. Navigate to **Employee Time Tracking** → **Working Time Violations** (if configured)
2. Review violations:
   - **Missing rest breaks** (e.g., no 30-min break in 8h shift)
   - **Insufficient rest between shifts** (e.g., < 11 hours between workdays)
   - **Excessive daily hours** (e.g., > 10 hours/day)
   - **Excessive weekly hours** (e.g., > 48 hours/week)
3. **Filter by severity:**
   - Critical: Legal violations
   - Warnings: Approaching limits

**Actions:**
- Contact affected employees
- Adjust schedules to ensure compliance
- Document corrective actions

*Note: Violation detection requires configuration of working time regulations specific to your jurisdiction.*

---

**3. Absence Report**

**Purpose:** Track vacation, sick leave, and other absences

1. Navigate to **Reporting** → **Built-In Reports**
2. Select **Absence Overview** or similar
3. Set parameters:
   - Date range (month, quarter, year)
   - Users/departments
4. Review:
   - Total absence days per employee
   - Breakdown by type (vacation, sick, compensatory)
   - Absence rate: (Absence Days / Total Work Days) × 100

**Benchmarks:**
- **Vacation:** Should trend toward using full entitlement
- **Sick Leave:** 2-5% absence rate is typical
- ** Excessive absences:** May indicate health, engagement, or policy issues

---

**4. Vacation Balance Report**

**Purpose:** Ensure employees are using vacation (avoid unused carryover issues)

1. Navigate to **User** → **User Details**
2. Export to Excel
3. Review columns:
   - Yearly Vacation Entitlement
   - Vacation Used (year-to-date)
   - Vacation Remaining
4. **Identify:**
   - Employees who haven't taken vacation (burnout risk)
   - Large remaining balances late in year (carryover/expiration issues)

**Actions (Late in Year):**
- Encourage employees to schedule remaining vacation
- Remind of use-it-or-lose-it policies
- Coordinate with managers to approve end-of-year requests

---

**5. Overtime Trend Analysis**

**Purpose:** Monitor excessive overtime and associated costs

1. Run Time Report for extended period (quarterly, annual)
2. Calculate overtime:
   - Per employee: Avg overtime hours/week
   - Per department: Total overtime hours
3. **Analyze trends:**
   - Increasing overtime: workload issues, understaffing
   - Concentrated in specific employees: uneven distribution
   - Seasonal patterns: project deadlines, busy seasons

**Cost Impact:**
```
Overtime Cost = Overtime Hours × Overtime Rate
(Overtime rate typically 1.5× or 2× regular rate depending on jurisdiction)
```

---

**6. Audit Trail Report**

**Purpose:** Track changes to time entries for compliance audits

1. Navigate to **Review** → **Audit Trail** (if enabled)
2. Filter to time-related entities:
   - Timesheet entries
   - Vacation records
   - Sick leave records
3. Review:
   - Who changed what
   - When changes occurred
   - Original vs. new values

**Use For:**
- Internal audits
- Responding to employee disputes
- Compliance documentation (SOC 2, ISO, labor inspections)

---

**Compliance Monitoring Schedule:**

**Daily (Automated or Quick Check):**
- Critical working time violations

**Weekly:**
- Overtime review (current week)
- Time entry completion (did everyone track time?)

**Monthly:**
- Full Time Report (overtime, shortages)
- Absence trends
- Vacation balance check (especially late in year)

**Quarterly:**
- Overtime trend analysis
- Absence rate benchmarking
- Policy compliance review

**Annually:**
- Year-end vacation balance reconciliation
- Working time regulation effectiveness
- Labor law compliance audit

---

**Jurisdiction-Specific Regulations:**

**European Union Working Time Directive:**
- Max 48 hours/week (averaged over reference period)
- Min 11 hours rest between workdays
- Min daily rest break for shifts > 6 hours
- Min 4 weeks paid annual leave

**United States FLSA:**
- Overtime pay (1.5× for >40h/week non-exempt employees)
- No federal vacation requirement
- State-specific sick leave mandates (varies)

**Germany (Arbeitszeitgesetz):**
- Max 8 hours/day (can extend to 10h with compensation)
- Min 11 hours rest between workdays
- 30-min break for 6-9h shifts
- Sundays and holidays off (with exceptions)

**Configure time cockpit violations based on your applicable laws.**

---

**See Also:**
- [Working Time Regulations](employee-time-tracking/working-time-regulations.md)
- [Time Report](employee-time-tracking/time-report.md)
- [Built-In Reports](reporting/built-in-reports.md)

---

### How do I prepare data for payroll processing?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Payroll integration requires accurate time tracking data exported in a format your payroll system can consume:

**Pre-Payroll Checklist (Do Before Exporting):**

**1. Verify Time Entry Completion**
- All employees have tracked full hours for pay period
- No missing days or gaps
- Run Time Report to identify shortages

**2. Approve Absences**
- All vacation, sick leave, compensatory time approved
- Absence dates match timesheet calendar
- Balances updated correctly

**3. Validate Working Hours**
- Expected vs. actual hours reviewed
- Overtime identified and calculated
- Time entry errors corrected

**4. Lock Pay Period (Optional)**
- Some organizations "lock" past pay periods to prevent changes
- Requires customization or process enforcement

---

**Export Process:**

**Method 1: Export Timesheet Entries**

1. Navigate to **Timesheet** → **Time Sheets**
2. **Filter to pay period:**
   - Date Range: Pay period start - end date
   - User: All employees OR specific department
3. **Optionally exclude:**
   - Vacation/sick leave (may be in separate export)
   - Non-payroll entries
4. Click **Export to Excel**
5. Save file with naming convention: `Timesheets_[PayPeriod].xlsx`

**Excel File Contains:**
- Employee name/ID
- Date
- Begin time, end time, duration
- Project/task (if relevant for job costing)
- Hourly rate (if tracked)
- Billable flag

---

**Method 2: Export Aggregated Hours**

For simpler payroll (just total hours, not line items):

1. Create custom report or view showing:
   - Employee Name/ID
   - Total Hours (sum of duration for pay period)
   - Overtime Hours (if calculated)
   - Regular Hours (Total - Overtime)
2. Export to Excel/CSV
3. Import into payroll system

**Example Format:**
```
Employee_ID, Name, Regular_Hours, Overtime_Hours, Vacation_Days, Sick_Days
12345, John Smith, 80, 5, 0, 0
67890, Jane Doe, 80, 0, 1, 0
```

---

**Method 3: Export Absence Data**

Vacation and sick leave may be separate payroll inputs:

1. Navigate to **User** → **Vacation**
2. Filter to pay period dates
3. Export showing:
   - Employee name/ID
   - Begin date, end date
   - Total days
   - Approved status
4. Repeat for **Sick Leave**

---

**Method 4: Web API Integration (Automated)**

For ongoing automation:
- Use time cockpit Web API to query timesheet and absence data
- Schedule nightly/weekly jobs to pull data
- Transform to your payroll system's format (CSV, JSON, XML)
- Import directly into payroll system via its API

**See:** [Developer FAQ](developer-faq.md) and [Web API Overview](web-api/overview.md)

---

**Payroll System-Specific Exports:**

**ADP, Paychex, Gusto (US):**
- CSV format with employee ID, hours, earnings codes
- May require separate files regular vs. overtime
- Map time cockpit fields to payroll earning codes

**DATEV (Germany/Austria):**
- DATEV-specific CSV format
- Include employee number, cost center, hours
- Export configuration may be available

**SAP, Oracle HCM (Enterprise):**
- Integration via API or file upload
- May require middleware or custom integration
- Consult with IT or support@timecockpit.com

**Custom Payroll:**
- Define CSV format requirements
- Configure export mapping
- Test import with sample data before going live

---

**Data Validation Before Submitting to Payroll:**

**Check:** 
✓ All employees present (no missing employees)
✓ Total hours per employee reasonable (typically 40-80h per week for full-time)
✓ Overtime calculated correctly
✓ Vacation/sick days match approved absences
✓ No duplicate entries
✓ Date range matches pay period exactly
✓ Employee IDs match payroll system

**Common Issues:**
- **Missing hours:** Employee didn't track time → Follow up before payroll
- **Excessive hours:** Data entry error → Investigate and correct
- **Wrong pay period:** Filter dates incorrect → Re-export with correct dates
- **Employee ID mismatch:** time cockpit ID ≠ payroll ID → Maintain mapping table

---

**Payroll Processing Workflow:**

```
Week Before Payroll Deadline:
- Remind employees to complete time entries
- HR reviews for completeness

Payroll Deadline Day (e.g., Friday):
- Verify all time entered
- Approve pending absences
- Run Time Report for validation
- Export data for payroll
- Send to payroll processor

After Export:
- Lock pay period (if possible) or note cutoff
- Handle late adjustments as corrections in next pay period
```

---

**Corrections & Adjustments:**

**If Error Discovered After Export:**
1. **Minor error:** May be able to manually adjust in payroll system
2. **Major error:** May require payroll re-run (costly)
3. **Late correction:** Process as adjustment in next pay period

**Best Practice:** "Freeze" time entries after payroll export. Changes after cutoff go to next period.

---

**See Also:**
- [Time Report](employee-time-tracking/time-report.md)
- [Data Export](data-exchange/export.md)
- [Web API Overview](web-api/overview.md)
- [Developer FAQ](developer-faq.md)

---

## Need More Help?

### HR Administrator Resources

**Related FAQs:**
- [User FAQ](user-faq.md) - General time tracking questions
- [Department Lead FAQ](department-lead-faq.md) - Team approval workflows
- [Employee FAQ](employee-faq.md) - Employee-facing guidance for self-service
- [Developer FAQ](developer-faq.md) - API & customization

**Documentation:**
- [Absence Time Management](employee-time-tracking/absence-time-management.md)
- [Working Time Regulations](employee-time-tracking/working-time-regulations.md)
- [Time Report](employee-time-tracking/time-report.md)
- [Default Permissions](employee-time-tracking/default-permissions.md)
- [Account Management](account-management/account-management.md)

**Support:**
- **Email:** support@timecockpit.com  
- **Custom Training:** Request HR-specific training sessions
- **Policy Consultation:** Get help configuring policies for compliance

---

*This FAQ is regularly updated with HR and compliance insights. Last updated: February 2026.*
