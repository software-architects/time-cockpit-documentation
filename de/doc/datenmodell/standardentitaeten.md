---
title: Referenz der Standardentitäten
description: Umfassende Referenz der Standardentitäten im Datenmodell von time cockpit mit Eigenschaften, Beziehungen, Berechtigungen und Anwendungsbeispielen.
en_page: doc/data-model/standard-entities.md
---

# Referenz der Standardentitäten

Diese Seite dokumentiert ausführlich die wichtigsten Entitäten im Standarddatenmodell von time cockpit (Präfix APP_). Jeder Abschnitt zu einer Entität enthält:

- **Zweck & Überblick**: Wofür die Entität steht
- **Wichtige Eigenschaften**: Relevante Felder mit Datentypen und Einschränkungen
- **Beziehungen**: Fremdschlüsselbeziehungen zu anderen Entitäten
- **Berechtigungen**: Wer Daten lesen und schreiben darf
- **Validierungsregeln**: Einschränkungen für die Datenintegrität
- **TCQL-Beispiele**: Häufige Abfragen

## Zentrale Entitäten der Zeiterfassung

### APP_Timesheet

Die zentrale Entität zum Erfassen der Arbeitszeit. Jede Zeitbuchung in time cockpit ist ein Timesheet-Datensatz.

**Zweck**: Erfasst einzelne Zeitbuchungen mit Beginn- und Endzeit, Zuordnung zu Projekt und Aufgabe, Beschreibung und Verrechnungsinformationen.

#### Wichtige Eigenschaften

| Eigenschaft | Typ | Pflicht | Beschreibung |
|----------|------|----------|-------------|
| `APP_TimesheetUuid` | Guid | PK | Eindeutige Kennung |
| `APP_BeginTime` | DateTime | Ja | Beginn der Arbeit |
| `APP_EndTime` | DateTime | Ja | Ende der Arbeit |
| `APP_DurationInHours` | Decimal | Berechnet | Dauer = (EndTime - BeginTime) in Stunden |
| `APP_Description` | Text(500) | Nein | Beschreibung/Notizen zur Arbeit |
| `APP_DateActual` | Date | Berechnet | Date(BeginTime) - wird zum Gruppieren verwendet |
| `APP_Billable` | Boolean | Ja | Standard: true - Ist diese Zeit an den Kunden verrechenbar? |
| `APP_Billed` | Boolean | Berechnet | Wurde die Zeitbuchung einer Rechnung zugeordnet? |
| `APP_HourlyRateActual` | Decimal(18,2) | Nein | Stundensatz zum Zeitpunkt der Buchung (aus Projekt oder Benutzer) |
| `APP_HourlyRateBilled` | Decimal(18,2) | Nein | Tatsächlich verrechneter Stundensatz (wird beim Erstellen der Rechnung gesetzt) |
| `APP_Revenue` | Decimal(18,2) | Berechnet | `DurationInHours * HourlyRateActual` |
| `APP_IsDurationTimesheet` | Boolean | Ja | Standard: false - Nur Dauer (ohne konkrete Uhrzeiten)? |
| `APP_Location` | Text(100) | Nein | Ort, an dem die Arbeit erbracht wurde |
| `APP_JourneyFrom` | Text(100) | Nein | Reise: Ausgangspunkt |
| `APP_JourneyTo` | Text(100) | Nein | Reise: Ziel |
| `APP_JourneyDistance` | Decimal(18,2) | Nein | Reisestrecke in km |
| `APP_IsRunning` | Boolean | Nein | Läuft der Timer gerade? |

#### Beziehungen

| Beziehung | Ziel | Kardinalität | Pflicht | Beschreibung |
|----------|--------|-------------|----------|-------------|
| `APP_UserDetail` | APP_UserDetail | Viele zu eins | Ja | Wer die Zeit erfasst hat |
| `APP_Project` | APP_Project | Viele zu eins | Nein | Zugeordnetes Projekt |
| `APP_Task` | APP_Task | Viele zu eins | Nein | Zugeordnete Aufgabe (legt das Projekt fest) |
| `APP_Invoice` | APP_Invoice | Viele zu eins | Nein | Rechnung, auf der diese Zeit verrechnet wurde |
| `APP_WorkingTimeWeight` | APP_WorkingTimeWeight | Viele zu eins | Nein | Zeitgewichtung (z. B. 1,5-fach für Samstag) |
| `APP_JourneyMeansOfTransport` | APP_MeansOfTransport | Viele zu eins | Nein | Verkehrsmittel (Auto, Zug, Flugzeug) |

#### Geschäftsregeln

1. **Projekt oder Aufgabe erforderlich**: Entweder `APP_Project` oder `APP_Task` muss gesetzt sein
2. **Aufgabe legt Projekt fest**: Ist `APP_Task` gesetzt, wird `APP_Project` aus `Task.Project` abgeleitet
3. **Berechnung des Stundensatzes**:
   - Ist `APP_Task.HourlyRate` gesetzt → Stundensatz der Aufgabe verwenden
   - Sonst, wenn `APP_Project.HourlyRate` gesetzt ist → Stundensatz des Projekts verwenden  
   - Sonst, wenn `APP_Customer.HourlyRate` gesetzt ist → Stundensatz des Kunden verwenden
   - Sonst → internen Stundensatz des Benutzers `APP_UserDetail.HourlyRate` verwenden
4. **Berechnung von „verrechenbar“**: `APP_Billable` übernimmt standardmäßig das Verrechenbar-Kennzeichen von Projekt/Aufgabe
5. **Berechnung des Umsatzes**: Wird nur berechnet, wenn `Billable = true` und ein Stundensatz gesetzt ist

#### Berechtigungen

**Leseberechtigung** (Sicherheit auf Zeilenebene):
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

**Schreibberechtigung**:
- Benutzer können ihre eigenen Zeitbuchungen anlegen, bearbeiten und löschen
- Administratoren können alle Zeitbuchungen ändern
- Sobald eine Zeitbuchung verrechnet ist (`APP_Billed = True`), können nur noch Administratoren sie ändern

#### TCQL-Beispiele

**Alle Zeitbuchungen des aktuellen Benutzers in diesem Monat abrufen:**
```tcql
From T In APP_Timesheet
Where 
    T.APP_UserDetail = Environment.CurrentUser.UserDetailUuid
    And T.APP_BeginTime >= :FirstOfMonth(:Now())
    And T.APP_BeginTime < :AddMonths(:FirstOfMonth(:Now()), 1)
Order By T.APP_BeginTime Desc
Select T
```

**Nicht verrechnete Zeitbuchungen eines Projekts abrufen:**
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

**Stunden pro Projekt in diesem Monat berechnen:**
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

**Zeitbuchungen mit Lücken finden (keine Überschneidung, fehlende Zeit):**
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

Steht für ein Projekt, auf das Zeit erfasst und das an Kunden verrechnet werden kann.

**Zweck**: Arbeit in Projekte mit Budgets, Stundensätzen, Projektleitern und Verrechnungseinstellungen gliedern.

#### Wichtige Eigenschaften

| Eigenschaft | Typ | Pflicht | Beschreibung |
|----------|------|----------|-------------|
| `APP_ProjectUuid` | Guid | PK | Eindeutige Kennung |
| `APP_ProjectName` | Text(200) | Ja | Anzeigename |
| `APP_Code` | Text(50) | Ja | Kurzcode (z. B. "PROJ-001") |
| `APP_Description` | Text(2000) | Nein | Ausführliche Beschreibung |
| `APP_Budget` | Decimal(18,2) | Nein | Gesamtbudget des Projekts (in Währung) |
| `APP_BudgetInHours` | Decimal(18,2) | Nein | Budget in Stunden |
| `APP_HourlyRate` | Decimal(18,2) | Nein | Standard-Stundensatz für dieses Projekt |
| `APP_Billable` | Boolean | Ja | Standard: true - Kann Zeit auf diesem Projekt verrechnet werden? |
| `APP_FixedPrice` | Boolean | Ja | Standard: false - Fixpreis oder nach Aufwand? |
| `APP_Closed` | Boolean | Ja | Standard: false - Ist das Projekt abgeschlossen? |
| `APP_StartDate` | Date | Nein | Startdatum des Projekts |
| `APP_EndDate` | Date | Nein | Geplantes/tatsächliches Enddatum |
| `APP_ExternalProjectCode` | Text(50) | Nein | Verweis auf ein externes System (z. B. SAP-ID) |
| `APP_InvoicingRules` | Text(2000) | Nein | Besondere Hinweise zur Rechnungslegung |

#### Beziehungen

| Beziehung | Ziel | Kardinalität | Pflicht | Beschreibung |
|----------|--------|-------------|----------|-------------|
| `APP_Customer` | APP_Customer | Viele zu eins | Ja | Kunde, zu dem dieses Projekt gehört |
| `APP_Manager1` | APP_UserDetail | Viele zu eins | Nein | Hauptverantwortlicher Projektleiter |
| `APP_Manager2` | APP_UserDetail | Viele zu eins | Nein | Stellvertretender Projektleiter |

#### TCQL-Beispiele

**Projekte mit Budgetstatus abrufen:**
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

**Projekte mit Budgetüberschreitung finden:**
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

Untereinheiten von Projekten, die bestimmte Arbeitspakete oder Phasen abbilden.

**Zweck**: Projekte in erfassbare Aufgaben mit eigenen Budgets und Stundensätzen aufteilen.

#### Wichtige Eigenschaften

| Eigenschaft | Typ | Pflicht | Beschreibung |
|----------|------|----------|-------------|
| `APP_TaskUuid` | Guid | PK | Eindeutige Kennung |
| `APP_TaskName` | Text(200) | Ja | Anzeigename |
| `APP_Code` | Text(50) | Ja | Kurzcode |
| `APP_Description` | Text(2000) | Nein | Ausführliche Beschreibung |
| `APP_BudgetInHours` | Decimal(18,2) | Nein | Zeitbudget für diese Aufgabe |
| `APP_HourlyRate` | Decimal(18,2) | Nein | Eigener Stundensatz (überschreibt den Stundensatz des Projekts) |
| `APP_Billable` | Boolean | Nein | Überschreibt die Verrechenbar-Einstellung des Projekts |
| `APP_Closed` | Boolean | Ja | Standard: false - Ist die Aufgabe abgeschlossen? |
| `APP_CodeAndDescription` | Text | Berechnet | `Code + " - " + TaskName` |

#### Beziehungen

| Beziehung | Ziel | Kardinalität | Pflicht | Beschreibung |
|----------|--------|-------------|----------|-------------|
| `APP_Project` | APP_Project | Viele zu eins | Ja | Übergeordnetes Projekt |

#### TCQL-Beispiele

**Aufschlüsselung der Aufgaben mit Stunden abrufen:**
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

## Weitere Entitäten

Die folgenden Entitäten sind ebenfalls dokumentiert, jedoch weniger ausführlich. Wie sie zusammenhängen, zeigen die [Entity-Relationship-Diagramme](~/doc/datenmodell/entitaetsbeziehungen.md):

- **APP_Customer** - Kundenstammdaten
- **APP_UserDetail** - Benutzerprofile und -einstellungen
- **APP_Invoice** - Ausgangsrechnungen
- **APP_InvoiceDetail** - Rechnungspositionen
- **APP_Vacation** - Urlaubsanträge und Genehmigungen
- **APP_SickLeave** - Erfassung von Krankenständen
- **APP_Department** - Organisationseinheiten
- **APP_WorkingTimeLimit** - Gesetzliche Arbeitszeitregelungen

## Siehe auch

- [Entity-Relationship-Diagramme](~/doc/datenmodell/entitaetsbeziehungen.md)
- [Leitfaden zu Berechtigungen](~/doc/datenmodell/berechtigungen-und-sicherheit.md)
- [TCQL-Sprachreferenz](/doc/tcql/overview.html)
- [Dokumentation der OData-API](/doc/web-api/odata.html)
