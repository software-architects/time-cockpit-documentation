---
title: HR Administrator FAQ - Employee & Absence Management
description: HR administrator FAQ for time cockpit: maintain employee data, manage absences, review working time, and prepare exports for follow-up processing.
keywords: [hr administrator, employee data, absence approval, sick leave, vacation entitlement, working time, payroll export, hr faq]
---

# HR Administrator FAQ

This FAQ answers common questions from HR administrators who maintain employee data, manage absences, and review working time information in time cockpit.

> [!NOTE]
> For general time tracking questions, see the [User FAQ](user-faq.md). For developer/API questions, see the [Developer FAQ](developer-faq.md).

> [!NOTE]
> Reviewed in April 2026.

## Employee Management & Onboarding

### How do I add a new employee to time cockpit?

In standard time cockpit, onboarding usually has two parts:

1. Create or enable the user account in [Account Management](account-management/account-management.md).
2. Maintain the employee's master data in **User -> User Details**.

The standard HR setup usually includes:

- visibility
- department assignment
- holiday calendar
- weekly hours of work
- vacation entitlement
- role assignment, if needed

Vacation entitlement is maintained separately in **User -> Vacation Entitlement**.

Typical standard roles include:

- **Time Tracking User**
- **Project Manager**
- **Project Controller**
- **Department Lead**
- **HR Admin**
- **Billing Admin**

For offboarding:

1. Set **Date of Separation** in the employee record.
2. In **Account Management**, set the user to **Active = false** if the user should no longer have access and should no longer be billed.
3. Set **Hidden** if the user should no longer appear in selections.
4. Do not delete the user if you need to keep historical data.

**See Also:**
- [Account Management](account-management/account-management.md)
- [Working Time / Leave Management](employee-time-tracking/working-time.md)
- [Default Permissions](employee-time-tracking/default-permissions.md)

---

### How do I set up different working time models (full-time, part-time)?

In standard time cockpit, weekly hours of work define planned hours per weekday. They do not define exact normal working times such as `08:00-17:00`.

Common setups are for example:

- full-time with the same planned hours on each workday
- part-time with reduced planned hours per day
- part-time with planned hours only on selected weekdays
- compressed weeks with more planned hours on fewer days

To configure this:

1. Open **User -> Weekly Hours of Work**.
2. Create or edit the record for the employee.
3. Enter the planned hours for each weekday.
4. Set days without planned work to `0` or leave empty.
5. Add included overtime per month only if you use overtime calculation.
6. Use validity periods when planned working time changes over time.

Important standard behavior:

- weekly hours of work are maintained per employee
- validity periods must not overlap
- planned hours are used for target/actual comparison, overtime, and remaining-leave calculation
- exact normal working times are not maintained in this list

**See Also:**
- [Working Time / Leave Management](employee-time-tracking/working-time.md)
- [Time Report](employee-time-tracking/time-report.md)

---

### How do I bulk update employee information?

Use export when you need a review or handoff file, but be careful with import in standard time cockpit: the importer creates new rows and does not update existing ones.

That means:

- use [Data Export](data-exchange/export.md) to review current employee data outside the system
- use [Data Import](data-exchange/import.md) for controlled creation of new records
- update existing employee master data in the relevant lists, or use customization if you need true bulk updates for existing records

If you prepare data externally, test the import mapping first and review the result before using it in production.

**See Also:**
- [Data Import](data-exchange/import.md)
- [Data Export](data-exchange/export.md)
- [Developer FAQ](developer-faq.md)

---

## Vacation & Absence Management

### How do I configure vacation policies and entitlements?

In standard time cockpit, vacation entitlement is maintained per employee and calculated together with weekly hours of work.

The core setup is:

1. Maintain the employee's planned working time in **User -> Weekly Hours of Work**.
2. Maintain the employee's entitlement in **User -> Vacation Entitlement**.
3. Use the vacation lists and the remaining-leave calculation for ongoing review.

Important standard behavior:

- vacation entitlement is managed in weeks
- remaining leave is also calculated in weeks
- used vacation is converted based on the employee's planned hours of work
- part-time and historical changes in weekly hours of work are considered in the calculation

If your company needs special accrual or expiration rules, review your current configuration carefully because the standard documentation mainly describes the entitlement and remaining-leave calculation, not custom policy automation.

**See Also:**
- [Working Time / Leave Management](employee-time-tracking/working-time.md)
- [Absence Time Management](employee-time-tracking/absence-time-management.md)

---

### How do I approve or reject vacation requests?

If the approval workflow is enabled, HR administrators can approve absences for all users on behalf of department leads.

1. Open the absence calendar described in [Absence Time Management](employee-time-tracking/absence-time-management.md).
2. Enable **Show all users** if you need to work across departments.
3. Narrow the result with the **Department** and **User** filters if needed.
4. Select a pending row in the list above the calendar to preview the absence.
5. Use the approval or rejection action in the rightmost columns.

Standard behavior documented for this workflow:

- HR administrators can approve on behalf of department leads
- the calendar jumps to the start date of the selected absence
- the requesting user receives a notification after approval or rejection
- rejected absences are deleted

**See Also:**
- [Absence Time Management](employee-time-tracking/absence-time-management.md)
- [Department Lead FAQ](department-lead-faq.md)

---

### How do I handle sick leave and medical absences?

Use **User -> Sick Leave** for sick-leave records. If the approval workflow is enabled for sick leave, the approval process is handled in the same absence calendar as other absence types.

For day-to-day work, this usually means:

1. Create or review the sick-leave entry.
2. Open the absence calendar if approval is required.
3. Approve or reject the record there.
4. Review the result in the employee's absence history and related working-time views.

The standard documentation describes absence entry and approval, but it does not document built-in handling for medical certificates or other external documents. If your process includes document storage, review your tenant setup separately.

**See Also:**
- [Absence Time Management](employee-time-tracking/absence-time-management.md)
- [Working Time / Leave Management](employee-time-tracking/working-time.md)

---

### What's the difference between vacation, sick leave, and compensatory time off?

In standard time cockpit, these are separate absence types:

- **Vacation** is used for leave that counts against vacation entitlement.
- **Sick Leave** is tracked separately from vacation.
- **Compensatory Time Off** is also tracked separately from vacation.

The approval workflow can be enabled separately for each absence type. Vacation entitlement and remaining leave are described in the working-time documentation, while the approval workflow for all three categories is described in the absence documentation.

**See Also:**
- [Absence Time Management](employee-time-tracking/absence-time-management.md)
- [Working Time / Leave Management](employee-time-tracking/working-time.md)

---

## Compliance & Reporting

### How do I run reports to monitor working time compliance?

The main standard views for HR administrators are:

- **Time Report** for working time, breaks, remarks, and overtime in a selected period
- **Target-Actual Hours Comparison** for planned versus actual hours across a date range
- **Overtime per Effective Date** for an overtime snapshot on one date
- **Working Time Violations** if your tenant uses working-time regulations
- absence-related lists and the absence calendar for vacation, sick leave, and compensatory time

Use these views together depending on the question:

1. Start with **Time Report** when you need a detailed view for one user and one period.
2. Use **Target-Actual Hours Comparison** when you want to compare users across a date range.
3. Use **Overtime per Effective Date** when you need the overtime balance on a specific date.
4. Use **Working Time Violations** when you review rule-based violations and the feature is configured in your tenant.

**See Also:**
- [Time Report](employee-time-tracking/time-report.md)
- [Working Time / Leave Management](employee-time-tracking/working-time.md)
- [Working Time Regulations](employee-time-tracking/working-time-regulations.md)

---

### How do I prepare data for payroll processing?

In standard time cockpit, payroll preparation is mainly a review-and-export process.

Before exporting, review:

- completed time entries for the payroll period
- approved absences for the same period
- planned versus actual hours where relevant
- overtime balances if your payroll process uses them

Typical standard sources are:

- [Time Report](employee-time-tracking/time-report.md)
- [Timesheets](project-time-tracking/timesheet.md)
- [Absence Time Management](employee-time-tracking/absence-time-management.md)
- [Data Export](data-exchange/export.md)

The standard documentation explains how to export data, but the final payroll format depends on your downstream payroll system and any custom integration you use.

**See Also:**
- [Time Report](employee-time-tracking/time-report.md)
- [Timesheets](project-time-tracking/timesheet.md)
- [Data Export](data-exchange/export.md)
- [Developer FAQ](developer-faq.md)

---

## Need More Help?

### HR Administrator Resources

**Related FAQs:**
- [User FAQ](user-faq.md) - General time tracking questions
- [Department Lead FAQ](department-lead-faq.md) - Team approval workflows
- [Employee FAQ](employee-faq.md) - Employee-facing guidance for self-service
- [Developer FAQ](developer-faq.md) - API and customization

**Documentation:**
- [Absence Time Management](employee-time-tracking/absence-time-management.md)
- [Working Time / Leave Management](employee-time-tracking/working-time.md)
- [Time Report](employee-time-tracking/time-report.md)
- [Default Permissions](employee-time-tracking/default-permissions.md)
- [Account Management](account-management/account-management.md)

**Support:**
- **Email:** support@timecockpit.com

---

*Last updated: April 2026.*
