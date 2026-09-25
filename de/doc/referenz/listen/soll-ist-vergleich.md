---
title: Soll-Ist-Vergleich (Target-Actual Hours Comparison)
description: Referenz zur Standardliste Target-Actual Hours Comparison in time cockpit mit Zeitraumfiltern und den wichtigsten Soll-Ist-Berechnungen.
en_page: doc/reference/lists/target-actual-hours-comparison.md
---

# Soll-Ist-Vergleich

Die Liste **Target-Actual Hours Comparison** vergleicht Soll- und Iststunden für einen ausgewählten Zeitraum und zeigt die daraus resultierende Abweichung pro Benutzer.

## Typische Zielgruppe

Diese Liste ist typischerweise relevant für:

- Mitarbeiter, die ihr eigenes Ergebnis für den Zeitraum prüfen
- Abteilungsleiter, die Soll- und Iststunden ihres Teams vergleichen
- HR-Administratoren, die Abweichungen über mehrere Benutzer hinweg prüfen

## Navigation

- Standardnavigation: `User -> Target-Actual Hours Comparison`
- Deeplink: `https://web.timecockpit.com/app/lists/APP_TargetActualHoursComparisonList`

## Standardfilter

| Filter | Technische Referenz | Bedeutung |
|---|---|---|
| Start Date | `@StartDate` | Beginn des Vergleichszeitraums |
| End Date | `@EndDate` | Ende des Vergleichszeitraums |
| Consider Working Time Weight | `@IncludeWeights` | Bezieht Arbeitszeitgewichtungen in die Berechnung der Iststunden ein |
| Include Hidden Users | `@IncludeHiddenUsers` | Bezieht ausgeblendete Benutzer ein |

## Spalten

| Spalte | Technische Referenz | Bedeutung | Ermittlung des Werts |
|---|---|---|---|
| Benutzer | `UserDetailName`, `UserDetailUuid` | In der Zeile angezeigter Benutzer | Anzeigewert des Benutzerdetails |
| Target Hours | `PlannedHoursOfWork` | Sollstunden für den Zeitraum | Mit der Standardfunktion für Sollstunden ohne Überstundenpauschale berechnet |
| Target Hours Including Overtime | `PlannedHoursOfWorkIncludingLumpSumOvertime` | Sollstunden einschließlich monatlicher Überstundenpauschale | Mit der Standardfunktion für Sollstunden einschließlich Überstundenpauschale berechnet |
| Ist | `ActualHoursOfWork` | Tatsächlich geleistete Stunden im Zeitraum | Mit der Standardfunktion für Iststunden und der ausgewählten Einstellung für Gewichtungen berechnet |
| Abweichung | `Deviation` | Differenz zwischen Soll und Ist | Mit der Standardfunktion für Überstunden für den ausgewählten Zeitraum berechnet |
| Deviation % | abgeleitete `DataBarCell` | Relative Abweichung | Bei negativer Abweichung vergleicht die Liste sie mit den Sollstunden. Bei positiver Abweichung vergleicht sie sie mit den Sollstunden einschließlich Überstunden. |

## Hinweise

- Diese Liste ist zeitraumbezogen. Wenn Sie eine Momentaufnahme zu einem einzelnen Datum benötigen, verwenden Sie [Überstunden zum Stichtag](~/doc/referenz/listen/ueberstunden-zum-stichtag.md).
- Der Wert der Iststunden kann sich ändern, je nachdem, ob Arbeitszeitgewichtungen einbezogen werden.
- Ausgeblendete Benutzer sind ausgeschlossen, sofern der entsprechende Filter nicht aktiviert ist.

## Verwandte Seiten

- [Überstunden zum Stichtag](~/doc/referenz/listen/ueberstunden-zum-stichtag.md)
- [Zeitbericht](~/doc/referenz/listen/zeitbericht.md)
- [Arbeitszeit / Urlaub](~/doc/arbeitszeiterfassung/arbeitszeit.md)
