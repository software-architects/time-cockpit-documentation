---
title: Arbeitszeitsaldo
description: Referenz zur Standardliste Arbeitszeitsaldo in time cockpit mit Filtern, berechneten Spalten und Links zu Korrekturen des Arbeitszeitsaldos.
en_page: doc/reference/lists/overtime-per-effective-date.md
---

# Arbeitszeitsaldo

Die Liste **Arbeitszeitsaldo** zeigt den Überstundensaldo jedes Mitarbeiters zu einem ausgewählten Datum. Sie ist nützlich, wenn Sie eine Momentaufnahme statt eines zeitraumbezogenen Vergleichs benötigen.

## Typische Zielgruppe

Diese Liste ist typischerweise relevant für:

- Mitarbeiter, die ihren eigenen Saldo prüfen
- Abteilungsleiter, die den Saldo ihres Teams prüfen
- HR-Administratoren, die Überstunden über mehrere Benutzer hinweg prüfen

## Navigation

- Standardnavigation: `Benutzer -> Arbeitszeitsaldo`
- Deeplink: `https://web.timecockpit.com/app/lists/APP_OvertimePerEffectiveDateList`

## Was die Liste zeigt

Die Liste berechnet pro Benutzer einen Überstundenwert für den ausgewählten Stichtag.

Sie ähnelt der Liste **Soll-Ist-Vergleich**, hat aber einen anderen Schwerpunkt:

- **Arbeitszeitsaldo** liefert den Überstundensaldo zu einem ausgewählten Datum
- **Soll-Ist-Vergleich** vergleicht Soll- und Iststunden für einen ausgewählten Zeitraum

## Standardfilter

Der Standardfilterbereich enthält diese Filter:

| Filter | Technische Referenz | Bedeutung |
|---|---|---|
| Stichtag | `@EffectiveDate` | Datum, für das der Überstundensaldo berechnet wird |
| Inkl. ausgeblendeter Benutzer | `@IncludeHiddenUsers` | Bezieht ausgeblendete Benutzerdatensätze ein, wenn der Wert `true` ist |

Der Standardwert für **Stichtag** ist der letzte Tag des Vormonats.

## Spalten

Die folgende Tabelle dokumentiert die sichtbaren Standardspalten.

| Spalte | Technische Referenz | Bedeutung | Ermittlung des Werts |
|---|---|---|---|
| Benutzer | `UserDetailName`, `UserDetailUuid` | In der Zeile angezeigter Mitarbeiter | Anzeigewert des Benutzerdetail-Datensatzes |
| Overtime | `Overtime` | Überstundensaldo zum ausgewählten Datum | Mit der Standardfunktion für Überstunden für den ausgewählten Benutzer und Stichtag berechnet |
| Overtime Bar | `Overtime` in `DataBarCell` | Grafische Darstellung des Überstundensaldos | Verwendet denselben Überstundenwert wie die numerische Spalte und zeigt ihn als Balken an |
| Korrektur Arbeitszeitsaldo | Hyperlink auf gefiltertes `APP_OvertimeCorrection` | Drill-down zu den manuellen Korrekturen des angezeigten Benutzers | Öffnet die Liste Korrektur Arbeitszeitsaldo, gefiltert auf den aktuellen Benutzer |

## So wird der Überstundenwert berechnet

Die Liste summiert nicht einfach die erfassten Stunden. Der Überstundenwert stammt aus der Standardberechnung der Überstunden in time cockpit.

In der Praxis hängt das Ergebnis daher von der Arbeitszeitkonfiguration des Benutzers und den erfassten Daten ab, darunter:

- Sollarbeitszeit
- erfasste Arbeitszeit
- Abwesenheiten wie Urlaub oder Krankenstand
- gesetzliche Feiertage
- Korrekturen des Arbeitszeitsaldos

Verwenden Sie diese Liste, wenn Sie den aktuellen Saldo zu einem bestimmten Datum benötigen. Verwenden Sie **Soll-Ist-Vergleich**, wenn Sie einen zeitraumbezogenen Vergleich benötigen.

## Hinweise

- Ausgeblendete Benutzer sind ausgeschlossen, sofern Sie sie nicht ausdrücklich im Filter einbeziehen.
- Die Liste ist schreibgeschützt. In der Standardkonfiguration dient sie als Auswertungsliste, nicht als Liste zur Datenpflege.
- Wenn Sie nachvollziehen müssen, warum sich ein Saldo geändert hat, öffnen Sie die zugehörigen Korrekturen des Arbeitszeitsaldos und vergleichen Sie das Ergebnis mit der Sollarbeitszeit und den erfassten Einträgen des Benutzers.

## Verwandte Seiten

- [Arbeitszeit / Urlaub](~/doc/arbeitszeiterfassung/arbeitszeit.md)
- [Abteilungsleiter-FAQ](~/doc/abteilungsleiter-faq.md)
- [HR-Administrator-FAQ](~/doc/hr-administrator-faq.md)
- [Navigation und Zugriffsrechte](~/doc/navigation-und-zugriffsrechte.md)
