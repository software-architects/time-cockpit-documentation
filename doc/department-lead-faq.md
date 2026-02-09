---
title: Department Lead FAQ - Team Management & Approvals
description: Department lead FAQ for time cockpit: managing team time, approving absences, monitoring capacity, and overseeing department productivity.
keywords: [department lead, team time tracking, absence approval, team management, department oversight, vacation approval, team productivity, staff management, lead responsibilities, time tracking supervisor, team capacity]
---

# Department Lead FAQ

This FAQ addresses common questions from department leads managing their teams, approving absences, monitoring productivity, and ensuring accurate time tracking within time cockpit.

> [!NOTE]
> For general time tracking questions, see the [User FAQ](user-faq.md). For HR-specific questions about policies, see the [HR Administrator FAQ](hr-administrator-faq.md).

## Absence Approval

### How do I approve vacation for my team members?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

As a department lead, you can approve vacation, sick leave, and compensatory time for employees in your department:

**Viewing Pending Requests from Your Team:**

1. Navigate to **User** → **Vacation**
2. **Filter to your department:**
   - The system automatically shows requests from your department members (if permissions configured)
   - Or manually filter: **Department** = Your Department
3. **Filter to pending requests:**
   - **Is Approved** = False or Unchecked
4. Sort by **Begin Date** to prioritize upcoming time off

**Approving Individual Requests:**

1. Review the vacation request:
   - **Employee name**
   - **Begin and End Date**
   - **Total Days**
   - **Description/Reason** (if provided)
   - **Employee's Vacation Balance** - verify sufficient days
2. **Consider:**
   - Team coverage during absence
   - Project deadlines and commitments
   - Other team members off at same time
   - Advance notice provided
3. **If approved:**
   - Check the **Is Approved** checkbox
   - **Approver** field auto-fills with your name
   - Click **Save**
4. **If need to discuss:**
   - Contact employee before rejecting
   - May need to adjust dates for better coverage

**Batch Approval:**

For multiple routine requests:
1. In the Vacation list, multi-select requests (Ctrl+Click)
2. Run **Approve Absence** action from toolbar
3. All selected requests approved simultaneously

**Your Approval Authority:**

By default, department leads can approve:
- ✓ **Vacation** for team members in your department
- ✓ **Sick Leave** for your department (retroactive approval)
- ✓ **Compensatory Time** for your department

You **cannot** approve for:  
- ✗ Employees in other departments (unless you lead multiple)
- ✗ Your own absence (requires your manager or HR)

**See Also:**
- [Absence Time Management](employee-time-tracking/absence-time-management.md)
- [Default Permissions](employee-time-tracking/default-permissions.md)
- [HR Administrator FAQ](hr-administrator-faq.md#how-do-i-approve-or-reject-vacation-requests)

---

### How do I see who's out of office this week/month?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Staying aware of team absences helps with planning, coverage, and workload distribution:

**Method 1: Vacation Calendar View**

1. Navigate to **Timesheet** → **Time Sheet Calendar**
2. Switch to **Week** or **Month** view
3. Use **User Selection** to view each team member:
   - Approved vacation/sick leave appears as colored blocks
   - Switch between team members to build mental picture
   - *Note: No multi-user calendar view in standard config*

**Method 2: Absence List (Current/Upcoming)**

1. Navigate to **User** → **Vacation**
2. **Filter:**
   - **Department:** Your department (may be automatic)
   - **Is Approved:** True
   - **Date Range:** This week, next week, or this month
3. **Group by Begin Date** for chronological view
4. Review list showing:
   - Who is out
   - When (begin/end dates)
   - How long (total days)

**Method 3: Built-In Absence Report**

1. Navigate to **Reporting** → **Built-In Reports**
2. Select **Absence Calendar** or **Absence Overview**
3. Filter to your department
4. Set date range (current month, next 3 months)
5. Generate report showing:
   - Timeline view of absences
   - Overlapping absences highlighted
   - Total days per employee

**Method 4: Export to Excel for Planning**

1. Navigate to **User** → **Vacation** (filtered as above)
2. Export to Excel
3. Create your own visualizations:
   - Pivot table by week
   - Conditional formatting for multi-person overlaps
   - Print calendar view for team board

**Team Capacity Dashboard (Custom):**

Create a saved view/list showing:
- Employee names
- Current week absence status (Present / Vacation / Sick)
- Next week absence status
- Project assignments
- Total available FTE this week

*Requires list customization or external dashboard tool.*

**Weekly Standup Visibility:**

Incorporate absence awareness into team routines:
- **Monday Standup:** "Who's out this week?"
- **Whiteboard/Shared Calendar:** Mark known absences
- **Project Status:** Note impact of absences on deliverables

**Proactive Planning:**

**Review Upcoming Absences:**
- Check 2-4 weeks ahead regularly
- Identify coverage gaps early
- Communicate with team about workload distribution
- Adjust project timelines if needed

**Holiday Periods:**
- Summer vacation season (July-Aug in Europe)
- End-of-year holidays (Dec-Jan)
- Review team coverage well in advance (months, not weeks)

**See Also:**
- [Absence Time Management](employee-time-tracking/absence-time-management.md)
- [Time Sheet Calendar](timesheet-calendar/calendar.md)
- [Built-In Reports](reporting/built-in-reports.md)

---

### What do I do if multiple team members request the same vacation dates?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Conflicting vacation requests require balancing fairness, business needs, and employee preferences:

**Assess the Impact:**

**1. Check Team Capacity**
- How many team members would be absent?
- What % of team remains?
- Benchmark: Can team function at X% capacity?
  - **> 70% present:** Usually manageable
  - **50-70% present:** Challenging but possible
  - **< 50% present:** High risk, consider limiting

**2. Check Project Commitments**
- Are critical milestones during requested period?
- Can deadlines accommodate reduced staffing?
- Are customers expecting deliverables?

**3. Check Required Skills**
- Do multiple key roles overlap (e.g., both senior developers)
- Can remaining staff cover critical functions?
- Is cross-training sufficient?

**Decision Frameworks:**

**Option 1: First-Come, First-Served**
- **Pro:** Simple, objective, fair
- **Con:** Favors planners, penalizes those with later-known plans
- **Rule:** First approved request locks the slot
- **Implementation:**
  - Approve first request
  - Contact later requesters: "Already have X people off, can you adjust dates?"

**Option 2: Rotating Priority**
- **Pro:** Fair over time, prevents same people always winning conflicts
- **Con:** Requires tracking historical decisions
- **Rule:** If conflict last time favored Employee A, this time favor Employee B
- **Implementation:**
  - Keep notes on conflict resolutions
  - "Last summer I asked you to adjust, this time I'll approve yours first"

**Option 3: Business Need Priority**
- **Pro:** Ensures business continuity
- **Con:** Can feel unfair to employees
- **Rule:** Approve based on whose absence is less disruptive
- **Implementation:**
  - Assess criticality of each person's projects/role
  - Approve least-disruptive absence first
  - Offer alternative dates to others

**Option 4: Compromise - Partial Overlap**
- **Pro:** Both employees get their vacation, just shortened overlap
- **Con:** May not fully solve coverage problem
- **Rule:** Allow 1-2 days overlap, but not full weeks
- **Implementation:**
  - Employee A: Aug 1-12 (full 2 weeks)
  - Employee B: Aug 10-21 (2-day overlap instead of 2 weeks)

**Option 5: Seniority/Special Circumstances**
- **Pro:** Considers context (family obligations, once-in-lifetime events)
- **Con:** Can seem arbitrary or unfair
- **Rule:** Priority for: significant life events, family commitments, scheduled events (weddings, etc.)
- **Implementation:**
  - Ask employees about plans: non-refundable bookings? Family event?
  - Give priority to employee with greater stake

**Communication is Key:**

**When Denying or Requesting Changes:**

1. **Contact promptly:** Don't leave employees waiting
2. **Explain reasoning:** "We already have 3 people out that week and Project X deadline..."
3. **Offer alternatives:**
   - "Could you shift by one week? That would work better."
   - "Could you take 1 week instead of 2? Then both can go."
   - "I can approve first week, but second week is problematic."
4. **Be empathetic:** Acknowledge disappointment
5. **Document decision:** For future reference and fairness tracking

**Sample Message:**
```
Hi [Employee],

I see your vacation request for Aug 5-16. We already have [Name] approved 
for Aug 8-15, and [Name2] is off Aug 12-19. That would leave us with only 
60% staffing during the Project X push.

Could you consider either:
- Week of July 29 - Aug 9 (first week overlaps less)
- Week of Aug 19-30 (after other absences)

I know this is frustrating, and I appreciate your flexibility. Let me know 
what works for you.

[Your Name]
```

**Preventive Measures:**

**1. Encourage Early Planning**
- "Please submit summer vacation requests by end of April"
- First-submitted gets preference in conflicts
- Reduces last-minute conflicts

**2. Block Out Critical Periods**
- Communicate blackout dates: "No vacation during Q4 product launch"
- Limit simultaneous absences: "Max 2 people off per week"
- Set team rotation: "We'll alternate who can take school spring break"

**3. Cross-Training**
- Reduce single-point-of-failure risks
- If multiple people can handle critical tasks, overlaps are less problematic

**4. Team Coordination**
- Encourage team to self-coordinate: "Talk to each other before submitting"
- Shared team calendar for visibility

**Escalation:**

If unable to resolve:
- Consult with HR Administrator for policy guidance
- Involve your manager for organizational perspective
- Consider business-funded hotel changes / rebooking assistance as gesture of goodwill (rare)

**See Also:**
- [Absence Time Management](employee-time-tracking/absence-time-management.md)
- [HR Administrator FAQ](hr-administrator-faq.md)

---

## Team Time Tracking Oversight

### How do I check if my team is tracking time accurately?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Ensuring accurate time tracking is essential for project management, billing, and payroll accuracy:

**Daily/Weekly Monitoring:**

**1. Time Entry Completeness Check**
1. Navigate to **Employee Time Tracking** → **Time Report**
2. Filter to **Your Department**
3. Set **Date Range:** This week or last week
4. Review **Expected vs. Actual Hours:**
   - **Expected:** Based on working time model (e.g., 40h/week)
   - **Actual:** Total hours tracked
   - **Difference:** Shortages or overages
5. **Look for:**
   - **Negative difference** (< expected): Missing time entries
   - **Large positive difference** (way > expected): Possible data entry errors
   - **Zero hours days:** Employee forgot to track? Or on vacation?

**2. Visual Calendar Review**
1. Navigate to **Timesheet** → **Time Sheet Calendar**
2. Use **User Selection** to review each team member
3. Switch to **Week View** for overview
4. **Check for:**
   - **Gaps:** Empty days (missing entries)
   - **Overlaps:** Stacked entries (entry errors)
   - **Sensibility:** Reasonable

 start/end times
   - **Descriptions:** Meaningful vs. "work" repeated

**Follow-Up Actions:**

**For Missing Entries:**
1. Send friendly reminder: "I notice you haven't logged time for Tuesday. Can you update?"
2. One-on-one if recurring: "I see you frequently forget to track time on Fridays. Can we set a reminder?"

**For Suspicious Patterns:**
- All entries exactly 8:00-17:00 every day (too perfect = might be estimates, not actuals)
- Frequent overlapping entries (user doesn't understand time-based entries)
- Missing project assignments (vague tracking)

**Team Time Tracking Meeting:**

**Weekly Standup Integration:**
1. "Did everyone log time for last week?"
2. Quick round-robin check
3. Set deadline: "All time entries due by Friday EOD"

**Monthly Team Training:**
- Review best practices
- Address common errors
- Show impact of accurate tracking (budgets, billing, planning)

**Quality Indicators:**

**Good Time Tracking:**
- ✓ Entries cover all working hours
- ✓ Appropriate time distribution across projects
- ✓ Descriptions are specific and meaningful
- ✓ Project/task assignments correct
- ✓ No overlaps or gaps
- ✓ Entered timely (daily or weekly, not months later)

**Poor Time Tracking:**
- ✗ Frequent missing days
- ✗ Entries all added in bulk later
- ✗ Vague descriptions ("work", "stuff")
- ✗ No project assignments
- ✗ Consistently late or retroactive

**Accountability Measures:**

**Light Touch:**
- Reminders and coaching
- Positive reinforcement for consistent trackers
- Make tracking easy (templates, training)

**Medium Touch:**
- Required weekly review meeting
- Manager sign-off on timesheets
- Link to performance reviews (time tracking accuracy as metric)

**Strong Touch (if policy-based):**
- Incomplete timesheets delay approval/payroll
- Written warnings for persistent non-compliance
- HR escalation

**See Also:**
- [Time Report](employee-time-tracking/time-report.md)
- [Working with Timesheet Entries](timesheet-calendar/working-with-timesheet-entries.md)
- [Project Manager FAQ](project-manager-faq.md#how-do-i-handle-team-members-who-forget-to-track-time)

---

### How do I monitor my department's overtime and workload?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Tracking overtime helps manage workload, prevent burnout, and control costs:

**Weekly Overtime Review:**

1. Navigate to **Employee Time Tracking** → **Time Report**
2. Filter to **Your Department**
3. Set **Date Range:** This week
4. Review the **Difference** column:
   - **Positive value:** Overtime (hours above expected)
   - **Negative value:** Undertime (hours below expected)
5. **Sort by difference** (descending) to see who has most overtime

**Understanding Overtime:**

**Example:**
```
Employee: Alice
Expected Hours: 40 (full-time model)
Actual Hours: 47
Difference: +7 hours overtime this week
```

**Occasional vs. Persistent Overtime:**

**Occasional (Acceptable):**
- Project deadline crunch
- Covering for absent colleague
- Customer emergency
- One-time event
- **Action:** Acknowledge effort, thank employee

**Persistent (Concern):**
- Same employee(s) every week
- Increasing trend over time
- Entire department consistently over
- **Action:** Investigate root cause, take corrective action

**Root Causes of Excessive Overtime:**

1. **Understaffing:**
   - Too many projects, not enough people
   - **Solution:** Hire more staff, redistribute work, or reduce project commitments

2. **Unrealistic Deadlines:**
   - Projects planned without adequate time
   - **Solution:** Improve planning, push back on timelines, involve team in estimates

3. **Inefficiency:**
   - Processes, tools, or training gaps
   - **Solution:** Process improvement, tool upgrades, skill development

4. **Scope Creep:**
   - Projects expanding beyond plan
   - **Solution:** Tighten scope management, change request process

5. **Uneven Work Distribution:**
   - Some employees overloaded, others underutilized
   - **Solution:** Rebalance assignments

6. **Employee Choice (Overcommitment):**
   - Employee saying yes to everything
   - **Solution:** Coach on prioritization and saying no

**Intervention Strategies:**

**Individual Level:**
1. **One-on-one discussion:** "I see you've been working 50-hour weeks. What's going on?"
2. **Assess:**
   - Is workload too high?
   - Are they inefficient (need training)?
   - Are they perfectionistic (over-working tasks)?
3. **Action plan:**
   - Redistribute some work
   - Set boundaries (no work after 6pm unless emergency)
   - Time management coaching

**Team Level:**
1. **Team meeting:** Discuss workload trends
2. **Retrospective:** What's causing overtime? How can we improve?
3. **Process changes:** Streamline workflows, remove blockers
4. **Resource request:** Escalate to management for additional headcount

**Organizational Level:**
1. **Report to management:** "My department is averaging 10% overtime for 3 months"
2. **Request support:** More staff, reduced project scope, extended deadlines
3. **Policy review:** Are expectations realistic?

**Overtime Cost Impact:**

**Calculate Departmental Overtime Cost:**
```
Overtime Hours × Overtime Rate Multiplier × Avg Hourly Cost
Example:
200 overtime hours/month × 1.5 (time-and-a-half) × $50/hour = $15,000/month additional cost
Annual: $180,000
```

Use this data to justify hiring additional staff (often cheaper than sustained overtime).

**Workload Dashboard (Custom View):**

Create list/report showing:
- Employee names
- This week hours
- Last 4 weeks avg hours
- Trend (increasing/decreasing)
- Current project assignments
- Status indicator (green < 42h, yellow 42-50h, red > 50h)

**Burnout Prevention:**

**Warning Signs:**
- Persistent overtime (> 50h/week for > 1 month)
- Quality declining
- Mood changes, irritability
- Increased sick leave
- Disengagement

**Actions:**
- Mandatory time off
- Workload reduction
- Check-in on wellbeing
- Employee assistance program (EAP) referral

**See Also:**
- [Time Report](employee-time-tracking/time-report.md)
- [Working Time Regulations](employee-time-tracking/working-time-regulations.md)
- [Project Manager FAQ](project-manager-faq.md)

---

### Can I see what projects my team is working on?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Understanding your team's project distribution helps with resource planning and workload management:

**Project Time Summary:**

1. Navigate to **Timesheet** → **Time Sheets**
2. **Filter:**
   - **User Detail:** Your team members (or **Department:** Your Department)
   - **Date Range:** This week, this month, or custom
3. **Group by Project:**
   - Drag **Project** column to grouping area at top of list
   - Entries group by project with subtotals
4. Review:
   - Which projects consuming most time
   - How time is distributed
   - Any unexpected project work

**By Team Member:**

1. In the same timesheet list
2. **Group by User Detail, then by Project** (nested grouping)
3. View each team member's project breakdown
4. Identify:
   - Who is on which projects
   - How many projects each person juggles
   - Utilization level

**Built-In Reports:**

1. Navigate to **Reporting** → **Built-In Reports**
2. Select **Time by User and Project** (or similar)
3. Filter to your department/team
4. Generate report showing matrix:
   - Rows: Team members
   - Columns: Projects
   - Values: Hours worked

**Use Cases:**

**Resource Allocation:**
- Is anyone over-allocated (too many projects)?
- Is work balanced or concentrated on few people?
- Are juniors appropriately assigned to learning opportunities?

**Capacity Planning:**
- Who has bandwidth for new projects?
- Who is at or over capacity?
- Can we take on additional work?

**Project Staffing:**
- Is this project adequately staffed?
- Do we have the right skill mix?
- Are people spending expected amount of time?

**Career Development:**
- Is employee getting diverse project experience?
- Are they stuck on same project too long?
- Should we rotate assignments?

**Weekly Team Meeting Agenda:**

Include project-based review:
- "Quick round: what projects did everyone work on this week?"
- Note any surprises or unexpected time sinks
- Adjust priorities if needed

**Project Assignment Matrix (Custom):**

Create a view or external document:
```
                 Project A  Project B  Project C  Support
Alice (40h/wk)     20h        15h         5h        -
Bob (40h/wk)       10h         -         25h        5h
Carol (32h/wk)      -         20h        12h        -
Dave (40h/wk)      30h         -          -        10h
---
Total Hours:       60h        35h        42h       15h
```

Update weekly based on time tracking data.

**Identifying Issues:**

**Red Flags:**
- **Single project:** Team member only on one project (risk of knowledge silos, boredom)
- **Too many projects:** Team member on 5+ projects (context switching, inefficiency)
- **Unplanned work:** Significant time on projects not in your planning
- **"Other" time:** Lots of time with no project assignment (vague tracking)

**Actions:**
- Rebalance assignments
- Investigate unplanned work (is it legitimate?)
- Improve time tracking specificity

**See Also:**
- [Project Time Sheets](project-time-tracking/timesheet.md)
- [Built-In Reports](reporting/built-in-reports.md)
- [Project Manager FAQ](project-manager-faq.md)

---

## Department Reporting

### What reports should I review regularly as a department lead?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Establish a regular reporting rhythm to stay on top of team status:

**Daily (Quick Check - 5 minutes):**

**Yesterday's Time Tracking**
- Quick scan: Did team track time yesterday?
- **Report:** Timesheet list, filter to yesterday + your department
- **Action:** Send reminder to anyone missing entries

---

**Weekly (Monday or Friday - 20 minutes):**

**1. Time Report (Completeness & Overtime)**
- **Purpose:** Ensure full week tracked, identify overtime
- **Report:** Employee Time Tracking → Time Report
- **Review:**
  - Expected vs. Actual hours
  - Who's missing time? Who's over-hours?
- **Action:** Follow up on gaps or concerns

**2. Project Time Distribution**
- **Purpose:** Understand where team's effort is going
- **Report:** Timesheet list grouped by Project
- **Review:**
  - Major projects and hours this week
  - Unexpected time sinks
  - Alignment with planned priorities
- **Action:** Adjust allocations if needed

**3. Absence Overview (This/Next Week)**
- **Purpose:** Know who's out for planning
- **Report:** Vacation list, filter to current/next week
- **Review:**
  - Who's on vacation/sick leave
  - Coverage plans
- **Action:** Communicate to team if needed

---

**Monthly (First Week of Month - 45 minutes):**

**4. Monthly Utilization**
- **Purpose:** Understand team productivity and capacity
- **Report:** Time Report for full month
- **Metrics:**
  - Total hours per person
  - Avg hours/week
  - Overtime trends
- **Action:** Identify workload issues

**5. Absence Report**
- **Purpose:** Track vacation usage and sick leave patterns
- **Report:** Built-In Reports → Absence by Employee
- **Metrics:**
  - Total vacation days used
  - Sick leave days
  - Absence rate
- **Action:** Encourage vacation usage if low, investigate high sick leave

**6. Project Time Summary**
- **Purpose:** Project portfolio review
- **Report:** Time by Project (monthly rollup)
- **Metrics:**
  - Total hours per project
  - Top projects by time
  - Compare to project budgets
- **Action:** Discuss with project managers, flag concerns

---

**Quarterly (Strategic Review - 1-2 hours):**

**7. Team Capacity & Planning**
- **Purpose:** Long-term resource planning
- **Report:** 3-month trend analysis
- **Metrics:**
  - Avg hours per person
  - Utilization rate
  - Overtime trends
  - Hiring needs forecast
- **Action:** Request additional staff, plan skill development

**8. Project Portfolio Health**
- **Purpose:** Department's project contribution
- **Report:** Aggregated project time across quarter
- **Metrics:**
  - Hours per project type/customer
  - Revenue contribution (if billable)
  - Team satisfaction with assignments
- **Action:** Strategic project decisions, rotation planning

---

**Ad-Hoc Reports:**

**When Needed:**
- **Employee performance review:** Individual's project time, productivity
- **Budget justification:** Demonstrate workload for hiring request
- **Incident investigation:** Time tracking during specific period
- **Project post-mortem:** Team hours on completed project

---

**Report Dashboard Setup:**

Save frequently-used views for quick access:
1. Create filter/grouping configurations
2. Save with descriptive names
3. Bookmark or add to favorites
4. Access with one click each week

**Reporting Rhythm Template:**
```
Monday Morning (15 min):
 - Check last week's time completeness
 - Review upcoming absences
 - Note overtime concerns

Friday Afternoon (10 min):
 - Verify this week's time entered
 - Send weekend reminder if needed

First Monday of Month (45 min):
 - Run all monthly reports
 - Prepare summary for your manager
 - Note action items
```

**See Also:**
- [Time Report](employee-time-tracking/time-report.md)
- [Built-In Reports](reporting/built-in-reports.md)
- [Project Manager FAQ](project-manager-faq.md#what-reports-should-i-review-regularly-as-a-project-manager)

---

## Department Administration

### How do I onboard a new team member to my department?

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

Smooth onboarding ensures new employees can track time effectively from day one:

**Pre-Day One (Coordinate with HR):**

✓ **HR creates user account:** See [HR Administrator FAQ](hr-administrator-faq.md#how-do-i-add-a-new-employee-to-time-cockpit)
✓ **Department assigned:** Ensure set to your department
✓ **You set as Department Lead:** Your approval rights apply
✓ **Working time model assigned:** Full-time, part-time, etc.
✓ **Vacation entitlement set:** Based on policy
✓ **Permissions configured:** Standard user role at minimum

**Day One:**

**Time Cockpit Introduction (30 minutes):**

1. **Login walkthrough:**
   - Show how to access (webURL)
   - Username and initial password (if applicable)
   - Password change procedure

2. **Basic navigation:**
   - Main menu modules (Timesheet, Management, User)
   - Time Sheet Calendar
   - User selection (should see their own name)

3. **First timesheet entry:**
   - Open Time Sheet Calendar
   - Create entry for onboarding time
   - Set customer/project: "Internal" → "Training/Onboarding"
   - Save entry

4. **Daily workflow:**
   - Track time throughout the day
   - When to create entries (real-time vs. end-of-day)
   - How to handle lunch breaks (non-tracked time)

**Week One:**

**Project Assignment:**

- Introduce them to projects they'll work on
- Show how to select customer → project → task
- Explain billable vs. non-billable expectations
- Provide list of common project codes

**Time Tracking Best Practices:**

- When to track (frequency)
- Level of detail in descriptions
- Using timesheet templates (if applicable)
- Copying entries to save time

**Absence Management:**

- How to request vacation
- Sick leave procedure (call you, then log in system)
- Notice requirements for vacation

**Calendar Views:**

- Day, Week, Month views
- When to use each
- How to navigate dates

**Week Two:**

**Check-In:**

1. Review their first week of time entries:
   - Are entries complete?
   - Appropriate project assignments?
   - Descriptions meaningful?
2. Answer questions
3. Correct any misunderstandings

**Advanced Features (As Needed):**

- Timesheet templates for recurring work
- Outlook integration (if enabled)
- Reports they might access
- Custom fields (if your data model has them)

**Common New User Issues:**

**Issue: Can't see projects**
- **Cause:** Permissions or project not assigned
- **Fix:** Check their role permissions, or assign to project team

**Issue: Overlapping entries**
- **Cause:** Doesn't understand time-based vs. duration
- **Fix:** Explain begin/end times, show visual overlap in calendar

**Issue: Forget to track regularly**
- **Cause:** New habit, not yet routine
- **Fix:** Set daily reminder (phone alarm), check-in during standups

**Issue: Unsure what project to assign**
- **Cause:** Project structure unclear
- **Fix:** Provide project/task cheat sheet, err on side of tracking (can correct later)

**Onboarding Checklist:**

```
□ User account created and active
□ Assigned to your department
□ Can log in successfully
□ Has created first timesheet entry
□ Understands daily tracking workflow
□ Knows how to select projects
□ Knows how to request vacation
□ Knows who to ask questions (you!)
□ Week 1 time entries reviewed and approved
```

**Resources to Provide:**

- Quick reference guide (link to [User FAQ](user-faq.md))
- Project code list
- Your contact info for questions
- Department-specific time tracking policies

**See Also:**
- [User FAQ](user-faq.md)
- [Working with Timesheet Entries](timesheet-calendar/working-with-timesheet-entries.md)
- [HR Administrator FAQ](hr-administrator-faq.md#how-do-i-add-a-new-employee-to-time-cockpit)

---

## Need More Help?

### Department Lead Resources

**Related FAQs:**
- [User FAQ](user-faq.md) - General time tracking
- [HR Administrator FAQ](hr-administrator-faq.md) - Policies and employee management
- [Project Manager FAQ](project-manager-faq.md) - Project-focused team management
- [Employee FAQ](employee-faq.md) - Guide for your team members
- [Developer FAQ](developer-faq.md) - API & customization

**Documentation:**
- [Absence Time Management](employee-time-tracking/absence-time-management.md)
- [Time Report](employee-time-tracking/time-report.md)
- [Default Permissions](employee-time-tracking/default-permissions.md)
- [Built-In Reports](reporting/built-in-reports.md)

**Support:**
- **Email:** support@timecockpit.com  
- **Team Training:** Request department-specific training sessions
- **Best Practices:** Consult on department workflows

---

*This FAQ is regularly updated with department lead insights. Last updated: February 2026.*
