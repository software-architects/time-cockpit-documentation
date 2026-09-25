# Translation review log

One line per translated page: date, German page, open questions for the reviewer (terms not in the glossary, doubts about the source). Reviewed pages get a check mark and the reviewer's initials.

| Date | Page | Batch | Open questions | Reviewed |
|---|---|---|---|---|
| 2026-09-25 | de/doc/erste-schritte/ueberblick.md | sample | — | |
| 2026-09-25 | de/doc/fuer-anwender.md | sample | Link texts of not yet translated pages are German already; check against the final titles. | |
| 2026-09-25 | de/doc/mitarbeiter-faq.md | sample | "Benutzer -> Urlaub" / "Benutzer -> Krankenstand" assume the German navigation labels; verify in the web client. | |
| 2026-09-25 | de/doc/erste-schritte/web-client.md | 1 | "Silverlight client was deprecated" translated as "eingestellt". | |
| 2026-09-25 | de/doc/erste-schritte/mobile-zeiterfassung.md | 1 | Source claims "Live Timer", "PIN/biometric login" and "simplified mobile views" that may not exist; full client "limited offline" contradicts the architecture page. Button "New" kept English (UI shows "+ Hinzufügen"?). | |
| 2026-09-25 | de/doc/erste-schritte/systemarchitektur.md | 1 | Source says "software as a server" (service?) and "can only be encrypted" (decrypted?). | |
| 2026-09-25 | de/doc/erste-schritte/konfigurationsassistent.md | 1 | UI labels kept English: Next, Shutdown, "Start the installation of time cockpit". | |
| 2026-09-25 | de/doc/erste-schritte/installationsanleitung.md | 1 | Page is outdated (Windows XP, .NET 4.0, Silverlight); "installation wizard" link points to the configuration wizard. | |
| 2026-09-25 | de/doc/erste-schritte/problembehebung*.md (7 pages) | 1 | LogExpert link to codeplex is dead; ".NET blog entry" without link; stray "?" in signal-tracking-suspended; existing next-button-missing-de.png could replace the EN screenshot. | |
| 2026-09-25 | de/doc/erste-schritte/anleitungen/*.md (2 pages) | 1 | Field labels kept English: Effective Date, Overtime, Date of Entitlement, Number of Weeks, Reset password, Change Password. | |
| 2026-09-25 | de/doc/kontoverwaltung/kontoverwaltung.md | 1 | UI labels kept English: User Name, Enabled, Tenant Admin; source misses "account" in "If you do not have a time cockpit yet". | |
| 2026-09-25 | de/doc/fuer-entwickler.md | 1 | Own terms: Skript-Debugger, TCQL-Konsole, Benutzerbereitstellung, Eigener Hostname. | |
| 2026-09-25 | de/doc/funktionen-im-ueberblick.md | 1 | Broken "Email" line in the source (blank line + lone colon) kept; "Top 5 by usage" is an unsourced claim; UI labels kept English: Budgetary Control of Projects/Tasks, Unbilled Timesheets, Create Invoice, Billing menu. | |
| 2026-09-25 | de/doc/anwender-faq.md | 1 | "In your screenshot" reads oddly in the source; inline code `Remaining Vacation` probably "Resturlaub" in the German UI. | |
| 2026-09-25 | de/doc/zeiterfassungskalender/kalender.md, arbeiten-mit-zeitbuchungen.md, musterbuchungen.md, arbeitszeit.md, outlook-termine.md, buchungsvorschlaege-zeitbuchungen-teilen.md | 2 | UI labels kept English: User Details, Hidden, Sign In, Global Settings, Enable Timesheet Suggestions; own terms Hauptmenü, Symbolleiste, Signalbalken, Input-Set; source: "time cockpit's time cockpit's", Month View without screenshot, "Timesheet Template" section assumed to be the Musterbuchungen pane. | |
| 2026-09-25 | de/doc/zeiterfassungskalender/formatprofil.md, office-365-integration.md, signale.md, signaldetails.md | 2 | Formatting-profile dialog fields translated descriptively (check against UI); TFS Changesets/Check-ins headings look swapped in the source; Keywords section in signal-details is a copy-paste error; empty "Formatting Profile Settings" heading kept. | |
| 2026-09-25 | de/doc/projektzeiterfassung/*.md (6 pages) | 2 | Many list/field labels kept English (Billing, Unbilled Timesheets, Outgoing Invoices, Position, Quantity, VAT, Revenue, Margin...). Source doubts: rate hierarchy contradicts customer-project-task; "Budget Type" field may not exist; "Sum(Duration x HourlyRateActual) = Total Internal Cost" looks wrong; Outgoing Invoices link points to APP_Company; step numbering skips; typos "Excute", "Depracated"; English prose inside fenced python blocks left untranslated. | |
