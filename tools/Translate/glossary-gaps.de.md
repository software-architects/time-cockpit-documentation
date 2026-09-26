# Glossary gaps (for review)

UI labels the German translation kept in English because `glossary.de.md` had no entry, with the German label the product actually uses. Found in the product repository (`TimeCockpit`): data model localizers `classic/TimeCockpit.Programmability/DataModel/Localization/*_de.cs` (L), `classic/OnCockpit.Programmability/DataModel/Localization/*_de.cs` (OL), WPF resources `classic/TimeCockpit.UI/WPF/**/Resources.de.resx` (W) and the web i18n files (web). Collected 2026-09-26.

Workflow: confirm or correct a row, move it into `glossary.curated.de.md`, rerun `build-glossary.ps1`, then replace the English label in `de/doc/**`.

## Conflicts with the current glossary, `toc.de.json` or German pages

These German terms are already used in the docs but differ from the product.

| English | Used in the German docs | Product (German) | Source |
|---|---|---|---|
| Task (entity) | Aufgabe | Tätigkeit (e.g. "Budgetkontrolle für Tätigkeiten") | L/NavigationModuleFriendlyNames_de.cs |
| Budgetary Control of Tasks | Budgetkontrolle für Aufgaben | Budgetkontrolle für Tätigkeiten | L |
| Time Report | Zeitbericht | Stundenzettel | L/GenericKeys_de.cs |
| Print Time Reports | (English) | Stundenzettel drucken | L/Actions_de.cs |
| Invoice Report | Rechnungsbericht | Rechnungsdokument | L/GenericKeys_de.cs |
| Overtime per Effective Date | Überstunden zum Stichtag | Arbeitszeitsaldo | L |
| Overtime Corrections | (English) | Korrektur Arbeitszeitsaldo | L |
| Vacation per Effective Date | Urlaub zum Stichtag | Resturlaub | L |
| Working Time Limits | Arbeitszeitgrenzen | Höchstarbeitszeit | L/Entities_de.cs |
| Working Time Violations | Arbeitszeitverstöße | Arbeitszeitverletzungen | L/GenericKeys_de.cs |
| Home Office Overview | Homeoffice-Übersicht | Telearbeitstage | L/GenericKeys_de.cs |
| Legal Holiday Calendars | (English) | Feiertagskalender | L |
| Create Invoice | Rechnung erstellen | Ausgangsrechnung anlegen (action), "Rechnung anlegen" (button) | L/Actions_de.cs |
| Assign to Existing Outgoing Invoice | Bestehender Ausgangsrechnung zuordnen | Zu vorhandener Ausgangsrechnung zuordnen | L/Actions_de.cs |
| Add Sick Leave (full client ribbon) | Krankenstand | Neuer Krankenurlaub | W/TimesheetCalendar |

## Lists and navigation

| English | Product (German) | Source |
|---|---|---|
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

## Actions and buttons

| English | Product (German) | Source |
|---|---|---|
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

## Fields and filters

| English | Product (German) | Source |
|---|---|---|
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

## Standard print view and custom reports

| English | Product (German) | Source |
|---|---|---|
| Title | Überschrift | W |
| Show Filter | Filter anzeigen | W |
| Font Family / Font Size | Schriftart / Schriftgröße [pt] | W |
| Wrap Mode: Auto Fit / Wrap / Truncate | Zeilenumbruchsmodus: Spaltenbreite anpassen / Zeilenumbruch / Abschneiden | W |
| Orientation: Automatic / Portrait / Landscape | Ausrichtung: Automatisch / Hochformat / Querformat | W |
| Page Setup / Page Size | Seite einrichten / Papiergröße | W |
| Color | Farbe | W |
| Is Visible Expression | Formel für Sichtbarkeit | OL |
| Sort Order | Sortierreihenfolge | OL |

## Full client, Signal Tracker, customization (OnCockpit Admin)

| English | Product (German) | Source |
|---|---|---|
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

## No German label in the product

Stay English unless the team decides otherwise: Share List, Move or group, Change Password, Create new PAT, Update Feed, Margin, Calculated Revenue, Line of Business Unit, Sign In (Office 365), and all role names (Time Tracking User, Project Manager, Project Controller, Billing Admin, Human Resources Admin, Department Lead, Account Admin, Customization Admin, Base Data Admin, Notification Manager, Admin). Role names are English-only data rows in the product.
