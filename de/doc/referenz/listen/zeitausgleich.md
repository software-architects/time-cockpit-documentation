---
title: Zeitausgleich
description: Referenz der Standardliste Zeitausgleich in time cockpit mit Filtern und den angezeigten Feldern der Abwesenheit.
en_page: doc/reference/lists/compensatory-time.md
---

# Zeitausgleich

Die Liste **Zeitausgleich** zeigt die Zeitausgleichseinträge für einen ausgewählten Benutzer und Zeitraum.

## Typische Zielgruppe

Diese Liste ist typischerweise relevant für:

- Mitarbeiter, die ihre eigenen Einträge prüfen
- Abteilungsleiter, die die Einträge ihres Teams prüfen
- HR-Administratoren, die Zeitausgleichsdaten prüfen und pflegen

## Navigation

- Standardnavigation: `Benutzer -> Zeitausgleich`
- Deeplink: `https://web.timecockpit.com/app/lists/entity/APP_CompensatoryTime`

## Standardfilter

| Filter | Technische Referenz | Bedeutung |
|---|---|---|
| Benutzer | `@UserDetail` | Benutzer, dessen Einträge angezeigt werden |
| Seit | `@YearParam` | Startjahr der angezeigten Einträge |

## Spalten

| Spalte | Technische Referenz | Bedeutung | Ermittlung des Werts |
|---|---|---|---|
| Benutzer | `APP_UserDetail` | Benutzer des Eintrags | Aus dem Zeitausgleichsdatensatz übernommen |
| Ganztägig | `APP_IsWholeDay` | Ob der Eintrag ganztägig ist | Aus dem Zeitausgleichsdatensatz übernommen |
| From | `APP_BeginTime` | Beginn des Eintrags | Aus dem Zeitausgleichsdatensatz übernommen |
| To | `APP_EndTime` | Ende des Eintrags | Aus dem Zeitausgleichsdatensatz übernommen |
| Description | `APP_Description` | Beschreibung des Eintrags | Aus dem Zeitausgleichsdatensatz übernommen |
| Genehmigt | `APP_IsApproved` | Genehmigungsstatus | Aus dem Datensatz übernommen und angezeigt, wenn die Genehmigung von Zeitausgleich aktiv ist |

## Verwandte Seiten

- [Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md)
- [Abwesenheitskalender](~/doc/referenz/listen/abwesenheitskalender.md)
