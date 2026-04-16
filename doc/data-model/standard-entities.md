---
title: Standard Entities Reference
description: Comprehensive reference documentation for time cockpit's standard data model entities, including properties, relationships, permissions, and usage examples.
---

# Standard Entities Reference

This page provides detailed documentation for the most important entities in time cockpit's standard data model (APP_ prefix). Each entity section includes:

- **Purpose & Overview**: What the entity represents
- **Key Properties**: Important fields with data types and constraints
- **Relationships**: Foreign key relations to other entities
- **Permissions**: Who can read/write data
- **Validation Rules**: Data integrity constraints
- **TCQL Examples**: Common queries

## Core Time Tracking Entities

### APP_Timesheet

The central entity for recording working time. Every time entry in time cockpit is a timesheet record.

**Purpose**: Records individual time entries with begin/end times, project/task assignments, descriptions, and billing information.

#### Key Properties

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `APP_TimesheetUuid` | Guid | PK | Unique identifier |
| `APP_BeginTime` | DateTime | Yes | Start time of work |
| `APP_EndTime` | DateTime | Yes | End time of work |
| `APP_DurationInHours` | Decimal | Calculated | Duration = (EndTime - BeginTime) in hours |
| `APP_Description` | Text(500) | No | Work description/notes |
| `APP_DateActual` | Date | Calculated | Date(BeginTime) - used for grouping |
| `APP_Billable` | Boolean | Yes | Default: true - Is this time billable to customer? |
| `APP_Billed` | Boolean | Calculated | Has this been assigned to an invoice? |
| `APP_HourlyRateActual` | Decimal(18,2) | No | Hourly rate at time of booking (from project or user) |
| `APP_HourlyRateBilled` | Decimal(18,2) | No | Rate actually billed (set when creating invoice) |
| `APP_Revenue` | Decimal(18,2) | Calculated | `DurationInHours * HourlyRateActual` |
| `APP_IsDurationTimesheet` | Boolean | Yes | Default: false - Duration only (no specific times)? |
| `APP_Location` | Text(100) | No | Where the work was performed |
| `APP_JourneyFrom` | Text(100) | No | Travel: starting point |
| `APP_JourneyTo` | Text(100) | No | Travel: destination |
| `APP_JourneyDistance` | Decimal(18,2) | No | Travel distance in km |
| `APP_IsRunning` | Boolean | No | Is timer currently running? |

#### Relationships

| Relation | Target | Cardinality | Required | Description |
|----------|--------|-------------|----------|-------------|
| `APP_UserDetail` | APP_UserDetail | Many-to-One | Yes | Who logged the time |
| `APP_Project` | APP_Project | Many-to-One | No | Project assigned to |
| `APP_Task` | APP_Task | Many-to-One | No | Task assigned to (implies project) |
| `APP_Invoice` | APP_Invoice | Many-to-One | No | Invoice this time was billed on |
| `APP_WorkingTimeWeight` | APP_WorkingTimeWeight | Many-to-One | No | Time weighting (e.g., 1.5x for Saturday) |
| `APP_JourneyMeansOfTransport` | APP_MeansOfTransport | Many-to-One | No | Travel method (car, train, plane) |

#### Business Rules

1. **Project or Task Required**: Either `APP_Project` or `APP_Task` must be set
2. **Task Implies Project**: When `APP_Task` is set, `APP_Project` is derived from `Task.Project`
3. **Hourly Rate Calculation**:
   - If `APP_Task.HourlyRate` is set → use task rate
   - Else if `APP_Project.HourlyRate` is set → use project rate  
   - Else if `APP_Customer.HourlyRate` is set → use customer rate
   - Else → use user's internal `APP_UserDetail.HourlyRate`
4. **Billable Calculation**: `APP_Billable` defaults to project/task billable flag
5. **Revenue Calculation**: Only calculated if `Billable = true` and hourly rate is set

#### Permissions

**Read Permission** (Row-Level Security):
```tcql
-- Users can see:
-- 1. Their own timesheets
-- 2. Department leads see their departments
-- 3. Project managers see their projects
-- 4. Billing/HR admins see all

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

**Write Permission**:
- Users can create/edit/delete their own timesheets
- Admins can modify all timesheets
- Once billed (`APP_Billed = True`), only admins can modify

#### TCQL Examples

**Get all timesheets for current user this month:**
```tcql
From T In APP_Timesheet
Where 
    T.APP_UserDetail = Environment.CurrentUser.UserDetailUuid
    And T.APP_BeginTime >= :FirstOfMonth(:Now())
    And T.APP_BeginTime < :AddMonths(:FirstOfMonth(:Now()), 1)
Order By T.APP_BeginTime Desc
Select T
```

**Get unbilled timesheets for a project:**
```tcql
From T In APP_Timesheet
Where 
    T.APP_Project.APP_ProjectCode = 'AdventureApp'
    And T.APP_Billable = True
    And T.APP_Billed = False
Select New With
{
    T.APP_DateActual,
    .UserName = T.APP_UserDetail.APP_Fullname,
    T.APP_DurationInHours,
    T.APP_HourlyRateActual,
    T.APP_Revenue,
    T.APP_Description
}
```

**Calculate hours per project this month:**
```tcql
From T In APP_Timesheet
Where 
    T.APP_BeginTime >= :FirstOfMonth(:Now())
    And T.APP_BeginTime < :AddMonths(:FirstOfMonth(:Now()), 1)
Select New With
{
    .ProjectCode = T.APP_Project.APP_Code,
    .ProjectName = T.APP_Project.APP_ProjectName,
    .TotalHours = Sum(T.APP_DurationInHours),
    .TotalRevenue = Sum(T.APP_Revenue),
    .EntryCount = Count()
}
```

**Find timesheets with gaps (no overlap, missing time):**
```tcql
From T In APP_Timesheet
Where 
    T.APP_UserDetail = Environment.CurrentUser.UserDetailUuid
    And T.APP_DateActual = :Today()
Order By T.APP_BeginTime
Select T
```

---

### APP_Project

Represents a project for which time can be tracked and which can be billed to customers.

**Purpose**: Organize work into projects with budgets, hourly rates, managers, and billing settings.

#### Key Properties

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `APP_ProjectUuid` | Guid | PK | Unique identifier |
| `APP_ProjectName` | Text(200) | Yes | Display name |
| `APP_Code` | Text(50) | Yes | Short code (e.g., "PROJ-001") |
| `APP_Description` | Text(2000) | No | Detailed description |
| `APP_Budget` | Decimal(18,2) | No | Total project budget (in currency) |
| `APP_BudgetInHours` | Decimal(18,2) | No | Budget in hours |
| `APP_HourlyRate` | Decimal(18,2) | No | Default hourly rate for this project |
| `APP_Billable` | Boolean | Yes | Default: true - Can time on this project be billed? |
| `APP_FixedPrice` | Boolean | Yes | Default: false - Fixed price or time & material? |
| `APP_Closed` | Boolean | Yes | Default: false - Is project completed/closed? |
| `APP_StartDate` | Date | No | Project start date |
| `APP_EndDate` | Date | No | Planned/actual end date |
| `APP_ExternalProjectCode` | Text(50) | No | Reference to external system (e.g., SAP ID) |
| `APP_InvoicingRules` | Text(2000) | No | Special invoicing notes |

#### Relationships

| Relation | Target | Cardinality | Required | Description |
|----------|--------|-------------|----------|-------------|
| `APP_Customer` | APP_Customer | Many-to-One | Yes | Which customer owns this project |
| `APP_Manager1` | APP_UserDetail | Many-to-One | No | Primary project manager |
| `APP_Manager2` | APP_UserDetail | Many-to-One | No | Secondary project manager |

#### TCQL Examples

**Get projects with budget status:**
```tcql
From P In APP_Project
Select New With
{
    P.APP_Code,
    P.APP_ProjectName,
    P.APP_Budget,
    .HoursBooked = (
        From T In APP_Timesheet 
        Where T.APP_Project = P 
        Select Sum(T.APP_DurationInHours)
    ),
    .RevenueGenerated = (
        From T In APP_Timesheet 
        Where T.APP_Project = P And T.APP_Billable = True
        Select Sum(T.APP_Revenue)
    ),
    .CostsIncurred = (
        From T In APP_Timesheet 
        Where T.APP_Project = P
        Select Sum(T.APP_DurationInHours * T.APP_UserDetail.APP_HourlyRate)
    )
}
```

**Find overbudget projects:**
```tcql
From P In APP_Project
Where 
    P.APP_Budget <> Null
    And (
        From T In APP_Timesheet 
        Where T.APP_Project = P
        Select Sum(T.APP_Revenue)
    ) > P.APP_Budget
Select New With
{
    P.APP_Code,
    P.APP_ProjectName,
    P.APP_Budget,
    .ActualRevenue = (From T In APP_Timesheet Where T.APP_Project = P Select Sum(T.APP_Revenue)),
    .Overrun = (From T In APP_Timesheet Where T.APP_Project = P Select Sum(T.APP_Revenue)) - P.APP_Budget
}
```

---

### APP_Task

Sub-units of projects representing specific work packages or phases.

**Purpose**: Break down projects into trackable tasks with individual budgets and hourly rates.

#### Key Properties

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `APP_TaskUuid` | Guid | PK | Unique identifier |
| `APP_TaskName` | Text(200) | Yes | Display name |
| `APP_Code` | Text(50) | Yes | Short code |
| `APP_Description` | Text(2000) | No | Detailed description |
| `APP_BudgetInHours` | Decimal(18,2) | No | Time budget for this task |
| `APP_HourlyRate` | Decimal(18,2) | No | Specific hourly rate (overrides project rate) |
| `APP_Billable` | Boolean | No | Override project billable setting |
| `APP_Closed` | Boolean | Yes | Default: false - Is task completed? |
| `APP_CodeAndDescription` | Text | Calculated | `Code + " - " + TaskName` |

#### Relationships

| Relation | Target | Cardinality | Required | Description |
|----------|--------|-------------|----------|-------------|
| `APP_Project` | APP_Project | Many-to-One | Yes | Parent project |

#### TCQL Examples

**Get task breakdown with hours:**
```tcql
From T In APP_Task
Where T.APP_Project.APP_Code = 'AdventureApp'
Select New With
{
    T.APP_Code,
    T.APP_TaskName,
    T.APP_BudgetInHours,
    .ActualHours = (
        From TS In APP_Timesheet 
        Where TS.APP_Task = T 
        Select Sum(TS.APP_DurationInHours)
    ),
    .RemainingHours = T.APP_BudgetInHours - (
        From TS In APP_Timesheet 
        Where TS.APP_Task = T 
        Select Sum(TS.APP_DurationInHours)
    )
}
```

---

## Additional Entities

The following entities are documented but with less detail. See individual entity pages for complete information:

- [APP_Customer](entities/customer.md) - Customer master data
- [APP_UserDetail](entities/user-detail.md) - User profiles and settings
- [APP_Invoice](entities/invoice.md) - Outgoing invoices
- [APP_InvoiceDetail](entities/invoice-detail.md) - Invoice line items
- [APP_Vacation](entities/vacation.md) - Vacation requests and approvals
- [APP_SickLeave](entities/sick-leave.md) - Sick leave tracking
- [APP_Department](entities/department.md) - Organizational units
- [APP_WorkingTimeLimit](entities/working-time-limit.md) - Legal working time regulations

## See Also

- [Entity Relationship Diagrams](entity-relationships.md)
- [Permissions Guide](../security/permissions-guide.md)
- [TCQL Language Reference](../tcql/overview.md)
- [OData API Documentation](../web-api/odata.md)
- [Calculated Properties](calculated-properties.md)
- [Validation Rules](validation-rules.md)
