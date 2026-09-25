---
title: Krankenstand
description: Referenz der Standardliste Krankenstand in time cockpit mit Filtern und den angezeigten Feldern der Abwesenheit.
en_page: doc/reference/lists/sick-leave.md
---

# Krankenstand

Die Liste **Krankenstand** zeigt die Krankenstandseinträge für einen ausgewählten Benutzer und Zeitraum.

## Typische Zielgruppe

Diese Liste ist typischerweise relevant für:

- Mitarbeiter, die ihre eigenen Einträge prüfen
- Abteilungsleiter, die die Einträge ihres Teams prüfen
- HR-Administratoren, die Krankenstandsdaten prüfen und pflegen

## Navigation

- Standardnavigation: `Benutzer -> Krankenstand`
- Deeplink: `https://web.timecockpit.com/app/lists/entity/APP_SickLeave`

## Standardfilter

| Filter | Technische Referenz | Bedeutung |
|---|---|---|
| Benutzer | `@UserDetail` | Benutzer, dessen Einträge angezeigt werden |
| Since | `@YearParam` | Startjahr der angezeigten Einträge |
| Include Hidden Users | `@IncludeHiddenUsers` | Bezieht ausgeblendete Benutzer ein |

## Spalten

| Spalte | Technische Referenz | Bedeutung | Ermittlung des Werts |
|---|---|---|---|
| Benutzer | `UserDetailName`, `UserDetailUuid` | Benutzer des Eintrags | Anzeigewert des Benutzerdetails |
| Is Whole Day | `APP_IsWholeDay` | Ob der Eintrag ganztägig ist | Aus dem Krankenstandsdatensatz übernommen |
| From | `APP_BeginTime` | Beginn des Krankenstands | Aus dem Krankenstandsdatensatz übernommen |
| To | `APP_EndTime` | Ende des Krankenstands | Aus dem Krankenstandsdatensatz übernommen |
| Description | `APP_Description` | Beschreibung des Eintrags | Aus dem Krankenstandsdatensatz übernommen |
| Approved | `APP_IsApproved` | Genehmigungsstatus | Aus dem Krankenstandsdatensatz übernommen und angezeigt, wenn die Genehmigung von Krankenständen aktiv ist |

## Verwandte Seiten

- [Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md)
- [Absence Calendar](~/doc/referenz/listen/abwesenheitskalender.md)
