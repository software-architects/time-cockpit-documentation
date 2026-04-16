---
title: Features Overview - Time Cockpit Capabilities
description: Complete overview of time cockpit features organized by capability including time tracking, project management, invoicing, employee management, reporting, and integrations.
keywords: [time cockpit features, feature overview, capabilities, time tracking features, project management, invoicing, employee time tracking, reporting features, feature guide]
---

# Features Overview

Explore time cockpit's comprehensive feature set organized by capability. Find detailed documentation for each feature to get the most out of your time tracking.

> [!TIP]
> **Want a business-focused overview?** Visit our [features page](https://www.timecockpit.com/features/) to see how time cockpit solves specific business challenges. This page provides detailed technical documentation for using each feature.

## 📅 Core Time Tracking

### Time Sheet Calendar
Intuitive graphical interface for tracking daily working hours.

- **[Time Sheet Calendar](timesheet-calendar/calendar.md)** - Main calendar interface with day, week, and month views
- **[Working with Timesheet Entries](timesheet-calendar/working-with-timesheet-entries.md)** - Creating, editing, and managing time entries
- **[Timesheet Templates](timesheet-calendar/timesheet-templates.md)** - Automate recurring time entries
- **[Signals & Activity Data](timesheet-calendar/signals.md)** - View captured activity data

**Learn more:** [Time Tracking Calendar features](https://www.timecockpit.com/features/time-tracking-calendar/)

### Access & Platforms
Track time anywhere, on any device.

- **[Web Client](getting-started/web-client.md)** - Browser-based access with PWA support
- **[Mobile Guide](getting-started/mobile-guide.md)** - 📱 **NEW!** Using time cockpit on phones and tablets
- **[Full Client Installation](getting-started/installation-instructions.md)** - Desktop application for Windows

### Calendar Integrations
Connect your existing calendars and tools.

- **[Outlook Appointments](timesheet-calendar/outlook-appointments.md)** - Sync with Microsoft Outlook/Office 365
- **[Office 365 Integration](timesheet-calendar/office365.md)** - Calendar synchronization

## 📊 Project Management

### Project Structure & Setup
Organize work by customers, projects, and tasks.

- **[Customers, Projects & Tasks](project-time-tracking/customer-project-task.md)** - Setting up project hierarchy
- **[Project Time Sheets](project-time-tracking/timesheet.md)** - Project-specific time tracking views

**Learn more:** [Project Time Tracking features](https://www.timecockpit.com/features/project-time-tracking/)

### Budget & Profitability
Keep projects profitable and on budget.

- **[Budget Tracking & Profitability Analysis](project-time-tracking/budget-tracking.md)** - 💰 **NEW!** Monitor project budgets, track costs vs. revenue, forecast completion
- **[Budgetary Control Use Case](use-cases/budgetary-control.md)** - Technical deep dive into budget calculation logic

**Key capabilities:**
- Set hour-based and cost-based budgets
- Real-time profitability tracking (revenue vs. costs)
- Forecast project completion and identify overruns
- Track billable vs. non-billable time
- Analyze internal costs vs. customer billing

**Learn more:** [Boost project profitability](https://www.timecockpit.com/blog/benefits-of-project-time-tracking/) | [Track project KPIs](https://www.timecockpit.com/blog/project-timetracking-kpis/)

## 💰 Invoicing & Billing

### Invoice Creation
Convert tracked time into customer invoices.

- **[Invoice Creation & Billing Workflow](project-time-tracking/billing.md)** - Step-by-step invoicing guide
- **[Invoice Data Fields](project-time-tracking/invoice-data-fields.md)** - Understanding invoice configuration

**Key workflows:**
- Create invoices from unbilled timesheet entries
- Manual invoice creation for fixed-price projects
- Retainer and recurring billing

**Learn more:** [Project Invoicing features](https://www.timecockpit.com/features/project-invoicing/) | [Maximize revenue](https://www.timecockpit.com/blog/project-time-tracking-revenue/)

### Pricing & Rates
Configure billing rates and pricing strategies.

- **[Hourly Rate Management & Pricing](project-time-tracking/hourly-rates.md)** - 💵 **NEW!** Complete rate configuration guide
  - Rate hierarchy (task → project → user → company)
  - Customer-specific pricing strategies
  - Role-based and service-based rates
  - Multi-currency considerations
  - Rate change workflows

**Key capabilities:**
- Set project-level, task-level, and employee rates
- Track internal costs vs. billable amounts
- Implement blended, role-based, or service-based pricing
- Manage rate changes mid-project
- Ensure profitability through margin analysis

## 👥 Employee Time Tracking

### Working Time Management
Track employee hours, absences, and compliance.

- **[Working Time / Leave Management](employee-time-tracking/working-time.md)** - Managing working hours and overtime
- **[Absence Time Management](employee-time-tracking/absence-time-management.md)** - Vacation, sick leave, compensatory time off
- **[Working Time Regulations](employee-time-tracking/working-time-regulations.md)** - Compliance with labor laws
- **[Time Report](employee-time-tracking/time-report.md)** - Employee time reporting
- **[Work from Home Tracking](employee-time-tracking/work-from-home.md)** - Remote work time tracking

**Learn more:** [Employee Time Tracking features](https://www.timecockpit.com/features/employee-time-tracking/)

### Approval Workflows
Structured approval processes for absences and timesheets.

- **[Approval Workflows](employee-time-tracking/approval-workflows.md)** - ✅ **NEW!** Complete workflow guide
  - Vacation approval process
  - Sick leave and compensatory time approval
  - Role-based permissions (Department Lead, HR Admin)
  - Automatic notifications
  - Timesheet approval workflows (custom)

**Key capabilities:**
- Enable approval requirements per absence type
- Department leads approve for their teams
- HR administrators handle cross-department approvals
- Absence calendar with pending approvals
- Notification system for requests and decisions

### Permissions & Security
Control who can see and do what.

- **[Default Permissions Guide](employee-time-tracking/default-permissions.md)** - Role-based access control
- **[Permissions Reference](data-model/permissions-guide.md)** - Comprehensive permissions documentation

## 📈 Reporting & Analytics

### Built-In Reports
Pre-configured reports for common analysis needs.

- **[Reporting Overview](reporting/overview.md)** - Introduction to SSRS reporting
- **[Built-In Reports](reporting/built-in-reports.md)** - Standard reports catalog
- **[Standard Print View](reporting/standard-print-view.md)** - Quick print layouts

**Common reports:**
- Project time by employee
- Billable vs. non-billable time
- Absence calendar
- Budget variance
- Revenue reports

**Learn more:** [Reporting & Analytics features](https://www.timecockpit.com/features/reporting/)

### Custom Reports
Create tailored reports for your specific needs.

- **[Custom Reports](reporting/custom-reports.md)** - Building SSRS custom reports
- **[TCQL Query Language](tcql/overview.md)** - Query data programmatically
- **[Data Export](data-exchange/export.md)** - Export to Excel for analysis

## 🤖 Activity Tracking (Desktop Only)

### Automatic Time Capture
Let time cockpit track your computer activity automatically.

- **[Signal Tracker Overview](signal-tracker/overview.md)** - Introduction to activity tracking
- **[Active Windows Tracking](signal-tracker/active-windows.md)** - Track application usage
- **[File Change Tracking](signal-tracker/changed-files.md)** - Monitor edited files
- **[Email Tracking](signal-tracker/sent-emails.md)** - Capture sent emails
- **[Phone Call Tracking](signal-tracker/phone-calls.md)** - Log phone activity
- **[Computer Activity](signal-tracker/computer-activity.md)** - Keyboard/mouse activity
- **[Network Connections](signal-tracker/network-connections.md)** - Track network usage

**Learn more:** [Activity Tracking features](https://www.timecockpit.com/features/activity-tracking/)

> [!NOTE]
> Signal tracking requires the **Windows desktop client**. View captured signals in the web client.

## 🔗 Integration & Data Exchange

### Import & Export
Connect time cockpit with external systems.

- **[Data Import](data-exchange/import.md)** - Import from Excel/CSV
- **[Data Export](data-exchange/export.md)** - Export to Excel and other formats
- **[Web API Overview](web-api/overview.md)** - Programmatic data access

**Learn more:** [Integration features](https://www.timecockpit.com/features/integration/)

### API & Automation
Integrate time cockpit with your workflow.

- **[Authentication](web-api/authentication.md)** - API authentication methods
- **[OData Endpoints](web-api/odata.md)** - RESTful data access
- **[TCQL Query Endpoint](web-api/query.md)** - Advanced querying
- **[Execute Actions](web-api/executeaction.md)** - Trigger actions via API
- **[Reporting API](web-api/reporting.md)** - Generate reports programmatically

## ⚙️ Customization

### Data Model Customization
Adapt time cockpit to your business processes.

- **[Customization Overview](data-model-customization/overview.md)** - Introduction to customization
- **[Entity Customization](data-model-customization/entity.md)** - Add custom fields and entities
- **[List Customization](data-model-customization/list.md)** - Create custom views
- **[Form Customization](data-model-customization/form.md)** - Design custom forms
- **[Dashboard Customization](data-model-customization/dashboard.md)** - Build custom dashboards
- **[Feature Flags](data-model-customization/feature-flags.md)** - Enable/disable features

**Learn more:** [Customization features](https://www.timecockpit.com/features/customization/)

### Scripting & Automation
Automate business logic with Python scripts.

- **[Scripting Overview](scripting/overview.md)** - Introduction to IronPython scripting
- **[Actions](scripting/actions.md)** - Custom business logic and workflows
- **[Triggers](scripting/triggers.md)** - Event-driven automation
- **[Automating Scripts](scripting/automating-scripts.md)** - Scheduled automation

## 🏢 Enterprise Features

### Azure Active Directory Integration
Enterprise-grade authentication and user management.

- **[AAD Integration](enterprise/aad.md)** - Azure AD authentication
- **[User Provisioning](enterprise/user-provisioning.md)** - Automated user management
- **[Custom Hostname](enterprise/custom-hostname.md)** - Branded URL (e.g., timecockpit.yourcompany.com)

**Learn more:** [Enterprise features](https://www.timecockpit.com/features/enterprise/) | [Security features](https://www.timecockpit.com/features/security/)

## 🎓 Learning Resources

### Getting Started
New to time cockpit? Start here.

- **[Overview](getting-started/overview.md)** - Introduction to time cockpit
- **[Account Management](account-management/account-management.md)** - User and billing management

### Frequently Asked Questions
Quick answers organized by role.

**General:**
- **[User FAQ](user-faq.md)** - Common questions for all users
- **[Employee FAQ](employee-faq.md)** - Basic time tracking questions

**Role-Specific:**
- **[Project Manager FAQ](project-manager-faq.md)** - Budget tracking & team time management
- **[Department Lead FAQ](department-lead-faq.md)** - Team oversight & absence approvals
- **[HR Administrator FAQ](hr-administrator-faq.md)** - Employee management & compliance
- **[Billing Administrator FAQ](billing-admin-faq.md)** - Invoicing & revenue tracking
- **[Developer FAQ](developer-faq.md)** - API & customization questions

### Data Model Reference
Understand time cockpit's data structure.

- **[Entity Relationships](data-model/entity-relationships.md)** - ER diagrams with Mermaid
- **[Standard Entities](data-model/standard-entities.md)** - Entity reference documentation

## 🔍 Find Features by Use Case

### "I need to..."

**...track time on client projects**
→ [Project Time Sheets](project-time-tracking/timesheet.md) | [Customers, Projects & Tasks](project-time-tracking/customer-project-task.md)

**...prevent project budget overruns**
→ [Budget Tracking](project-time-tracking/budget-tracking.md) | [Budgetary Control](use-cases/budgetary-control.md)

**...invoice customers for time worked**
→ [Invoicing](project-time-tracking/billing.md) | [Hourly Rates](project-time-tracking/hourly-rates.md)

**...manage employee vacation requests**
→ [Absence Management](employee-time-tracking/absence-time-management.md) | [Approval Workflows](employee-time-tracking/approval-workflows.md)

**...track employee working time for compliance**
→ [Working Time](employee-time-tracking/working-time.md) | [Working Time Regulations](employee-time-tracking/working-time-regulations.md)

**...approve team absences**
→ [Approval Workflows](employee-time-tracking/approval-workflows.md) | [Department Lead FAQ](department-lead-faq.md)

**...track time on my phone**
→ [Mobile Guide](getting-started/mobile-guide.md)

**...understand project profitability**
→ [Budget Tracking](project-time-tracking/budget-tracking.md) | [Hourly Rates](project-time-tracking/hourly-rates.md)

**...automate repetitive tasks**
→ [Scripting Actions](scripting/actions.md) | [Triggers](scripting/triggers.md)

**...integrate with external systems**
→ [Web API](web-api/overview.md) | [Data Exchange](data-exchange/import.md)

**...customize time cockpit for my workflow**
→ [Customization Overview](data-model-customization/overview.md) | [Entity Customization](data-model-customization/entity.md)

**...generate custom reports**
→ [Custom Reports](reporting/custom-reports.md) | [TCQL](tcql/overview.md)

## 📱 Feature Highlights

### New & Recently Enhanced
Features recently added or significantly improved.

- 💰 **[Budget Tracking](project-time-tracking/budget-tracking.md)** - Comprehensive budget monitoring and profitability analysis
- 💵 **[Hourly Rates](project-time-tracking/hourly-rates.md)** - Advanced rate management and pricing strategies
- ✅ **[Approval Workflows](employee-time-tracking/approval-workflows.md)** - Structured absence and timesheet approvals
- 📱 **[Mobile Guide](getting-started/mobile-guide.md)** - Enhanced mobile and responsive experience

### Most Popular Features

**Top 5 by usage:**
1. Time Sheet Calendar - Daily time tracking
2. Project Time Tracking - Customer project work
3. Invoicing - Billing customers
4. Absence Management - Vacation and sick leave
5. Reporting - Time and budget reports

### Power User Features

**Advanced capabilities for experienced users:**
- [Budgetary Control](use-cases/budgetary-control.md) - Deep dive into budget calculations
- [TCQL](tcql/overview.md) - Advanced query language
- [Data Model Customization](data-model-customization/overview.md) - Tailor data structure
- [Scripting](scripting/overview.md) - Python-based automation
- [Web API](web-api/overview.md) - Programmatic integration

## 🛠️ Support & Resources

### Documentation
- **[For Users](for-users.md)** - User-focused documentation hub
- **[For Developers](for-developers.md)** - Developer & API documentation
- **[Release Notes](release-notes/)** - What's new in each version

### Getting Help
- **Email

:** [support@timecockpit.com](mailto:support@timecockpit.com)
- **FAQs:** See role-specific FAQ pages above
- **Website:** [www.timecockpit.com](https://www.timecockpit.com/)

---

*Looking for something not listed here? Try the search function or contact [support@timecockpit.com](mailto:support@timecockpit.com).*
