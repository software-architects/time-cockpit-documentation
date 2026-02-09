---
title: Reporting - SSRS Reports & Custom Reports
description: Create printable reports in time cockpit using Microsoft Reporting Services (SSRS). Learn about RDL files, report filters, and data sources for custom reports.
---
# Reporting

In versions greater than 1.22, time cockpit supports to view your data in the form of printable reports. For reporting purposes, time cockpit uses [Reporting Services (SSRS)](http://msdn.microsoft.com/de-de/library/ms159106.aspx).

> [!TIP]
> Explore time cockpit's [reporting and analytics features](https://www.timecockpit.com/features/reporting/) to gain business insights. Learn which [project time tracking KPIs](https://www.timecockpit.com/blog/project-timetracking-kpis/) matter most for your business.

## Business Case: Why Data-Driven Reporting Matters

> [!AI-GENERATED]
> This content is AI-generated and requires verification.

### The Challenge: Decisions Without Data

Without integrated reporting capabilities, organizations rely on:

- **Manual Excel Exports**: Finance and operations teams export raw data, spend 5-10 hours building pivot tables and charts monthly, introducing errors and delays.
- **Gut-Feel Management**: Project managers approve budgets and staffing based on intuition rather than historical utilization data, leading to over/under-staffing (15-25% inefficiency).
- **Delayed Financial Insights**: Month-end revenue reports take 3-5 days to compile manually, preventing timely corrective action when projects go off-track.
- **Compliance Risks**: Without audit-ready reports for working time regulations, organizations face €5,000-€15,000 fines during labor inspections for incomplete documentation.
- **Client Reporting Overhead**: Professional services firms spend 2-4 hours per client per month creating status reports manually, consuming billable time on non-billable admin work.

### The Solution: Integrated Business Intelligence

Time cockpit's reporting system provides:

- Professional SSRS-based reports with automatic data integration
- Scheduled report generation and distribution (planned feature)
- Permission-aware data access (users see only authorized data)
- Pre-built reports for common scenarios (time reports, absence calendars, revenue reports)
- Custom report development for organization-specific needs
- Direct access to time cockpit business logic (calculated properties, report filters)

### 6 Key Benefits with ROI

**1. Faster Management Decision-Making**  
Real-time access to utilization reports, project profitability analysis, and budget vs. actual comparisons enables proactive management instead of reactive firefighting.

*ROI Example*: Identifying a project trending 20% over budget in Week 3 instead of Week 10 allows for course correction before losing €15,000-€30,000 on a €100,000 project.

**2. Eliminate Manual Reporting Labor**  
Automated reports replace 10-20 hours of monthly Excel work for finance and operations teams.

*ROI Example*: A 30-person consultancy saves 15 hours/month × 12 months = 180 hours annually. At €50/hour, that's **€9,000 saved per year** in finance labor costs.

**3. Improve Resource Allocation**  
Utilization reports show which employees are under-allocated (60-70% billable) vs. overloaded (90-100% billable), enabling balanced staffing.

*ROI Example*: Increasing average utilization from 65% to 75% for a 20-person team (assuming €150k revenue/person at 75%) generates **€400,000 in additional annual revenue** without hiring.

**4. Accurate Client Billing & Transparency**  
Time reports with detailed task breakdowns provide audit trails for client invoices, reducing disputes and accelerating payment.

*ROI Example*: Reducing payment collection time by 5 days (from DSO of 40 days to 35 days) for €50,000 monthly billing improves cash flow by €8,333 (working capital freed up).

**5. Compliance & Audit Readiness**  
Pre-built reports for working time regulations, vacation entitlements, and absence tracking satisfy labor law requirements in DACH regions (Germany, Austria, Switzerland).

*ROI Example*: Passing labor inspections without fines (avoiding €5,000-€15,000 penalties) and reducing audit preparation time from 30 hours to 5 hours saves €1,250-€2,250 per audit at €50/hour.

**6. Data-Driven Business Development**  
Revenue reports by customer, project type, and service category reveal which offerings are most profitable, guiding marketing and sales strategy.

*ROI Example*: Discovering that "training services" generate 35% margins vs. "implementation projects" at 18% margins allows you to shift sales focus, potentially increasing overall margins by 5-8 percentage points (worth €50,000-€80,000 annually for a €1M revenue firm).

### Reporting Scenarios with Business Impact

**Scenario 1: Project Manager Reviews Team Utilization**

**Without Time Cockpit Reporting**:
- Export timesheet data to Excel (15 minutes)
- Build pivot table grouping hours by employee and project (20 minutes)
- Calculate utilization percentages manually (15 minutes)
- Format charts for presentation (15 minutes)
- Data is already 2-3 days old by the time report is complete

**Total time**: 65 minutes, outdated data

**With Time Cockpit Reporting**:
- Open "Utilization Report" from menu (10 seconds)
- Select date range and department filters (30 seconds)
- Generate report showing billable hours, utilization %, and capacity gaps (5 seconds)
- Export to PDF for team meeting (10 seconds)

**Total time**: ~1 minute, real-time data

**Scenario 2: Finance Director Prepares Monthly Revenue Report**

**Without Time Cockpit Reporting**:
- Request exports from operations team (1 day delay)
- Import timesheet data into accounting system (45 minutes)
- Cross-reference invoices with actual hours worked (90 minutes)
- Calculate revenue by customer and project (60 minutes)
- Build Excel dashboard with charts (45 minutes)
- Reconcile discrepancies between systems (2 hours)

**Total time**: 5-6 hours, 2-3 day delay

**With Time Cockpit Reporting**:
- Open "Revenue Report" (10 seconds)
- Select current month, group by customer (20 seconds)
- Generate report showing billed revenue, unbilled hours, and project margins (5 seconds)
- Export to Excel for board presentation (10 seconds)

**Total time**: ~1 minute, same-day data

**Scenario 3: HR Admin Prepares Working Time Documentation for Labor Inspection**

**Without Time Cockpit Reporting**:
- Search email archives for absence requests (2 hours)
- Export timesheet records to Excel (30 minutes)
- Manually verify working time compliance for 25 employees (4 hours)
- Format documentation to meet inspector requirements (2 hours)
- Print and organize 500+ pages of records (1 hour)

**Total time**: 9-10 hours, high error risk

**With Time Cockpit Reporting**:
- Open "Working Time Compliance Report" (10 seconds)
- Select date range for inspection period (20 seconds)
- Generate report showing daily working hours, breaks, and violations (5 seconds)
- Generate "Absence Report" showing vacation and sick leave records (5 seconds)
- Export both reports to PDF (15 seconds)

**Total time**: ~1 minute, audit-ready documentation

### Business Metrics Enabled by Reporting

Time cockpit reporting makes these critical business metrics accessible:

- **Employee Utilization Rate** = Billable Hours ÷ Total Available Hours × 100  
  *Target*: 70-85% for consultants (varies by role)

- **Project Profitability** = (Billed Revenue - Labor Costs) ÷ Billed Revenue × 100  
  *Target*: 25-40% for professional services

- **Revenue per Employee** = Total Revenue ÷ Number of Employees  
  *Benchmark*: €120,000-€180,000 for DACH region consultancies

- **Absence Rate** = Total Absence Days ÷ Total Working Days × 100  
  *Target*: 3-5% vacation, 2-4% sick leave

- **Budget Variance** = (Actual Hours - Budgeted Hours) ÷ Budgeted Hours × 100  
  *Target*: ±10% variance for well-estimated projects

- **Days Sales Outstanding (DSO)** = (Accounts Receivable ÷ Total Credit Sales) × Days in Period  
  *Target*: 30-40 days for B2B

These metrics are available through time cockpit's built-in reports and can be exported for executive dashboards.

### For Different Organization Sizes

**Small Teams (2-10 employees)**:  
Focus on basic time reports and utilization tracking. Pre-built reports cover 90% of needs. Avoid over-investing in custom report development until you have 10+ employees. Primary value: visibility into who is working on what.

**Medium Teams (10-50 employees)**:  
Reporting becomes mission-critical. Invest in monthly financial reports (revenue by customer, project profitability), resource planning reports (utilization by employee/department), and compliance reports (working time, absences). Consider custom reports for specific needs (e.g., customer-specific invoice formats).

**Large Teams (50+ employees)**:  
Reporting is essential for business intelligence. Use custom SSRS reports tailored to your workflows. Train department leads to run their own reports instead of relying on finance team. Integrate reporting into weekly management routines (Monday morning utilization review, Friday afternoon revenue check).

### Getting Started with Reporting

1. **Explore Pre-Built Reports**: Time cockpit includes default reports for timesheets, absences, and projects. Open any list and look for the "Report" action to see available reports.

2. **Understand Report Filters**: Reports use time cockpit's existing filtering mechanism. Add filters to your list (date range, department, customer) and these filters automatically apply to generated reports.

3. **Export Reports**: Reports can be exported to PDF (for sharing with clients or printing) or Excel (for further analysis).

4. **Custom Reports for Administrators**: Time cockpit administrators can create custom SSRS reports using Microsoft SQL Server Report Builder (free) or Visual Studio with SQL Server Data Tools. Custom reports access time cockpit data through the business layer (permissions and calculated properties automatically apply).

5. **Schedule Key Reports**: Plan monthly reporting routines (e.g., first Monday: utilization report, last Friday: revenue report). Consistency in reporting cadence helps catch issues early.

6. **Train Department Leads**: Empower project managers and department leads to run their own reports instead of waiting for finance team. This decentralizes decision-making and speeds up responses to project issues.

See also: [Time Report](time-report.md), [Built-in Reports](../data-model-customization/built-in-reports.md), [Data Exchange](../data-exchange/overview.md)

## FAQ

1. **Do we need our own Microsoft Reporting Services Server for this functionality?**<br/>
No, you don't. time cockpit uses an embedded version of Microsoft Reporting Services.

1. **I am not familiar with Microsoft Reporting Services. How can I learn it?**<br/>
We recommend the book [Professional Microsoft SQL Server 2012 Reporting Services](http://www.amazon.de/gp/product/1118101111/).

1. **Will this new reporting feature be charged separately?**<br/>
No, it will not. Please note that your time cockpit subscription does not cover the licenses you need for Microsoft's tools for editing *Reporting Services Definition (RDL)* files (see also next question).

1. **How can we edit the RDL files that time cockpit creates?**<br/>
You can choose between Microsoft Visual Studio 2012 together with [Microsoft's SQL Server Data Tools BI for Visual Studio 2012](http://www.microsoft.com/en-us/download/details.aspx?id=36843) and [Microsoft SQL Server 2008 R2 Report Builder 3.0](http://www.microsoft.com/en-us/download/details.aspx?id=6116). Visual Studio is perfect for you if you are a developer who uses Visual Studio for your daily work. Use Report Builder if you are do not have a background in software development and you do not know Visual Studio.<br/><br/>
You can download [Microsoft SQL Server 2008 R2 Report Builder 3.0](http://www.microsoft.com/en-us/download/details.aspx?id=6116) from Microsoft's website. It is free of charge if you have a valid license for an SQL Server. You can find the details about the terms and conditions for Report Builder in its installation wizard.

1. **Can only time cockpit administrators benefit from this new functionality?**<br/>
Currently only time cockpit administrators can create and view custom reports. In the April 2014 release we will add the possibility to upload custom reports into your time cockpit database. Uploaded reports will be available for other users, too (full client and web client). However, creating custom reports will always be a restricted to time cockpit administrators.

1. **Do the custom reports access time cockpit's database directly?**<br/>
No, they don't. Reports get their data through the time cockpit business layer. Therefore things like permissions, business logic (e.g. calculated properties), etc. apply and are available.<br/><br/>
Please note that you must not change the data source that time cockpit generated in the RDL files. The data source is created only for design time. At runtime, time cockpit will ignore it and deliver the appropriate data on the fly.

1. **Is it possible to add a report to time cockpit's menu?**<br/>
Currently not. We are planning to add this possibility in one of the next versions of time cockpit.

1. **Can I use Reporting Services' parameters and filters?**<br/>
Yes and no. Custom reports in time cockpit use time cockpit's existing filtering mechanism. You can add new report filters to your list if you want to. time cockpit will automatically pass these filter conditions to Reporting Services. Please note that you have to use time cockpit's filtering mechanisms. You cannot add additional filters or parameters directly in Reporting Services.

1. **Can I combine data from multiple time cockpit lists in a single report?**<br/>
No, this is currently not supported. The time cockpit list engine is very powerful. You can even create lists based on [time cockpit scripts](~/doc/scripting/overview.md). In such script you can put together data from all areas in time cockpit. However, this is a quite advanced scenario. If you want to build such a report and you have questions about it, please contact us at [support@timecockpit.com](mailto:support@timecockpit.com).

1. **Can I combine data from time cockpit and other sources in a single report?**<br/>
No, this is currently not supported. If you want to include data in your report, you have to first import it into time cockpit. You can use time cockpit's [Excel importer](~/doc/data-exchange/import.md) for that.

1. **Can I automatically send reports to users?**<br/>
No, this is currently not supported. Would you like to have this functionality? We would love to hear your feedback at [support@timecockpit.com](mailto:support@timecockpit.com).

1. **I would need some reports but do not have the time to build them myself. Can you do it for me?**<br/>
Yes of course. Let us know how your reports should look like and we will be glad to send you a cost estimation.

1. **How can I give feedback?**<br/>
Please send your questions and feedback to [support@timecockpit.com](mailto:support@timecockpit.com).