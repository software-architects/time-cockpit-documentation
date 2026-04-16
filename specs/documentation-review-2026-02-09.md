# Documentation Structure Review & Reorganization

**Date**: February 9, 2026  
**Phase**: Phase 2 Implementation  
**Status**: ✅ Complete

## Critical Analysis of Original Structure

### Problems Identified

#### 1. **Mixed Audiences**
- User documentation (Tracking Time, Attendance) interleaved with developer documentation (TCQL, Scripting, Web API)
- No clear entry point for different user types
- Developers had to navigate through user content to find technical docs

#### 2. **Poor Discoverability**
- Data Model documentation existed but wasn't linked in TOC
- Use Cases folder (budgetary-control.md) wasn't referenced
- Developer FAQ was at root level without context
- No overview pages guiding users to relevant sections

#### 3. **Inconsistent Organization**
- Some sections organized by feature (Tracking Time)
- Others organized by tool (TCQL, Scripting)
- No logical flow from beginner to advanced topics
- Reporting appeared twice (in user section and as standalone)

#### 4. **Lack of Context**
- No landing pages explaining what each section contains
- No guidance for "I want to do X, where do I start?"
- Technical documentation lacked practical examples index

### What Worked Well

✅ **Clear release notes organization** - Chronological by year/month  
✅ **Signal tracker grouping** - All related features together  
✅ **Full client separation** - Desktop-specific features clearly grouped  
✅ **Existing how-to guides** - Practical, action-oriented content

## New Structure

### Architecture

```
time-cockpit-documentation/
├── 👤 FOR USERS (functionality-focused)
│   ├── Getting Started
│   ├── Account Management
│   ├── Tracking Time
│   ├── Project-Based Time Tracking
│   ├── Attendance Time Tracking
│   ├── Working with Time Cockpit
│   ├── Data Exchange
│   ├── Reporting (built-in reports)
│   ├── Full Client (Desktop)
│   └── Enterprise (AAD)
│
├── 💻 FOR DEVELOPERS (technical/customization)
│   ├── Developer FAQ ⭐ NEW
│   ├── Data Model ⭐ NEW SECTION
│   │   ├── Entity Relationships ⭐ NEW
│   │   ├── Standard Entities Reference ⭐ NEW
│   │   └── Permissions & Security Guide ⭐ NEW
│   ├── Data Model Customization
│   ├── TCQL (Query Language)
│   ├── Scripting & Automation
│   ├── Web API
│   ├── Reporting (Custom Reports)
│   └── Use Cases & Examples ⭐ NEW SECTION
│       └── Budgetary Control ⭐ NEW
│
└── Release Notes
```

### Landing Pages

Created two audience-specific entry points:

#### [doc/for-users.md](for-users.md)
- **Purpose**: Guide end users to relevant functionality
- **Structure**: Task-oriented ("How do I...")
- **Sections**: 
  - Quick navigation by topic
  - Common tasks with direct links
  - Role-based guidance (Project Manager, Department Lead, Billing Admin, HR Admin)
  - Full client features
  - Link to developer docs

#### [doc/for-developers.md](for-developers.md)
- **Purpose**: Technical documentation hub
- **Structure**: Tool/technology-oriented
- **Sections**:
  - Quick start guide
  - Popular use cases upfront
  - Comprehensive tool documentation (Data Model, TCQL, API, Scripting)
  - Integration patterns
  - Best practices
  - Link to user docs

## New Documentation Created (Phase 1 & 2)

### Data Model Section ⭐ NEW

#### 1. [data-model/entity-relationships.md](data-model/entity-relationships.md) (~25KB)
**Content**:
- 4 comprehensive Mermaid ER diagrams:
  - **Domain 1**: Project & Billing (Customer → Project → Task → Timesheet → Invoice)
  - **Domain 2**: Time & Attendance (Users, vacations, sick leave, working time)
  - **Domain 3**: Security & User Management (Roles, permissions, authentication)
  - **Domain 4**: Master Data & Configuration

**Features**:
- Relationship cardinality explained (||--o{, }o--||, etc.)
- Key relationships broken down with business rules
- Complete entity list by domain
- Cross-domain relationship mapping

**Value**: Visual understanding of data structure, critical for developers building integrations or customizations

#### 2. [data-model/standard-entities.md](data-model/standard-entities.md) (~16KB)
**Content**:
- Deep documentation for core entities:
  - **APP_Timesheet**: 20+ properties with types/constraints, 5 relationships, row-level security example, 4 TCQL queries, 5 Web API examples
  - **APP_Project**: Properties, relationships, budget tracking queries
  - **APP_Task**: Task breakdown analysis

**Structure per entity**:
- Purpose & overview
- Key properties table (name, type, required, description)
- Relationships table (target, cardinality, description)
- Business rules & calculations
- Permissions (with TCQL conditions explained)
- TCQL examples (common queries)
- Web API examples (HTTP requests)

**Value**: Single source of truth for entity documentation, combines conceptual understanding with practical examples

#### 3. [data-model/permissions-guide.md](data-model/permissions-guide.md) (~30KB)
**Content**:
- Security architecture overview with diagrams
- Permission concepts (access types, evaluation flow)
- Standard roles reference (BillingAdmin, HumanResourcesAdmin, ProjectManager, DepartmentLead, User)
- **5 common permission patterns** with real examples:
  1. Own Data + Admins (users see their own, admins see all)
  2. Hierarchical Manager Access (department leads, project managers)
  3. Project-Based Access
  4. Conditional Write Access (state-based restrictions)
  5. Feature Flag Based

**Advanced sections**:
- Named Sets reference (CurrentUserRoles, APP_MyDepartmentsAsLead, etc.)
- Creating custom named sets
- Property-level permissions
- Action permissions
- Security best practices
- Troubleshooting guide
- Custom security scenarios (time-based, customer-specific, multi-tenant)

**Value**: Complete security implementation guide, saves developers hours of trial/error

### Developer Resources

#### 4. [developer-faq.md](developer-faq.md) (~16KB)
**Content**: 15+ Q&A entries covering:
- Project budgeting & tracking
- Working time setup & calculations
- Integration patterns (JIRA, Slack, email, webhooks)
- Workflow automation (approval processes, notifications)
- Custom queries & reports
- Data export patterns
- Security & permissions

**Format**: Question → Answer → Code Example (TCQL/Python/PowerShell/JavaScript)

**Value**: Quick reference for common developer questions

#### 5. [use-cases/budgetary-control.md](use-cases/budgetary-control.md) (~14KB)
**Content**:
- Complete breakdown of APP_BudgetaryControlOfProjectsList
- 10+ calculated metrics explained (hours, revenue, costs, margins, rates)
- TCQL query analysis (line-by-line breakdown)
- Python list implementation patterns
- Mermaid data flow diagram
- Performance optimization tips

**Value**: Real-world example showing how complex calculations work, pattern for custom implementations

## Navigation Structure Changes

### Before:
```
- Getting Started
- Account Management  
- Tracking Time
- Project-Based Time Tracking
- Attendance Time Tracking
- Data Model Customization ❌ (User + Dev mixed)
- Working with Time Cockpit
- Data Exchange
- Reporting
- TCQL ❌ (Dev content in main flow)
- Scripting ❌ (Dev content in main flow)
- Web API ❌ (Dev content in main flow)
- Enterprise
- Release Notes
- Full Client
```

### After:
```
👤 FOR USERS
  ├── for-users.md (landing page)
  ├── Getting Started
  ├── Account Management
  ├── Tracking Time
  ├── Project-Based Time Tracking
  ├── Attendance Time Tracking
  ├── Working with Time Cockpit
  ├── Data Exchange
  ├── Reporting (built-in)
  ├── Full Client (Desktop)
  └── Enterprise

💻 FOR DEVELOPERS
  ├── for-developers.md (landing page) ⭐
  ├── Developer FAQ ⭐
  ├── Data Model ⭐ (NEW section)
  │   ├── Entity Relationships ⭐
  │   ├── Standard Entities ⭐
  │   └── Permissions Guide ⭐
  ├── Data Model Customization
  ├── TCQL
  ├── Scripting & Automation
  ├── Web API
  ├── Reporting (custom)
  └── Use Cases & Examples ⭐
      └── Budgetary Control ⭐

RELEASE NOTES (unchanged)
```

## Benefits of New Structure

### For End Users
✅ Clear entry point: "For Users" section  
✅ Task-oriented organization  
✅ No technical jargon in navigation  
✅ Faster discovery of features  
✅ Role-based guidance (shows what's relevant for your job)

### For Developers
✅ Separate "For Developers" section  
✅ All technical docs in one place  
✅ Progressive disclosure (FAQ → Data Model → Deep Dive)  
✅ Example-driven learning  
✅ Integration patterns catalog  
✅ Security implementation guide

### For Documentation Maintainers
✅ Logical structure makes adding content easier  
✅ Clear audience targeting  
✅ Reduced duplication  
✅ Template-based entity documentation  
✅ Use cases folder for real-world examples

## Metrics

### Documentation Added
- **7 new files** created
- **~116KB** of new content
- **4 Mermaid diagrams** (ER diagrams)
- **2 Mermaid flowcharts** (security architecture, data flow)
- **50+ code examples** (TCQL, Python, HTTP, JavaScript, PowerShell)
- **2 landing pages** with navigation guidance

### Coverage
- **3 core entities** fully documented (Timesheet, Project, Task)
- **5 permission patterns** documented with examples
- **15+ FAQ entries** answering common questions
- **1 complete use case** (budgetary control implementation)
- **20+ entities** referenced in ER diagrams
- **Standard roles** documented with permissions

## Next Steps (Phase 3)

### Expand Entity Documentation
- Document 15+ more entities (Customer, Invoice, UserDetail, Vacation, SickLeave, etc.)
- Apply standard entity template to each
- Add more Web API examples per entity

### Advanced Topics
- Triggers deep dive (with notification examples)
- Actions guide (custom business logic)
- Named Sets implementation guide
- Calculated properties patterns
- Validation rules cookbook

### More Use Cases
- Invoice automation workflow
- JIRA integration (complete example)
- Custom approval process
- Department-based security setup
- Multi-company setup guide

### Integration Guides
- Accounting system integration (DATEV, SAP)
- HR system sync patterns
- Power BI / Tableau dashboards
- Zapier / Make.com automation

## Conclusion

The documentation is now **audience-focused** with clear separation between:
- **Functional documentation** (how to use time cockpit)
- **Technical documentation** (how to customize/integrate/automate)

Key improvements:
1. ✅ **Discoverability**: Landing pages guide users to relevant content
2. ✅ **Structure**: Logical flow from beginner to advanced
3. ✅ **Practicality**: Every technical topic has code examples
4. ✅ **Completeness**: Data model, security, and core entities documented
5. ✅ **Maintainability**: Clear structure for adding future content

The foundation is now in place for Phase 3 (expanding entity coverage and advanced topics).
