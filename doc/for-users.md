---
title: For Time Cockpit Users
description: User-focused documentation for tracking time, managing projects, and using time cockpit's core features.
---

# For Time Cockpit Users

Welcome to the user documentation for time cockpit! This section covers everything you need to effectively track time, manage projects, handle absences, and generate reports.

## 📋 Quick Navigation

### Getting Started
New to time cockpit? Start here to set up your account and learn the basics.
- [Overview](~/doc/getting-started/overview.md)
- [Web Client](~/doc/getting-started/web-client.md)
- [Account Management](~/doc/account-management/account-management.md)

### Daily Time Tracking
Learn how to track your working hours efficiently.
- [Time Sheet Calendar](~/doc/timesheet-calendar/calendar.md)
- [Working With Time Sheet Entries](~/doc/timesheet-calendar/working-with-timesheet-entries.md)
- [Outlook Appointments](~/doc/timesheet-calendar/outlook-appointments.md)
- [Time Sheet Templates](~/doc/timesheet-calendar/timesheet-templates.md)
- [Working Time](~/doc/timesheet-calendar/working-time.md)

### Project-Based Work
Track time on customer projects and generate invoices.
- [Customers, Projects & Tasks](~/doc/project-time-tracking/customer-project-task.md)
- [Project Time Sheets](~/doc/project-time-tracking/timesheet.md)
- [Invoicing](~/doc/project-time-tracking/billing.md)
- [Invoice Data Fields](~/doc/project-time-tracking/invoice-data-fields.md)

### Attendance & Leave Management
Manage working time, vacation, sick leave, and compliance.
- [Working Time / Leave Management](~/doc/employee-time-tracking/working-time.md)
- [Absence Time Management](~/doc/employee-time-tracking/absence-time-management.md)
- [Working Time Regulations](~/doc/employee-time-tracking/working-time-regulations.md)
- [Time Report](~/doc/employee-time-tracking/time-report.md)
- [Default Permissions](~/doc/employee-time-tracking/default-permissions.md)

### Reporting
Generate reports to analyze your time tracking data.
- [Overview](~/doc/reporting/overview.md)
- [Standard Print View](~/doc/reporting/standard-print-view.md)
- [Built-In Reports](~/doc/reporting/built-in-reports.md)

## ❓ Frequently Asked Questions (FAQs)

Find quick answers to common questions organized by role and topic.

### General FAQs
- **[User FAQ](user-faq.md)** - Common questions for all time cockpit users covering time tracking, projects, vacation, billing, and account management
- **[Employee FAQ](employee-faq.md)** - Basic questions for employees on daily time tracking, vacation requests, and mobile access

### Role-Specific FAQs
- **[Project Manager FAQ](project-manager-faq.md)** - Budget tracking, team time management, billable hours, and project profitability
- **[Department Lead FAQ](department-lead-faq.md)** - Team time tracking oversight, absence approval, capacity monitoring, and department reporting
- **[HR Administrator FAQ](hr-administrator-faq.md)** - Employee management, vacation policies, absence approvals, working time regulations, and compliance
- **[Billing Administrator FAQ](billing-admin-faq.md)** - Invoice creation, hourly rates, billing reports, revenue tracking, and customer billing

> [!TIP]
> For developer-specific questions about the API, data model, or customizations, see the [Developer FAQ](developer-faq.md).

## 🔍 Common Tasks

### How do I...

**Track time on a project?**
1. Go to Time Sheet Calendar
2. Click to add new entry
3. Select customer → project → task
4. Enter begin/end time
5. Add description
→ [Full Guide](~/doc/timesheet-calendar/working-with-timesheet-entries.md)

**Request vacation?**
1. Navigate to Vacation list
2. Create new vacation entry
3. Set begin/end dates
4. Submit for approval
→ [Absence Management Guide](~/doc/employee-time-tracking/absence-time-management.md)

**Create an invoice?**
1. Select unbilled timesheets
2. Run "Create Invoice" action
3. Review invoice details
4. Set invoice number
→ [Invoicing Guide](~/doc/project-time-tracking/billing.md)

**Export my timesheet data?**
→ [Data Export](~/doc/data-exchange/export.md)

**Import data from Excel?**
→ [Data Import](~/doc/data-exchange/import.md)

## 💼 For Different Roles

### Project Managers
- Track project budgets and hours
- View team member timesheets on your projects
- Generate project reports
→ [Project Time Tracking](~/doc/project-time-tracking/customer-project-task.md)

### Department Leads
- Approve team absences (vacation, sick leave)
- View department working time reports
- Monitor team compliance
→ [Default Permissions](~/doc/employee-time-tracking/default-permissions.md)

### Billing Administrators
- Create and manage invoices
- Track project profitability
- Assign timesheets to invoices
→ [Invoicing](~/doc/project-time-tracking/billing.md)

### HR Administrators
- Manage user accounts and working time
- Set up vacation entitlements
- Configure working time regulations
→ [Working Time Management](~/doc/employee-time-tracking/working-time.md)

## 🖥️ Full Client (Desktop Application)

For Windows users, the full client provides additional features like signal tracking:

- [Installation Instructions](~/doc/getting-started/installation-instructions.md)
- [Signal Trackers Overview](~/doc/signal-tracker/overview.md)
- [Active Windows Tracking](~/doc/signal-tracker/active-windows.md)
- [Email Tracking](~/doc/signal-tracker/sent-emails.md)
- [File Change Tracking](~/doc/signal-tracker/changed-files.md)

## 🏢 Enterprise Features

For organizations using Azure Active Directory:
- [AAD Integration](~/doc/enterprise/aad.md)

## 📚 Additional Resources

- [Release Notes](~/doc/release-notes/2026-02.md) - What's new in time cockpit
- [Troubleshooting](~/doc/getting-started/troubleshooting/send-log-files.md) - Common issues and solutions

---

## Looking for Developer Documentation?

If you're looking to customize time cockpit, integrate with external systems, or automate workflows:
→ **[For Developers](for-developers.md)**
