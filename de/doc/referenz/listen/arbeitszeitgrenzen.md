---
title: Arbeitszeitgrenzen (Working Time Limits)
description: Referenz der Standardliste Working Time Limits in time cockpit mit Prüfeinstellungen für Tages- und Wochenarbeitszeit sowie Pausen.
en_page: doc/reference/lists/working-time-limits.md
---

# Arbeitszeitgrenzen

Die Liste **Working Time Limits** speichert die Prüfmodelle, die für die Prüfung der Arbeitszeit verwendet werden.

## Typische Zielgruppe

Diese Liste ist typischerweise relevant für:

- HR-Administratoren
- Administratoren, die die Arbeitszeitprüfung konfigurieren

## Navigation

- Standardnavigation: `Benutzer -> Working Time Limits`
- Deeplink: `https://web.timecockpit.com/app/lists/entity/APP_WorkingTimeLimit`

## Spalten

| Spalte | Technische Referenz | Bedeutung | Ermittlung des Werts |
|---|---|---|---|
| Code | `APP_Code` | Technischer Code des Grenzwertsatzes | Aus dem Datensatz der Arbeitszeitgrenze übernommen |
| Name | `APP_WorkingTimeLimitName` | Anzeigename des Grenzwertsatzes | Aus dem Datensatz der Arbeitszeitgrenze übernommen |
| Land | `APP_Country` | Mit dem Grenzwertsatz verknüpftes Land | Aus dem zugehörigen Land übernommen |
| Daily Working Time Check Is Active | `APP_DailyWorkingTimeCheckIsActive` | Ob die tägliche Prüfung aktiviert ist | Aus dem Datensatz übernommen |
| Max Daily Working Hours | `APP_MaxDailyWorkingHours` | Tagesgrenze ohne Erweiterung durch Reisezeit | Aus dem Datensatz übernommen |
| Max Daily Working Hours Including Active Travel Time | `APP_MaxDailyWorkingHoursIncludingActiveTravelTime` | Tagesgrenze, wenn aktive Reisezeit eingerechnet wird | Aus dem Datensatz übernommen |
| Max Daily Working Hours Including Active and Passive Travel Time | `APP_MaxDailyWorkingHoursIncludingActiveAndPassiveTravelTime` | Tagesgrenze, wenn die gesamte Reisezeit eingerechnet wird | Aus dem Datensatz übernommen |
| Weekly Working Time Check Is Active | `APP_WeeklyWorkingTimeCheckIsActive` | Ob die wöchentliche Prüfung aktiviert ist | Aus dem Datensatz übernommen |
| Max Weekly Working Hours | `APP_MaxWeeklyWorkingHours` | Wochengrenze | Aus dem Datensatz übernommen |
| Max Weekly Working Hours Including Active and Passive Travel Time | `APP_MaxWeeklyWorkingHoursIncludingActiveAndPassiveTravelTime` | Erweiterte Wochengrenze | Aus dem Datensatz übernommen |
| Break Check Is Active | `APP_BreakCheckIsActive` | Ob die Pausenprüfung aktiviert ist | Aus dem Datensatz übernommen |
| Minimum Break Length in Minutes | `APP_MinBreakLengthInMinutes` | Erforderliche Pausendauer | Aus dem Datensatz übernommen |
| Break After Hours | `APP_BreakAfterHours` | Schwellenwert, ab dem eine Pause erforderlich ist | Aus dem Datensatz übernommen |

## Verwandte Seiten

- [Arbeitszeitverstöße](~/doc/referenz/listen/arbeitszeitverstoesse.md)
- [Arbeitszeit / Urlaub](~/doc/arbeitszeiterfassung/arbeitszeit.md)
