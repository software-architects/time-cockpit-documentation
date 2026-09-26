---
title: Datenmodell - Entitätsbeziehungen
description: ER-Diagramme zur Struktur des Standarddatenmodells von time cockpit in den Bereichen Rechnungslegung, Zeiterfassung und Sicherheit.
en_page: doc/data-model/entity-relationships.md
---

# Entity-Relationship-Diagramme

Diese Seite stellt die Beziehungen zwischen den Standardentitäten von time cockpit (Präfix APP_) grafisch dar. Zur besseren Übersicht ist das Datenmodell in logische Bereiche gegliedert.

## Bereich 1: Projekte & Rechnungslegung

Dieser Bereich umfasst Kundenbeziehungen, Projektmanagement, Zeiterfassung und Rechnungslegung.

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
        decimal APP_DurationInHours "Berechnet"
        string APP_Description
        boolean APP_Billable
        boolean APP_Billed
        decimal APP_HourlyRateActual
        decimal APP_Revenue "Berechnet"
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
        decimal APP_ReadOnlyRevenue "Berechnet"
        guid APP_Project FK
    }
    
    APP_InvoiceDetail {
        guid APP_InvoiceDetailUuid PK
        decimal APP_Quantity
        decimal APP_Price
        decimal APP_Amount "Berechnet"
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

### Wichtige Beziehungen

- `APP_Customer` ist die Wurzel; jedes `APP_Project` gehört zu genau einem Kunden.
- `APP_Task` gehört zu genau einem `APP_Project`; ein Projekt kann viele Tätigkeiten haben.
- `APP_Timesheet` hat einen Pflicht-Fremdschlüssel auf `APP_UserDetail`, einen Pflicht-Fremdschlüssel auf `APP_Project` und einen optionalen Fremdschlüssel auf `APP_Task`.
- `APP_Timesheet` hat einen optionalen Fremdschlüssel auf `APP_Invoice` und ist damit höchstens einer Rechnung zugeordnet.
- `APP_Invoice` gehört zu genau einem `APP_Project`; ein Projekt kann viele Rechnungen haben.
- `APP_InvoiceDetail` gehört zu genau einer `APP_Invoice` und hat Pflicht-Fremdschlüssel auf `APP_Article` und `APP_Unit` sowie einen optionalen Fremdschlüssel auf `APP_Task`.
- `APP_Project` enthält zwei optionale Fremdschlüssel auf `APP_UserDetail` (Manager1, Manager2).

## Bereich 2: Zeit & Anwesenheit

Dieser Bereich verwaltet Arbeitszeitpläne der Mitarbeiter, Abwesenheiten, Genehmigungen und die Einhaltung der Arbeitszeitregelungen.

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
        decimal APP_HourlyRate "Interner Kostensatz"
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
        boolean APP_IsApproved "Berechnet"
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
        boolean APP_IsApproved "Berechnet"
        string APP_RejectionReason
        guid APP_UserDetail FK
        guid APP_Approver FK
    }

    APP_CompensatoryTime {
        guid APP_CompensatoryTimeUuid PK
        datetime APP_BeginTime
        datetime APP_EndTime
        boolean APP_IsApproved "Berechnet"
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

### Wichtige Beziehungen

- `APP_UserDetail` ist die zentrale Entität dieses Bereichs; alle Datensätze zu Abwesenheiten, Arbeitszeitplänen und Höchstarbeitszeiten haben einen Pflicht-Fremdschlüssel darauf.
- `APP_Vacation`, `APP_SickLeave` und `APP_CompensatoryTime` haben jeweils einen Pflicht-Fremdschlüssel auf `APP_UserDetail` (den Mitarbeiter) und einen optionalen Fremdschlüssel zurück auf `APP_UserDetail` (die genehmigende Person).
- `APP_WeeklyHoursOfWork`, `APP_VacationEntitlement`, `APP_WorkingTimeLimit` und `APP_OvertimeCorrection` haben jeweils einen Pflicht-Fremdschlüssel auf `APP_UserDetail`; ein Benutzer kann von jedem Typ viele Datensätze haben.
- `APP_UserDetail` hat einen optionalen Fremdschlüssel auf `APP_Department`; eine Abteilung kann viele Benutzer haben.
- `APP_DepartmentLead` ist eine Verknüpfungsentität zwischen `APP_Department` und `APP_UserDetail`; eine Abteilung kann mehrere Abteilungsleiter haben, und ein Benutzer kann mehrere Abteilungen leiten.
- `APP_UserDetail` hat einen optionalen Fremdschlüssel auf `APP_LegalHolidayCalendar`; ein Kalender kann von vielen Benutzern gemeinsam verwendet werden.
- `APP_LegalHoliday` hat einen Pflicht-Fremdschlüssel auf `APP_LegalHolidayCalendar`; ein Kalender enthält viele Feiertage.

## Bereich 3: Sicherheit & Benutzerverwaltung

Dieser Bereich umfasst Authentifizierung, Autorisierung, Rollen und Berechtigungen.

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
        string APP_Code "z. B. BillingAdmin"
        string APP_RoleName
        string APP_Description
    }
    
    APP_CultureInfo {
        guid APP_CultureInfoUuid PK
        string APP_CultureInfoName "z. B. en-US"
        string APP_DisplayName
    }
    SYS_Permission {
        guid SYS_PermissionUuid PK
        string SYS_TargetEntity
        string SYS_PermissionType
    }
```

### Wichtige Beziehungen

- `SYS_UserAccount` hat höchstens ein `APP_UserDetail`-Profil (eins zu null oder eins).
- `APP_UserDetail` gehört zu genau einer `APP_CultureInfo`.
- `APP_UserDetailRole` ist eine Verknüpfungsentität zwischen `APP_UserDetail` und `APP_UserRole`; ein Benutzer kann viele Rollen haben, und eine Rolle kann vielen Benutzern zugewiesen sein.
- `APP_UserRole` hat einen optionalen Fremdschlüssel auf `SYS_Permission`.

## Bereich 4: Stammdaten & Konfiguration

Unterstützende Entitäten für Konfiguration und Referenzdaten.

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
        decimal APP_PriceVat "Berechnet"
        boolean APP_IsHidden
        guid APP_Unit FK
    }
    
    APP_Unit {
        guid APP_UnitUuid PK
        string APP_Code "z. B. hour, piece, km"
        string APP_UnitName
    }
    
    APP_Country {
        guid APP_CountryUuid PK
        string APP_CountryName
        string APP_CountryCode "ISO-Code"
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

## Bereichsübergreifende Beziehungen

**APP_UserDetail** hat Fremdschlüsselbeziehungen zu Entitäten in jedem Bereich:
- Wird von `APP_Timesheet` referenziert (Bereich 1)
- Referenziert `APP_Department` und `APP_LegalHolidayCalendar` und wird von allen Entitäten für Abwesenheiten und Arbeitszeitpläne referenziert (Bereich 2)
- Wird von `SYS_UserAccount` und `APP_UserDetailRole` referenziert und referenziert `APP_CultureInfo` (Bereich 3)

**APP_Project** wird bereichsübergreifend referenziert:
- Referenziert `APP_Customer` (Bereich 1)
- Wird von `APP_Timesheet` und `APP_Invoice` referenziert (Bereich 1)

## Kardinalität verstehen

**Symbole**:
- `||` : Eins (genau eins)
- `o{` : Null oder viele
- `}o` : Viele zu null oder eins
- `||--o{` : Eins zu viele
- `}o--||` : Viele zu eins
- `}o--o|` : Viele zu null oder eins

**Beispiele**:
```
APP_Customer ||--o{ APP_Project
```
Ein Kunde hat null oder viele Projekte. Jedes Projekt gehört zu genau einem Kunden.

```
APP_Timesheet }o--o| APP_Invoice
```
Eine Zeitbuchung kann null oder einer Rechnung zugeordnet sein (optional). Eine Rechnung kann viele Zeitbuchungen haben.

## Vollständige Liste der Entitäten nach Bereich

### Rechnungslegung & Projekte
- APP_Customer
- APP_Project
- APP_Task
- APP_Timesheet
- APP_Invoice
- APP_InvoiceDetail
- APP_Article
- APP_Unit

### Zeit & Anwesenheit
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

### Sicherheit
- SYS_UserAccount
- APP_UserDetail
- APP_UserDetailRole
- APP_UserRole
- APP_CultureInfo

### Stammdaten
- APP_Company
- APP_Country
- APP_MeansOfTransport

### Konfiguration
- APP_GlobalSettings
- APP_FeatureFlag
- APP_FormattingProfile
- APP_EntityViewProfile

## Verwandte Dokumentation

- [Referenz der Standardentitäten](~/doc/datenmodell/standardentitaeten.md) - Ausführliche Dokumentation jeder Entität
- [Leitfaden zu Berechtigungen](~/doc/datenmodell/berechtigungen-und-sicherheit.md) - Mit Berechtigungen auf Entitäten arbeiten
- [TCQL: Überblick](/doc/tcql/overview.html) - Die Abfragesprache von time cockpit
- [Web API - OData](/doc/web-api/odata.html) - REST-API-Zugriff auf Entitäten

## Siehe auch

- [Anpassung des Datenmodells](/doc/data-model-customization/overview.html)
- [Eigene Entitäten anlegen](/doc/data-model-customization/entity.html)
- [Named Sets für die Sicherheit](~/doc/datenmodell/berechtigungen-und-sicherheit.md#referenz-der-named-sets)
