---
title: Ausgangsrechnung anlegen - Aktionsreferenz
description: Referenz zur Standardaktion Ausgangsrechnung anlegen in time cockpit mit Voraussetzungen, Parametern und Nebeneffekten im Standardablauf.
en_page: doc/reference/actions/create-invoice.md
---

# Ausgangsrechnung anlegen

Die Aktion **Ausgangsrechnung anlegen** erstellt aus ausgewählten, nicht verrechneten Zeitbuchungen eine neue Ausgangsrechnung.

## Wo die Aktion verfügbar ist

In der Standardkonfiguration wird diese Aktion hier verwendet:

- [Verwaltung -> Verrechnung -> Nicht verrechnete Zeitbuchungen](https://web.timecockpit.com/app/lists/APP_UnbilledTimesheetsList)

Mit den Standardberechtigungen ist die Aktion für **Abrechnungsadministratoren** vorgesehen.

## Bevor Sie beginnen

Die Aktion funktioniert nur, wenn alle ausgewählten Zeitbuchungen die Standardvalidierungsregeln erfüllen.

Die ausgewählten Zeitbuchungen müssen:

- ein Projekt haben
- zum selben Projekt gehören
- noch nicht verrechnet sein
- einen Umsatzwert haben, was in der Praxis bedeutet, dass die auf dem Stundensatz basierenden Verrechnungsinformationen vorhanden sein müssen

Außerdem muss die Konfiguration des Mandanten für die Rechnungserstellung ausreichend vollständig sein. Insbesondere:

- muss ein Unternehmen mit Länderangabe vorhanden sein
- muss der Artikel mit dem Code `serviceTime` vorhanden sein
- muss der Artikel mit dem Code `travelCosts` vorhanden sein, wenn Kilometer verrechnet werden sollen

## Parameter

Wenn Sie die Aktion ausführen, öffnet time cockpit ein Parameterformular mit diesen Standardfeldern:

| Feld | Technische Referenz | Bedeutung |
|---|---|---|
| Rechnungsdatum | `APP_InvoiceDate` | Datum, das in der neuen Rechnung gespeichert wird |
| Rechnungsnummer | `APP_InvoiceNumber` | Zu verwendende Rechnungsnummer, wenn Sie sie explizit festlegen |
| Invoice Description | `APP_InvoiceDescription` | In der Rechnung gespeicherte Beschreibung |
| Leistungszeitraum Beginn | `APP_ServiceStartDate` | Optionales Beginndatum des Leistungszeitraums |
| Leistungszeitraum Ende | `APP_ServiceEndDate` | Optionales Enddatum des Leistungszeitraums |

Das Standardparameterformular bietet außerdem Aktionen, um die Rechnungsnummer manuell oder automatisch festzulegen.

Wenn Sie den Leistungszeitraum leer lassen, leitet time cockpit ihn aus dem Datum der ersten und der letzten ausgewählten Zeitbuchung ab.

## Was die Aktion ändert

Ist die Aktion erfolgreich, führt sie diese Standardschritte aus:

1. Sie erstellt eine neue Rechnung für das Projekt der ausgewählten Zeitbuchungen.
2. Sie speichert das Rechnungsdatum, die Einstellungen der Rechnungsnummer, die optionale Beschreibung und den optionalen Leistungszeitraum.
3. Sie ordnet die ausgewählten Zeitbuchungen der neuen Rechnung zu.
4. Sie kopiert bei verrechenbaren Zeitbuchungen den aktuellen Verrechnungssatz in `APP_HourlyRateBilled`.
5. Sie erstellt Rechnungspositionen für Dienstleistungszeit, gruppiert nach Tätigkeit und Stundensatz.
6. Optional erstellt sie eine zusätzliche Rechnungsposition für Reisekosten, wenn die ausgewählten Zeitbuchungen eine Fahrtstrecke enthalten.
7. Sie aktualisiert den Kostenwert der Rechnung auf Basis der Stundenkostensätze der beteiligten Benutzer.

## Nebeneffekte und Standardlogik

Einige Standardverhalten werden leicht übersehen:

- **Ersatzwert für den Leistungszeitraum:** Werden keine Leistungsdaten eingegeben, verwendet die Aktion das früheste und das späteste Datum der ausgewählten Zeitbuchungen.
- **Gruppierung der Rechnungspositionen:** Dienstleistungspositionen werden nach Tätigkeit und Stundensatz gruppiert, nicht unbedingt eine Position pro Zeitbuchung.
- **Festschreiben des Stundensatzes:** Der verrechnete Stundensatz wird in die Zeitbuchung kopiert, sodass spätere Änderungen des Satzes bereits verrechnete Daten nicht verändern.
- **Umsatzsteuer bei Auslandsgeschäften:** Unterscheidet sich das Land des Kunden vom Land des Rechnungsstellers, setzt die Aktion den Umsatzsteuersatz der generierten Rechnungspositionen auf `0`.
- **Reisekosten:** Ist eine Fahrtstrecke vorhanden, kann die Aktion eine eigene Rechnungsposition auf Basis des Artikels `travelCosts` hinzufügen.

## Typische Gründe, warum die Aktion fehlschlägt

Die Standardaktion bricht mit einem Validierungsfehler ab, wenn:

- eine ausgewählte Zeitbuchung keinen für die Verrechnung bereiten Umsatzwert hat
- eine ausgewählte Zeitbuchung kein Projekt hat
- die Auswahl mehr als ein Projekt enthält
- eine der ausgewählten Zeitbuchungen bereits verrechnet ist
- erforderliche Stammdaten der Verrechnung wie das Land des Unternehmens oder die Standardartikel fehlen

## Verwandte Seiten

- [Nicht verrechnete Zeitbuchungen](~/doc/referenz/listen/nicht-verrechnete-zeitbuchungen.md)
- [Rechnungslegung](~/doc/projektzeiterfassung/rechnungslegung.md)
- [Rechnungsdatenfelder](~/doc/projektzeiterfassung/rechnungsdatenfelder.md)
- [Abrechnungs-FAQ](~/doc/abrechnungs-faq.md)
