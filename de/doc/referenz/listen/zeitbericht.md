---
title: Zeitbericht (Time Report) - Listenreferenz
description: Referenz zur Standardliste Time Report in time cockpit mit Filtern, sichtbaren Spalten und dem wichtigsten Berechnungskontext des Berichts.
en_page: doc/reference/lists/time-report.md
---

# Zeitbericht

Die Liste **Time Report** erstellt einen tageweisen Bericht für einen Benutzer in einem ausgewählten Zeitraum. Sie kombiniert Anwesenheit, Sollstunden, Abwesenheiten sowie Informationen zu Überstunden und Urlaub.

## Typische Zielgruppe

Diese Liste ist typischerweise relevant für:

- Mitarbeiter, die ihren eigenen Monat prüfen
- Abteilungsleiter, die jeweils einen Mitarbeiter prüfen
- HR-Administratoren, die eine kompakte tägliche Übersicht benötigen

## Navigation

- Standardnavigation: `User -> Time Report`
- Deeplink: `https://web.timecockpit.com/app/lists/APP_DefaultTimeReportList`

## Standardfilter

| Filter | Technische Referenz | Bedeutung |
|---|---|---|
| Benutzer | `@UserDetail` | Benutzer, für den der Bericht erstellt wird |
| From | `@BeginTime` | Beginndatum des Berichts |
| To | `@EndTime` | Enddatum des Berichts |

## Sichtbare Spalten

| Spalte | Technische Referenz | Bedeutung | Ermittlung des Werts |
|---|---|---|---|
| Date | `Date` | Berichtstag | Eine Zeile pro Tag im ausgewählten Intervall |
| Working Time | `WorkingTime` | Arbeitsstunden des Tages | Aus den erfassten Einträgen des Benutzers für den Tag berechnet |
| Breaks | `Breaks` | Zusammenfassung der Pausen als Text | Aus der Anwesenheitssituation des Tages gebildet |
| Break Time | `BreakTime` | Pausendauer | Berechnete Pausendauer für den Tag |
| Home Office | `IsHomeOfficeDay` | Ob der Tag als Homeoffice-Tag zählt | Wird gesetzt, wenn die relevanten Einträge des Tages Homeoffice-Einträge sind und die Funktion sichtbar ist |
| Text | `Text` | Tagesbezogener Kontexttext | Aus Abwesenheiten, Feiertagen und anderen tagesbezogenen Umständen gebildet |
| Time Sheet Entries | gefilterter Link auf `APP_Timesheet` | Drill-down zu den Zeitbuchungen des Tages | Öffnet die Liste der Zeitbuchungen für den ausgewählten Benutzer und Tag |

## Zusätzliche Berichtswerte

Die Liste berechnet außerdem zusätzliche Werte, die hauptsächlich von der Berichtsausgabe und der Zusammenfassungslogik verwendet werden, zum Beispiel:

- Überstunden zu Beginn und am Ende des Zeitraums
- Überstunden innerhalb des Zeitraums
- Sollstunden im Monat
- Iststunden im Monat
- Resturlaub zu Beginn und am Ende des Zeitraums
- genommener Urlaub und neuer Urlaubsanspruch im Zeitraum

Diese Werte stammen aus den Standardberechnungen für Arbeitszeit, Überstunden, Urlaub, gesetzliche Feiertage und Abwesenheiten.

## Hinweise

- Der Standardbericht erwartet jeweils einen Benutzer.
- Beginn- und Enddatum müssen im selben Jahr liegen.
- Der Bericht kombiniert Zeitbuchungen, Wochenarbeitszeit, Feiertage, Urlaub, Krankenstand, Zeitausgleich und Überstundenkorrekturen.

## Verwandte Seiten

- [Arbeitszeit / Urlaub](~/doc/arbeitszeiterfassung/arbeitszeit.md)
- [Überstunden zum Stichtag](~/doc/referenz/listen/ueberstunden-zum-stichtag.md)
- [Soll-Ist-Vergleich](~/doc/referenz/listen/soll-ist-vergleich.md)
