---
title: Rechnungsdatenfelder - Rechnungen konfigurieren
description: "Rechnungsdatenfelder in time cockpit: Rechnungsdatum, Rechnungsnummer, Rechnungsadresse, Leistungszeitraum und Rechnungspositionen konfigurieren."
en_page: doc/project-time-tracking/invoice-data-fields.md
---
# Rechnungsdatenfelder

Dieser Abschnitt gibt einen detaillierten Überblick über die wichtigsten Datenfelder von Rechnungen in time cockpit. Erfahren Sie, wie Sie diese Felder nutzen, um Rechnungen zu erstellen und zu verwalten.

![Rechnung](/doc/project-time-tracking/images/invoice.png "Rechnung")

## Abschnitt Ausgangsrechnung

### Rechnungsdatum
Wenn Sie die Aktion `Ausgangsrechnung anlegen` verwenden, wird das Feld für das Rechnungsdatum automatisch auf das aktuelle Datum gesetzt. Wenn Sie eine Rechnung dagegen manuell erstellen, müssen Sie dieses Feld selbst nach Ihren Vorstellungen setzen.

### Rechnungsnummer
time cockpit kann für Ihre nächste Rechnung automatisch eine Rechnungsnummer erzeugen. Standardmäßig wird eine Rechnungsnummer nach folgendem Muster erzeugt: `:FormatDate(@InvoiceDate, "yyyy") + '-' + :FormatDate(@InvoiceDate, "MM") + '-'`. Wenn Sie also im Oktober 2023 eine Rechnung erstellen, wird das Präfix **2023-10-** erzeugt und eine fortlaufende Nummer für die Rechnung angehängt, z. B. **2023-10-001**. Das Muster der Rechnungsnummer legen Sie in Ihren [globalen Einstellungen](https://web.timecockpit.com/app/lists/entity/APP_GlobalSettings) fest. 

![Rechnung](/doc/project-time-tracking/images/global-settings-invoice-number.png "Rechnung")

Wenn Sie für eine einzelne Rechnung eine eigene Rechnungsnummer festlegen möchten, verwenden Sie die Aktion `Set individual` und geben Sie Ihre eigene Rechnungsnummer ein. 

### Rechnungsregeln
Diese Informationen werden aus den Rechnungsregeln des Projekts abgeleitet, zu dem die Rechnung gehört.

## Abschnitt Rechnungsadresse

Die Rechnungsadresse ist für das Generieren des Rechnungsdokuments erforderlich. Standardmäßig wird die Rechnungsadresse aus der Rechnungsadresse des Kunden übernommen. Sie können die Rechnungsadresse aber für jede Rechnung überschreiben. Die Rechnungsadressen Ihrer Kunden verwalten Sie in Ihrer [Kundenliste](https://web.timecockpit.com/app/lists/entity/APP_Customer).

>[!NOTE]
> Die Adresse wirkt sich hinsichtlich der Umsatzsteuer auch auf Ihr Rechnungsdokument aus. Lesen Sie dazu [Rechnungslegung](~/doc/projektzeiterfassung/rechnungslegung.md) – Ein Rechnungsdokument generieren.

## Abschnitt General

### Beginn und Ende des Leistungszeitraums

Beginn- und Enddatum werden auf das Rechnungsdokument gedruckt. Wird die Rechnung mit `Ausgangsrechnung anlegen` aus ausgewählten Zeitbuchungen erstellt, wird der Leistungszeitraum automatisch anhand der ersten und der letzten Zeitbuchung ermittelt.

### Nettoumsatz

In einer Rechnung entspricht `Nettoumsatz` den gesamten Erlösen aus allen Rechnungspositionen, die der Rechnung zugeordnet sind. Dieser Wert gibt den erzielten Gesamtumsatz ohne Umsatzsteuer an. 

### Bruttoumsatz

In einer Rechnung entspricht `Gross Revenue` den gesamten Erlösen aus allen Rechnungspositionen, die der Rechnung zugeordnet sind, **einschließlich** der Umsatzsteuer der jeweiligen Rechnungspositionen.

### Berechneter und abweichender Umsatz [veraltet]

> [!NOTE]
> Frühere Versionen von time cockpit enthielten die Felder `Calculated Revenue` und `Abweichender Umsatz`. Beide Felder werden für künftige Rechnungen nicht mehr benötigt. Wir empfehlen, die Anzeige dieser Felder in den [globalen Einstellungen](https://web.timecockpit.com/app/lists/entity/APP_GlobalSettings) zu deaktivieren. Bei bestehenden Rechnungen wird der im Feld 'Abweichender Nettoumsatz' eingetragene Wert weiterhin im Feld 'Nettoumsatz' berücksichtigt. Abweichenden Umsatz und Rechnungspositionen können Sie nicht gleichzeitig in einer Rechnung verwenden.

## Abschnitt Skonto

Wenn Sie in time cockpit eine Rechnung erstellen, können Sie Ihren Kunden Skonto gewähren. Damit legen Sie ein Datum fest: Zahlt der Kunde vor diesem Datum, steht ihm ein reduzierter Preis zu.

So richten Sie das Skonto ein:

1. Geben Sie im Feld `On Payment Within [Days]` einen Zahlenwert ein. Er legt fest, innerhalb wie vieler Tage der Kunde zahlen muss, um Skonto zu erhalten.

2. Geben Sie im Feld `Skonto [%]` den Prozentsatz des Skontos ein, das Sie dem Kunden gewähren.

Sobald Sie diese Einstellungen vorgenommen haben, berechnet time cockpit automatisch das `Discount Due Date`, bis zu dem das Skonto in Anspruch genommen werden kann, und zeigt es an. Zusätzlich berechnet das System für Sie den Wert `Gross Revenue Discounted`.

>[!NOTE]
> Wenn Sie in der Rechnung das Datum `Bezahlt am` setzen und dieses innerhalb der Skontofrist liegt, befüllt time cockpit das Feld `Payment Amount` automatisch mit dem Wert von `Gross Revenue Discounted`.

## Abschnitt Rechnungsdokument

In diesem Abschnitt konfigurieren und generieren Sie eine PDF-Version der Rechnung. Um den Bericht für Ihre Rechnung zu generieren, verwenden Sie einfach die Option `Download Invoice Document as PDF`.

Zusätzlich legen Sie mit dem Kennzeichen `Inkl. Zeitnachweis am Rechnungsdokument` fest, ob das Rechnungsdokument für jede Rechnung die Details der Zeitbuchungen enthalten soll. Mit diesem Kennzeichen steuern Sie den Detaillierungsgrad Ihres Rechnungsdokuments.
