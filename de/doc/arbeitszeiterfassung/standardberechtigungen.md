---
title: Standardberechtigungen - Rollenbasierte Zugriffskontrolle
description: Das Standardberechtigungsmodell von time cockpit, die Standardrollen und die technischen Berechtigungsregeln, auf denen sie beruhen.
en_page: doc/employee-time-tracking/default-permissions.md
---
# Standardberechtigungen in time cockpit

## Überblick

time cockpit enthält ein Standardberechtigungsmodell mit vordefinierten Rollen für typische Zuständigkeiten wie Kontoadministration, Stammdatenpflege, Verrechnung, HR, Projektleitung und Zeiterfassung.

Diese Seite gibt einen Überblick über die Standardrollen und führt die technischen Berechtigungsregeln zum Nachschlagen an.

> [!NOTE]
> Überprüft im April 2026.

## Bisherige Standardberechtigungen

Vor dem aktuellen Standardberechtigungsmodell verwendete time cockpit ein einfacheres Rollenkonzept mit nur wenigen Basisrollen:

- **Tenant Admin**: Verwaltete die Kontoeinstellungen, lud Lizenzrechnungen herunter und fügte Benutzer hinzu oder deaktivierte sie
- **Admin**: Verwaltete Rollen und Rollenzuordnungen, passte das Datenmodell an, führte TCQL-Abfragen aus und verwaltete globale Einstellungen
- **Time Tracking User**: Hatte umfassenden Zugriff auf die übrigen Standardfunktionen

## Aktivierung der Standardberechtigungen

- **Neukunden**: Die Standardberechtigungen werden automatisch aktiviert.
- **Bestandskunden** (Konten, die vor dem 10.12.2025 angelegt wurden): Die Standardberechtigungen werden nicht automatisch aktiviert, damit bestehende eigene Berechtigungen nicht unbeabsichtigt geändert werden. Um sie zu aktivieren, wenden Sie sich an [support@timecockpit.com](mailto:support@timecockpit.com).

Die zugehörige Referenz zur Navigation finden Sie unter [Navigationsberechtigungen und Menüstruktur](~/doc/navigation-und-zugriffsrechte.md).

## Standardrollen

| **Interner Name** | **Anzeigename** | **Berechtigungen** | **Typische Verwendung** |
|-------------------|------------------|-----------------|-----------------|
| `AccountAdmin` | **Account Admin** | Kontoeinstellungen und Benutzerrollen verwalten, neue Benutzer hinzufügen sowie Benutzer aktivieren oder deaktivieren. | Allgemeine Kontoadministration |
| `CustomizationAdmin` | **Customization Admin** | Datenmodell verwalten, Identitätswechsel verwenden und auf den TCQL-Editor zugreifen. | Arbeiten an Datenmodell und Anpassungen |
| `BaseDataAdmin` | **Base Data Admin** | Stammdaten und gemeinsame Konfiguration verwalten, etwa Kunden, Projekte, Länder, Abteilungen, Fahrzeuge, Firmen, Artikel, Einheiten, Rechnungsnummern, Feiertagskalender, Importdefinitionen, Abfragevorlagen und globale Einstellungen. | Gemeinsame Organisationsdaten |
| `BillingAdmin` | **Billing Admin** | Verrechnungsbezogene Entitäten verwalten, darunter Rechnungen, Rechnungspositionen, Firmen, Artikel, Einheiten und Rechnungsnummern, sowie Zugriff auf alle für die Verrechnung benötigten Zeitbuchungen. | Rechnungslegung und Verrechnung |
| `HumanResourcesAdmin` | **Human Resources Admin** | Benutzerdetails, Sollarbeitszeiten, Abwesenheiten, Urlaubsansprüche, Korrekturen des Arbeitszeitsaldos, Höchstarbeitszeiten, Arbeitszeitgewichtungen, Abteilungen und Feiertagskalender verwalten. | HR und Anwesenheitsverwaltung |
| `DepartmentLead` | **Department Lead** | Abwesenheitsanträge von Mitarbeitern der Abteilung genehmigen oder ablehnen und deren Zeiterfassungsdaten prüfen. | Genehmigungen und Aufsicht auf Abteilungsebene |
| `ProjectController` | **Project Controller** | Zeiterfassungs- und Verrechnungsdaten der gesamten Organisation lesen. | Controlling und Prüfung |
| `ProjectManager` | **Project Manager** | Zugeordnete Projekte und Tätigkeiten verwalten und projektbezogene Zeitbuchungen, Rechnungen und Rechnungspositionen prüfen. | Projektdurchführung |
| `NotificationManager` | **Notification Manager** | Benachrichtigungen der Anwendung senden und verwalten. | Benachrichtigungsabläufe |
| `User` | **Time Tracking User** | Zeiterfassungs- und Abwesenheitsfunktionen für den aktuellen Benutzer innerhalb des offenen Buchungszeitraums verwenden. | Selbstbedienung für Endanwender |

## Anpassungsmöglichkeiten

Die Standardberechtigungen decken übliche Standardszenarien ab. Hat Ihr Mandant besondere Anforderungen, können Sie das Berechtigungsmodell durch Anpassung erweitern oder ändern.

## Technische Details der Berechtigungen

Die folgende Tabelle enthält die technischen Berechtigungsregeln aus dem Datenmodell. Jede Regel ist mit TCQL-Ausdrücken definiert, die die Zugriffsrechte abhängig von Rollen und Kontext bestimmen.

| **Entitätsname** | **Berechtigungsname** | **Beschreibung** | **Bedingung/Logik (TCQL)** |
|-----------------|---------------------|-----------------|----------------------------|
| APP_Article | APP_ReadPermission | Stammdaten- und Abrechnungsadministratoren können Artikel lesen | `'BaseDataAdmin' In Set('CurrentUserRoles') Or 'BillingAdmin' In Set('CurrentUserRoles')` |
| APP_Article | APP_WritePermission | Stammdaten- und Abrechnungsadministratoren können Artikel schreiben | `'BaseDataAdmin' In Set('CurrentUserRoles') Or 'BillingAdmin' In Set('CurrentUserRoles')` |
| APP_CalendarWeekRule | APP_WriteCalendarWeekRule | Kalenderwochenregeln können nicht geändert werden | `0 = 1` |
| APP_Company | APP_WritePermission | Stammdaten- und Abrechnungsadministratoren können Firmen schreiben | `'BaseDataAdmin' In Set('CurrentUserRoles') Or 'BillingAdmin' In Set('CurrentUserRoles')` |
| APP_CompensatoryTime | APP_ReadPermission | HR-Administratoren, Abteilungsleiter (für ihre Abteilung) und Benutzer (für ihre eigenen Datensätze) können Zeitausgleich lesen | `'HumanResourcesAdmin' In Set('CurrentUserRoles') Or ('DepartmentLead' In Set('CurrentUserRoles') And Current.UserDetail.Department In Set('APP_MyDepartmentsAsLead')) Or ('User' In Set('CurrentUserRoles', 'Code') And Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid)` |
| APP_CompensatoryTime | APP_WritePermission | HR-Administratoren können nach dem Buchungsabschlussdatum schreiben; Benutzer können ihre eigenen Datensätze schreiben, wenn sie nicht genehmigt sind und nach dem Buchungsabschlussdatum liegen | `'HumanResourcesAdmin' In Set('CurrentUserRoles') And :Date(Current.BeginTime) > :GetBookingCompletionDate() Or ('User' In Set('CurrentUserRoles') And Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid And (Current.APP_IsApproved=False Or Current.UserDetail.APP_IsAbsenceApprovalRequired <> True) And :Date(Current.BeginTime) > :GetBookingCompletionDate())` |
| APP_Country | APP_WritePermission | Stammdaten- und Abrechnungsadministratoren können Länder schreiben | `'BaseDataAdmin' In Set('CurrentUserRoles') Or 'BillingAdmin' In Set('CurrentUserRoles')` |
| APP_CultureInfo | APP_WriteCultureInfo | Nur der Systemmodus kann Kulturinformationen schreiben | `:GetIsInSystemMode()` |
| APP_Customer | APP_WritePermission | Stammdaten- und Abrechnungsadministratoren können Kunden schreiben | `'BaseDataAdmin' In Set('CurrentUserRoles') Or 'BillingAdmin' In Set('CurrentUserRoles')` |
| APP_Department | APP_WritePermission | Stammdaten- und HR-Administratoren können Abteilungen schreiben | `'BaseDataAdmin' In Set('CurrentUserRoles') Or 'HumanResourcesAdmin' In Set('CurrentUserRoles')` |
| APP_DepartmentLead | APP_WritePermission | Stammdaten- und HR-Administratoren können Zuordnungen von Abteilungsleitern schreiben | `'BaseDataAdmin' In Set('CurrentUserRoles') Or 'HumanResourcesAdmin' In Set('CurrentUserRoles')` |
| APP_FeatureFlag | APP_WritePermission | Administratoren können Feature-Flags schreiben | `'Admin' In Set('CurrentUserRoles')` |
| APP_FormattingProfile | APP_ReadPermission | Benutzer können globale Formatprofile oder ihre eigenen lesen | `Current.APP_UserDetail = Null Or Current.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.UserDetailUuid` |
| APP_FormattingProfile | APP_WritePermission | Stammdatenadministratoren können globale oder eigene Profile schreiben; Benutzer können nur ihre eigenen schreiben | `'BaseDataAdmin' In Set('CurrentUserRoles') And (Current.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.APP_UserDetailUuid Or Current.APP_UserDetail = Null) Or (Current.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.APP_UserDetailUuid)` |
| APP_FormattingProfileColor | APP_ReadPermission | Benutzer können Farben globaler Formatprofile oder ihrer eigenen lesen | `Current.APP_FormattingProfile.APP_UserDetail = Null Or Current.APP_FormattingProfile.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.UserDetailUuid` |
| APP_FormattingProfileColor | APP_WritePermission | Stammdatenadministratoren können Farben globaler oder eigener Profile schreiben; Benutzer können nur ihre eigenen schreiben | `'BaseDataAdmin' In Set('CurrentUserRoles') And (Current.APP_FormattingProfile.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.APP_UserDetailUuid Or Current.APP_FormattingProfile.APP_UserDetail = Null) Or (Current.APP_FormattingProfile.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.APP_UserDetailUuid)` |
| APP_GlobalSettings | APP_WritePermission | Stammdatenadministratoren können globale Einstellungen schreiben | `'BaseDataAdmin' In Set('CurrentUserRoles')` |
| APP_ImportDefinition | APP_WritePermission | Stammdatenadministratoren können Importdefinitionen schreiben | `'BaseDataAdmin' In Set('CurrentUserRoles')` |
| APP_Invoice | APP_ReadPermission | Abrechnungsadministratoren und Projektcontroller können alle lesen; Projektleiter können die Rechnungen ihrer Projekte lesen | `'BillingAdmin' In Set('CurrentUserRoles') Or 'ProjectController' In Set('CurrentUserRoles') Or ('ProjectManager' In Set('CurrentUserRoles') And (Current.APP_Project.APP_Manager1 = Environment.CurrentUser.UserDetailUuid Or Current.APP_Project.APP_Manager2 = Environment.CurrentUser.UserDetailUuid))` |
| APP_Invoice | APP_WritePermission | Abrechnungsadministratoren können Rechnungen schreiben | `'BillingAdmin' In Set('CurrentUserRoles')` |
| APP_InvoiceDetail | APP_ReadPermission | Abrechnungsadministratoren und Projektcontroller können alle lesen; Projektleiter können die Rechnungspositionen ihrer Projekte lesen | `'BillingAdmin' In Set('CurrentUserRoles') Or 'ProjectController' In Set('CurrentUserRoles') Or ('ProjectManager' In Set('CurrentUserRoles') And (Current.APP_Invoice.APP_Project.APP_Manager1 = Environment.CurrentUser.UserDetailUuid Or Current.APP_Invoice.APP_Project.APP_Manager2 = Environment.CurrentUser.UserDetailUuid))` |
| APP_InvoiceDetail | APP_WritePermission | Abrechnungsadministratoren können Rechnungspositionen schreiben | `'BillingAdmin' In Set('CurrentUserRoles')` |
| APP_InvoiceNumber | APP_ReadPermission | Stammdaten- und Abrechnungsadministratoren können Rechnungsnummern lesen | `'BaseDataAdmin' In Set('CurrentUserRoles') Or 'BillingAdmin' In Set('CurrentUserRoles')` |
| APP_InvoiceNumber | APP_WritePermission | Stammdaten- und Abrechnungsadministratoren können Rechnungsnummern schreiben | `'BaseDataAdmin' In Set('CurrentUserRoles') Or 'BillingAdmin' In Set('CurrentUserRoles')` |
| APP_LegalHoliday | APP_WritePermission | Stammdaten- und HR-Administratoren können gesetzliche Feiertage schreiben | `'BaseDataAdmin' In Set('CurrentUserRoles') Or 'HumanResourcesAdmin' In Set('CurrentUserRoles')` |
| APP_LegalHolidayCalendar | APP_WritePermission | Stammdaten- und HR-Administratoren können Feiertagskalender schreiben | `'BaseDataAdmin' In Set('CurrentUserRoles') Or 'HumanResourcesAdmin' In Set('CurrentUserRoles')` |
| APP_MeansOfTransport | APP_WritePermission | Stammdatenadministratoren können Verkehrsmittel schreiben | `'BaseDataAdmin' In Set('CurrentUserRoles')` |
| APP_Notification | APP_ReadPermission | Benachrichtigungsmanager können alle lesen; Benutzer können ihre eigenen Benachrichtigungen lesen | `'NotificationManager' In Set('CurrentUserRoles') Or Current.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.UserDetailUuid` |
| APP_Notification | APP_WritePermission | Benachrichtigungsmanager können Benachrichtigungen schreiben | `'NotificationManager' In Set('CurrentUserRoles')` |
| APP_NotificationState | APP_ReadPermission | Benachrichtigungsmanager können alle lesen; Benutzer können den Status ihrer eigenen Benachrichtigungen lesen | `'NotificationManager' In Set('CurrentUserRoles') Or Current.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.UserDetailUuid` |
| APP_NotificationState | APP_WritePermission | Benachrichtigungsmanager können alle schreiben; Benutzer können den Status ihrer eigenen Benachrichtigungen schreiben | `'NotificationManager' In Set('CurrentUserRoles') Or Current.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.UserDetailUuid` |
| APP_OvertimeCorrection | APP_ReadPermission | HR-Administratoren, Abteilungsleiter (für ihre Abteilung) und Benutzer (für ihre eigenen Datensätze) können Korrekturen des Arbeitszeitsaldos lesen | `'HumanResourcesAdmin' In Set('CurrentUserRoles') Or ('DepartmentLead' In Set('CurrentUserRoles') And Current.UserDetail.Department In Set('APP_MyDepartmentsAsLead')) Or ('User' In Set('CurrentUserRoles', 'Code') And Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid)` |
| APP_OvertimeCorrection | APP_WritePermission | HR-Administratoren können Korrekturen des Arbeitszeitsaldos schreiben | `'HumanResourcesAdmin' In Set('CurrentUserRoles')` |
| APP_Project | APP_UpdatePermission | Projektleiter können die von ihnen geleiteten Projekte aktualisieren | `'ProjectManager' In Set('CurrentUserRoles') And (Current.APP_Manager1 = Environment.CurrentUser.UserDetailUuid Or Current.APP_Manager2 = Environment.CurrentUser.UserDetailUuid)` |
| APP_Project | APP_WritePermission | Abrechnungs- und Stammdatenadministratoren können Projekte schreiben | `'BillingAdmin' In Set('CurrentUserRoles') Or 'BaseDataAdmin' In Set('CurrentUserRoles')` |
| APP_SickLeave | APP_ReadPermission | HR-Administratoren, Abteilungsleiter (für ihre Abteilung) und Benutzer (für ihre eigenen Datensätze) können Krankenstände lesen | `'HumanResourcesAdmin' In Set('CurrentUserRoles') Or ('DepartmentLead' In Set('CurrentUserRoles') And Current.UserDetail.Department In Set('APP_MyDepartmentsAsLead')) Or ('User' In Set('CurrentUserRoles', 'Code') And Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid)` |
| APP_SickLeave | APP_WritePermission | HR-Administratoren können nach dem Buchungsabschlussdatum schreiben; Benutzer können ihre eigenen Datensätze schreiben, wenn sie nicht genehmigt sind und nach dem Buchungsabschlussdatum liegen | `'HumanResourcesAdmin' In Set('CurrentUserRoles') And :Date(Current.BeginTime) > :GetBookingCompletionDate() Or ('User' In Set('CurrentUserRoles') And Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid And (Current.APP_IsApproved=False Or Current.UserDetail.APP_IsAbsenceApprovalRequired <> True) And :Date(Current.BeginTime) > :GetBookingCompletionDate())` |
| APP_Task | APP_WritePermission | Abrechnungsadministratoren, Stammdatenadministratoren und Projektleiter (für ihre Projekte) können Tätigkeiten schreiben | `'BillingAdmin' In Set('CurrentUserRoles') Or 'BaseDataAdmin' In Set('CurrentUserRoles') Or ('ProjectManager' In Set('CurrentUserRoles') And (Current.APP_Project.APP_Manager1 = Environment.CurrentUser.UserDetailUuid Or Current.APP_Project.APP_Manager2 = Environment.CurrentUser.UserDetailUuid))` |
| APP_TemplateQuery | APP_WritePermission | Stammdatenadministratoren können Abfragevorlagen schreiben | `'BaseDataAdmin' In Set('CurrentUserRoles')` |
| APP_Timesheet | APP_ReadPermission | Abrechnungsadministratoren, HR-Administratoren und Projektcontroller können alle lesen; Benutzer können ihre eigenen lesen; Abteilungsleiter und Projektleiter können die jeweiligen Zeitbuchungen lesen | `'BillingAdmin' In Set('CurrentUserRoles') Or 'HumanResourcesAdmin' In Set('CurrentUserRoles') Or 'ProjectController' In Set('CurrentUserRoles') Or ('User' In Set('CurrentUserRoles') And (Current.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.APP_UserDetailUuid Or ('DepartmentLead' In Set('CurrentUserRoles') And Current.APP_UserDetail.Department In Set('APP_MyDepartmentsAsLead')) Or ('ProjectManager' In Set('CurrentUserRoles') And (Current.APP_Project.APP_Manager1 = Environment.CurrentUser.APP_UserDetailUuid Or Current.APP_Project.APP_Manager2 = Environment.CurrentUser.APP_UserDetailUuid))))` |
| APP_Timesheet | APP_WritePermission | HR-Administratoren können nach dem Buchungsabschlussdatum schreiben; Benutzer können ihre eigenen nach dem Buchungsabschlussdatum schreiben | `'HumanResourcesAdmin' In Set('CurrentUserRoles') And :Date(Current.BeginTime) > :GetBookingCompletionDate() Or ('User' In Set('CurrentUserRoles') And Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid And :Date(Current.BeginTime) > :GetBookingCompletionDate())` |
| APP_TimesheetSuggestion | APP_ReadPermission | Benutzer können Buchungsvorschläge lesen, die sie gesendet oder erhalten haben | `Current.APP_Sender.APP_UserDetailUuid = Environment.CurrentUser.UserDetailUuid Or Current.APP_Receiver.APP_UserDetailUuid = Environment.CurrentUser.UserDetailUuid` |
| APP_TimesheetSuggestion | APP_WritePermission | Buchungsvorschläge können nicht direkt geschrieben werden | `1 = 0` |
| APP_TimesheetTemplate | APP_ReadPermission | Stammdatenadministratoren können alle lesen; Benutzer können ihre eigenen Musterbuchungen lesen | `'BaseDataAdmin' In Set('CurrentUserRoles') Or Current.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.APP_UserDetailUuid` |
| APP_TimesheetTemplate | APP_WritePermission | Benutzer können ihre eigenen Musterbuchungen schreiben | `Current.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.APP_UserDetailUuid` |
| APP_Unit | APP_WritePermission | Stammdaten- und Abrechnungsadministratoren können Einheiten schreiben | `'BaseDataAdmin' In Set('CurrentUserRoles') Or 'BillingAdmin' In Set('CurrentUserRoles')` |
| APP_UserDetail | APP_ReadPermission | Kontoadministratoren, HR-Administratoren, Abrechnungsadministratoren, Stammdatenadministratoren und Projektcontroller können alle lesen; Benutzer können ihre eigenen lesen; Abteilungsleiter können die Mitarbeiter ihrer Abteilung lesen | `'AccountAdmin' In Set('CurrentUserRoles') Or 'HumanResourcesAdmin' In Set('CurrentUserRoles') Or 'BillingAdmin' In Set('CurrentUserRoles') Or 'BaseDataAdmin' In Set('CurrentUserRoles') Or 'ProjectController' In Set('CurrentUserRoles') Or ('User' In Set('CurrentUserRoles', 'Code') And (Current.UserDetailUuid = Environment.CurrentUser.UserDetailUuid Or ('DepartmentLead' In Set('CurrentUserRoles') And Current.Department In Set('APP_MyDepartmentsAsLead'))))` |
| APP_UserDetail | APP_WritePermission | HR-Administratoren und Kontoadministratoren können Benutzerdetails schreiben; Benutzer können ihre eigenen schreiben | `'HumanResourcesAdmin' In Set('CurrentUserRoles') Or 'AccountAdmin' In Set('CurrentUserRoles') Or ('User' In Set('CurrentUserRoles', 'Code') And Current.UserDetailUuid = Environment.CurrentUser.UserDetailUuid)` |
| APP_UserDetailRole | APP_PreventUserDeletingOwnAdminRole | Kontoadministratoren können ihre eigene Rolle Account Admin nicht löschen | `'AccountAdmin' In Set('CurrentUserRoles', 'Code') And ((Current.UserRole.Code = 'AccountAdmin' And Current.APP_UserDetail.APP_UserDetailUuid <> Environment.CurrentUser.APP_UserDetailUuid) Or (Current.UserRole.Code <> 'AccountAdmin'))` |
| APP_UserDetailRole | APP_ReadPermission | Kontoadministratoren können alle Rollenzuordnungen lesen; Benutzer können ihre eigenen lesen | `'AccountAdmin' In Set('CurrentUserRoles') Or (Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid)` |
| APP_UserRole | APP_DeletePermission | Geschützte Rollen können nicht gelöscht werden | `Current.Code Not In('User', 'Admin', 'AccountAdmin', 'BaseDataAdmin', 'NotificationManager')` |
| APP_UserRole | APP_InsertPermission | Kontoadministratoren können Benutzerrollen anlegen | `'AccountAdmin' In Set('CurrentUserRoles')` |
| APP_UserRole | APP_ReadPermission | Alle Benutzer können Benutzerrollen lesen | `1=1` |
| APP_UserRole | APP_UpdatePermission | Kontoadministratoren können Benutzerrollen aktualisieren | `'AccountAdmin' In Set('CurrentUserRoles')` |
| APP_Vacation | APP_ReadPermission | HR-Administratoren, Abteilungsleiter (für ihre Abteilung) und Benutzer (für ihre eigenen Datensätze) können Urlaube lesen | `'HumanResourcesAdmin' In Set('CurrentUserRoles') Or ('DepartmentLead' In Set('CurrentUserRoles') And Current.UserDetail.Department In Set('APP_MyDepartmentsAsLead')) Or ('User' In Set('CurrentUserRoles', 'Code') And Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid)` |
| APP_Vacation | APP_WritePermission | HR-Administratoren können nach dem Buchungsabschlussdatum schreiben; Benutzer können ihre eigenen Datensätze schreiben, wenn sie nicht genehmigt sind und nach dem Buchungsabschlussdatum liegen | `'HumanResourcesAdmin' In Set('CurrentUserRoles') And :Date(Current.BeginTime) > :GetBookingCompletionDate() Or ('User' In Set('CurrentUserRoles') And Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid And (Current.APP_IsApproved=False Or Current.UserDetail.APP_IsAbsenceApprovalRequired <> True) And :Date(Current.BeginTime) > :GetBookingCompletionDate())` |
| APP_VacationEntitlement | APP_ReadPermission | HR-Administratoren, Abteilungsleiter (für ihre Abteilung) und Benutzer (für ihre eigenen Datensätze) können Urlaubsansprüche lesen | `'HumanResourcesAdmin' In Set('CurrentUserRoles') Or ('DepartmentLead' In Set('CurrentUserRoles') And Current.UserDetail.Department In Set('APP_MyDepartmentsAsLead')) Or ('User' In Set('CurrentUserRoles', 'Code') And Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid)` |
| APP_VacationEntitlement | APP_WritePermission | HR-Administratoren können Urlaubsansprüche schreiben | `'HumanResourcesAdmin' In Set('CurrentUserRoles')` |
| APP_WeeklyHoursOfWork | APP_ReadPermission | HR-Administratoren, Abteilungsleiter (für ihre Abteilung) und Benutzer (für ihre eigenen Datensätze) können die Wochenarbeitszeit lesen | `'HumanResourcesAdmin' In Set('CurrentUserRoles') Or ('DepartmentLead' In Set('CurrentUserRoles') And Current.UserDetail.Department In Set('APP_MyDepartmentsAsLead')) Or ('User' In Set('CurrentUserRoles', 'Code') And Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid)` |
| APP_WeeklyHoursOfWork | APP_WritePermission | HR-Administratoren können die Wochenarbeitszeit schreiben | `'HumanResourcesAdmin' In Set('CurrentUserRoles')` |
| APP_WorkingTimeLimit | APP_WritePermission | HR-Administratoren können Höchstarbeitszeiten schreiben, die nicht vorkonfiguriert sind | `'HumanResourcesAdmin' In Set('CurrentUserRoles') And Current.IsPreConfigured <> True` |
| APP_WorkingTimeWeight | APP_WritePermission | HR-Administratoren können Arbeitszeitgewichtungen schreiben | `'HumanResourcesAdmin' In Set('CurrentUserRoles')` |
