---
title: Telearbeitstage
description: Referenz zur Standardliste Telearbeitstage in time cockpit mit der Logik der Tageszählung und dem Drill-down zu den Details.
en_page: doc/reference/lists/home-office-overview.md
---

# Telearbeitstage

Die Liste **Telearbeitstage** zählt die Homeoffice-Tage pro Benutzer für einen ausgewählten Zeitraum.

## Typische Zielgruppe

Diese Liste ist typischerweise relevant für:

- Mitarbeiter, die ihre eigenen Homeoffice-Tage prüfen
- Abteilungsleiter, die die Summen ihres Teams prüfen
- HR-Administratoren, die die Summen der Telearbeit prüfen

## Navigation

- Standardnavigation: `Benutzer -> Telearbeitstage`
- Deeplink: `https://web.timecockpit.com/app/lists/APP_HomeOfficeOverviewList`

## Standardfilter

| Filter | Technische Referenz | Bedeutung |
|---|---|---|
| Benutzer | `@UserDetailFilter` | Schränkt die Liste auf einen Benutzer ein |
| Inkl. ausgeblendeter Benutzer | `@IncludeHiddenUsers` | Bezieht ausgeblendete Benutzer ein |
| From | `@BeginTimeFilter` | Beginn des Zählzeitraums |
| To | `@EndTimeFilter` | Ende des Zählzeitraums |

## Spalten

| Spalte | Technische Referenz | Bedeutung | Ermittlung des Werts |
|---|---|---|---|
| Benutzer | `Fullname`, `UserDetailUuid` | In der Zeile angezeigter Benutzer | Anzeigewert des Benutzerdetails |
| Telearbeitstage | `HomeOfficeCount` | Anzahl der gezählten Homeoffice-Tage | Ein Tag zählt nur, wenn er mindestens eine relevante Homeoffice-Zeitbuchung und keine relevante Zeitbuchung außerhalb des Homeoffice enthält |
| Details | Link auf `HomeOfficeDetailList` | Drill-down zu den detaillierten Datensätzen | Öffnet die Detailliste mit denselben Filtern für Benutzer und Datum |

## Hinweise

- Die Zählung erfolgt nach Tagen, nicht nach Einträgen.
- Ein gemischter Tag mit Homeoffice-Einträgen und Einträgen außerhalb des Homeoffice zählt in der Standardlogik nicht als voller Homeoffice-Tag.

## Verwandte Seiten

- [Stundenzettel](~/doc/referenz/listen/stundenzettel.md)
- [Arbeitszeit / Urlaub](~/doc/arbeitszeiterfassung/arbeitszeit.md)
