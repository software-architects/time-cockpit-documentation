---
title: Department Lead FAQ - Team Approvals & Time Review
description: Department lead FAQ for time cockpit: approve absences, review team time, check overtime, and see project-related time tracking.
keywords: [department lead, absence approval, team time tracking, overtime, vacation approval, time report, team timesheets, department faq]
---

# Department Lead FAQ

This FAQ answers common questions from department leads who approve absences and review team-related time tracking data in time cockpit.

> [!NOTE]
> Reviewed in April 2026.

> [!NOTE]
> For general time tracking questions, see the [User FAQ](user-faq.md). For HR-specific setup and master data topics, see the [HR Administrator FAQ](hr-administrator-faq.md).

## Absence Approval

### How do I approve vacation for my team members?

If the absence approval workflow is enabled, department leads can approve or reject pending absences for employees in the departments they lead.

1. Open the absence calendar described in [Absence Time Management](employee-time-tracking/absence-time-management.md).

2. Review the pending absences in the list above the calendar.
3. Select a row to preview the absence in the calendar and jump to the relevant date.
4. Use the approval or rejection action in the rightmost columns.

Useful context from the standard documentation:

- approvals are controlled in global settings and per user
- department leads can review absences for the departments they lead
- the requesting user receives a notification after approval or rejection


**See Also:**
- [Absence Time Management](employee-time-tracking/absence-time-management.md)
- [Default Permissions](employee-time-tracking/default-permissions.md)
- [HR Administrator FAQ](hr-administrator-faq.md#how-do-i-approve-or-reject-vacation-requests)

---

### How do I see who's out of office this week/month?

For a team-wide absence overview, use the absence calendar. Department leads can see absences for their own department and for departments where they are assigned as lead.

For a single employee, you can also use the [Time Sheet Calendar](timesheet-calendar/calendar.md):

1. Open the **Timesheet** module.
2. Use **User Selection** to switch to the employee.
3. Change to **Week** or **Month** view.
4. Review the displayed absence times together with the employee's time sheet entries.

**See Also:**
- [Absence Time Management](employee-time-tracking/absence-time-management.md)
- [Time Sheet Calendar](timesheet-calendar/calendar.md)

---

### What do I do if multiple team members request the same vacation dates?

Use the absence calendar to compare the request with existing absences in the relevant department.

1. Select the pending request in the approval list.
2. Review the highlighted date range in the calendar.
3. Compare it with existing absences of other users in the same department.
4. Approve or reject the request based on your organization's rules.

The standard documentation explains how to review overlaps in the calendar, but it does not define a built-in decision policy for conflicting requests. If you need guidance on company rules, coordinate with HR.

**See Also:**
- [Absence Time Management](employee-time-tracking/absence-time-management.md)
- [HR Administrator FAQ](hr-administrator-faq.md)

---

## Team Time Tracking Oversight

### How do I check if my team is tracking time accurately?

Department leads can combine **Time Report**, **Time Sheet Calendar**, and the **Time Sheets** list for this check.

Use [Time Report](employee-time-tracking/time-report.md) when you want a working-time summary for a user and period. The report includes working time, breaks, overtime, remarks, and summary information.

If the list is available in your navigation, **Target-Actual Hours Comparison** is also useful for period-based checks. It lets you set:

- **Start Date**
- **End Date**
- **Consider Working Time Weight**
- **Show Hidden Users**

The list then shows these values per user:

- target hours
- target hours including lump sum overtime
- actual hours
- deviation
- deviation in percent

Use the [Time Sheet Calendar](timesheet-calendar/calendar.md) when you want to inspect a specific day or week:

1. Open the employee in **User Selection**.
2. Review the entries in the calendar.
3. Check visible gaps, overlaps, and the general distribution of the day.

Use [Time Sheet](project-time-tracking/timesheet.md) when you need a tabular view of team entries for review or export.

**See Also:**
- [Time Report](employee-time-tracking/time-report.md)
- [Working with Timesheet Entries](timesheet-calendar/working-with-timesheet-entries.md)
- [Timesheets](project-time-tracking/timesheet.md)

---

### How do I monitor my department's overtime and workload?

Use [Time Report](employee-time-tracking/time-report.md) as the primary source. It includes planned hours, actual working hours, overtime in the selected period, and the overtime balance at the start of the period.

If the list is available in your navigation, **Overtime per Effective Date** gives you a compact overtime snapshot for one date. It has these filters:

- **Effective Date**
- **Show Hidden Users**

For each user it shows:

- user
- overtime in hours
- a data bar for the overtime value
- a link to the user's overtime corrections

For period-based comparison, **Target-Actual Hours Comparison** is the more detailed view because it compares planned hours, actual hours, and deviation across a date range.

For detailed investigation:

1. Open **Time Report** for the relevant employee and period.
2. Review overtime together with remarks, absences, and break information.
3. If you need the underlying entries, open the employee in the [Time Sheet Calendar](timesheet-calendar/calendar.md) or review the [Time Sheet](project-time-tracking/timesheet.md) list.

**See Also:**
- [Time Report](employee-time-tracking/time-report.md)
- [Working Time Regulations](employee-time-tracking/working-time-regulations.md)
- [Project Manager FAQ](project-manager-faq.md)

---

### Can I see what projects my team is working on?

Yes. Under the default permissions, department leads can read timesheets for employees in their department.

The simplest way is to open the [Time Sheet](project-time-tracking/timesheet.md) list and review the project-related columns for the relevant period. Depending on your view configuration, you can also use filtering, sorting, grouping, or export to focus on one employee, one project, or one date range.

For a single employee and day or week, the [Time Sheet Calendar](timesheet-calendar/calendar.md) is often faster.

**See Also:**
- [Timesheets](project-time-tracking/timesheet.md)
- [Time Sheet Calendar](timesheet-calendar/calendar.md)
- [Project Manager FAQ](project-manager-faq.md)

---

## Department Reporting

### What reports should I review regularly as a department lead?

The most useful standard views for department leads are:

- [Time Report](employee-time-tracking/time-report.md) for working time, breaks, remarks, and overtime
- the absence calendar in [Absence Time Management](employee-time-tracking/absence-time-management.md) for approved and pending absences
- [Time Sheet](project-time-tracking/timesheet.md) for tabular review of project-related time entries
- `Overtime per Effective Date` for an overtime snapshot on one effective date
- `Target-Actual Hours Comparison` for comparing planned hours, actual hours, and deviation across a period

How often you review these views depends on your internal process. In the product documentation, they mainly map to three use cases: absence approval, working-time review, and project-related time review.

**See Also:**
- [Time Report](employee-time-tracking/time-report.md)
- [Absence Time Management](employee-time-tracking/absence-time-management.md)
- [Project Manager FAQ](project-manager-faq.md#what-reports-should-i-review-regularly-as-a-project-manager)

---

## Department Administration

### How do I onboard a new team member to my department?

Keep this split between setup and daily usage:

1. Coordinate the account, department assignment, and role setup with HR or account administration.
2. Show the employee the **Timesheet** module and the [Time Sheet Calendar](timesheet-calendar/calendar.md).
3. Let them create a first entry using the steps in [Working with Timesheet Entries](timesheet-calendar/working-with-timesheet-entries.md).
4. Show them the relevant user documentation for daily tracking and absences.

For account setup and employee master data, see the [HR Administrator FAQ](hr-administrator-faq.md#how-do-i-add-a-new-employee-to-time-cockpit). For end-user guidance, start with the [User FAQ](user-faq.md).

**See Also:**
- [User FAQ](user-faq.md)
- [Working with Timesheet Entries](timesheet-calendar/working-with-timesheet-entries.md)
- [HR Administrator FAQ](hr-administrator-faq.md#how-do-i-add-a-new-employee-to-time-cockpit)

---

## Need More Help?

### Department Lead Resources

**Related FAQs:**
- [User FAQ](user-faq.md) - General time tracking
- [HR Administrator FAQ](hr-administrator-faq.md) - HR setup and employee master data
- [Project Manager FAQ](project-manager-faq.md) - Project-focused team management
- [Employee FAQ](employee-faq.md) - Guide for your team members
- [Developer FAQ](developer-faq.md) - API and customization

**Documentation:**
- [Absence Time Management](employee-time-tracking/absence-time-management.md)
- [Time Report](employee-time-tracking/time-report.md)
- [Default Permissions](employee-time-tracking/default-permissions.md)
- [Time Sheet Calendar](timesheet-calendar/calendar.md)

**Support:**
- **Email:** support@timecockpit.com

---

*Last updated: April 2026.*
