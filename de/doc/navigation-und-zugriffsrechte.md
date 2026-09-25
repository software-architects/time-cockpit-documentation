---
title: Navigation, Zugriffsrechte und Menüstruktur
description: Referenz der Standard-Navigationspfade, des rollenbasierten Zugriffs und der geprüften Deeplinks in time cockpit.
keywords: [navigation, berechtigungen, rollen, menüstruktur, zugriffssteuerung, standardberechtigungen]
en_page: doc/navigation-access-permissions.md
---

# Navigation, Zugriffsrechte und Menüstruktur

> [!NOTE]
> Überprüft im April 2026.

Diese Seite beschreibt die Standard-Navigationsstruktur in time cockpit, wenn `APP_DefaultPermissions` aktiviert ist. Sie zeigt, welche Rollen typischerweise mit welchen Menübereichen arbeiten, und ordnet häufig verwendeten Menüeinträgen ihre geprüften Deeplinks zu.

> [!NOTE]
> Diese Dokumentation gilt, wenn das Feature-Flag **APP_DefaultPermissions** aktiviert ist. Für Konten, die nach dem 10.12.2025 angelegt wurden, sind die Standardberechtigungen automatisch aktiviert. Bestehende Konten können die Aktivierung über [support@timecockpit.com](mailto:support@timecockpit.com) anfordern.

> [!NOTE]
> Die Deeplinks auf dieser Seite beruhen auf der Navigationskonfiguration der Produktivumgebung, exportiert am 9.2.2026. Entitätsbasierte Navigationsbefehle verwenden `/app/lists/entity/APP_*`, direkte Listenbefehle `/app/lists/APP_*List` und Formularbefehle `/app/forms/entity/APP_*`.

## Navigationshierarchie

Die Navigation von time cockpit hat drei Ebenen:

1. **Modul**: Navigationseintrag der obersten Ebene, zum Beispiel `Timesheet`, `Management` oder `User`
2. **Abschnitt**: Gruppierung innerhalb eines Moduls, zum Beispiel `Billing`
3. **Befehl**: Menüeintrag, der eine Liste oder ein Formular öffnet

## Rollenbasierter Zugriff im Überblick

### Rollen im Überblick

| Rolle | Schwerpunkt | Wichtigste Aufgaben |
|------|---------------|---------------------|
| **AccountAdmin** | Kontoverwaltung | Benutzerkonten, Rollen, Abrechnung, Kontoeinstellungen |
| **BaseDataAdmin** | Stammdaten | Kunden, Projekte, Aufgaben, globale Einstellungen, Importdefinitionen |
| **BillingAdmin** | Rechnungslegung und Umsatz | Rechnungen, Artikel, Einheiten, Firmen, Verrechnung von Projekten |
| **HumanResourcesAdmin** | HR und Mitarbeiterdaten | Benutzerdetails, Abwesenheiten, Arbeitszeit, Urlaubsansprüche |
| **ProjectController** | Projektüberwachung | Lesezugriff auf alle Zeitbuchungen, Rechnungen und Projektdaten |
| **ProjectManager** | Projektdurchführung | Zugewiesene Projekte verwalten, projektbezogene Zeitbuchungen ansehen, Aufgaben aktualisieren |
| **DepartmentLead** | Teamführung | Abwesenheiten genehmigen, Zeiterfassungsdaten der Abteilung prüfen |
| **NotificationManager** | Systembenachrichtigungen | Benachrichtigungen der Anwendung verwalten und versenden |
| **User** | Zeiterfassung | Eigene Zeitbuchungen, Abwesenheiten und zugehörige Selbstbedienungsfunktionen |

## Geprüfte Navigationszuordnung

| Navigationspfad | Navigationsziel | Deeplink-URL |
|----------------|-------------------|--------------|
| Zeiterfassung -> Zeitbuchungen | APP_Timesheet | https://web.timecockpit.com/app/lists/entity/APP_Timesheet |
| Verwaltung -> Kunden | APP_Customer | https://web.timecockpit.com/app/lists/entity/APP_Customer |
| Verwaltung -> Projekte | APP_Project | https://web.timecockpit.com/app/lists/entity/APP_Project |
| Verwaltung -> Aufgaben | APP_Task | https://web.timecockpit.com/app/lists/entity/APP_Task |
| Verwaltung -> Billing -> Rechnungen | APP_Invoice | https://web.timecockpit.com/app/lists/entity/APP_Invoice |
| Verwaltung -> Billing -> Unbilled Timesheets | APP_UnbilledTimesheetsList | https://web.timecockpit.com/app/lists/APP_UnbilledTimesheetsList |
| Verwaltung -> Billing -> Budgetary Control of Projects | APP_BudgetaryControlOfProjectsList | https://web.timecockpit.com/app/lists/APP_BudgetaryControlOfProjectsList |
| Verwaltung -> Billing -> Budgetary Control of Tasks | APP_BudgetaryControlOfTasksList | https://web.timecockpit.com/app/lists/APP_BudgetaryControlOfTasksList |
| Verwaltung -> Billing -> Articles | APP_Article | https://web.timecockpit.com/app/lists/entity/APP_Article |
| Verwaltung -> Billing -> Units | APP_Unit | https://web.timecockpit.com/app/lists/entity/APP_Unit |
| Verwaltung -> Billing -> Companies | APP_Company | https://web.timecockpit.com/app/lists/entity/APP_Company |
| Verwaltung -> Countries | APP_Country | https://web.timecockpit.com/app/lists/entity/APP_Country |
| Verwaltung -> Means of Transport | APP_MeansOfTransport | https://web.timecockpit.com/app/lists/entity/APP_MeansOfTransport |
| Verwaltung -> Global Settings | APP_GlobalSettings | https://web.timecockpit.com/app/forms/entity/APP_GlobalSettings |
| Verwaltung -> Musterbuchungen | APP_TimesheetTemplate | https://web.timecockpit.com/app/lists/entity/APP_TimesheetTemplate |
| Verwaltung -> Template Queries | APP_TemplateQuery | https://web.timecockpit.com/app/lists/entity/APP_TemplateQuery |
| Verwaltung -> Importdefinitionen | APP_DefaultImportDefinitionList | https://web.timecockpit.com/app/lists/APP_DefaultImportDefinitionList |
| Benutzer -> User Details | APP_UserDetail | https://web.timecockpit.com/app/lists/entity/APP_UserDetail |
| Benutzer -> Wochenarbeitszeit | APP_WeeklyHoursOfWork | https://web.timecockpit.com/app/lists/entity/APP_WeeklyHoursOfWork |
| Benutzer -> Departments | APP_Department | https://web.timecockpit.com/app/lists/entity/APP_Department |
| Benutzer -> Legal Holiday Calendars | APP_LegalHolidayCalendar | https://web.timecockpit.com/app/lists/entity/APP_LegalHolidayCalendar |
| Benutzer -> Legal Holidays | APP_LegalHoliday | https://web.timecockpit.com/app/lists/entity/APP_LegalHoliday |
| Benutzer -> Urlaub | APP_Vacation | https://web.timecockpit.com/app/lists/entity/APP_Vacation |
| Benutzer -> Urlaubsanspruch | APP_VacationEntitlement | https://web.timecockpit.com/app/lists/entity/APP_VacationEntitlement |
| Benutzer -> Vacation per Effective Date | APP_VacationPerEffectiveDateList | https://web.timecockpit.com/app/lists/APP_VacationPerEffectiveDateList |
| Benutzer -> Krankenstand | APP_SickLeave | https://web.timecockpit.com/app/lists/entity/APP_SickLeave |
| Benutzer -> Zeitausgleich | APP_CompensatoryTime | https://web.timecockpit.com/app/lists/entity/APP_CompensatoryTime |
| Benutzer -> Working Time Weights | APP_WorkingTimeWeight | https://web.timecockpit.com/app/lists/entity/APP_WorkingTimeWeight |
| Benutzer -> Overtime Corrections | APP_OvertimeCorrection | https://web.timecockpit.com/app/lists/entity/APP_OvertimeCorrection |
| Benutzer -> Overtime per Effective Date | APP_OvertimePerEffectiveDateList | https://web.timecockpit.com/app/lists/APP_OvertimePerEffectiveDateList |
| Benutzer -> Target-Actual Hours Comparison | APP_TargetActualHoursComparisonList | https://web.timecockpit.com/app/lists/APP_TargetActualHoursComparisonList |
| Benutzer -> Zeitbericht | APP_DefaultTimeReportList | https://web.timecockpit.com/app/lists/APP_DefaultTimeReportList |
| Benutzer -> Home Office Overview | APP_HomeOfficeOverviewList | https://web.timecockpit.com/app/lists/APP_HomeOfficeOverviewList |
| Benutzer -> Working Time Limits | APP_WorkingTimeLimit | https://web.timecockpit.com/app/lists/entity/APP_WorkingTimeLimit |
| Benutzer -> Working Time Violations | APP_DefaultWorkingTimeViolationList | https://web.timecockpit.com/app/lists/APP_DefaultWorkingTimeViolationList |
| Benutzer -> Add Roles | APP_UserRole | https://web.timecockpit.com/app/lists/entity/APP_UserRole |
| Benutzer -> Assign Roles | APP_UserDetailRole | https://web.timecockpit.com/app/lists/entity/APP_UserDetailRole |

## Typische Zugriffsszenarien nach Rolle

### Ablauf für BillingAdmin

**Verfügbare Navigation:**
- Verwaltung -> Billing -> Rechnungen, Unbilled Timesheets, Budgetary Control of Projects, Articles, Units, Companies
- Lesezugriff auf alle Zeitbuchungen und Projekte

**Typische Aufgaben:**
1. [Unbilled Timesheets](https://web.timecockpit.com/app/lists/APP_UnbilledTimesheetsList) öffnen
2. Rechnungen aus verrechenbaren Zeitbuchungen erstellen
3. [Rechnungen](https://web.timecockpit.com/app/lists/entity/APP_Invoice) verwalten
4. [Budgetary Control of Projects](https://web.timecockpit.com/app/lists/APP_BudgetaryControlOfProjectsList) prüfen

### Ablauf für HumanResourcesAdmin

**Verfügbare Navigation:**
- Benutzer -> User Details, Wochenarbeitszeit, Departments, Legal Holidays
- Benutzer -> Urlaub, Krankenstand, Zeitausgleich
- Benutzer -> Working Time Limits, Working Time Weights

**Typische Aufgaben:**
1. [User Details](https://web.timecockpit.com/app/lists/entity/APP_UserDetail) verwalten
2. [Wochenarbeitszeit](https://web.timecockpit.com/app/lists/entity/APP_WeeklyHoursOfWork) konfigurieren
3. [Urlaubsanträge](https://web.timecockpit.com/app/lists/entity/APP_Vacation) prüfen
4. [Working Time Limits](https://web.timecockpit.com/app/lists/entity/APP_WorkingTimeLimit) einrichten

### Ablauf für ProjectManager

**Verfügbare Navigation:**
- Verwaltung -> Billing -> Budgetary Control of Projects und Budgetary Control of Tasks für zugewiesene Projekte
- Verwaltung -> Projekte und Aufgaben für zugewiesene Projekte

**Typische Aufgaben:**
1. [Projekte](https://web.timecockpit.com/app/lists/entity/APP_Project) und [Aufgaben](https://web.timecockpit.com/app/lists/entity/APP_Task) aktualisieren
2. [Budgetary Control of Projects](https://web.timecockpit.com/app/lists/APP_BudgetaryControlOfProjectsList) überwachen
3. Projektbezogene Zeitbuchungen prüfen

### Ablauf für DepartmentLead

**Verfügbare Navigation:**
- Benutzer -> Urlaub, Krankenstand und Zeitausgleich für Mitarbeiter der Abteilung
- Benutzer -> Zeitbericht, Overtime Corrections und Overtime per Effective Date für Mitarbeiter der Abteilung

**Typische Aufgaben:**
1. [Urlaubsanträge](https://web.timecockpit.com/app/lists/entity/APP_Vacation) genehmigen
2. [Zeitbericht](https://web.timecockpit.com/app/lists/APP_DefaultTimeReportList) prüfen
3. Abwesenheiten und Überstunden des Teams überwachen

## Verwandte Dokumentation

- [Standardberechtigungen im Überblick](~/doc/arbeitszeiterfassung/standardberechtigungen.md)
- [Abrechnungs-FAQ](~/doc/abrechnungs-faq.md)
- [HR-Administrator-FAQ](~/doc/hr-administrator-faq.md)
- [Projektleiter-FAQ](~/doc/projektleiter-faq.md)
- [Abteilungsleiter-FAQ](~/doc/abteilungsleiter-faq.md)

---

*Diese Dokumentation beruht auf der Navigationskonfiguration und dem Datenmodell der Produktivumgebung, exportiert am 9.2.2026.*
