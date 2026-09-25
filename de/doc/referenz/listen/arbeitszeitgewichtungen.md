---
title: Arbeitszeitgewichtungen (Working Time Weights)
description: Referenz der Standardliste Working Time Weights in time cockpit mit den Gewichtungswerten, die in Arbeitszeitberechnungen verwendet werden.
en_page: doc/reference/lists/working-time-weights.md
---

# Arbeitszeitgewichtungen

Die Liste **Working Time Weights** speichert Gewichtungsdefinitionen, die Arbeitszeitberechnungen beeinflussen.

## Typische Zielgruppe

Diese Liste ist typischerweise relevant für:

- HR-Administratoren
- Administratoren, die das Verhalten der Arbeitszeitberechnung konfigurieren

## Navigation

- Standardnavigation: `Benutzer -> Working Time Weights`
- Deeplink: `https://web.timecockpit.com/app/lists/entity/APP_WorkingTimeWeight`

## Spalten

| Spalte | Technische Referenz | Bedeutung | Ermittlung des Werts |
|---|---|---|---|
| Name | `APP_WorkingTimeWeightName` | Name der Gewichtungsdefinition | Aus dem Datensatz übernommen |
| Description | `APP_Description` | Beschreibung der Gewichtungsdefinition | Aus dem Datensatz übernommen |
| Weight | `APP_Weight` | Numerische Gewichtung, die in Berechnungen verwendet wird | Aus dem Datensatz übernommen |
| Is Break | `APP_IsBreak` | Ob die Gewichtung eine Pause darstellt | Aus dem Datensatz übernommen |

## Verwandte Seiten

- [Target-Actual Hours Comparison](~/doc/referenz/listen/soll-ist-vergleich.md)
- [Arbeitszeit / Urlaub](~/doc/arbeitszeiterfassung/arbeitszeit.md)
