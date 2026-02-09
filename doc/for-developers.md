---
title: For Developers
description: Technical documentation for customizing time cockpit, building integrations, and automating workflows.
---

# For Developers

Welcome to the developer documentation for time cockpit! This section covers everything you need to customize the data model, build integrations, automate workflows, and extend time cockpit's functionality.

## 🚀 Quick Start

### New to Time Cockpit Development?

1. **[Developer FAQ](developer-faq.md)** - Common questions and quick answers
2. **[Data Model Overview](data-model/entity-relationships.md)** - Understand the entity structure
3. **[Web API Overview](web-api/overview.md)** - Access time cockpit programmatically
4. **[TCQL Overview](tcql/overview.md)** - Learn the query language

### Popular Use Cases

- [Budgetary Control Implementation](use-cases/budgetary-control.md)
- [Project Budget Tracking](developer-faq.md#how-do-i-track-project-budgets)
- [JIRA Integration](developer-faq.md#how-can-i-integrate-with-jira)
- [Custom Workflow Automation](developer-faq.md#how-do-i-create-an-approval-workflow)

## 📊 Data Model

Understand time cockpit's data structure and relationships.

### Core Concepts
- **[Entity Relationships](data-model/entity-relationships.md)** - Visual ER diagrams for all domains
  - Project & Billing domain
  - Time & Attendance domain  
  - Security & User Management
  - Master Data & Configuration

- **[Standard Entities Reference](data-model/standard-entities.md)** - Complete entity documentation
  - APP_Timesheet, APP_Project, APP_Task
  - Properties, relationships, permissions
  - TCQL and Web API examples

- **[Permissions & Security Guide](data-model/permissions-guide.md)** - Security architecture
  - Role-based access control (RBAC)
  - Row-level security patterns
  - Named sets
  - Common permission scenarios

### Customization
- **[Data Model Customization Overview](data-model-customization/overview.md)**
- **[Creating Custom Entities](data-model-customization/entity.md)**
- **[Custom Lists](data-model-customization/list.md)**
- **[Custom Forms](data-model-customization/form.md)**
- **[Permission Configuration](data-model-customization/permission.md)**
- **[Navigation Customization](data-model-customization/navigation.md)**
- **[Dashboards](data-model-customization/dashboard.md)**
- **[Feature Flags](data-model-customization/feature-flags.md)**

## 🔍 TCQL - Time Cockpit Query Language

TCQL is the expression-based query language for accessing and manipulating time cockpit data.

### Core Syntax
- **[Overview](tcql/overview.md)** - Introduction to TCQL
- **[From Clause](tcql/from-clause.md)** - Data source selection
- **[Where Clause](tcql/where-clause.md)** - Filtering data
- **[Select Clause](tcql/select-clause.md)** - Projections and aggregations
- **[Order By Clause](tcql/order-by-clause.md)** - Sorting results
- **[Expression Language](tcql/expression-language.md)** - Operators and functions

### Specialized Functions
- **[Working Time & Holiday Functions](tcql/functions-for-working-time-and-holidays.md)**
  - `:GetWorkTime()` - Calculate working hours
  - `:GetWeeklyHoursOfWork()` - Expected hours
  - `:BookingCompletionDateOfUser()` - Closing date
  - `:FirstOfMonth()`, `:LastOfMonth()` - Date helpers

### Advanced Topics
- **[TCQL AST API](tcql/tcql-ast-api.md)** - Programmatic query construction

### Example Queries

**Get unbilled hours per project:**
```tcql
From T In APP_Timesheet
Where T.APP_Billable = True And T.APP_Billed = False
Select New With {
    .ProjectCode = T.APP_Project.APP_Code,
    .TotalHours = Sum(T.APP_DurationInHours),
    .Revenue = Sum(T.APP_Revenue)
}
```

**Find timesheets in wrong department:**
```tcql
From T In APP_Timesheet
Where 
    T.APP_Project <> Null And
    T.APP_UserDetail.APP_Department <> T.APP_Project.APP_Customer.APP_Department
Select T
```

More examples → [Developer FAQ](developer-faq.md)

## 🔌 Web API

Access time cockpit data via REST/OData API.

### API Documentation
- **[Overview](web-api/overview.md)** - API architecture
- **[Authentication](web-api/authentication.md)** - OAuth, bearer tokens
- **[OData Endpoint](web-api/odata.md)** - REST CRUD operations
- **[Query Endpoint](web-api/query.md)** - Execute TCQL via HTTP
- **[ExecuteList Endpoint](web-api/executelist.md)** - Run predefined lists
- **[ExecuteAction Endpoint](web-api/executeaction.md)** - Trigger actions
- **[Reporting Endpoint](web-api/reporting.md)** - Generate reports
- **[Sample Implementation](web-api/timecockpit-client.md)** - Client library

### Quick Examples

**Get current user's timesheets:**
```http
GET https://api.timecockpit.com/odata/APP_Timesheet
  ?$filter=APP_UserDetailUuid eq current-user-uuid
  &$expand=APP_Project,APP_Task
  &$orderby=APP_BeginTime desc
  &$top=50
```

**Create a timesheet:**
```http
POST https://api.timecockpit.com/odata/APP_Timesheet
Content-Type: application/json

{
  "APP_BeginTime": "2026-02-09T09:00:00Z",
  "APP_EndTime": "2026-02-09T12:30:00Z",
  "APP_Description": "Development work",
  "APP_ProjectUuid": "...",
  "APP_UserDetailUuid": "..."
}
```

**Execute TCQL query:**
```http
POST https://api.timecockpit.com/query
Content-Type: application/json

{
  "query": "From T In APP_Timesheet Where T.APP_BeginTime >= @StartDate Select T",
  "parameters": {
    "@StartDate": "2026-02-01T00:00:00Z"
  }
}
```

More examples → [Web API Documentation](web-api/overview.md)

## ⚙️ Scripting & Automation

Automate workflows and extend functionality using Python (IronPython).

### Core Concepts
- **[Scripting Overview](scripting/overview.md)** - Introduction to scripting
- **[Actions](scripting/actions.md)** - User-triggered operations
- **[Triggers](scripting/triggers.md)** - Event-driven automation
- **[Automating Scripts](scripting/automating-scripts.md)** - Scheduled execution

### Common Scenarios

**How-To Guides:**
- [Add a File Property](scripting/add-file-property.md)
- [Add Holidays Using a Script](scripting/add-holidays.md)
- [Export Data to Excel](scripting/export-data-to-excel.md)
- [Import Data from CSV](scripting/import-data-from-csv.md)
- [Import from SQL Server](scripting/import-data-from-sql-server.md)
- [Modify the Data Model](scripting/modify-data-model.md)
- [Send Mails When Over Budget](scripting/send-mail-when-over-budget.md)
- [Use .NET Framework Classes](scripting/use-dot-net-classes-in-scripts.md)
- [Use C# to Access API](scripting/use-c-sharp-to-access-time-cockpit-api.md)
- [Use XML in Scripts](scripting/use-xml-in-scripts.md)

### Example: Auto-Approve Vacation

```python
def approveVacationTrigger(actionContext):
    dc = actionContext.DataContext
    vacation = actionContext.InputSet.First()
    
    # Auto-approve if less than 1 day
    if vacation.APP_BeginTime == vacation.APP_EndTime:
        vacation.APP_ApprovedTimestampUtc = DateTime.UtcNow
        vacation.APP_Approver = dc.Environment.CurrentUser
        dc.SaveObject(vacation)
```

More examples → [Scripting How-To Guides](scripting/overview.md)

## 📈 Reporting

Create custom reports and data visualizations.

- **[Overview](reporting/overview.md)** - Reporting architecture
- **[Standard Print View](reporting/standard-print-view.md)** - Built-in templates
- **[Custom Reports](reporting/custom-reports.md)** - Create your own
- **[Built-In Reports](reporting/built-in-reports.md)** - Available reports

## 💡 Use Cases & Examples

Real-world implementation examples:

- **[Budgetary Control](use-cases/budgetary-control.md)** - Project budget tracking with calculated metrics
  - Hours booked vs. budgeted
  - Revenue vs. costs analysis
  - Effective billing rates
  - Python-based list implementation

More use cases coming soon!

## 📦 Integration Patterns

### Common Integration Scenarios

**1. External Project Management (JIRA, Azure DevOps)**
- Sync projects/tasks into time cockpit
- Push time entries back to external system
→ [JIRA Integration Example](developer-faq.md#how-can-i-integrate-with-jira)

**2. Accounting Systems (DATEV, SAP)**
- Export invoices and billable hours
- Import customer/project master data
→ [Data Export](data-exchange/export.md)

**3. HR Systems**
- Sync employee master data
- Export working time for payroll
→ [Data Import/Export](data-exchange/import.md)

**4. Custom Dashboards (Power BI, Tableau)**
- Query timesheet data via OData
- Build real-time dashboards
→ [OData Endpoint](web-api/odata.md)

## 🔐 Security for Developers

- **[Permissions Guide](data-model/permissions-guide.md)** - Implement custom security
- **[Default Permissions Migration](migration-guides/default-permissions.md)** - Enable new security model
- **[AAD Integration](enterprise/aad.md)** - Enterprise authentication

## 🛠️ Development Tools

### Testing Your Changes

**TCQL Console**: Test queries interactively in the web client
**Script Debugger**: Available in full client for script development
**API Testing**: Use Postman or similar tools with Bearer authentication

### Best Practices

1. **Always test permissions** - Verify users can't access unauthorized data
2. **Use transactions** - Wrap multi-step operations in `BeginTransaction()/CommitTransaction()`
3. **Handle errors gracefully** - Use try/catch blocks in scripts
4. **Document custom code** - Add comments explaining business logic
5. **Version control** - Export data model changes regularly

## 📞 Getting Help

### Resources
- **[Developer FAQ](developer-faq.md)** - Quick answers to common questions
- **Release Notes** - Stay updated on API changes
- **Support** - Contact time cockpit support for technical assistance

### Community
- Share custom scripts and solutions
- Learn from others' implementations
- Contribute use cases and examples

---

## Looking for User Documentation?

If you're looking for information on how to use time cockpit as an end user:
→ **[For Users](for-users.md)**
