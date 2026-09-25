---
title: Arbeitszeitverstöße (Working Time Violations)
description: Referenz der Standardliste Working Time Violations in time cockpit mit Filtern, Prüfkontext und Drill-down-Links.
en_page: doc/reference/lists/working-time-violations.md
---

# Arbeitszeitverstöße

Die Liste **Working Time Violations** zeigt erkannte Verstöße gegen die aktiven Regeln der Arbeitszeitprüfung für einen ausgewählten Benutzer und Datumsbereich.

## Typische Zielgruppe

Diese Liste ist typischerweise relevant für:

- HR-Administratoren
- Abteilungsleiter
- Mitarbeiter, die einen erkannten Verstoß nachvollziehen müssen

## Navigation

- Standardnavigation: `Benutzer -> Working Time Violations`
- Deeplink: `https://web.timecockpit.com/app/lists/APP_DefaultWorkingTimeViolationList`

## Standardfilter

| Filter | Technische Referenz | Bedeutung |
|---|---|---|
| Benutzer | `@UserDetail` | Zu prüfender Benutzer |
| From | `@BeginTime` | Startdatum des Prüfzeitraums |
| To | `@EndTime` | Enddatum des Prüfzeitraums |

## Spalten

| Spalte | Technische Referenz | Bedeutung | Ermittlung des Werts |
|---|---|---|---|
| Benutzer | `UserDetailName`, `UserDetailUuid` | Benutzer mit dem erkannten Verstoß | Anzeigewert des Benutzerdetails |
| Working Time Violation | `Description` | Text, der das erkannte Problem erklärt | Von der Logik der Arbeitszeitprüfung erzeugt |
| Working Time Limit | `WorkingTimeLimitName`, `WorkingTimeLimitUuid` | Für den Verstoß verwendetes Prüfmodell | Aus dem Datensatz der Arbeitszeitgrenze übernommen, der bei der Prüfung verwendet wurde |
| Go To Calendar | URL auf `/app/timesheetcalendar` | Direkter Sprung in den Kalender | Erzeugt eine URL des Web-Kalenders für das betreffende Datum und den Benutzer |
| Zeitbuchungen | gefilterter `APP_Timesheet`-Link | Drill-down zu den betreffenden Zeitbuchungen | Öffnet die Liste der Zeitbuchungen für den betroffenen Benutzer und Zeitraum |

## So werden Verstöße ermittelt

Die Liste führt die Standardprüfung der Arbeitszeit aus, basierend auf:

- der ausgewählten Arbeitszeitgrenze
- globalen Einstellungen, die tägliche, wöchentliche und Pausenprüfungen aktivieren
- den erfassten Zeitbuchungen im ausgewählten Zeitraum
- der Behandlung von Reisezeiten, sofern relevant

## Hinweise

- Die Seite dient der Auswertung. Sie korrigiert selbst keine Daten.
- Ist kein aktives Prüfmodell konfiguriert, kann die Liste statt Verstößen ein Informationsergebnis anzeigen.

## Verwandte Seiten

- [Arbeitszeitgrenzen](~/doc/referenz/listen/arbeitszeitgrenzen.md)
- [Arbeitszeit / Urlaub](~/doc/arbeitszeiterfassung/arbeitszeit.md)
- [Standardberechtigungen](~/doc/arbeitszeiterfassung/standardberechtigungen.md)
