## Documentation terms (curated, binding)

Product and role names as used in the German product UI and on www.timecockpit.com. Terms marked "unchanged" stay English in German text.

| English | German | Notes |
|---|---|---|
| time cockpit | time cockpit | unchanged, lowercase; "Time Cockpit" only where the English source capitalizes at sentence start |
| Time Sheet Calendar | Zeiterfassungskalender | module and list name |
| timesheet, time sheet entry, timesheet entry | Zeitbuchung (pl. Zeitbuchungen) | "Zeiterfassung" for the activity, "Zeitbuchung" for the record |
| Timesheets (list) | Zeitbuchungen | |
| Timesheet module | Modul Zeiterfassung | navigation: **Zeiterfassung** |
| Management module | Modul Verwaltung | navigation: **Verwaltung** |
| User module | Modul Benutzer | navigation: **Benutzer** |
| Administration module | Modul Administration | |
| project-based time tracking | projektbezogene Zeiterfassung | |
| attendance time tracking | Anwesenheitszeiterfassung | |
| working time | Arbeitszeit | |
| Weekly Hours of Work | Wochenarbeitszeit | entity name; hours per weekday |
| working time model | Arbeitszeitmodell | |
| working time regulations / limits | Arbeitszeitregelungen / Arbeitszeitgrenzen | legal concept; the list/entity Working Time Limit is **Höchstarbeitszeit** |
| working time violation | Arbeitszeitverletzung | product term |
| overtime | Überstunden | |
| compensatory time (off) | Zeitausgleich | |
| vacation | Urlaub | |
| vacation entitlement | Urlaubsanspruch | |
| sick leave | Krankenstand | Austrian usage, matches the product UI |
| absence, time off | Abwesenheit | |
| absence time management | Abwesenheitsverwaltung | |
| approval workflow | Genehmigungsworkflow | |
| approver | genehmigende Person | avoid "Genehmiger" |
| booking completion date | Buchungsabschlussdatum | |
| customer / project / task | Kunde / Projekt / Tätigkeit | product term (data model and web client); "Aufgabe" only in the generic sense |
| budgetary control | Budgetkontrolle | |
| billable | verrechenbar | |
| billing, invoicing | Rechnungslegung, Verrechnung | "Rechnungslegung" as topic name, "verrechnen" as verb |
| invoice, invoice item | Rechnung, Rechnungsposition | |
| article | Artikel | invoicing article |
| hourly rate | Stundensatz | |
| time report | Stundenzettel | product report name; "Print Time Reports" = Stundenzettel drucken |
| report, reporting | Bericht, Berichte | |
| built-in reports | integrierte Berichte | |
| print view | Druckansicht | |
| data exchange, import, export | Datenaustausch, Import, Export | |
| signal, signal tracker | Signal, Signal Tracker | "Signal Tracker" unchanged |
| formatting profile | Formatprofil | |
| timesheet template, Time Sheet Templates | Musterbuchung, Musterbuchungen | product UI label |
| share (timesheet entries), timesheet suggestion | teilen, Buchungsvorschlag | the UI label "Share -> Anteil" below is the financial share, not this |
| Customization module | Modul Anpassung | navigation: **Anpassung** |
| list, form | Liste, Formular | never "EntityView" |
| list profile | Listenprofil | |
| named set | Named Set | unchanged |
| entity, property, relation | Entität, Eigenschaft, Beziehung | data model terms; APP_* names unchanged |
| calculated property | berechnete Eigenschaft | |
| validation rule | Validierungsregel | |
| permission, default permissions | Berechtigung, Standardberechtigungen | |
| role | Rolle | role names (Time Tracking User, Project Manager, Project Controller, Billing Admin, HR Administrator, Department Lead, Account Admin) stay English in code and lists; in running text: Zeiterfassungsbenutzer, Projektleiter, Projektcontroller, Abrechnungsadministrator, HR-Administrator, Abteilungsleiter, Kontoadministrator |
| department, department lead | Abteilung, Abteilungsleiter | |
| user, user detail | Benutzer, Benutzerdetail | |
| account management | Kontoverwaltung | |
| web client | Web-Client | |
| full client (desktop) | Vollclient (Desktop) | |
| mobile access | mobiler Zugriff | |
| sandbox environment | Sandbox-Umgebung | |
| customization | Anpassung | "Anpassungsmöglichkeiten" for "customization capabilities" |
| data model | Datenmodell | |
| scripting, script | Scripting, Skript | "Scripting" unchanged as topic name |
| trigger, action | Trigger, Aktion | |
| Web API, OData, endpoint | Web API, OData, Endpunkt | |
| query, TCQL | Abfrage, TCQL | TCQL keywords unchanged |
| MCP server, AI assistant | MCP-Server, KI-Assistent | |
| release notes | Release Notes | unchanged |
| getting started | Erste Schritte | |
| overview | Überblick | page titles; "Übersicht" for lists of items |
| See Also | Siehe auch | |
| tip / note / warning / important | Tipp / Hinweis / Warnung / Wichtig | alert headings, rendered by the template |
| support@timecockpit.com | support@timecockpit.com | unchanged |

## Product UI labels (from the product localizers, binding)

German labels as the product shows them (data model localizers, full client resources, web i18n), collected 2026-09-26 in `glossary-gaps.de.md`. Use them for lists, actions, fields, filters and buttons, also in navigation paths.

| English | German | Notes |
|---|---|---|
| Task (entity) | Tätigkeit (e.g. "Budgetkontrolle für Tätigkeiten") | L/NavigationModuleFriendlyNames_de.cs |
| Budgetary Control of Tasks | Budgetkontrolle für Tätigkeiten | L |
| Time Report | Stundenzettel | L/GenericKeys_de.cs |
| Print Time Reports | Stundenzettel drucken | L/Actions_de.cs |
| Invoice Report | Rechnungsdokument | L/GenericKeys_de.cs |
| Overtime per Effective Date | Arbeitszeitsaldo | L |
| Overtime Corrections | Korrektur Arbeitszeitsaldo | L |
| Vacation per Effective Date | Resturlaub | L |
| Working Time Limits | Höchstarbeitszeit | L/Entities_de.cs |
| Working Time Violations | Arbeitszeitverletzungen | L/GenericKeys_de.cs |
| Home Office Overview | Telearbeitstage | L/GenericKeys_de.cs |
| Legal Holiday Calendars | Feiertagskalender | L |
| Create Invoice | Ausgangsrechnung anlegen (action), "Rechnung anlegen" (button) | L/Actions_de.cs |
| Assign to Existing Outgoing Invoice | Zu vorhandener Ausgangsrechnung zuordnen | L/Actions_de.cs |
| Add Sick Leave (full client ribbon) | Neuer Krankenurlaub | W/TimesheetCalendar |
| Budgetary Control of Projects | Budgetkontrolle für Projekte | L |
| Unbilled Timesheets | Nicht verrechnete Zeitbuchungen | L |
| Outgoing Invoices | Ausgangsrechnungen | L |
| Billing (menu section) | Verrechnung | L |
| Legal Holidays | Feiertage | L |
| Target-Actual Hours Comparison | Soll-Ist-Vergleich | L |
| Working Time Weights | Arbeitszeitgewichtung | L |
| Template Queries | Musterabfragen | L |
| User Details | Benutzerdetails | L |
| User Status | Benutzerstatusliste | L |
| Departments | Abteilungen | L |
| Countries | Länder | L |
| Means of Transport | Verkehrsmittel | L |
| Roles / Assign Roles | Rollen / Rollen zuordnen | L |
| Global Settings | Globale Einstellungen | L |
| Absence Calendar | Abwesenheitskalender | L, web |
| Articles / Units / Companies | Artikel / Einheiten / Gesellschaften | L |
| Delete Invoice | Ausgangsrechnung löschen | L |
| Approve Absence / Reject Absence | Abwesenheit Genehmigen / Abwesenheit Ablehnen (capitalized in the product) | L |
| Delete profile | Profil löschen | W |
| Delete signals | Signale löschen | W |
| Download / Load / Upload New Report Definition | Berichtsdefinition downloaden / Berichtsdefinition laden / Neue Berichtsdefinition uploaden | W |
| Create / Save / Load sample file | Vorlagedatei generieren / speichern / laden | W |
| Select source file | Datei auswählen | W |
| Test import / Execute import | Import testen / Import ausführen (web: Import durchführen) | W, web |
| Quick Export | Excel Export (tooltip "Quick Excel Export (STRG + E)") | W |
| Reset password | Passwort zurücksetzen | W |
| New version available | Neue Version / Neue Version laden | web |
| Add Vacation / Add Compensatory Time | Neuer Urlaub / Neuer Zeitausgleich (full client ribbon, wording differs) | W |
| Effective Date | Stichtag | L |
| Date of Entitlement | Entstehungsdatum | L |
| Number of Weeks | Anzahl Wochen | L |
| Prorate | Aliquotieren | L |
| Extraordinary Entitlement | Außerordentlicher Urlaubsanspruch | L |
| Remaining Leave in Weeks | Resturlaub in Wochen | L |
| Special Leave | Sonderurlaub | L |
| Is Whole Day | Ganztägig | L |
| Is Approved | Genehmigt | L |
| Absence approval required | Abwesenheitsgenehmigung erforderlich | L |
| Receive Notification | Benachrichtigungen zur Abwesenheitsgenehmigung erhalten | L |
| Enable Timesheet Suggestions | Zeitbuchungsvorschläge aktivieren | L |
| Timesheet Suggestions | Buchungsvorschläge | L |
| Hidden | Ausgeblendet | L, OL |
| Include Hidden Users / Show Hidden Users | Inkl. ausgeblendeter Benutzer | L |
| Show all users | Alle Benutzer anzeigen | L |
| Date of Separation | Austrittsdatum | L |
| Valid From / Valid Until | Gültig ab / Gültig bis | L |
| Since | Seit | L |
| Consider Working Time Weight | Arbeitszeitgewichtung berücksichtigen | L |
| Start Date / End Date | Startdatum / Enddatum (project form: "Endedatum") | L |
| Billable | Verrechenbar | L |
| Target Hours | Soll-Stunden | L |
| Telework Days | Telearbeitstage | L |
| Invoice Number | Ausgangsrechnungsnummer (invoice), Rechnungsnummer (create dialog) | L |
| Billing Address | Rechnungsadresse | L |
| Service Period Start / End | Leistungszeit Beginn / Ende (invoice), Leistungszeitraum Beginn / Ende (create dialog) | L |
| Discount | Skonto [%] | L |
| Payment Received On | Bezahlt am | L |
| Incl. Timesheets on Invoice Document | Inkl. Zeitnachweis am Rechnungsdokument | L |
| Position / Quantity / VAT | Pos. / Anzahl / USt. | L |
| Revenue / Net Revenue | Umsatz / Nettoumsatz | L |
| Deviating Revenue | Abweichender Umsatz (invoice: Abweichender Nettoumsatz) | L |
| Include Closed Projects | Inkl. abgeschlossener Projekte | L |
| Only Tasks with Unbilled Time Sheet Entries | Nur Tätigkeiten mit nicht verrechneten Buchungen | L |
| Project Manager / Deputy Project Manager (fields) | Projektleiter / Projektleiter Stv. | L |
| User Name | E-Mail (Benutzername) | OL |
| Enabled | Aktiv | OL |
| Tenant Admin | Tenant Admin (obsolete, role AccountAdmin) | OL |
| Title | Überschrift | W |
| Show Filter | Filter anzeigen | W |
| Font Family / Font Size | Schriftart / Schriftgröße [pt] | W |
| Wrap Mode: Auto Fit / Wrap / Truncate | Zeilenumbruchsmodus: Spaltenbreite anpassen / Zeilenumbruch / Abschneiden | W |
| Orientation: Automatic / Portrait / Landscape | Ausrichtung: Automatisch / Hochformat / Querformat | W |
| Page Setup / Page Size | Seite einrichten / Papiergröße | W |
| Color | Farbe | W |
| Is Visible Expression | Formel für Sichtbarkeit | OL |
| Sort Order | Sortierreihenfolge | OL |
| General Options | Allgemeine Optionen | W |
| Signal Processing | Signalverarbeitung | W |
| Polling Interval | Abfrageintervall | W |
| Query interval (calendar) | Abfrageintervall für Termine | W |
| Limit for inactivity | Inaktivitätszeitgrenze | W |
| Ask for notes after breaks | Inaktivitätsintervall für Notizerinnerung | W |
| Resolve email address | E-Mail-Adressen abfragen | W |
| Selected folders | Überwachte Ordner | W |
| Ignore patterns | Exkludiertes Muster hinzufügen (button) | W |
| Plugins | Plugins | web |
| Default Relation List | Standard Liste für Relationen | W |
| New item / New module / New section / New permission | Neu / Neues Modul / Neuer Bereich / Neue Berechtigung | W |
| New Configuration | Neu konfigurieren | W |
| Properties | Eigenschaften | W |
| Invariant friendly name / Display name | Anzeigename | W |
| Default display property | Anzeigeeigenschaft | W |
| Default list / Default form | Standard Liste / Standard Form | W |
| Module type | Modultyp | W |
| Is visible / Is enabled expression | Formel für Sichtbarkeit / Formel für Verfügbarkeit | W |
| Default data context | Standard Datenkontext | W |
| Target / Type of the link | Zielfenster / Typ des Links | W |
| Statistics | Statistik | W |

No German label in the product (keep English): Share List, Move or group, Change Password, Create new PAT, Update Feed, Margin, Calculated Revenue, Line of Business Unit, Sign In (Office 365), role names.
