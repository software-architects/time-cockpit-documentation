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
    APP_Customer ||--o{ APP_Project : "APP_Customer"
    APP_Project ||--o{ APP_Task : "APP_Project"
    APP_Project ||--o{ APP_Timesheet : "APP_Project"
    APP_Task ||--o{ APP_Timesheet : "APP_Task"
    APP_Project ||--o{ APP_Invoice : "APP_Project"
    APP_Invoice ||--o{ APP_InvoiceDetail : "APP_Invoice"
    APP_InvoiceDetail }o--|| APP_Article : "APP_Article"
    APP_InvoiceDetail }o--|| APP_Unit : "APP_Unit"
    APP_InvoiceDetail }o--o| APP_Task : "APP_Task"
    APP_Timesheet }o--o| APP_Invoice : "APP_Invoice"
    APP_Timesheet }o--|| APP_UserDetail : "APP_UserDetail"
    APP_Timesheet }o--o| APP_WorkingTimeWeight : "APP_WorkingTimeWeight"
    APP_Project }o--o| APP_UserDetail : "APP_Manager1"
    APP_Project }o--o| APP_UserDetail : "APP_Manager2"
    
    APP_Customer {
        guid APP_CustomerUuid PK
        string APP_CompanyName
        string APP_Code
        boolean APP_Billable
        string APP_BillingAddress
        string APP_Email
    }
    
    APP_Project {
        guid APP_ProjectUuid PK
        string APP_ProjectName
        string APP_Code
        decimal APP_Budget
        decimal APP_BudgetInHours
        decimal APP_HourlyRate
        boolean APP_Billable
        boolean APP_FixedPrice
        boolean APP_Closed
        guid APP_Customer FK
        guid APP_Manager1 FK
        guid APP_Manager2 FK
    }
    
    APP_Task {
        guid APP_TaskUuid PK
        string APP_TaskName
        string APP_Code
        decimal APP_BudgetInHours
        boolean APP_Closed
        guid APP_Project FK
    }
    
    APP_Timesheet {
        guid APP_TimesheetUuid PK
        datetime APP_BeginTime
        datetime APP_EndTime
        decimal APP_DurationInHours "Calculated"
        string APP_Description
        boolean APP_Billable
        boolean APP_Billed
        decimal APP_HourlyRateActual
        decimal APP_Revenue "Calculated"
        guid APP_Project FK
        guid APP_Task FK
        guid APP_UserDetail FK
        guid APP_Invoice FK
        guid APP_WorkingTimeWeight FK
    }
    
    APP_Invoice {
        guid APP_InvoiceUuid PK
        string APP_InvoiceNumber
        date APP_InvoiceDate
        decimal APP_ReadOnlyRevenue "Calculated"
        guid APP_Project FK
    }
    
    APP_InvoiceDetail {
        guid APP_InvoiceDetailUuid PK
        decimal APP_Quantity
        decimal APP_Price
        decimal APP_Amount "Calculated"
        guid APP_Invoice FK
        guid APP_Article FK
        guid APP_Unit FK
        guid APP_Task FK
    }

    APP_Article {
        guid APP_ArticleUuid PK
        string APP_Code
        string APP_ArticleName
        guid APP_Unit FK
    }

    APP_Unit {
        guid APP_UnitUuid PK
        string APP_Code
        string APP_UnitName
    }

    APP_UserDetail {
        guid APP_UserDetailUuid PK
        string APP_Username
        string APP_Fullname
    }

    APP_WorkingTimeWeight {
        guid APP_WorkingTimeWeightUuid PK
        string APP_Code
        decimal APP_Multiplier
    }
```

### Key Relationships

- `APP_Customer` is the root; each `APP_Project` belongs to exactly one customer.
- `APP_Task` belongs to exactly one `APP_Project`; a project can have many tasks.
- `APP_Timesheet` has a mandatory FK to `APP_UserDetail`, a mandatory FK to `APP_Project`, and an optional FK to `APP_Task`.
- `APP_Timesheet` has an optional FK to `APP_Invoice`, linking it to at most one invoice.
- `APP_Invoice` belongs to exactly one `APP_Project`; a project can have many invoices.
- `APP_InvoiceDetail` belongs to exactly one `APP_Invoice` and has mandatory FKs to `APP_Article` and `APP_Unit`, plus an optional FK to `APP_Task`.
- `APP_Project` holds two optional FKs to `APP_UserDetail` (Manager1, Manager2).

## Domain 2: Time & Attendance

This domain manages employee work schedules, absences, approvals, and working time compliance.

```mermaid
erDiagram
    APP_UserDetail ||--o{ APP_WeeklyHoursOfWork : "APP_UserDetail"
    APP_UserDetail ||--o{ APP_VacationEntitlement : "APP_UserDetail"
    APP_UserDetail ||--o{ APP_Vacation : "APP_UserDetail"
    APP_UserDetail ||--o{ APP_SickLeave : "APP_UserDetail"
    APP_UserDetail ||--o{ APP_CompensatoryTime : "APP_UserDetail"
    APP_UserDetail ||--o{ APP_OvertimeCorrection : "APP_UserDetail"
    APP_UserDetail }o--o| APP_Department : "APP_Department"
    APP_Department ||--o{ APP_DepartmentLead : "APP_Department"
    APP_DepartmentLead }o--|| APP_UserDetail : "APP_UserDetail"
    APP_UserDetail }o--o| APP_LegalHolidayCalendar : "APP_LegalHolidayCalendar"
    APP_LegalHolidayCalendar ||--o{ APP_LegalHoliday : "APP_LegalHolidayCalendar"
    APP_UserDetail ||--o{ APP_WorkingTimeLimit : "APP_UserDetail"
    APP_Vacation }o--o| APP_UserDetail : "APP_Approver"
    APP_SickLeave }o--o| APP_UserDetail : "APP_Approver"
    APP_CompensatoryTime }o--o| APP_UserDetail : "APP_Approver"
    APP_UserDetail ||--o{ APP_Timesheet : "APP_UserDetail"
    
    APP_UserDetail {
        guid APP_UserDetailUuid PK
        string APP_Username
        string APP_Firstname
        string APP_Lastname
        string APP_Email
        decimal APP_HourlyRate "Internal cost rate"
        boolean APP_IsAbsenceApprovalRequired
        date APP_DeviatingBookingCompletionDate
        guid APP_Department FK
        guid APP_LegalHolidayCalendar FK
    }
    
    APP_Department {
        guid APP_DepartmentUuid PK
        string APP_DepartmentName
        string APP_Code
    }
    
    APP_DepartmentLead {
        guid APP_DepartmentLeadUuid PK
        boolean APP_ReceiveNotificationsForAbsenceApproval
        guid APP_Department FK
        guid APP_UserDetail FK
    }
    
    APP_WeeklyHoursOfWork {
        guid APP_WeeklyHoursOfWorkUuid PK
        date APP_EffectiveDate
        decimal APP_MondayHours
        decimal APP_TuesdayHours
        decimal APP_WednesdayHours
        decimal APP_ThursdayHours
        decimal APP_FridayHours
        decimal APP_SaturdayHours
        decimal APP_SundayHours
        guid APP_UserDetail FK
    }
    
    APP_Vacation {
        guid APP_VacationUuid PK
        datetime APP_BeginTime
        datetime APP_EndTime
        string APP_Description
        boolean APP_IsWholeDay
        datetime APP_ApprovedTimestampUtc
        boolean APP_IsApproved "Calculated"
        guid APP_UserDetail FK
        guid APP_Approver FK
    }
    
    APP_SickLeave {
        guid APP_SickLeaveUuid PK
        datetime APP_BeginTime
        datetime APP_EndTime
        string APP_Description
        boolean APP_IsWholeDay
        datetime APP_ApprovedTimestampUtc
        boolean APP_IsApproved "Calculated"
        string APP_RejectionReason
        guid APP_UserDetail FK
        guid APP_Approver FK
    }

    APP_CompensatoryTime {
        guid APP_CompensatoryTimeUuid PK
        datetime APP_BeginTime
        datetime APP_EndTime
        boolean APP_IsApproved "Calculated"
        guid APP_UserDetail FK
        guid APP_Approver FK
    }

    APP_OvertimeCorrection {
        guid APP_OvertimeCorrectionUuid PK
        date APP_EffectiveDate
        decimal APP_Hours
        string APP_Reason
        guid APP_UserDetail FK
    }
    
    APP_VacationEntitlement {
        guid APP_VacationEntitlementUuid PK
        int APP_Year
        decimal APP_Days
        guid APP_UserDetail FK
    }
    
    APP_WorkingTimeLimit {
        guid APP_WorkingTimeLimitUuid PK
        date APP_EffectiveDate
        decimal APP_MaxDailyWorkingTime
        decimal APP_MinDailyBreakTime
        decimal APP_MaxWeeklyWorkingTime
        guid APP_UserDetail FK
    }

    APP_LegalHolidayCalendar {
        guid APP_LegalHolidayCalendarUuid PK
        string APP_CalendarName
        string APP_Description
    }

    APP_LegalHoliday {
        guid APP_LegalHolidayUuid PK
        string APP_HolidayName
        date APP_HolidayDate
        guid APP_LegalHolidayCalendar FK
    }

    APP_Timesheet {
        guid APP_TimesheetUuid PK
        date APP_DateActual
        datetime APP_BeginTime
        datetime APP_EndTime
        guid APP_UserDetail FK
    }
```

### Key Relationships

- `APP_UserDetail` is the central entity in this domain; all absence, schedule, and limit records hold a mandatory FK to it.
- `APP_Vacation`, `APP_SickLeave`, and `APP_CompensatoryTime` each have a mandatory FK to `APP_UserDetail` (the employee) and an optional FK back to `APP_UserDetail` (the approver).
- `APP_WeeklyHoursOfWork`, `APP_VacationEntitlement`, `APP_WorkingTimeLimit`, and `APP_OvertimeCorrection` each have a mandatory FK to `APP_UserDetail`; one user can have many records of each type.
- `APP_UserDetail` has an optional FK to `APP_Department`; a department can have many users.
- `APP_DepartmentLead` is a join entity between `APP_Department` and `APP_UserDetail`; a department can have many leads, and a user can lead many departments.
- `APP_UserDetail` has an optional FK to `APP_LegalHolidayCalendar`; a calendar can be shared across many users.
- `APP_LegalHoliday` has a mandatory FK to `APP_LegalHolidayCalendar`; a calendar contains many holidays.

## Domain 3: Security & User Management

This domain handles authentication, authorization, roles, and permissions.

```mermaid
erDiagram
    SYS_UserAccount ||--o| APP_UserDetail : "SYS_UserAccount"
    APP_UserDetail ||--o{ APP_UserDetailRole : "APP_UserDetail"
    APP_UserDetailRole }o--|| APP_UserRole : "APP_UserRole"
    APP_UserRole }o--o| SYS_Permission : "SYS_Permission"
    APP_UserDetail }o--|| APP_CultureInfo : "APP_CultureInfo"
    
    SYS_UserAccount {
        guid SYS_UserAccountUuid PK
        string SYS_Username
        string SYS_Email
        boolean SYS_IsDisabled
    }
    
    APP_UserDetail {
        guid APP_UserDetailUuid PK
        string APP_Username
        string APP_Firstname
        string APP_Lastname
        string APP_Email
        boolean APP_IsHidden
        guid SYS_UserAccount FK
        guid APP_CultureInfo FK
    }
    
    APP_UserDetailRole {
        guid APP_UserDetailRoleUuid PK
        date APP_ValidFrom
        date APP_ValidTo
        guid APP_UserDetail FK
        guid APP_UserRole FK
    }
    
    APP_UserRole {
        guid APP_UserRoleUuid PK
        string APP_Code "e.g., BillingAdmin"
        string APP_RoleName
        string APP_Description
    }
    
    APP_CultureInfo {
        guid APP_CultureInfoUuid PK
        string APP_CultureInfoName "e.g., en-US"
        string APP_DisplayName
    }
    SYS_Permission {
        guid SYS_PermissionUuid PK
        string SYS_TargetEntity
        string SYS_PermissionType
    }
```

### Key Relationships

- `SYS_UserAccount` has at most one `APP_UserDetail` profile (one-to-zero-or-one).
- `APP_UserDetail` belongs to exactly one `APP_CultureInfo`.
- `APP_UserDetailRole` is a join entity between `APP_UserDetail` and `APP_UserRole`; a user can have many roles, and a role can be assigned to many users.
- `APP_UserRole` has an optional FK to `SYS_Permission`.

## Domain 4: Master Data & Configuration

Supporting entities for configuration and reference data.

```mermaid
erDiagram
    APP_Company ||--o{ APP_Invoice : "APP_Company"
    APP_Article ||--o{ APP_InvoiceDetail : "APP_Article"
    APP_Unit ||--o{ APP_InvoiceDetail : "APP_Unit"
    APP_Unit ||--o{ APP_Article : "APP_Unit"
    APP_Country ||--o{ APP_Customer : "APP_Country"
    APP_Country ||--o{ APP_Company : "APP_Country"
    APP_LegalHolidayCalendar ||--o{ APP_LegalHoliday : "APP_LegalHolidayCalendar"
    
    APP_Company {
        guid APP_CompanyUuid PK
        string APP_CompanyName
        string APP_VatID
        string APP_IBAN
        string APP_Street
        string APP_ZipCode
        string APP_Town
        guid APP_Country FK
    }
    
    APP_Article {
        guid APP_ArticleUuid PK
        string APP_Code
        string APP_ArticleName
        decimal APP_Price
        decimal APP_VatRate
        decimal APP_PriceVat "Calculated"
        boolean APP_IsHidden
        guid APP_Unit FK
    }
    
    APP_Unit {
        guid APP_UnitUuid PK
        string APP_Code "e.g., hour, piece, km"
        string APP_UnitName
    }
    
    APP_Country {
        guid APP_CountryUuid PK
        string APP_CountryName
        string APP_CountryCode "ISO code"
    }
    
    APP_LegalHolidayCalendar {
        guid APP_LegalHolidayCalendarUuid PK
        string APP_CalendarName
        string APP_Description
    }
    
    APP_LegalHoliday {
        guid APP_LegalHolidayUuid PK
        string APP_HolidayName
        date APP_HolidayDate
        guid APP_LegalHolidayCalendar FK
    }

    APP_Customer {
        guid APP_CustomerUuid PK
        string APP_CompanyName
        guid APP_Country FK
    }

    APP_Invoice {
        guid APP_InvoiceUuid PK
        string APP_InvoiceNumber
        guid APP_Company FK
    }

    APP_InvoiceDetail {
        guid APP_InvoiceDetailUuid PK
        guid APP_Invoice FK
        guid APP_Article FK
        guid APP_Unit FK
    }
```

## Cross-Domain Relationships

**APP_UserDetail** holds FKs from or to entities in every domain:
- Referenced by `APP_Timesheet` (Domain 1)
- References `APP_Department` and `APP_LegalHolidayCalendar`, and is referenced by all absence/schedule entities (Domain 2)
- Referenced by `SYS_UserAccount` and `APP_UserDetailRole`, and references `APP_CultureInfo` (Domain 3)

**APP_Project** is referenced across domains:
- References `APP_Customer` (Domain 1)
- Referenced by `APP_Timesheet` and `APP_Invoice` (Domain 1)

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
