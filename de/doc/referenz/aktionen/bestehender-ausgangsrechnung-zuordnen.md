---
title: Bestehender Ausgangsrechnung zuordnen - Aktionsreferenz
description: Referenz zur Standardaktion Assign to Existing Outgoing Invoice in time cockpit mit Voraussetzungen, Parametern und Nebeneffekten.
en_page: doc/reference/actions/assign-to-existing-outgoing-invoice.md
---

# Bestehender Ausgangsrechnung zuordnen

Die Aktion **Assign to Existing Outgoing Invoice** ordnet ausgewählte Zeitbuchungen einer bereits vorhandenen Ausgangsrechnung zu.

## Wo die Aktion verfügbar ist

In der Standardkonfiguration wird diese Aktion hier verwendet:

- [Verwaltung -> Billing -> Unbilled Timesheets](https://web.timecockpit.com/app/lists/APP_UnbilledTimesheetsList)

Mit den Standardberechtigungen ist diese Aktion für **Abrechnungsadministratoren** vorgesehen.

## Bevor Sie beginnen

Die ausgewählten Zeitbuchungen müssen:

- noch nicht verrechnet sein
- ein Projekt haben
- zum selben Projekt gehören wie die Zielrechnung

Sind eine oder mehrere der ausgewählten Zeitbuchungen bereits verrechnet oder passt das Projekt nicht zur ausgewählten Rechnung, bricht die Aktion mit einem Validierungsfehler ab.

## Parameter

Wenn Sie die Aktion ausführen, lässt time cockpit Sie diesen Parameter auswählen:

| Feld | Technische Referenz | Bedeutung |
|---|---|---|
| Outgoing Invoice | `APP_Invoice` | Bestehende Rechnung, der die ausgewählten Zeitbuchungen zugeordnet werden sollen |

## Was die Aktion ändert

Ist die Aktion erfolgreich, führt sie diese Standardschritte aus:

1. Sie lädt die ausgewählte Ausgangsrechnung.
2. Sie prüft, ob alle ausgewählten Zeitbuchungen zum selben Projekt gehören wie diese Rechnung.
3. Sie ordnet die ausgewählten Zeitbuchungen der bestehenden Rechnung zu.
4. Sie kopiert bei verrechenbaren Zeitbuchungen den aktuellen Stundensatz in `APP_HourlyRateBilled`.
5. Sie speichert bei nicht verrechenbaren Zeitbuchungen `0` in `APP_HourlyRateBilled`.

## Nebeneffekte und Standardlogik

Wichtige Standardverhalten:

- Die Aktion erstellt keine neue Rechnung.
- Die Aktion erstellt von sich aus keine neuen Rechnungspositionen.
- Die Aktion aktualisiert die Rechnungsverknüpfung der ausgewählten Zeitbuchungen.
- Der verrechnete Stundensatz wird in der Zeitbuchung festgeschrieben, genau wie im Standardablauf der Rechnungserstellung.

## Typische Gründe, warum die Aktion fehlschlägt

Die Standardaktion bricht mit einem Validierungsfehler ab, wenn:

- eine der ausgewählten Zeitbuchungen bereits verrechnet ist
- eine der ausgewählten Zeitbuchungen kein Projekt hat
- eine der ausgewählten Zeitbuchungen zu einem anderen Projekt gehört als die ausgewählte Rechnung

## Verwandte Seiten

- [Nicht verrechnete Zeitbuchungen](~/doc/referenz/listen/nicht-verrechnete-zeitbuchungen.md)
- [Rechnung erstellen](~/doc/referenz/aktionen/rechnung-erstellen.md)
- [Rechnungslegung](~/doc/projektzeiterfassung/rechnungslegung.md)
- [Abrechnungs-FAQ](~/doc/abrechnungs-faq.md)
