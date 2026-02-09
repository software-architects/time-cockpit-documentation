---
title: Data Model - Entity Relationships
description: Entity relationship diagrams showing the structure of time cockpit's standard data model across billing, time tracking, and security domains.
---

# Entity Relationship Diagrams

This page visualizes the relationships between time cockpit's standard entities (APP_ prefix). The data model is organized into logical domains for clarity.

## Domain 1: Project & Billing

This domain handles customer relationships, project management, time tracking, and invoicing.

```mermaid
erDiagram
    APP_Customer ||--o{ APP_Project : "has projects"
    APP_Project ||--o{ APP_Task : "contains tasks"
    APP_Project ||--o{ APP_Timesheet : "time tracked on"
    APP_Task ||--o{ APP_Timesheet : "time tracked on"
    APP_Project ||--o{ APP_Invoice : "billed via"
    APP_Invoice ||--o{ APP_InvoiceDetail : "contains lines"
    APP_InvoiceDetail }o--|| APP_Article : "references"
    APP_InvoiceDetail }o--|| APP_Unit : "measured in"
    APP_InvoiceDetail }o--o| APP_Task : "optionally for task"
    APP_Timesheet }o--o| APP_Invoice : "billed in"
    APP_Timesheet }o--|| APP_UserDetail : "logged by"
    APP_Timesheet }o--o| APP_WorkingTimeWeight : "weighted by"
    APP_Project }o--o| APP_UserDetail : "Manager1"
    APP_Project }o--o| APP_UserDetail : "Manager2"
    APP_Project }o--|| APP_Customer : "belongs to"
    APP_Task }o--|| APP_Project : "belongs to"
    
    APP_Customer {
        guid CustomerUuid PK
        string CompanyName
        string Code
        boolean Billable
        string BillingAddress
        string Email
    }
    
    APP_Project {
        guid ProjectUuid PK
        string ProjectName
        string Code
        decimal Budget
        decimal BudgetInHours
        decimal HourlyRate
        boolean Billable
        boolean FixedPrice
        boolean Closed
        guid CustomerUuid FK
        guid Manager1Uuid FK
        guid Manager2Uuid FK
    }
    
    APP_Task {
        guid TaskUuid PK
        string TaskName
        string Code
        decimal BudgetInHours
        boolean Closed
        guid ProjectUuid FK
    }
    
    APP_Timesheet {
        guid TimesheetUuid PK
        datetime BeginTime
        datetime EndTime
        decimal DurationInHours "Calculated"
        string Description
        boolean Billable
        boolean Billed
        decimal HourlyRateActual
        decimal Revenue "Calculated"
        guid ProjectUuid FK
        guid TaskUuid FK
        guid UserDetailUuid FK
        guid InvoiceUuid FK
    }
    
    APP_Invoice {
        guid InvoiceUuid PK
        string InvoiceNumber
        date InvoiceDate
        decimal ReadOnlyRevenue "Calculated"
        guid ProjectUuid FK
    }
    
    APP_InvoiceDetail {
        guid InvoiceDetailUuid PK
        decimal Quantity
        decimal Price
        decimal Amount "Calculated"
        guid InvoiceUuid FK
        guid ArticleUuid FK
        guid UnitUuid FK
        guid TaskUuid FK
    }
```

### Key Relationships Explained

**Project Assignment**:
- Timesheets can be assigned to a **Project directly** OR to a **Task** (which belongs to a Project)
- When assigned to a task, project context is derived: `Task.Project`

**Billing Flow**:
1. Log timesheets on projects/tasks
2. Mark timesheets as billable
3. Create invoice for project
4. Assign timesheets to invoice (sets `APP_Billed = True`)
5. Invoice details can reference articles or tasks

**Customer Hierarchy**:
```
Customer → Project → Task → Timesheet
                  ↓
              Invoice → InvoiceDetail
```

## Domain 2: Time & Attendance

This domain manages employee work schedules, absences, approvals, and working time compliance.

```mermaid
erDiagram
    APP_UserDetail ||--o{ APP_WeeklyHoursOfWork : "has schedules"
    APP_UserDetail ||--o{ APP_VacationEntitlement : "entitled to days"
    APP_UserDetail ||--o{ APP_Vacation : "takes vacation"
    APP_UserDetail ||--o{ APP_SickLeave : "has sick leave"
    APP_UserDetail ||--o{ APP_CompensatoryTime : "earns comp time"
    APP_UserDetail ||--o{ APP_OvertimeCorrection : "overtime adjusted"
    APP_UserDetail }o--o| APP_Department : "belongs to"
    APP_Department ||--o{ APP_DepartmentLead : "led by"
    APP_DepartmentLead }o--|| APP_UserDetail : "lead is user"
    APP_UserDetail }o--o| APP_LegalHolidayCalendar : "follows calendar"
    APP_LegalHolidayCalendar ||--o{ APP_LegalHoliday : "contains holidays"
    APP_UserDetail ||--o{ APP_WorkingTimeLimit : "has regulations"
    APP_Vacation }o--o| APP_UserDetail : "approved by"
    APP_SickLeave }o--o| APP_UserDetail : "approved by"
    APP_CompensatoryTime }o--o| APP_UserDetail : "approved by"
    APP_UserDetail ||--o{ APP_Timesheet : "logs time"
    
    APP_UserDetail {
        guid UserDetailUuid PK
        string Username
        string Firstname
        string Lastname
        string Email
        decimal HourlyRate "Internal cost rate"
        boolean IsAbsenceApprovalRequired
        date DeviatingBookingCompletionDate
        guid DepartmentUuid FK
        guid LegalHolidayCalendarUuid FK
    }
    
    APP_Department {
        guid DepartmentUuid PK
        string DepartmentName
        string Code
    }
    
    APP_DepartmentLead {
        guid DepartmentLeadUuid PK
        boolean ReceiveNotificationsForAbsenceApproval
        guid DepartmentUuid FK
        guid UserDetailUuid FK
    }
    
    APP_WeeklyHoursOfWork {
        guid WeeklyHoursOfWorkUuid PK
        date EffectiveDate
        decimal MondayHours
        decimal TuesdayHours
        decimal WednesdayHours
        decimal ThursdayHours
        decimal FridayHours
        decimal SaturdayHours
        decimal SundayHours
        guid UserDetailUuid FK
    }
    
    APP_Vacation {
        guid VacationUuid PK
        datetime BeginTime
        datetime EndTime
        string Description
        boolean IsWholeDay
        datetime ApprovedTimestampUtc
        boolean IsApproved "Calculated"
        guid UserDetailUuid FK
        guid ApproverUuid FK
    }
    
    APP_SickLeave {
        guid SickLeaveUuid PK
        datetime BeginTime
        datetime EndTime
        string Description
        boolean IsWholeDay
        datetime ApprovedTimestampUtc
        boolean IsApproved "Calculated"
        string RejectionReason
        guid UserDetailUuid FK
        guid ApproverUuid FK
    }
    
    APP_VacationEntitlement {
        guid VacationEntitlementUuid PK
        int Year
        decimal Days
        guid UserDetailUuid FK
    }
    
    APP_WorkingTimeLimit {
        guid WorkingTimeLimitUuid PK
        date EffectiveDate
        decimal MaxDailyWorkingTime
        decimal MinDailyBreakTime
        decimal MaxWeeklyWorkingTime
        guid UserDetailUuid FK
    }
```

### Key Relationships Explained

**Approval Chain**:
```
Employee → Creates Vacation/SickLeave
            ↓
Department Lead → Receives Notification
            ↓
Review & Approve → Sets ApprovedTimestampUtc + Approver
            ↓
Employee → Gets Notification of Approval
```

**Working Time Calculation**:
- `APP_WeeklyHoursOfWork`: Defines expected hours per day
- `APP_WorkingTimeLimit`: Defines legal/policy limits
- `APP_Timesheet`: Actual worked hours
- Functions: `:GetWorkTime()`, `:GetWeeklyHoursOfWork()` calculate compliance

**Absence Types** (all follow same pattern):
- `APP_Vacation`: Planned time off
- `APP_SickLeave`: Illness
- `APP_CompensatoryTime`: Time off in lieu of overtime

**Effective Date Pattern**:
Many entities use `EffectiveDate` to support multiple configurations over time:
- Change work schedule from 40h to 32h starting next month
- Add new working time limits when law changes
- Track vacation entitlement per year

## Domain 3: Security & User Management

This domain handles authentication, authorization, roles, and permissions.

```mermaid
erDiagram
    SYS_UserAccount ||--o| APP_UserDetail : "has profile"
    APP_UserDetail ||--o{ APP_UserDetailRole : "assigned roles"
    APP_UserDetailRole }o--|| APP_UserRole : "of type"
    APP_UserRole }o--o| SYS_Permission : "grants permissions"
    APP_UserDetail }o--|| APP_CultureInfo : "UI language"
    APP_Company ||--o{ APP_UserDetail : "employs"
    
    SYS_UserAccount {
        guid UserAccountUuid PK
        string Username
        string Email
        boolean IsDisabled
    }
    
    APP_UserDetail {
        guid UserDetailUuid PK
        string Username
        string Firstname
        string Lastname
        string Email
        boolean IsHidden
        guid UserAccountUuid FK
        guid CultureInfoUuid FK
        guid CompanyUuid FK
    }
    
    APP_UserDetailRole {
        guid UserDetailRoleUuid PK
        date ValidFrom
        date ValidTo
        guid UserDetailUuid FK
        guid UserRoleUuid FK
    }
    
    APP_UserRole {
        guid UserRoleUuid PK
        string Code "e.g., BillingAdmin"
        string RoleName
        string Description
    }
    
    APP_CultureInfo {
        guid CultureInfoUuid PK
        string CultureInfoName "e.g., en-US"
        string DisplayName
    }
```

### Key Security Concepts

**Role-Based Access Control (RBAC)**:
- Users have `APP_UserDetail` (profile)
- Roles assigned via `APP_UserDetailRole` (with validity period)
- Standard roles: `BillingAdmin`, `HumanResourcesAdmin`, `ProjectManager`, `DepartmentLead`, `User`

**Permission Evaluation**:
```tcql
-- Check if current user has role
'BillingAdmin' In Set('CurrentUserRoles')

-- Named Set definition (APP_CurrentUserRoles)
From R In APP_UserDetailRole 
Where R.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid
And (R.ValidFrom = Null Or R.ValidFrom <= :Today())
And (R.ValidTo = Null Or R.ValidTo >= :Today())
Select New With { R.UserRole.Code }
```

**Row-Level Security Example**:
```tcql
-- Timesheet read permission allows:
-- 1. Own timesheets
-- 2. Department leads see their department
-- 3. Project managers see their projects  
-- 4. Admins see all

:Iif(
  'BillingAdmin' In Set('CurrentUserRoles') Or
  'HumanResourcesAdmin' In Set('CurrentUserRoles'),
  True,
  :Iif(
    Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid Or
    ('DepartmentLead' In Set('CurrentUserRoles') And 
     Current.UserDetail.Department In Set('APP_MyDepartmentsAsLead')) Or
    ('ProjectManager' In Set('CurrentUserRoles') And 
     (Current.Project.Manager1 = Environment.CurrentUser.UserDetailUuid Or
      Current.Project.Manager2 = Environment.CurrentUser.UserDetailUuid)),
    True,
    False
  )
) = True
```

## Domain 4: Master Data & Configuration

Supporting entities for configuration and reference data.

```mermaid
erDiagram
    APP_Company ||--o{ APP_Invoice : "bills as"
    APP_Article ||--o{ APP_InvoiceDetail : "used in"
    APP_Unit ||--o{ APP_InvoiceDetail : "measures"
    APP_Unit ||--o{ APP_Article : "sold in"
    APP_Country ||--o{ APP_Customer : "located in"
    APP_Country ||--o{ APP_Company : "located in"
    APP_LegalHolidayCalendar ||--o{ APP_LegalHoliday : "contains"
    
    APP_Company {
        guid CompanyUuid PK
        string CompanyName
        string VatID
        string IBAN
        string Street
        string ZipCode
        string Town
        guid CountryUuid FK
    }
    
    APP_Article {
        guid ArticleUuid PK
        string Code
        string ArticleName
        decimal Price
        decimal VatRate
        decimal PriceVat "Calculated"
        boolean IsHidden
        guid UnitUuid FK
    }
    
    APP_Unit {
        guid UnitUuid PK
        string Code "e.g., hour, piece, km"
        string UnitName
    }
    
    APP_Country {
        guid CountryUuid PK
        string CountryName
        string CountryCode "ISO code"
    }
    
    APP_LegalHolidayCalendar {
        guid LegalHolidayCalendarUuid PK
        string CalendarName
        string Description
    }
    
    APP_LegalHoliday {
        guid LegalHolidayUuid PK
        string HolidayName
        date HolidayDate
        guid LegalHolidayCalendarUuid FK
    }
```

## Cross-Domain Relationships

Some key entities span multiple domains:

**APP_UserDetail** is central to:
- Time tracking (logs timesheets)
- Absence management (takes vacation/sick leave)
- Security (has roles)
- Project management (manages projects)
- Approval workflows (approves absences)

**APP_Project** connects:
- Customer management (belongs to customer)
- Time tracking (timesheets reference it)
- Billing (invoices for it)
- Security (project managers have special access)

## Understanding Cardinality

**Symbols**:
- `||` : One (exactly one)
- `o{` : Zero or many
- `}o` : Many to zero or one
- `||--o{` : One to many
- `}o--||` : Many to one
- `}o--o|` : Many to zero-or-one

**Examples**:
```
APP_Customer ||--o{ APP_Project
```
One customer has zero or many projects. Each project belongs to exactly one customer.

```
APP_Timesheet }o--o| APP_Invoice
```
A timesheet can belong to zero or one invoice (optional). An invoice can have many timesheets.

## Complete Entity List by Domain

### Billing & Projects
- APP_Customer
- APP_Project
- APP_Task
- APP_Timesheet
- APP_Invoice
- APP_InvoiceDetail
- APP_Article
- APP_Unit

### Time & Attendance
- APP_UserDetail
- APP_Department
- APP_DepartmentLead
- APP_WeeklyHoursOfWork
- APP_Vacation
- APP_SickLeave
- APP_CompensatoryTime
- APP_OvertimeCorrection
- APP_VacationEntitlement
- APP_WorkingTimeLimit
- APP_WorkingTimeWeight
- APP_LegalHolidayCalendar
- APP_LegalHoliday

### Security
- SYS_UserAccount
- APP_UserDetail
- APP_UserDetailRole
- APP_UserRole
- APP_CultureInfo

### Master Data
- APP_Company
- APP_Country
- APP_MeansOfTransport

### Configuration
- APP_GlobalSettings
- APP_FeatureFlag
- APP_FormattingProfile
- APP_EntityViewProfile

## Related Documentation

- [Standard Entities Reference](standard-entities.md) - Detailed documentation for each entity
- [Permissions Guide](../security/permissions-guide.md) - How to work with entity permissions
- [TCQL Overview](../tcql/overview.md) - Query language for time cockpit
- [Web API - OData](../web-api/odata.md) - REST API access to entities

## See Also

- [Data Model Customization](../data-model-customization/overview.md)
- [Creating Custom Entities](../data-model-customization/entity.md)
- [Named Sets for Security](../security/named-sets.md)
