---
title: Resturlaub
description: Referenz der Standardliste Resturlaub in time cockpit mit Berechnung des Resturlaubs und Drill-down-Links.
en_page: doc/reference/lists/vacation-per-effective-date.md
---

# Resturlaub

Die Liste **Resturlaub** zeigt den Resturlaub jedes Benutzers zu einem ausgewählten Datum.

## Typische Zielgruppe

Diese Liste ist typischerweise relevant für:

- Mitarbeiter, die ihren aktuellen Resturlaub prüfen
- Abteilungsleiter, die den Resturlaub ihres Teams prüfen
- HR-Administratoren, die den Resturlaub mehrerer Benutzer prüfen

## Navigation

- Standardnavigation: `Benutzer -> Resturlaub`
- Deeplink: `https://web.timecockpit.com/app/lists/APP_VacationPerEffectiveDateList`

## Standardfilter

| Filter | Technische Referenz | Bedeutung |
|---|---|---|
| Stichtag | `@EffectiveDate` | Datum, für das der Resturlaub berechnet wird |
| Aliquotieren | `@Prorate` | Bei Yes wird der Saldo um den noch nicht erworbenen Anteil aktueller Ansprüche verringert (siehe [Aliquoter Urlaub](~/doc/arbeitszeiterfassung/aliquoter-urlaub.md)) |
| Inkl. ausgeblendeter Benutzer | `@IncludeHiddenUsers` | Bezieht ausgeblendete Benutzer ein |

## Spalten

| Spalte | Technische Referenz | Bedeutung | Ermittlung des Werts |
|---|---|---|---|
| Benutzer | `UserDetailName`, `UserDetailUuid` | In der Zeile angezeigter Benutzer | Anzeigewert des Benutzerdetails |
| Resturlaub in Wochen | `RemainingWeeks` | Resturlaub zum ausgewählten Datum | Mit der Standardfunktion für den Resturlaub berechnet |
| Balance Bar | `RemainingWeeks` in `DataBarCell` | Grafische Darstellung des Saldos | Verwendet denselben Wert der Restwochen wie die numerische Spalte |
| Urlaub | gefilterter `APP_Vacation`-Link | Drill-down zu den Urlaubseinträgen des Benutzers | Öffnet die Urlaubsliste, gefiltert auf den aktuellen Benutzer |
| Urlaubsanspruch | gefilterter `APP_VacationEntitlement`-Link | Drill-down zu den Anspruchsdatensätzen des Benutzers | Öffnet die Liste der Urlaubsansprüche, gefiltert auf den aktuellen Benutzer |

## Hinweise

- Diese Liste eignet sich für eine Momentaufnahme zu einem einzelnen Datum.
- Wenn Sie einen detaillierten Verlauf von Ansprüchen, Abzügen und Urlaubsverbrauch benötigen, öffnen Sie die Urlaubsliste des Benutzers.

## Verwandte Seiten

- [Urlaub](~/doc/referenz/listen/urlaub.md)
- [Urlaubsanspruch](~/doc/referenz/listen/urlaubsanspruch.md)
- [Aliquoter Urlaub](~/doc/arbeitszeiterfassung/aliquoter-urlaub.md)
- [Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md)
