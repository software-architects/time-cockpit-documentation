---
title: Urlaubsanspruch
description: Referenz der Standardliste Urlaubsanspruch in time cockpit mit Filtern und den Anspruchsfeldern pro Benutzer.
en_page: doc/reference/lists/vacation-entitlement.md
---

# Urlaubsanspruch

Die Liste **Urlaubsanspruch** enthält die Anspruchsdatensätze, die für einen Benutzer Urlaubswochen hinzufügen oder anpassen.

## Typische Zielgruppe

Diese Liste ist typischerweise relevant für:

- Mitarbeiter, die ihren eigenen Anspruchsverlauf prüfen
- HR-Administratoren, die Urlaubsansprüche pflegen

## Navigation

- Standardnavigation: `Benutzer -> Urlaubsanspruch`
- Deeplink: `https://web.timecockpit.com/app/lists/entity/APP_VacationEntitlement`

## Standardfilter

| Filter | Technische Referenz | Bedeutung |
|---|---|---|
| Benutzer | `@UserDetail` | Beschränkt die Liste auf einen Benutzer |
| Inkl. ausgeblendeter Benutzer | `@IncludeHiddenUsers` | Bezieht ausgeblendete Benutzer ein |

## Spalten

| Spalte | Technische Referenz | Bedeutung | Ermittlung des Werts |
|---|---|---|---|
| Benutzer | `UserDetailName`, `UserDetailUuid` | Benutzer des Anspruchsdatensatzes | Anzeigewert des Benutzerdetails |
| Entstehungsdatum | `APP_VacationEntitlementDate` | Datum, ab dem der Anspruch wirksam wird | Aus dem Anspruchsdatensatz übernommen |
| Anzahl Wochen | `APP_NumberOfWeeks` | Anzahl der gewährten oder abgezogenen Urlaubswochen | Aus dem Anspruchsdatensatz übernommen |
| Außerordentlicher Urlaubsanspruch | `APP_IsExtraordinary` | Kennzeichnet den Anspruch als außerordentlich, sodass er nicht aliquotiert wird (siehe [Aliquoter Urlaub](~/doc/arbeitszeiterfassung/aliquoter-urlaub.md)) | Aus dem Anspruchsdatensatz übernommen |
| Description | `APP_Description` | Freitextbeschreibung des Anspruchs | Aus dem Anspruchsdatensatz übernommen |

## Verwandte Seiten

- [Urlaub](~/doc/referenz/listen/urlaub.md)
- [Resturlaub](~/doc/referenz/listen/resturlaub.md)
- [Aliquoter Urlaub](~/doc/arbeitszeiterfassung/aliquoter-urlaub.md)
