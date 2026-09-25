---
title: Budgetkontrolle für Projekte (Budgetary Control of Projects)
description: Referenz zur Standardliste Budgetary Control of Projects in time cockpit mit Filtern, berechneten Spalten und zugehörigen Drill-down-Links.
en_page: doc/reference/lists/budgetary-control-of-projects.md
---

# Budgetkontrolle für Projekte

Die Liste **Budgetary Control of Projects** bietet Ihnen eine Übersicht über Verrechnung und Budget auf Projektebene. Sie kombiniert erfasste Zeitbuchungen, die Budgeteinstellungen des Projekts und Rechnungsdaten, sodass Sie geplante und geleistete Arbeit sowie verrechnete und nicht verrechnete Beträge vergleichen können.

## Typische Zielgruppe

Mit den Standardberechtigungen ist diese Liste typischerweise relevant für:

- Abrechnungsadministratoren
- Projektleiter
- Projektcontroller

## Navigation

- Standardnavigation: `Management -> Billing -> Budgetary Control of Projects`
- Deeplink: `https://web.timecockpit.com/app/lists/APP_BudgetaryControlOfProjectsList`

## Was die Liste zeigt

Die Liste aggregiert die Daten pro Projekt. Sie verwendet:

- Projektstammdaten wie das Kennzeichen für Verrechenbarkeit, das Kennzeichen für Fixpreis, Budget, Budget in Stunden und Stundensatz
- mit dem Projekt verknüpfte Zeitbuchungen
- mit dem Projekt verknüpfte Rechnungen und Rechnungspositionen

Die Standardliste gruppiert die Einträge nach dem Verrechenbarkeitsstatus des Projekts.

## Standardfilter

Der Standardfilterbereich enthält diese Filter:

| Filter | Technische Referenz | Bedeutung |
|---|---|---|
| Customer | `@Customer` | Schränkt die Liste auf einen Kunden ein |
| Project | `@Project` | Schränkt die Liste auf ein Projekt ein |
| Include Unbillable | `@IncludeUnbillable` | Bezieht nicht verrechenbare Projekte ein, wenn der Wert `true` ist |
| Include Closed | `@IncludeClosed` | Bezieht abgeschlossene Projekte ein, wenn der Wert `true` ist |

## Spalten

Die folgende Tabelle dokumentiert die sichtbaren Standardspalten.

| Spalte | Technische Referenz | Bedeutung | Ermittlung des Werts |
|---|---|---|---|
| Customer | `CustomerName`, `CustomerUuid` | Kunde des Projekts | Aus dem mit dem Projekt verknüpften Kunden übernommen |
| Project | `ProjectName`, `ProjectUuid` | In der Zeile angezeigtes Projekt | Aus dem mit den zugrunde liegenden Zeitbuchungen verknüpften Projekt übernommen |
| Billable | `BillableText`, `Billable` | Ob das Projekt verrechenbar ist | Aus dem Kennzeichen für Verrechenbarkeit des Projekts übernommen und als Text verrechenbar oder nicht verrechenbar angezeigt |
| Fixed Price | `FixedPrice` | Ob das Projekt ein Fixpreisprojekt ist | Aus der Projekteinstellung übernommen |
| Budget in Hours | `BudgetInHours` | Geplantes Budget in Stunden | Verwendet das Stundenbudget des Projekts, falls vorhanden. Gibt es nur ein monetäres Budget und ist ein Stundensatz vorhanden, leitet die Liste die Stunden aus Budget geteilt durch Stundensatz ab. |
| Billable Hours | `HoursBillable` | Bereits geleistete verrechenbare Stunden | Summe der Dauer der Zeitbuchungen, die verrechenbar sind und einen positiven Stundensatz haben |
| Open Hours in Budget | `OpenBudgetInHours` | Verbleibende verrechenbare Stunden im Projektbudget | Berechnet als Budget in Stunden minus verrechenbare Stunden |
| Billable Progress % | `ProgressBillablePercent` | Fortschritt gegenüber dem Stundenbudget auf Basis der verrechenbaren Stunden | Berechnet als verrechenbare Stunden geteilt durch Budget in Stunden |
| Performed Hours | `Hours` | Alle geleisteten Stunden im Projekt | Summe der Dauer aller in der Liste enthaltenen Zeitbuchungen |
| Performed Progress % | `ProgressPercent` | Fortschritt gegenüber dem Stundenbudget auf Basis aller geleisteten Stunden | Berechnet als geleistete Stunden geteilt durch Budget in Stunden |
| Unbilled Hours | `HoursNotBilled` | Verrechenbare Stunden, die noch nicht verrechnet wurden | Summe der verrechenbaren Stunden aus Zeitbuchungen, die noch nicht als verrechnet markiert sind und einen positiven Stundensatz haben |
| Actual Hourly Rate | `EffectiveHourlyRate` | Effektiver Umsatz pro Stunde in der aktuellen Ergebnismenge | Berechnet als Umsatz geteilt durch die enthaltenen Stunden |
| Budget | `Budget` | Monetäres Projektbudget | Verwendet das monetäre Budget des Projekts, falls vorhanden. Andernfalls leitet die Liste es bei verrechenbaren Projekten aus Budget in Stunden mal Stundensatz ab. |
| Revenue | `Revenue` | Durch die enthaltenen Zeitbuchungen erzielter Umsatz | Summe der Umsatzwerte der Zeitbuchungen |
| Unbilled Revenue | `RevenueNotBilled` | Noch nicht verrechneter Umsatz | Summe des Umsatzes aus Zeitbuchungen, die nicht verrechnet und nicht als nicht verrechenbar ausgeschlossen sind |
| Costs | `Costs` | Interner Kostenwert der enthaltenen Zeitbuchungen | Summe der Stunden der Zeitbuchungen multipliziert mit dem Stundenkostensatz des Benutzers |
| Billed Revenue from Invoices | `BilledRevenueFromInvoices` | Umsatz, der für das Projekt bereits in Rechnungen abgebildet ist | Summe der Umsatzwerte der mit dem Projekt verknüpften Rechnungen |
| Unbilled Hours from Invoices | `UnbilledHoursFromInvoices` | Verbleibende Budgetstunden im Vergleich zu den verrechneten Rechnungsstunden | Berechnet als Budget in Stunden minus der in Rechnungspositionen mit der Einheit `hour` verrechneten Stunden |
| Time Sheet Entries | Hyperlink auf gefiltertes `APP_Timesheet` | Drill-down zu den zugehörigen Zeitbuchungen | Öffnet die Standardliste der Zeitbuchungen, gefiltert auf das aktuelle Projekt |
| Rechnungen | Hyperlink auf gefiltertes `APP_Invoice` | Drill-down zu den Rechnungen des Projekts | Öffnet die Rechnungsliste, gefiltert auf das aktuelle Projekt |

## Hinweise

- Die Liste ist projektzentriert. Sie ist nützlich, wenn Sie eine kompakte Übersicht benötigen, statt die einzelnen Zeitbuchungen durchzusehen.
- Mehrere Werte werden aus mehr als einer Quelle berechnet. So kombiniert die Liste zum Beispiel Projekteinstellungen, Zeitbuchungen und Rechnungen in derselben Ergebniszeile.
- Hat ein Projekt kein explizites Stundenbudget, aber ein monetäres Budget und einen Stundensatz, leitet die Liste das Stundenbudget automatisch ab.
- Ist `Budget in Hours` gleich `0`, bleiben auch die Prozentspalten bei `0`, weil kein Stundenbudget für den Vergleich vorhanden ist.

## Verwandte Seiten

- [Rechnungslegung](~/doc/projektzeiterfassung/rechnungslegung.md)
- [Nicht verrechnete Zeitbuchungen](~/doc/referenz/listen/nicht-verrechnete-zeitbuchungen.md)
- [Projektleiter-FAQ](~/doc/projektleiter-faq.md)
- [Abrechnungs-FAQ](~/doc/abrechnungs-faq.md)
- [Navigation und Zugriffsrechte](~/doc/navigation-und-zugriffsrechte.md)
