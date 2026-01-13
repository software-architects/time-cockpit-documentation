# update default permissions
- we already have a section about standard permissions
- in the latest datamodel update, we added new features regarding standard permissions
- we need to update the documentation accordingly
- consider the file doc/employee-time-tracking/default-permissions.md#
- also consider this 

## Bisherige Standard-Berechtigungen:
```

Die bisherigen Standardberechtigungen umfassten nur eine minimale Umsetzung. Detailliertere Berechtigungen konnten selbst konfiguriert werden.
 
Tenant Admin:

Verwalten der Account Settings 
Download der Lizenzrechnungen
Benutzer hinzufügen/sperren
Admin:

Verwaltung der Rollen
Verwaltung der Rollen-Benutzer-Zuordnung
Anpassung das Datenmodells
Ausführen von TCQL-Abfragen
Verwaltung der globalen Einstellungen
Time Tracking User:

Uneingeschränkte Lese/Schreibrechte auf den restlichen Funktionsumfang 
 
Neue Standard-Berechtigungen
Die neuen Standardberechtigungen wurden um neue Rollen erweitert. Die Anpassung dieser Standard-Berechtigungen ist durch Deaktivierung von einzelnen Standardberechtigungen und die Erstellung von selbst Konfigurierbaren Berechtigungen immer noch möglich. 
Bei neuen time cockpit Kunden sind die Standard-Berechtigungen bereits aktiviert. 
Bestandskunden die Ihren Account vor dem 10.12.2025 hatten sind die neue Standardberechtigungen bewusst NICHT automatisch aktiviert. Bei Bedarf können Sie das gerne via Mail an support@timecockpit.com aktivieren lassen. Hierbei ist zu beachten, dass eventuell bereits individuelle Berechtigungen konfiguriert wurden welche mit den Standardberechtigungen abgeglichen werden müssen.

Account Admin:

Verwalten der Account Settings 
Download der Lizenzrechnungen
Benutzer hinzufügen/sperren
Verwaltung der Rollen
Verwaltung der Rollen-Benutzer-Zuordnung
Customization Admin:

Anpassung des Datenmodells
Ausführen von TCQL-Abfragen
Base Data Admin:

Verwaltung der globalen Einstellungen
Verwaltung der globalen Formatprofile
Verwaltung der Importdefinitionen
Verwaltung der Musterabfragen
Verwaltung verschiedener Stammdatentabellen (Kunden, Projekte, Länder, Verkehrsmittel, Abteilungen, Feiertagskalender, Gesellschaften, Artikel und Einheiten)
Billing Admin:

Verwaltung von Gesellschaften und Rechnungen
Verwaltung von Artikeln und Einheiten
Department Lead

Freigeben/Ablehnen der Abwesenheiten der Mitarbeiter ihrer Abteilung
Human Resources Admin

Verwaltung Benutzerdaten und deren Sollarbeitszeiten und Abteilungen
Verwaltung der Abwesenheitszeiten (Urlaub, Zeitausgleich, Krankenurlaub) innerhalb der geöffneten Buchungsperiode. 
Verwaltung der Feiertagskalender
Verwaltung der Zeiterfassung innerhalb der geöffneten Buchungsperiode
Verwaltung des Urlaubanspruchs und der Überstundenkorrekturen
Verwaltung der Höchstarbeitszeiten und Arbeitszeitgewichtungen
Project Controller

Leserecht auf alle Zeitbuchungen
Project Manager

Leserecht auf alle Zeitbuchungen ihrer Projekte (als Projektleiter oder Projektleiter-Stellvertreter)
Time Tracking User

Verwaltung der eigenen Zeiterfassung und Abwesenheitszeiten innerhalb der geöffneten Buchungsperiode
Verwaltung von Tätigkeiten
Notification Manager

Verwaltung und Senden von Anwendungs-Benachrichtigungen

Offene Punkte:

Rolle "Notification Manager" solange wir keine UI haben in der die Benutzet mit nur dieser Rolle Nachrichten verwalten können benötigt man auch die Rolle Customization Admin
```

- compare the current state of the documentation with the provided text
- identify any missing roles or permissions or mistakes, disambiguities, logical mistakes etc.

# Datamodel Permissions
- also here is an excerpt of the datamodel and the technical permissions writtein in TCQL:

# ANALYSIS FINDINGS

## Missing Standard Roles in Current Documentation

The current documentation at doc/employee-time-tracking/default-permissions.md is MISSING three standard roles that are present in both the German specification text and the technical TCQL permissions:

### 1. Project Controller
**Permissions from TCQL analysis:**
- Read access to all timesheets (APP_Timesheet read permission)
- Read access to invoices and invoice details (APP_Invoice, APP_InvoiceDetail read permission)
- Read access to user details (APP_UserDetail read permission)

**Purpose:** Users who need oversight of all project-related time tracking and billing data

### 2. Project Manager  
**Permissions from TCQL analysis:**
- Read access to timesheets for projects they manage (as Manager1 or Manager2)
- Read access to invoices/invoice details for their projects
- Update permission on projects they manage (APP_Project update permission)
- Write permission on tasks for their projects (APP_Task write permission)

**Purpose:** Users who manage specific projects and need to view/manage data for those projects only

### 3. Department Lead
**Permissions from TCQL analysis:**
- Read access to absences (vacation, sick leave, compensatory time) for employees in their department(s)
- Approve/reject absences for employees in their department (based on German text)
- Read access to user details, overtime corrections, vacation entitlements, weekly hours of work for their department employees
- Read access to timesheets for their department employees

**Purpose:** Department managers who need to approve absences and monitor time tracking for their team members

## Additional Findings

### Inconsistencies/Ambiguities:
- "Billing Admin" role includes read access to all user timesheets (via APP_Timesheet read permission) - not explicitly mentioned in German text
- "Human Resources Admin" can also read all timesheets (APP_Timesheet read permission) - mentioned in German text but scope not fully clear
- "Department Lead" approval rights for absences mentioned in German text but technical implementation shows read-only permissions - approval logic may be in UI layer
- Date "10.12.2025" mentioned as cutoff date is in the past (current date is January 2026)

### Open Issues from German Text:
- "Notification Manager" role requires "Customization Admin" role until UI is available - this limitation should be documented

```
APP_Article
APP_ReadPermission
:Iif('BaseDataAdmin' In Set('CurrentUserRoles')

     Or 'BillingAdmin' In Set('CurrentUserRoles'), 

        True, 

        False

    ) = True
-------------------------------------
APP_Article
APP_WritePermission
:Iif('BaseDataAdmin' In Set('CurrentUserRoles')

     Or 'BillingAdmin' In Set('CurrentUserRoles'), 

        True, 

        False

    ) = True
-------------------------------------
APP_CalendarWeekRule
APP_WriteCalendarWeekRule
0 = 1
-------------------------------------
APP_Company
APP_WritePermission
:Iif('BaseDataAdmin' In Set('CurrentUserRoles')

     Or 'BillingAdmin' In Set('CurrentUserRoles'), 

        True, 

        False

    ) = True
-------------------------------------
APP_CompensatoryTime
APP_ReadPermission
:Iif('HumanResourcesAdmin' In Set('CurrentUserRoles') Or ('DepartmentLead' In Set('CurrentUserRoles') And Current.UserDetail.Department In Set('APP_MyDepartmentsAsLead')),

     True, 

     :Iif('User' In Set('CurrentUserRoles', 'Code'), 

          :Iif(Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid, True, False), 

		False)

    ) = True
-------------------------------------
APP_CompensatoryTime
APP_WritePermission
:Iif('HumanResourcesAdmin' In Set('CurrentUserRoles'), 

        :Iif(:Date(Current.BeginTime) > :Iif(Current.UserDetail.DeviatingBookingCompletionDate <> Null And Current.UserDetail.AllowDeviatingBookingCompletionDateUntil >= :Today(), Current.UserDetail.DeviatingBookingCompletionDate, :GetBookingCompletionDate()), True, False), 

        :Iif('User' In Set('CurrentUserRoles'), 

             :Iif(Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid And (Current.APP_IsApproved=False Or Current.UserDetail.APP_IsAbsenceApprovalRequired <> True) And :Date(Current.BeginTime) > :Iif(Current.UserDetail.DeviatingBookingCompletionDate <> Null And Current.UserDetail.AllowDeviatingBookingCompletionDateUntil >= :Today(), Current.UserDetail.DeviatingBookingCompletionDate, :GetBookingCompletionDate()), True, False), 

             False)

    ) = True
-------------------------------------
APP_Country
APP_WritePermission
:Iif('BaseDataAdmin' In Set('CurrentUserRoles')

     Or 'BillingAdmin' In Set('CurrentUserRoles'), 

        True, 

        False

    ) = True
-------------------------------------
APP_CultureInfo
APP_WriteCultureInfo
:GetIsInSystemMode()
-------------------------------------
APP_Customer
APP_WritePermission
:Iif('BaseDataAdmin' In Set('CurrentUserRoles')

     Or 'BillingAdmin' In Set('CurrentUserRoles'), 

        True, 

        False

    ) = True
-------------------------------------
APP_Department
APP_WritePermission
:Iif('BaseDataAdmin' In Set('CurrentUserRoles')

     Or 'HumanResourcesAdmin' In Set('CurrentUserRoles'), 

        True, 

        False

    ) = True
-------------------------------------
APP_DepartmentLead
APP_WritePermission
:Iif('BaseDataAdmin' In Set('CurrentUserRoles')

     Or 'HumanResourcesAdmin' In Set('CurrentUserRoles'), 

        True, 

        False

    ) = True
-------------------------------------
APP_FeatureFlag
APP_WritePermission
:Iif('Admin' In Set('CurrentUserRoles'), True, False) = True
-------------------------------------
APP_FormattingProfile
APP_ReadPermission
:Iif(Current.APP_UserDetail = Null Or Current.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.UserDetailUuid, True, False) = True
-------------------------------------
APP_FormattingProfile
APP_WritePermission
:Iif('BaseDataAdmin' In Set('CurrentUserRoles'),

     :Iif(Current.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.APP_UserDetailUuid Or Current.APP_UserDetail = Null, True, False),

     :Iif(Current.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.APP_UserDetailUuid, True, False)

    ) = True
-------------------------------------
APP_FormattingProfileColor
APP_ReadPermission
:Iif(Current.APP_FormattingProfile.APP_UserDetail = Null Or Current.APP_FormattingProfile.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.UserDetailUuid, True, False) = True
-------------------------------------
APP_FormattingProfileColor
APP_WritePermission
:Iif('BaseDataAdmin' In Set('CurrentUserRoles'),

     :Iif(Current.APP_FormattingProfile.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.APP_UserDetailUuid Or Current.APP_FormattingProfile.APP_UserDetail = Null, True, False),

     :Iif(Current.APP_FormattingProfile.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.APP_UserDetailUuid, True, False)

    ) = True
-------------------------------------
APP_GlobalSettings
APP_WritePermission
:Iif('BaseDataAdmin' In Set('CurrentUserRoles'), 

     True, 

     False

    ) = True
-------------------------------------
APP_ImportDefinition
APP_WritePermission
:Iif('BaseDataAdmin' In Set('CurrentUserRoles'), 

        True, 

        False

    ) = True
-------------------------------------
APP_Invoice
APP_ReadPermission
:Iif(   'BillingAdmin' In Set('CurrentUserRoles')

     Or 'ProjectController' In Set('CurrentUserRoles'), 

        True, 

        :Iif('ProjectManager' In Set('CurrentUserRoles'),

             :Iif(Current.APP_Project.APP_Manager1 = Environment.CurrentUser.UserDetailUuid Or Current.APP_Project.APP_Manager2 = Environment.CurrentUser.UserDetailUuid, True, False),

             False)

    ) = True
-------------------------------------
APP_Invoice
APP_WritePermission
:Iif('BillingAdmin' In Set('CurrentUserRoles'), 

        True, 

        False

    ) = True
-------------------------------------
APP_InvoiceDetail
APP_ReadPermission
:Iif(   'BillingAdmin' In Set('CurrentUserRoles')

     Or 'ProjectController' In Set('CurrentUserRoles'), 

        True, 

        :Iif('ProjectManager' In Set('CurrentUserRoles'),

             :Iif(Current.APP_Invoice.APP_Project.APP_Manager1 = Environment.CurrentUser.UserDetailUuid Or Current.APP_Invoice.APP_Project.APP_Manager2 = Environment.CurrentUser.UserDetailUuid, True, False),

             False)

    ) = True
-------------------------------------
APP_InvoiceDetail
APP_WritePermission
:Iif('BillingAdmin' In Set('CurrentUserRoles'), 

        True, 

        False

    ) = True
-------------------------------------
APP_InvoiceNumber
APP_ReadPermission
:Iif(   'BaseDataAdmin' In Set('CurrentUserRoles')

     Or 'BillingAdmin' In Set('CurrentUserRoles'), 

        True, 

        False

    ) = True  
-------------------------------------
APP_InvoiceNumber
APP_WritePermission
:Iif(   'BaseDataAdmin' In Set('CurrentUserRoles')

     Or 'BillingAdmin' In Set('CurrentUserRoles'), 

        True, 

        False

    ) = True  
-------------------------------------
APP_LegalHoliday
APP_WritePermission
:Iif(   'BaseDataAdmin' In Set('CurrentUserRoles')

     Or 'HumanResourcesAdmin' In Set('CurrentUserRoles'), 

        True, 

        False

    ) = True
-------------------------------------
APP_LegalHolidayCalendar
APP_WritePermission
:Iif(   'BaseDataAdmin' In Set('CurrentUserRoles')

     Or 'HumanResourcesAdmin' In Set('CurrentUserRoles'), 

        True, 

        False

    ) = True
-------------------------------------
APP_MeansOfTransport
APP_WritePermission
:Iif('BaseDataAdmin' In Set('CurrentUserRoles'), 

        True, 

        False

    ) = True
-------------------------------------
APP_Notification
APP_ReadPermission
:Iif('NotificationManager' In Set('CurrentUserRoles') Or Current.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.UserDetailUuid, 

     True, 

     False

    ) = True
-------------------------------------
APP_Notification
APP_WritePermission
:Iif('NotificationManager' In Set('CurrentUserRoles'), 

     True, 

     False

    ) = True
-------------------------------------
APP_NotificationState
APP_ReadPermission
:Iif('NotificationManager' In Set('CurrentUserRoles') Or Current.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.UserDetailUuid, 

     True, 

     False

    ) = True
-------------------------------------
APP_NotificationState
APP_WritePermission
:Iif('NotificationManager' In Set('CurrentUserRoles') Or Current.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.UserDetailUuid, 

     True, 

     False

    ) = True
-------------------------------------
APP_OvertimeCorrection
APP_ReadPermission
:Iif('HumanResourcesAdmin' In Set('CurrentUserRoles') Or ('DepartmentLead' In Set('CurrentUserRoles') And Current.UserDetail.Department In Set('APP_MyDepartmentsAsLead')),

     True, 

     :Iif('User' In Set('CurrentUserRoles', 'Code'), 

          :Iif(Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid, True, False), 

		False)

    ) = True
-------------------------------------
APP_OvertimeCorrection
APP_WritePermission
:Iif('HumanResourcesAdmin' In Set('CurrentUserRoles'), 

        True, 

        False

    ) = True
-------------------------------------
APP_Project
APP_UpdatePermission
:Iif('ProjectManager' In Set('CurrentUserRoles'),

     :Iif(Current.APP_Manager1 = Environment.CurrentUser.UserDetailUuid Or Current.APP_Manager2 = Environment.CurrentUser.UserDetailUuid, True, False),

     False) = True	
-------------------------------------
APP_Project
APP_WritePermission
:Iif('BillingAdmin' In Set('CurrentUserRoles') Or 'BaseDataAdmin' In Set('CurrentUserRoles'), 

     True, 

     False

	) = True
-------------------------------------
APP_SickLeave
APP_ReadPermission
:Iif('HumanResourcesAdmin' In Set('CurrentUserRoles') Or ('DepartmentLead' In Set('CurrentUserRoles') And Current.UserDetail.Department In Set('APP_MyDepartmentsAsLead')),

     True, 

     :Iif('User' In Set('CurrentUserRoles', 'Code'), 

          :Iif(Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid, True, False), 

		False)

    ) = True
-------------------------------------
APP_SickLeave
APP_WritePermission
:Iif('HumanResourcesAdmin' In Set('CurrentUserRoles'), 

        :Iif(:Date(Current.BeginTime) > :Iif(Current.UserDetail.DeviatingBookingCompletionDate <> Null And Current.UserDetail.AllowDeviatingBookingCompletionDateUntil >= :Today(), Current.UserDetail.DeviatingBookingCompletionDate, :GetBookingCompletionDate()), True, False), 

        :Iif('User' In Set('CurrentUserRoles'), 

             :Iif(Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid And (Current.APP_IsApproved=False Or Current.UserDetail.APP_IsAbsenceApprovalRequired <> True) And :Date(Current.BeginTime) > :Iif(Current.UserDetail.DeviatingBookingCompletionDate <> Null And Current.UserDetail.AllowDeviatingBookingCompletionDateUntil >= :Today(), Current.UserDetail.DeviatingBookingCompletionDate, :GetBookingCompletionDate()), True, False), 

             False)

    ) = True
-------------------------------------
APP_Task
APP_WritePermission
:Iif('BillingAdmin' In Set('CurrentUserRoles') Or 

     'BaseDataAdmin' In Set('CurrentUserRoles') Or 

     ('ProjectManager' In Set('CurrentUserRoles') And (Current.APP_Project.APP_Manager1 = Environment.CurrentUser.UserDetailUuid Or Current.APP_Project.APP_Manager2 = Environment.CurrentUser.UserDetailUuid)),

	 True, False) = True
-------------------------------------
APP_TemplateQuery
APP_WritePermission
:Iif('BaseDataAdmin' In Set('CurrentUserRoles'), 

     True, 

     False

    ) = True
-------------------------------------
APP_Timesheet
APP_ReadPermission
:Iif(   'BillingAdmin' In Set('CurrentUserRoles')

     Or 'HumanResourcesAdmin' In Set('CurrentUserRoles')

	 Or 'ProjectController' In Set('CurrentUserRoles'),

     True,

     :Iif('User' In Set('CurrentUserRoles'),

         :Iif(Current.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.APP_UserDetailUuid Or 

               ('DepartmentLead' In Set('CurrentUserRoles') And Current.APP_UserDetail.Department In Set('APP_MyDepartmentsAsLead')) Or 

               ('ProjectManager' In Set('CurrentUserRoles') And (Current.APP_Project.APP_Manager1 = Environment.CurrentUser.APP_UserDetailUuid Or Current.APP_Project.APP_Manager2 = Environment.CurrentUser.APP_UserDetailUuid)),

               True, 

               False

              ), 

          False

         )

     ) = True
-------------------------------------
APP_Timesheet
APP_WritePermission
:Iif('HumanResourcesAdmin' In Set('CurrentUserRoles'), 

        :Iif(:Date(Current.BeginTime) > :Iif(Current.UserDetail.DeviatingBookingCompletionDate <> Null And Current.UserDetail.AllowDeviatingBookingCompletionDateUntil >= :Today(), Current.UserDetail.DeviatingBookingCompletionDate, :GetBookingCompletionDate()), True, False), 

        :Iif('User' In Set('CurrentUserRoles'), 

             :Iif(Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid And :Date(Current.BeginTime) > :Iif(Current.UserDetail.DeviatingBookingCompletionDate <> Null And Current.UserDetail.AllowDeviatingBookingCompletionDateUntil >= :Today(), Current.UserDetail.DeviatingBookingCompletionDate, :GetBookingCompletionDate()), True, False), 

             False)

    ) = True
-------------------------------------
APP_TimesheetSuggestion
APP_ReadPermission
Current.APP_Sender.APP_UserDetailUuid = Environment.CurrentUser.UserDetailUuid Or Current.APP_Receiver.APP_UserDetailUuid = Environment.CurrentUser.UserDetailUuid
-------------------------------------
APP_TimesheetSuggestion
APP_WritePermission
1 = 0
-------------------------------------
APP_TimesheetTemplate
APP_ReadPermission
:Iif('BaseDataAdmin' In Set('CurrentUserRoles') Or Current.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.APP_UserDetailUuid, 

     True, 

     False

    ) = True
-------------------------------------
APP_TimesheetTemplate
APP_WritePermission
:Iif(Current.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.APP_UserDetailUuid, 

     True, 

     False

    ) = True
-------------------------------------
APP_Unit
APP_WritePermission
:Iif(   'BaseDataAdmin' In Set('CurrentUserRoles')

     Or 'BillingAdmin' In Set('CurrentUserRoles'), 

        True, 

        False

    ) = True
-------------------------------------
APP_UserDetail
APP_ReadPermission
:Iif(   'AccountAdmin' In Set('CurrentUserRoles') 

     Or 'HumanResourcesAdmin' In Set('CurrentUserRoles')

     Or 'BillingAdmin' In Set('CurrentUserRoles')

     Or 'BaseDataAdmin' In Set('CurrentUserRoles')

     Or 'ProjectController' In Set('CurrentUserRoles'), 

	    True, 

	    :Iif('User' In Set('CurrentUserRoles', 'Code'), 

	       :Iif(Current.UserDetailUuid = Environment.CurrentUser.UserDetailUuid Or ('DepartmentLead' In Set('CurrentUserRoles') And Current.Department In Set('APP_MyDepartmentsAsLead')), True, False), 

	       False

		   )

	 ) = True
-------------------------------------
APP_UserDetail
APP_WritePermission
:Iif(   'HumanResourcesAdmin' In Set('CurrentUserRoles')

     Or 'AccountAdmin' In Set('CurrentUserRoles'), 

     True, 

     :Iif('User' In Set('CurrentUserRoles', 'Code'), 

          :Iif(Current.UserDetailUuid = Environment.CurrentUser.UserDetailUuid, True, False), 

          False)

     ) = True
-------------------------------------
APP_UserDetailRole
APP_PreventUserDeletingOwnAdminRole
('AccountAdmin' In Set('CurrentUserRoles', 'Code') And ((Current.UserRole.Code = 'AccountAdmin' And Current.APP_UserDetail.APP_UserDetailUuid <> Environment.CurrentUser.APP_UserDetailUuid) Or (Current.UserRole.Code <> 'AccountAdmin')))
-------------------------------------
APP_UserDetailRole
APP_ReadPermission
:Iif('AccountAdmin' In Set('CurrentUserRoles'),

        True,

        :Iif(Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid, True, False)

    ) = True
-------------------------------------
APP_UserRole
APP_DeletePermission
Current.Code Not In('User', 'Admin', 'AccountAdmin', 'BaseDataAdmin', 'NotificationManager')
-------------------------------------
APP_UserRole
APP_InsertPermission
:Iif('AccountAdmin' In Set('CurrentUserRoles'), 

     True, 

     False

    ) = True
-------------------------------------
APP_UserRole
APP_ReadPermission
1=1
-------------------------------------
APP_UserRole
APP_UpdatePermission
:Iif('AccountAdmin' In Set('CurrentUserRoles'), 

     True, 

     False

    ) = True
-------------------------------------
APP_Vacation
APP_ReadPermission
:Iif('HumanResourcesAdmin' In Set('CurrentUserRoles') Or ('DepartmentLead' In Set('CurrentUserRoles') And Current.UserDetail.Department In Set('APP_MyDepartmentsAsLead')),

     True, 

     :Iif('User' In Set('CurrentUserRoles', 'Code'), 

          :Iif(Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid, True, False), 

		False)

    ) = True
-------------------------------------
APP_Vacation
APP_WritePermission
:Iif('HumanResourcesAdmin' In Set('CurrentUserRoles'), 

        :Iif(:Date(Current.BeginTime) > :Iif(Current.UserDetail.DeviatingBookingCompletionDate <> Null And Current.UserDetail.AllowDeviatingBookingCompletionDateUntil >= :Today(), Current.UserDetail.DeviatingBookingCompletionDate, :GetBookingCompletionDate()), True, False), 

        :Iif('User' In Set('CurrentUserRoles'), 

             :Iif(Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid And (Current.APP_IsApproved=False Or Current.UserDetail.APP_IsAbsenceApprovalRequired <> True) And :Date(Current.BeginTime) > :Iif(Current.UserDetail.DeviatingBookingCompletionDate <> Null And Current.UserDetail.AllowDeviatingBookingCompletionDateUntil >= :Today(), Current.UserDetail.DeviatingBookingCompletionDate, :GetBookingCompletionDate()), True, False), 

             False)

    ) = True
-------------------------------------
APP_VacationEntitlement
APP_ReadPermission
:Iif('HumanResourcesAdmin' In Set('CurrentUserRoles') Or ('DepartmentLead' In Set('CurrentUserRoles') And Current.UserDetail.Department In Set('APP_MyDepartmentsAsLead')),

     True, 

     :Iif('User' In Set('CurrentUserRoles', 'Code'), 

          :Iif(Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid, True, False), 

		False)

    ) = True
-------------------------------------
APP_VacationEntitlement
APP_WritePermission
:Iif('HumanResourcesAdmin' In Set('CurrentUserRoles'), 

        True, 

        False

    ) = True
-------------------------------------
APP_WeeklyHoursOfWork
APP_ReadPermission
:Iif('HumanResourcesAdmin' In Set('CurrentUserRoles') Or ('DepartmentLead' In Set('CurrentUserRoles') And Current.UserDetail.Department In Set('APP_MyDepartmentsAsLead')),

     True, 

     :Iif('User' In Set('CurrentUserRoles', 'Code'), 

          :Iif(Current.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid, True, False), 

		False)

    ) = True
-------------------------------------
APP_WeeklyHoursOfWork
APP_WritePermission
:Iif('HumanResourcesAdmin' In Set('CurrentUserRoles'), 

        True, 

        False

    ) = True
-------------------------------------
APP_WorkingTimeLimit
APP_WritePermission
:Iif('HumanResourcesAdmin' In Set('CurrentUserRoles') And Current.IsPreConfigured <> True, 

     True, 

     False

    ) = True
-------------------------------------
APP_WorkingTimeWeight
APP_WritePermission
:Iif('HumanResourcesAdmin' In Set('CurrentUserRoles'), 

        True, 

        False

    ) = True
-------------------------------------

```

- i want you to check if the documentation that would result from the provided text is complete and correct based on the provided technical permissions and the previous documentation
- from the datamodel permissions generate a table with the following format
- Entityname | Permissionname | prosa descirption of permission | Condition/Logic