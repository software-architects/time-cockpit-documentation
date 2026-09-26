---
title: Rechnungsdokument
description: Referenz zur Standardliste Rechnungsdokument in time cockpit mit den Feldern von Rechnung, Rechnungsposition und Zeitbuchung, die der Bericht verwendet.
en_page: doc/reference/lists/invoice-report.md
---

# Rechnungsdokument

Die Liste **Rechnungsdokument** ist die Datenquelle für das Standard-PDF der Rechnung. Sie sammelt die Kopfdaten der Rechnung, die Rechnungspositionen, die Unternehmensdaten und optional die verknüpften Zeitbuchungen.

## Typische Zielgruppe

Diese Referenz ist vor allem nützlich für:

- Abrechnungsadministratoren
- Benutzer, die die Standardausgabe der Rechnung verstehen müssen

## Navigation

- Standard-Deeplink: `https://web.timecockpit.com/app/lists/APP_DefaultInvoiceReportList`
- Hinweis: Diese Liste wird typischerweise vom Ablauf für das Rechnungs-PDF verwendet und nicht als Eintrag im Hauptmenü.

## Spalten

Die Liste selbst stellt eine kompakte Ansicht der Rechnungskopfdaten bereit:

| Spalte | Technische Referenz | Bedeutung | Ermittlung des Werts |
|---|---|---|---|
| Ausgangsrechnungsnummer | `InvoiceNumber` | Nummer der Rechnung | Aus dem Rechnungsdatensatz übernommen |
| Rechnungsdatum | `InvoiceDate` | Datum der Rechnung | Aus dem Rechnungsdatensatz übernommen |
| Description | `Description` | Beschreibung der Rechnung | Aus dem Rechnungsdatensatz übernommen |

## Berichtskontext

Wenn das Rechnungs-PDF erstellt wird, lädt der Bericht zusätzliche Datensätze:

- Unternehmensdaten des Rechnungsstellers
- Kopfdaten der Rechnung wie Kunde, Leistungszeitraum, Zahlungsziele und Summen
- Zeilen der Rechnungspositionen, sortiert nach der Position der Rechnungsposition
- verknüpfte Zeitbuchungen, wenn sie in den Bericht aufgenommen werden

## Verwandte Seiten

- [Ausgangsrechnung anlegen](~/doc/referenz/aktionen/ausgangsrechnung-anlegen.md)
- [Rechnungslegung](~/doc/projektzeiterfassung/rechnungslegung.md)
- [Rechnungsdatenfelder](~/doc/projektzeiterfassung/rechnungsdatenfelder.md)
