---
title: Budgetkontrolle für Tätigkeiten
description: Referenz zur Standardliste Budgetkontrolle für Tätigkeiten in time cockpit mit Filtern, berechneten Spalten und Drill-down-Links.
en_page: doc/reference/lists/budgetary-control-of-tasks.md
---

# Budgetkontrolle für Tätigkeiten

Die Liste **Budgetkontrolle für Tätigkeiten** bietet Ihnen eine Sicht auf Tätigkeitsebene auf Budgetverbrauch, geleistete Stunden, nicht verrechnete Stunden und verrechnete Stunden.

## Typische Zielgruppe

Mit den Standardberechtigungen ist diese Liste typischerweise relevant für:

- Abrechnungsadministratoren
- Projektleiter
- Projektcontroller

## Navigation

- Standardnavigation: `Verwaltung -> Verrechnung -> Budgetkontrolle für Tätigkeiten`
- Deeplink: `https://web.timecockpit.com/app/lists/APP_BudgetaryControlOfTasksList`

## Standardfilter

| Filter | Technische Referenz | Bedeutung |
|---|---|---|
| Customer | `@Customer` | Schränkt die Liste auf einen Kunden ein |
| Project | `@Project` | Schränkt die Liste auf ein Projekt ein |
| Tätigkeit | `@Task` | Schränkt die Liste auf eine Tätigkeit ein |
| From | `@EffortFrom` | Bezieht Aufwand ab dem ausgewählten Datum ein |
| To | `@EffortTo` | Bezieht Aufwand bis zum ausgewählten Datum ein |
| Only With Unbilled Hours | `@OnlyWithUnbilledHours` | Zeigt nur Zeilen, die noch nicht verrechnete verrechenbare Stunden enthalten |
| Inkl. abgeschlossener Projekte | `@IncludeClosedProjects` | Bezieht abgeschlossene Projekte ein |
| Include Closed | `@IncludeClosed` | Bezieht abgeschlossene Tätigkeiten ein |

## Spalten

| Spalte | Technische Referenz | Bedeutung | Ermittlung des Werts |
|---|---|---|---|
| Project | `ProjectName`, `ProjectUuid` | Projekt der Tätigkeitszeile | Aus dem zugehörigen Projekt übernommen |
| Tätigkeit | `TaskName`, `TaskUuid` | Tätigkeit der Zeile | Aus der Tätigkeit übernommen. Zeilen ohne Tätigkeit werden als eigene Zeile ohne Tätigkeit angezeigt. |
| Budget in Hours | `BudgetInHours` | Stundenbudget der Tätigkeit | Aus dem Budget in Stunden der Tätigkeit übernommen |
| Billable Hours | `PositveBillableHoursTotal` | Verrechenbare Stunden der Tätigkeit | Summe der Stunden aus Zeitbuchungen, die verrechenbar sind und einen positiven Stundensatz haben |
| Open Hours in Budget | `BudgetInHours - PositveBillableHoursTotal` | Verbleibendes Tätigkeitsbudget in Stunden | Berechnet als Budget in Stunden minus verrechenbare Stunden |
| Billable Progress % | `ProgressPositveBillablePercent` | Verrechenbarer Fortschritt gegenüber dem Tätigkeitsbudget | Verrechenbare Stunden geteilt durch Budget in Stunden |
| Performed Hours | `TotalHours` | Alle geleisteten Stunden der Tätigkeit | Summe aller enthaltenen Stunden aus Zeitbuchungen |
| Performed Progress % | `ProgressTotalHoursPercent` | Gesamter geleisteter Fortschritt gegenüber dem Tätigkeitsbudget | Geleistete Stunden geteilt durch Budget in Stunden |
| Unbilled Billable Hours | `ActualPositveBillableHours` | Noch nicht verrechnete verrechenbare Stunden | Summe der Stunden aus verrechenbaren, nicht verrechneten Zeitbuchungen mit positivem Stundensatz |
| Unbilled Revenue | `RevenueUnbilled` | Noch nicht verrechneter Umsatz | Summe des Umsatzes aus verrechenbaren, nicht verrechneten Zeitbuchungen |
| Actual Hourly Rate | `EffectiveHourlyRate` | Effektiver Umsatz pro Stunde | Umsatz geteilt durch Gesamtstunden |
| Billed Hours from Invoices | `BilledHoursFromInvoices` | Mit der Tätigkeit verknüpfte verrechnete Stunden | Summe der Menge der Rechnungspositionen mit der Einheit `hour` |
| Unbilled Hours from Invoices | `UnbilledHoursFromInvoices` | Verbleibende Budgetstunden im Vergleich zu den Stunden in Rechnungspositionen | Budget in Stunden minus verrechnete Stunden aus Rechnungen |
| Timesheet Entries | gefilterter Link auf `APP_Timesheet` | Drill-down zu den zugrunde liegenden Zeitbuchungen | Öffnet die Standardliste der Zeitbuchungen, gefiltert auf das aktuelle Projekt und die aktuelle Tätigkeit |

## Hinweise

- Die Liste enthält eigene Zeilen für Projektzeit, die keiner Tätigkeit zugeordnet ist.
- Hat die Tätigkeit kein Stundenbudget, bleiben die Prozentwerte bei `0`.
- Die Liste kombiniert Tätigkeitsstammdaten, Zeitbuchungen und Rechnungspositionen in einer Ergebnismenge.

## Verwandte Seiten

- [Budgetkontrolle für Projekte](~/doc/referenz/listen/budgetkontrolle-projekte.md)
- [Nicht verrechnete Zeitbuchungen](~/doc/referenz/listen/nicht-verrechnete-zeitbuchungen.md)
- [Rechnungslegung](~/doc/projektzeiterfassung/rechnungslegung.md)
