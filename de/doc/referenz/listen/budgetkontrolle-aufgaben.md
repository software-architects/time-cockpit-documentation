---
title: Budgetkontrolle für Aufgaben (Budgetary Control of Tasks)
description: Referenz zur Standardliste Budgetary Control of Tasks in time cockpit mit Filtern, berechneten Spalten und Drill-down-Links.
en_page: doc/reference/lists/budgetary-control-of-tasks.md
---

# Budgetkontrolle für Aufgaben

Die Liste **Budgetary Control of Tasks** bietet Ihnen eine Sicht auf Aufgabenebene auf Budgetverbrauch, geleistete Stunden, nicht verrechnete Stunden und verrechnete Stunden.

## Typische Zielgruppe

Mit den Standardberechtigungen ist diese Liste typischerweise relevant für:

- Abrechnungsadministratoren
- Projektleiter
- Projektcontroller

## Navigation

- Standardnavigation: `Management -> Billing -> Budgetary Control of Tasks`
- Deeplink: `https://web.timecockpit.com/app/lists/APP_BudgetaryControlOfTasksList`

## Standardfilter

| Filter | Technische Referenz | Bedeutung |
|---|---|---|
| Customer | `@Customer` | Schränkt die Liste auf einen Kunden ein |
| Project | `@Project` | Schränkt die Liste auf ein Projekt ein |
| Task | `@Task` | Schränkt die Liste auf eine Aufgabe ein |
| From | `@EffortFrom` | Bezieht Aufwand ab dem ausgewählten Datum ein |
| To | `@EffortTo` | Bezieht Aufwand bis zum ausgewählten Datum ein |
| Only With Unbilled Hours | `@OnlyWithUnbilledHours` | Zeigt nur Zeilen, die noch nicht verrechnete verrechenbare Stunden enthalten |
| Include Closed Projects | `@IncludeClosedProjects` | Bezieht abgeschlossene Projekte ein |
| Include Closed | `@IncludeClosed` | Bezieht abgeschlossene Aufgaben ein |

## Spalten

| Spalte | Technische Referenz | Bedeutung | Ermittlung des Werts |
|---|---|---|---|
| Project | `ProjectName`, `ProjectUuid` | Projekt der Aufgabenzeile | Aus dem zugehörigen Projekt übernommen |
| Task | `TaskName`, `TaskUuid` | Aufgabe der Zeile | Aus der Aufgabe übernommen. Zeilen ohne Aufgabe werden als eigene Zeile ohne Aufgabe angezeigt. |
| Budget in Hours | `BudgetInHours` | Stundenbudget der Aufgabe | Aus dem Budget in Stunden der Aufgabe übernommen |
| Billable Hours | `PositveBillableHoursTotal` | Verrechenbare Stunden der Aufgabe | Summe der Stunden aus Zeitbuchungen, die verrechenbar sind und einen positiven Stundensatz haben |
| Open Hours in Budget | `BudgetInHours - PositveBillableHoursTotal` | Verbleibendes Aufgabenbudget in Stunden | Berechnet als Budget in Stunden minus verrechenbare Stunden |
| Billable Progress % | `ProgressPositveBillablePercent` | Verrechenbarer Fortschritt gegenüber dem Aufgabenbudget | Verrechenbare Stunden geteilt durch Budget in Stunden |
| Performed Hours | `TotalHours` | Alle geleisteten Stunden der Aufgabe | Summe aller enthaltenen Stunden aus Zeitbuchungen |
| Performed Progress % | `ProgressTotalHoursPercent` | Gesamter geleisteter Fortschritt gegenüber dem Aufgabenbudget | Geleistete Stunden geteilt durch Budget in Stunden |
| Unbilled Billable Hours | `ActualPositveBillableHours` | Noch nicht verrechnete verrechenbare Stunden | Summe der Stunden aus verrechenbaren, nicht verrechneten Zeitbuchungen mit positivem Stundensatz |
| Unbilled Revenue | `RevenueUnbilled` | Noch nicht verrechneter Umsatz | Summe des Umsatzes aus verrechenbaren, nicht verrechneten Zeitbuchungen |
| Actual Hourly Rate | `EffectiveHourlyRate` | Effektiver Umsatz pro Stunde | Umsatz geteilt durch Gesamtstunden |
| Billed Hours from Invoices | `BilledHoursFromInvoices` | Mit der Aufgabe verknüpfte verrechnete Stunden | Summe der Menge der Rechnungspositionen mit der Einheit `hour` |
| Unbilled Hours from Invoices | `UnbilledHoursFromInvoices` | Verbleibende Budgetstunden im Vergleich zu den Stunden in Rechnungspositionen | Budget in Stunden minus verrechnete Stunden aus Rechnungen |
| Timesheet Entries | gefilterter Link auf `APP_Timesheet` | Drill-down zu den zugrunde liegenden Zeitbuchungen | Öffnet die Standardliste der Zeitbuchungen, gefiltert auf das aktuelle Projekt und die aktuelle Aufgabe |

## Hinweise

- Die Liste enthält eigene Zeilen für Projektzeit, die keiner Aufgabe zugeordnet ist.
- Hat die Aufgabe kein Stundenbudget, bleiben die Prozentwerte bei `0`.
- Die Liste kombiniert Aufgabenstammdaten, Zeitbuchungen und Rechnungspositionen in einer Ergebnismenge.

## Verwandte Seiten

- [Budgetkontrolle für Projekte](~/doc/referenz/listen/budgetkontrolle-projekte.md)
- [Nicht verrechnete Zeitbuchungen](~/doc/referenz/listen/nicht-verrechnete-zeitbuchungen.md)
- [Rechnungslegung](~/doc/projektzeiterfassung/rechnungslegung.md)
