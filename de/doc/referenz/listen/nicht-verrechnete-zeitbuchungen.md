---
title: Nicht verrechnete Zeitbuchungen (Unbilled Timesheets)
description: Referenz zur Standardliste Unbilled Timesheets in time cockpit mit Filtern, Spalten und der Aktion Create Invoice.
en_page: doc/reference/lists/unbilled-timesheets.md
---

# Nicht verrechnete Zeitbuchungen

Die Liste **Unbilled Timesheets** zeigt verrechenbare Zeitbuchungen, die noch keiner Rechnung zugeordnet sind. Sie ist der Standardausgangspunkt, um aus erfasster Arbeit Rechnungen zu erstellen.

## Typische Zielgruppe

Mit den Standardberechtigungen ist diese Liste typischerweise relevant für:

- Abrechnungsadministratoren
- Projektleiter
- Projektcontroller

## Navigation

- Standardnavigation: `Management -> Billing -> Unbilled Timesheets`
- Deeplink: `https://web.timecockpit.com/app/lists/APP_UnbilledTimesheetsList`

## Was die Liste zeigt

Die Liste basiert auf Zeitbuchungen. Sie behält den Standardkontext von Projekt und Verrechnung bei, wendet aber Filter an, die sich auf verrechenbare und noch nicht verrechnete Arbeit konzentrieren.

Standardmäßig:

- gruppiert die Liste die Einträge nach Kunde und Projekt
- filtert sie auf `Billable = true`
- filtert sie auf `Billed = false`

## Standardfilter

Der Standardfilterbereich enthält diese Filter:

| Filter | Technische Referenz | Bedeutung |
|---|---|---|
| Benutzer | `APP_UserDetail` | Schränkt die Liste auf einen Benutzer ein |
| Customer | `APP_Project.APP_Customer` | Schränkt die Liste auf einen Kunden ein |
| Project | `APP_Project` | Schränkt die Liste auf ein Projekt ein |
| Task | `APP_Task` | Schränkt die Liste auf eine Aufgabe ein |
| Description | `APP_Description` | Sucht in der Beschreibung der Zeitbuchung |
| From | `@BeginTime` | Zeigt Einträge ab dem ausgewählten Datum |
| To | `@EndTime` | Zeigt Einträge bis zum ausgewählten Datum |
| Billable | `APP_Billable` | Standardwert ist `true` |
| Billed | `APP_Billed` | Standardwert ist `false` |

## Spalten

Die folgende Tabelle dokumentiert die sichtbaren Standardspalten.

| Spalte | Technische Referenz | Bedeutung | Ermittlung des Werts |
|---|---|---|---|
| Benutzer | `APP_UserDetail`, Query-Alias `UserDetailName` | Benutzer, der die Zeitbuchung erfasst hat | Anzeigewert des zugehörigen Benutzerdetails |
| Customer | `APP_Project.APP_Customer`, Query-Alias `CustomerName` | Kunde des zugehörigen Projekts | Anzeigewert des über das Projekt verknüpften Kunden |
| Project | `APP_Project`, Query-Alias `ProjectName` | Zugehöriges Projekt | Anzeigewert des Projekts |
| Task | `APP_Task`, Query-Alias `TaskName` | Zugehörige Aufgabe | Anzeigewert der Aufgabe |
| Date | `APP_BeginTime`, angezeigt als `APP_Timesheet.APP_DateActual` | Kalenderdatum der Zeitbuchung | Basiert auf dem Beginndatum der Zeitbuchung |
| Begin Time | `APP_BeginTimeActual` | Erfasste Beginnzeit | Aus der tatsächlichen Beginnzeit der Zeitbuchung übernommen |
| End Time | `APP_EndTimeActual` | Erfasste Endzeit | Aus der tatsächlichen Endzeit der Zeitbuchung übernommen |
| Description | `APP_Description` | Freitextbeschreibung | Direkt aus der Zeitbuchung übernommen |
| Location | `APP_Location` | Ort oder Arbeitsort | Direkt aus der Zeitbuchung übernommen |
| Hours | `APP_DurationInHours` | Dauer der Zeitbuchung | Berechnete Dauer der Zeitbuchung in Stunden |
| Hourly Rate | `APP_HourlyRateActual` | Effektiver Stundensatz für verrechnungsbezogene Berechnungen | Aus dem tatsächlichen Stundensatz der Zeitbuchung übernommen |
| Revenue | `APP_Revenue` | Berechneter Umsatz der Zeitbuchung | Standardumsatzwert der Zeitbuchung, typischerweise auf Basis von Dauer und effektivem Stundensatz |
| Billable | `APP_Billable` | Gibt an, ob die Zeitbuchung verrechenbar ist | Aus der Zeitbuchung übernommen |
| Billed | `APP_Billed` | Gibt an, ob die Zeitbuchung bereits der Verrechnung zugeordnet ist | Aus der Zeitbuchung übernommen |
| Fixed Price | `APP_Project.APP_FixedPrice` | Gibt an, ob das zugehörige Projekt ein Fixpreisprojekt ist | Aus dem zugehörigen Projekt übernommen |

## Gruppierung

Die Standardliste gruppiert die Zeilen nach:

1. Kunde
2. Projekt

Damit lässt sich leichter eine Gruppe von Zeitbuchungen für eine einzelne Rechnung auswählen.

## Standardaktion

### Create Invoice

Die wichtigste Standardaktion dieser Liste ist `Create Invoice`.

Im Standardablauf:

- übernimmt die Aktion die ausgewählten Zeitbuchungen
- erstellt oder befüllt sie Rechnungspositionen
- ordnet sie die ausgewählten Zeitbuchungen dem Rechnungskontext zu

Sobald Zeitbuchungen einer Rechnung oder Rechnungsposition zugeordnet sind, werden sie im Standardablauf der Rechnungslegung schreibgeschützt.

Den vollständigen Ablauf der Rechnungslegung finden Sie unter [Rechnungslegung](~/doc/projektzeiterfassung/rechnungslegung.md).

## Hinweise

- Die Liste ist für verrechenbare Arbeit gedacht, die noch verrechnet werden muss.
- Wenn Sie alle Zeitbuchungen statt nur der verrechenbaren und nicht verrechneten benötigen, verwenden Sie [Zeitbuchungen](~/doc/projektzeiterfassung/zeitbuchungen.md).
- Die Spaltenwerte stammen aus der zugrunde liegenden Zeitbuchung und dem zugehörigen Kunden-, Projekt-, Aufgaben- und Rechnungskontext.

## Verwandte Seiten

- [Rechnungslegung](~/doc/projektzeiterfassung/rechnungslegung.md)
- [Abrechnungs-FAQ](~/doc/abrechnungs-faq.md)
- [Navigation und Zugriffsrechte](~/doc/navigation-und-zugriffsrechte.md)
