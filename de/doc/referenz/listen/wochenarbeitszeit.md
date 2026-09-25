---
title: Wochenarbeitszeit
description: Referenz der Standardliste Wochenarbeitszeit in time cockpit mit Stunden pro Wochentag, Gültigkeitsdaten und Angaben zur Arbeitszeit.
en_page: doc/reference/lists/weekly-hours-of-work.md
---

# Wochenarbeitszeit

Die Liste **Wochenarbeitszeit** speichert die Sollstunden pro Wochentag und die Gültigkeitszeiträume für einen Benutzer.

## Typische Zielgruppe

Diese Liste ist typischerweise relevant für:

- Mitarbeiter, die ihre Arbeitszeiteinstellungen prüfen
- HR-Administratoren, die die Soll-Arbeitszeit pflegen

## Navigation

- Standardnavigation: `Benutzer -> Wochenarbeitszeit`
- Deeplink: `https://web.timecockpit.com/app/lists/entity/APP_WeeklyHoursOfWork`

## Standardfilter

| Filter | Technische Referenz | Bedeutung |
|---|---|---|
| Benutzer | `@UserDetail` | Beschränkt die Liste auf einen Benutzer |

## Spalten

| Spalte | Technische Referenz | Bedeutung | Ermittlung des Werts |
|---|---|---|---|
| Benutzer | `UserDetailName`, `UserDetailUuid` | Benutzer des Arbeitszeitdatensatzes | Anzeigewert des Benutzerdetails |
| Working Time Category | `APP_WorkingTimeCategoryCode` | Code der zugehörigen Arbeitszeitkategorie | Aus der verknüpften Arbeitszeitkategorie übernommen |
| Normal Working Hours Configured | `APP_HasConfiguredWorkingTimeWindows` | Ob explizite Arbeitszeitfenster vorhanden sind | Als `true` berechnet, wenn in der Woche mindestens ein konfiguriertes Fenster mit Beginn und Ende existiert |
| Valid From | `APP_ValidFrom` | Beginn des Gültigkeitszeitraums | Aus dem Arbeitszeitdatensatz übernommen |
| Valid Until | `APP_ValidUntil` | Ende des Gültigkeitszeitraums | Aus dem Arbeitszeitdatensatz übernommen |
| Description | `APP_Description` | Beschreibung des Datensatzes | Aus dem Arbeitszeitdatensatz übernommen |
| Monday to Sunday | `APP_HoursMonday` ... `APP_HoursSunday` | Sollstunden pro Wochentag | Aus den Wochentagsfeldern des Datensatzes übernommen |
| Sum Hours | `APP_SumHours` | Gesamte Soll-Wochenstunden | Aus dem Summenwert des Datensatzes übernommen |
| Lump Sum Overtime per Month | `APP_LumpSumOvertimePerMonth` | Mit dem Plan verknüpfte monatliche Überstundenpauschale | Aus dem Arbeitszeitdatensatz übernommen |

## Hinweise

- Diese Liste legt Sollstunden pro Wochentag fest, keine exakten täglichen Arbeitszeitfenster als Uhrzeiten.
- Ein Benutzer kann mehrere Datensätze mit unterschiedlichen Gültigkeitszeiträumen haben.

## Verwandte Seiten

- [Arbeitszeit / Urlaub](~/doc/arbeitszeiterfassung/arbeitszeit.md)
- [Target-Actual Hours Comparison](~/doc/referenz/listen/soll-ist-vergleich.md)
