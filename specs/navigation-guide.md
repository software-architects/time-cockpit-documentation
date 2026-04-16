# Documentation Navigation Guide

This guide shows how different user types can efficiently navigate the reorganized time cockpit documentation.

## 🎯 For Different User Types

### Scenario 1: "I'm a new user, just want to track my time"

**Start here**: [For Users](for-users.md) → [Getting Started](getting-started/overview.md)

**Path**:
1. [Getting Started - Overview](getting-started/overview.md)
2. [Time Sheet Calendar](timesheet-calendar/calendar.md)
3. [Working With Time Sheet Entries](timesheet-calendar/working-with-timesheet-entries.md)

**Result**: Can create timesheets within 10 minutes

---

### Scenario 2: "I'm a project manager, need to track project budgets"

**Start here**: [For Users](for-users.md) → Project-Based Time Tracking

**Path**:
1. [Customer / Project / Task](project-time-tracking/customer-project-task.md)
2. [For Users - Project Managers section](for-users.md#project-managers)
3. Optional: [Developer FAQ - Project Budgeting](developer-faq.md#how-do-i-track-project-budgets-in-time-cockpit)

**Result**: Understand project setup, can view budget reports

---

### Scenario 3: "I'm a developer, need to integrate time cockpit with our system"

**Start here**: [For Developers](for-developers.md) → Web API

**Path**:
1. [For Developers](for-developers.md) - Read Quick Start
2. [Web API Overview](web-api/overview.md)
3. [Web API Authentication](web-api/authentication.md)
4. [OData Endpoint](web-api/odata.md)
5. [Developer FAQ](developer-faq.md) - Check integration examples

**Result**: Can make authenticated API calls, understand OData patterns

---

### Scenario 4: "I need to understand the data model before customizing"

**Start here**: [For Developers](for-developers.md) → Data Model

**Path**:
1. [Entity Relationships](data-model/entity-relationships.md) - Visual overview
2. [Standard Entities Reference](data-model/standard-entities.md) - Deep dive on APP_Timesheet, APP_Project, APP_Task
3. [Permissions & Security Guide](data-model/permissions-guide.md) - Understand who can access what
4. [Data Model Customization Overview](data-model-customization/overview.md) - How to extend

**Result**: Complete understanding of entities, relationships, and security model

---

### Scenario 5: "I want to automate approval workflows"

**Start here**: [For Developers](for-developers.md) → Scripting & Automation

**Path**:
1. [Developer FAQ - Approval Workflows](developer-faq.md#how-do-i-create-an-approval-workflow-for-vacation-or-sick-leave)
2. [Scripting Overview](scripting/overview.md)
3. [Triggers](scripting/triggers.md) - Event-driven automation
4. [Actions](scripting/actions.md) - User-triggered operations

**Result**: Can write triggers for automatic approvals, send notifications

---

### Scenario 6: "I need to build custom reports with budget calculations"

**Start here**: [For Developers](for-developers.md) → Use Cases & Examples

**Path**:
1. [Budgetary Control Use Case](use-cases/budgetary-control.md) - See real implementation
2. [TCQL Overview](tcql/overview.md) - Learn query language
3. [Standard Entities - APP_Timesheet](data-model/standard-entities.md#app_timesheet) - Understand timesheet properties
4. [Developer FAQ - Custom Reports](developer-faq.md#how-can-i-create-a-custom-report-with-tcql)

**Result**: Can write TCQL queries, calculate budgets, create custom lists

---

### Scenario 7: "I need to set up department-based security"

**Start here**: [For Developers](for-developers.md) → Data Model → Permissions

**Path**:
1. [Permissions & Security Guide](data-model/permissions-guide.md) - Read overview
2. [Permissions Guide - Hierarchical Manager Access](data-model/permissions-guide.md#pattern-2-hierarchical-manager-access) - See department lead pattern
3. [Developer FAQ - Department-Based Security](developer-faq.md#how-can-i-restrict-timesheet-visibility-based-on-departments)
4. [Data Model Customization - Permissions](data-model-customization/permission.md) - Implement

**Result**: Can configure row-level security for department leads

---

### Scenario 8: "I'm a billing admin, need to invoice projects"

**Start here**: [For Users](for-users.md) → Project-Based Time Tracking → Invoicing

**Path**:
1. [For Users - Billing Administrators section](for-users.md#billing-administrators)
2. [Invoicing Guide](project-time-tracking/billing.md)
3. [Invoice Data Fields](project-time-tracking/invoice-data-fields.md)

**Result**: Can create invoices, understand invoice fields

---

### Scenario 9: "I need to understand working time calculations"

**Start here**: [For Users](for-users.md) → Attendance Time Tracking

**Path**:
1. [Working Time / Leave Management](employee-time-tracking/working-time.md)
2. [Working Time Regulations](employee-time-tracking/working-time-regulations.md)
3. [Developer FAQ - Working Time Setup](developer-faq.md#how-do-i-set-up-working-time-and-calculate-overtime)
4. [TCQL - Working Time Functions](tcql/functions-for-working-time-and-holidays.md)

**Result**: Understand working time setup, can query calculations via TCQL

---

### Scenario 10: "I want to export timesheet data to Excel"

**Combination path** (User + Developer):

**Option A - UI Export** (For Users):
1. [Data Exchange - Data Export](data-exchange/export.md)

**Option B - Scripted Export** (For Developers):
1. [Developer FAQ - Data Export](developer-faq.md#how-do-i-export-timesheet-data-to-external-systems)
2. [Scripting - Export to Excel](scripting/export-data-to-excel.md)

**Result**: Can export data via UI or automated script

---

## 📚 Quick Reference by Topic

### Time Tracking
- **Users**: [Tracking Time section](for-users.md#daily-time-tracking)
- **Developers**: [APP_Timesheet entity](data-model/standard-entities.md#app_timesheet)

### Projects & Billing
- **Users**: [Project-Based Time Tracking](for-users.md#project-based-work)
- **Developers**: [APP_Project & APP_Invoice entities](data-model/standard-entities.md)

### Security & Permissions
- **Users**: [Default Permissions](employee-time-tracking/default-permissions.md)
- **Developers**: [Permissions & Security Guide](data-model/permissions-guide.md)

### Data Model
- **Developers only**: [Data Model section](for-developers.md#-data-model)

### Automation
- **Developers only**: [Scripting & Automation](for-developers.md#%EF%B8%8F-scripting--automation)

### Integration
- **Developers only**: [Web API section](for-developers.md#-web-api)

---

## 🔍 Search Tips

### Looking for specific entities?
→ Start at [Entity Relationships](data-model/entity-relationships.md) for visual map  
→ Then go to [Standard Entities Reference](data-model/standard-entities.md) for details

### Looking for code examples?
→ Start at [Developer FAQ](developer-faq.md) for common scenarios  
→ Then check [Use Cases](for-developers.md#-use-cases--examples) for complete implementations

### Looking for how-to guides?
→ **Users**: [For Users](for-users.md) - Common Tasks section  
→ **Developers**: [Scripting How-To](scripting/overview.md) or [Developer FAQ](developer-faq.md)

### Looking for API documentation?
→ [Web API Overview](web-api/overview.md) then specific endpoints (OData, Query, etc.)

### Looking for query syntax?
→ [TCQL Overview](tcql/overview.md) then specific clauses (Where, Select, From, etc.)

---

## 🎓 Learning Paths

### Beginner User Path
1. [For Users landing page](for-users.md)
2. [Getting Started - Overview](getting-started/overview.md)
3. [Time Sheet Calendar](timesheet-calendar/calendar.md)
4. [Project-Based Time Tracking](project-time-tracking/customer-project-task.md)

**Time**: 1-2 hours to basic competency

---

### Beginner Developer Path
1. [For Developers landing page](for-developers.md)
2. [Developer FAQ](developer-faq.md) - Scan common questions
3. [Entity Relationships](data-model/entity-relationships.md) - Understand data model
4. [Standard Entities - APP_Timesheet](data-model/standard-entities.md#app_timesheet) - Deep dive on core entity
5. [TCQL Overview](tcql/overview.md) - Learn query language basics

**Time**: 3-4 hours to basic understanding

---

### Advanced Developer Path
1. Complete Beginner Developer Path
2. [Permissions & Security Guide](data-model/permissions-guide.md) - Master security
3. [Budgetary Control Use Case](use-cases/budgetary-control.md) - Complex calculation example
4. [Web API](web-api/overview.md) - Integration patterns
5. [Scripting & Automation](scripting/overview.md) - Workflow automation

**Time**: 8-10 hours to advanced proficiency

---

## ✅ Documentation Quality Checklist

When adding new documentation, ensure:

- [ ] **Audience clarity**: Is it for users or developers?
- [ ] **Proper section**: Placed in correct "For Users" or "For Developers" category?
- [ ] **Linked in TOC**: Added to doc/toc.yml?
- [ ] **Code examples**: Technical docs have working code samples?
- [ ] **Cross-references**: Links to related documentation?
- [ ] **Search keywords**: Title and description contain relevant terms?

---

## Need Help?

- **Users**: Start at [For Users](for-users.md)
- **Developers**: Start at [For Developers](for-developers.md)
- **Not sure?**: Check [Documentation Review](documentation-review-2026-02-09.md) for structure overview
