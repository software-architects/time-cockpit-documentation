---
title: Überstunden zum Stichtag (Overtime per Effective Date)
description: Referenz zur Standardliste Overtime per Effective Date in time cockpit mit Filtern, berechneten Spalten und Links zu Überstundenkorrekturen.
en_page: doc/reference/lists/overtime-per-effective-date.md
---

# Überstunden zum Stichtag

Die Liste **Overtime per Effective Date** zeigt den Überstundensaldo jedes Mitarbeiters zu einem ausgewählten Datum. Sie ist nützlich, wenn Sie eine Momentaufnahme statt eines zeitraumbezogenen Vergleichs benötigen.

## Typische Zielgruppe

Diese Liste ist typischerweise relevant für:

- Mitarbeiter, die ihren eigenen Saldo prüfen
- Abteilungsleiter, die den Saldo ihres Teams prüfen
- HR-Administratoren, die Überstunden über mehrere Benutzer hinweg prüfen

## Navigation

- Standardnavigation: `User -> Overtime per Effective Date`
- Deeplink: `https://web.timecockpit.com/app/lists/APP_OvertimePerEffectiveDateList`

## Was die Liste zeigt

Die Liste berechnet pro Benutzer einen Überstundenwert für den ausgewählten Stichtag.

Sie ähnelt der Liste **Target-Actual Hours Comparison**, hat aber einen anderen Schwerpunkt:

- **Overtime per Effective Date** liefert den Überstundensaldo zu einem ausgewählten Datum
- **Target-Actual Hours Comparison** vergleicht Soll- und Iststunden für einen ausgewählten Zeitraum

## Standardfilter

Der Standardfilterbereich enthält diese Filter:

| Filter | Technische Referenz | Bedeutung |
|---|---|---|
| Effective Date | `@EffectiveDate` | Datum, für das der Überstundensaldo berechnet wird |
| Include Hidden Users | `@IncludeHiddenUsers` | Bezieht ausgeblendete Benutzerdatensätze ein, wenn der Wert `true` ist |

Der Standardwert für **Effective Date** ist der letzte Tag des Vormonats.

## Spalten

Die folgende Tabelle dokumentiert die sichtbaren Standardspalten.

| Spalte | Technische Referenz | Bedeutung | Ermittlung des Werts |
|---|---|---|---|
| Benutzer | `UserDetailName`, `UserDetailUuid` | In der Zeile angezeigter Mitarbeiter | Anzeigewert des Benutzerdetail-Datensatzes |
| Overtime | `Overtime` | Überstundensaldo zum ausgewählten Datum | Mit der Standardfunktion für Überstunden für den ausgewählten Benutzer und Stichtag berechnet |
| Overtime Bar | `Overtime` in `DataBarCell` | Grafische Darstellung des Überstundensaldos | Verwendet denselben Überstundenwert wie die numerische Spalte und zeigt ihn als Balken an |
| Overtime Corrections | Hyperlink auf gefiltertes `APP_OvertimeCorrection` | Drill-down zu den manuellen Korrekturen des angezeigten Benutzers | Öffnet die Liste Overtime Corrections, gefiltert auf den aktuellen Benutzer |

## So wird der Überstundenwert berechnet

Die Liste summiert nicht einfach die erfassten Stunden. Der Überstundenwert stammt aus der Standardberechnung der Überstunden in time cockpit.

In der Praxis hängt das Ergebnis daher von der Arbeitszeitkonfiguration des Benutzers und den erfassten Daten ab, darunter:

- Sollarbeitszeit
- erfasste Arbeitszeit
- Abwesenheiten wie Urlaub oder Krankenstand
- gesetzliche Feiertage
- Überstundenkorrekturen

Verwenden Sie diese Liste, wenn Sie den aktuellen Saldo zu einem bestimmten Datum benötigen. Verwenden Sie **Target-Actual Hours Comparison**, wenn Sie einen zeitraumbezogenen Vergleich benötigen.

## Hinweise

- Ausgeblendete Benutzer sind ausgeschlossen, sofern Sie sie nicht ausdrücklich im Filter einbeziehen.
- Die Liste ist schreibgeschützt. In der Standardkonfiguration dient sie als Auswertungsliste, nicht als Liste zur Datenpflege.
- Wenn Sie nachvollziehen müssen, warum sich ein Saldo geändert hat, öffnen Sie die zugehörigen Überstundenkorrekturen und vergleichen Sie das Ergebnis mit der Sollarbeitszeit und den erfassten Einträgen des Benutzers.

## Verwandte Seiten

- [Arbeitszeit / Urlaub](~/doc/arbeitszeiterfassung/arbeitszeit.md)
- [Abteilungsleiter-FAQ](~/doc/abteilungsleiter-faq.md)
- [HR-Administrator-FAQ](~/doc/hr-administrator-faq.md)
- [Navigation und Zugriffsrechte](~/doc/navigation-und-zugriffsrechte.md)
