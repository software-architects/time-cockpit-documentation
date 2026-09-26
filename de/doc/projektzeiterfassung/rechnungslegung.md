---
title: Rechnungslegung - Rechnungen erstellen und verwalten
description: "Rechnungen in time cockpit aus Zeitbuchungen erstellen: Positionen automatisch generieren, Artikel nutzen, manuelle Rechnungen und PDF-Berichte."
en_page: doc/project-time-tracking/billing.md
---
# Rechnungslegung

time cockpit ist nicht nur ein Werkzeug für die Zeiterfassung, sondern ermöglicht auch eine effiziente Rechnungslegung für Ihre erfassten Zeiten. Dieser Artikel erklärt, wie Sie mit time cockpit Rechnungen für die erfassten Stunden erstellen.

Diese Seite beschreibt den Standardablauf der Rechnungslegung in time cockpit, die Bausteine einer Rechnung und die verfügbaren Möglichkeiten, Rechnungen automatisch oder manuell zu erstellen.

## Bausteine einer Rechnung

In time cockpit existiert eine Rechnung nicht für sich allein, sondern setzt sich aus verschiedenen Bausteinen zusammen. Eine ausführliche Beschreibung einer Rechnung finden Sie unter [Rechnungsdatenfelder](~/doc/projektzeiterfassung/rechnungsdatenfelder.md).

### Rechnungsposition

Eine Rechnung besteht immer aus einer oder mehreren Rechnungspositionen. Eine Rechnungsposition ist ein detaillierter Eintrag auf einer Rechnung, der ein bestimmtes Produkt, eine Dienstleistung oder eine Gebühr mit der zugehörigen Menge, dem Einzelpreis und den Gesamtkosten darstellt. Rechnungspositionen schlüsseln die verrechneten Produkte oder Dienstleistungen auf, sodass sowohl für den Verkäufer als auch für den Käufer klar ist, was verrechnet wird.

Eine Rechnungsposition besteht aus folgenden Daten:

- **Pos.:** Eine numerische Kennung für die Position der Rechnungsposition auf der Rechnung.
- **Tätigkeit:** Zugehörige Tätigkeit eines Projekts (falls zutreffend).
- **Description:** Eine kurze Beschreibung des Produkts, der Dienstleistung oder der Gebühr.
- **Anzahl:** Die Menge oder Anzahl der Einheiten des enthaltenen Produkts oder der Dienstleistung.
- **Unit:** Die Maßeinheit der Position.
- **Price:** Der Einzelpreis oder Satz für das Produkt oder die Dienstleistung.
- **USt.:** Der für die Position geltende Umsatzsteuersatz (USt.).
- **Total:** Die Gesamtkosten dieser Position (Preis x Menge).
- **Total (incl. VAT):** Die Gesamtkosten einschließlich Umsatzsteuer.

![Rechnungsposition](/doc/project-time-tracking/images/invoice-item.png "Rechnungsposition")

> [!NOTE]
> Rechnungspositionen innerhalb einer Rechnung können unterschiedliche Umsatzsteuersätze haben, die im Rechnungsdokument entsprechend ausgewiesen werden. Außerdem können Sie mit negativen Werten Gutschriften erstellen.

### Artikel

In time cockpit können Sie entweder eigene Rechnungspositionen anlegen oder Rechnungspositionen auf Basis von Artikeln erstellen. Ein Artikel in time cockpit ist eine vordefinierte Beschreibung eines Produkts oder einer Dienstleistung mit zugehörigen Preisinformationen, die sich einfach in eine Rechnungsposition umwandeln lässt. Artikel sind im Wesentlichen Vorlagen für häufige Produkte oder Dienstleistungen eines Unternehmens. Anstatt bei häufig verwendeten Positionen auf jeder Rechnung dieselben Details einzugeben, können Benutzer Artikel auswählen, um die Rechnungsposition automatisch mit den relevanten Produkt- oder Dienstleistungsinformationen zu befüllen.

Ein Artikel besteht aus folgenden Feldern:

- **Code:** Ein eindeutiger Code zur Identifikation des Artikels.
- **Name:** Der Name oder Titel des Artikels.
- **Description:** Eine kurze Beschreibung des Inhalts des Artikels.
- **Unit:** Die Maßeinheit der Position.
- **Price:** Der Einzelpreis oder Satz für den Artikel.
- **Sortierreihenfolge:** Die Reihenfolge, in der der Artikel in der Liste erscheint.
- **USt. [%]:** Der für den Artikel geltende Umsatzsteuersatz (USt.). 
- **Ausgeblendet:** Gibt an, ob der Artikel in der Combobox ausgeblendet oder sichtbar ist.
- **Total (incl. VAT):** Der Gesamtpreis des Artikels einschließlich Umsatzsteuer.

![Artikel](/doc/project-time-tracking/images/article.png "Artikel")

> [!NOTE]
> time cockpit liefert Artikel für Dienstleistungszeit und Reisezeit mit. Eine Liste Ihrer Artikel finden Sie in Ihrer [Artikelliste](https://web.timecockpit.com/app/lists/entity/APP_Article).

## So erstellen Sie eine Rechnung

Das Standarddatenmodell von time cockpit enthält die Liste [Verwaltung -> Verrechnung -> Nicht verrechnete Zeitbuchungen](https://web.timecockpit.com/app/lists/APP_UnbilledTimesheetsList). Diese Liste basiert auf dem Standardablauf der [Zeitbuchungen](https://web.timecockpit.com/app/lists/entity/APP_Timesheet), bietet aber zusätzliche Filter, um zwischen verrechenbaren und noch nicht verrechneten Stunden zu unterscheiden. Außerdem stellt sie die Aktion `Ausgangsrechnung anlegen` bereit, mit der Sie Zeitbuchungen einer Rechnung zuordnen. So erstellen Sie eine Rechnung:

1. Öffnen Sie die Liste **Nicht verrechnete Zeitbuchungen**.
2. Wählen Sie die Zeitbuchungen aus, die in die Rechnung aufgenommen werden sollen.
3. Wählen Sie im Menü **Aktionen** den Eintrag **Ausgangsrechnung anlegen**.
4. Geben Sie die Rechnungsdaten ein.

Wenn Sie die Aktion **Ausgangsrechnung anlegen** ausführen, ordnet sie die ausgewählten Zeitbuchungen Rechnungspositionen zu. 

<div class="tc-video" data-vimeo="871357620" data-title="Rechnungslegung" style="--bs-aspect-ratio: 51.82%"></div>

> [!NOTE]
> Sobald Zeitbuchungen einer Rechnungsposition oder Rechnung zugeordnet sind, werden sie **schreibgeschützt**, um versehentliche Änderungen nach der Verrechnung zu verhindern.

Stundensätze für Kunden oder Projekte können sich im Lauf der Zeit ändern. Deshalb kopiert die Aktion `Ausgangsrechnung anlegen` den konkret gültigen Stundensatz in das Feld `APP_HourlyRateBilled` einer Zeitbuchung. Dieses Feld wird auch im berechneten Feld `APP_Revenue` verwendet, das den durch Zeitbuchungen erzielten Umsatz anzeigt.

> [!NOTE]
> Bis zur Version [2023-10](/doc/release-notes/2023-10.html) konnte time cockpit Zeitbuchungen nur zu Rechnungen zusammenfassen. Die einer Rechnung zugeordneten Zeitbuchungen konnten von Benutzern nicht mehr bearbeitet werden. Mit Version 2023-10 wurde diese Funktion erweitert, sodass Sie für eine einzelne Rechnung mehrere Rechnungspositionen anlegen können. Der Rechnungsbetrag wird daher jetzt aus der Summe aller Rechnungspositionen berechnet.


## Automatische Erstellung von Rechnungspositionen

Wenn Sie in time cockpit eine Rechnung erstellen, analysiert time cockpit die ausgewählten Zeitbuchungen eines Projekts, um Rechnungspositionen zu generieren. Betreffen die Einträge Reisen, verwendet time cockpit den Artikel "travel time" als Grundlage für die Rechnungsposition. Eine Zeitbuchung wird als Reise interpretiert, wenn in der Zeitbuchung `Distance Relevant for Mileage Allowance` ausgefüllt ist. Beim Generieren einer Rechnung werden alle gefahrenen Kilometer der ausgewählten Zeitbuchungen summiert. Beschreibung, Einheit, Preis und Umsatzsteuer der Rechnungsposition werden auf Basis des Standardartikels "Travel Costs" (Code: travelCosts) gesetzt.

![Zeitbuchung für eine Reise](/doc/project-time-tracking/images/travel-timesheet.png "Zeitbuchung für eine Reise")

Stellen Zeitbuchungen tatsächliche Arbeit für einen Kunden dar, legt time cockpit für jede Tätigkeit innerhalb des Projekts eine Rechnungsposition an und verwendet dabei den Artikel "Service" (Code: serviceTime). Das System berechnet die Gesamtstunden jeder Rechnungsposition aus den zugehörigen Zeitbuchungen.

Das folgende Beispiel zeigt eine Rechnung mit drei Rechnungspositionen.

* Support: Eine Rechnungsposition, die für die Tätigkeit "Support" im jeweiligen Projekt angelegt wurde
* Meeting: Eine Rechnungsposition, die für die Tätigkeit "Meeting" im jeweiligen Projekt angelegt wurde
* Travel Costs: Eine Rechnungsposition, die für Reisen im jeweiligen Projekt angelegt wurde. Reisen sind keiner Tätigkeit zugeordnet, daher ist es auch die Rechnungsposition nicht.

![Beispiel für Rechnungspositionen](/doc/project-time-tracking/images/invoice-items-example.png "Beispiel für Rechnungspositionen")

> [!NOTE]
> Die Berechnung des Rechnungsbetrags (**Nettoumsatz** in der Rechnung) basiert daher auf der Summe aller Rechnungspositionen.

> [!NOTE]
> Die Preise generierter Rechnungspositionen können geändert werden. In diesem Fall wird die aktualisierte Summe aller Rechnungspositionen in der Rechnung übernommen, zu der die Rechnungsposition gehört.

## Eigene Rechnungspositionen und Artikel

Wenn die automatische Generierung von Rechnungspositionen Ihre Anforderungen nicht erfüllt, können Sie flexibel eigene Rechnungspositionen und Artikel anlegen. Bietet Ihr Unternehmen zum Beispiel sowohl Beratung zur Zeiterfassung an als auch Zeiterfassungsterminals als Hardware, und sollen beide auf einer einzigen Rechnung stehen, können Sie einen eigenen Artikel wie "Time Tracking Terminal" definieren. Das könnte wie folgt aussehen.

<div class="tc-video" data-vimeo="870320759" data-title="Eigene Rechnungsposition" data-poster="/images/video-posters/870320759.jpg" style="--bs-aspect-ratio: 56.27%"></div>

### Einen eigenen Artikel anlegen

1. Wechseln Sie in time cockpit in das Modul "Verwaltung".
2. Öffnen Sie den Bereich "Artikel".
3. Klicken Sie auf die Schaltfläche "Hinzufügen".
5. Geben Sie alle notwendigen Informationen zum Artikel ein.
8. Speichern Sie den Artikel.

![Eigener Artikel](/doc/project-time-tracking/images/custom-article.png "Eigener Artikel")

### Den eigenen Artikel in einer Rechnung verwenden

1. Wechseln Sie im Modul "Verwaltung" in den Bereich "Ausgangsrechnungen"
2.  Suchen Sie das Projekt, zu dem Sie den eigenen Artikel hinzufügen möchten.
3.  Suchen Sie Ihre Rechnung.
4.  Fügen Sie in den Rechnungsdetails eine neue Position hinzu.
5.  Wählen Sie Ihren neuen Artikel (z. B. "Time Tracking Terminal") aus der Liste der verfügbaren Artikel aus.
6.  Klicken Sie auf "Aktion ausführen".
7.  Die Informationen aus der Artikelvorlage werden in die eigentliche Rechnungsposition kopiert.
8.  Sie können die Menge bearbeiten (z. B. auf 25 erhöhen).
9.  Speichern und schließen Sie die eigene Rechnungsposition mit dem eigenen Artikel.

## Manuelle Rechnungen erstellen

In time cockpit können Sie bei Bedarf flexibel manuelle Rechnungen erstellen. Damit erzeugen Sie Rechnungen, die nicht in den standardmäßigen automatischen Ablauf der Rechnungserstellung passen. Manuelle Rechnungen können notwendig sein, wenn Sie eigene Rechnungspositionen, Dienstleistungen oder Produkte aufnehmen möchten, die nicht durch die regulären Zeitbuchungen abgedeckt sind.

### Schritte zum Erstellen einer manuellen Rechnung

1. Öffnen Sie die Liste [**Verwaltung --> Verrechnung --> Ausgangsrechnungen**](https://web.timecockpit.com/app/lists/entity/APP_Company).
2. Klicken Sie auf die Schaltfläche "Hinzufügen".
4. Geben Sie die relevanten Daten der manuellen Rechnung ein, darunter Kundendaten, Rechnungsnummer und Rechnungsdatum.
5. Fügen Sie nach Bedarf eigene Rechnungspositionen hinzu. Für jede Position können Sie Beschreibung, Menge, Einzelpreis und Steuersatz angeben.
6. Prüfen Sie die Rechnung und nehmen Sie notwendige Anpassungen vor.
7. Speichern Sie die manuelle Rechnung.

>[!NOTE]
> Bei manuellen Rechnungen werden Rechnungspositionen **nicht** automatisch aus den Zeitbuchungen eines bestimmten Zeitraums generiert. So haben Sie die volle Kontrolle darüber, welche eigenen Rechnungspositionen Sie mit welchen Details anlegen.

## Ein Rechnungsdokument generieren

time cockpit kann für eine bestimmte Rechnung ein umfassendes PDF-Dokument erstellen, das die wesentlichen Angaben einer gültigen Rechnung enthält. Dazu gehören Kundenadresse, Rechnungsnummer, Rechnungsdatum und Leistungszeitraum. 

![Rechnungsdokument](/doc/project-time-tracking/images/invoice-report.png "Rechnungsdokument")

Außerdem listet das Dokument alle zugeordneten Rechnungspositionen einzeln auf. Jede Rechnungsposition wird mit Menge, Einheit, Preis, Gesamtbetrag und dem zugehörigen Umsatzsteuersatz dargestellt. So erhalten Sie einen vollständigen Überblick über den Inhalt der Rechnung und können die verrechneten Positionen leicht prüfen und nachvollziehen.

Sind der Rechnung Zeitbuchungen zugeordnet (erstellt mit der Aktion `Ausgangsrechnung anlegen`), können Sie die Anzeige der Details der Zeitbuchungen im Rechnungsdokument aktivieren. Setzen Sie dazu in der jeweiligen Rechnung das Kennzeichen `Inkl. Zeitnachweis am Rechnungsdokument`. 

>[!NOTE]
> Wurden Menge oder Preis einer der automatisch generierten Rechnungspositionen für Dienstleistungen nach der Generierung geändert, stimmen die Details der Zeitbuchungen nicht mehr mit den Rechnungspositionen überein. In diesem Fall empfiehlt es sich, die Anzeige der Details der Zeitbuchungen im Rechnungsdokument zu deaktivieren. So bleibt die Rechnung korrekt und konsistent mit den geänderten Rechnungspositionen.

### Rechnungen ohne Umsatzsteuer

Bei Rechnungen ohne Umsatzsteuer (alle Rechnungspositionen mit 0 % USt.) hängt die Entscheidung, ob es sich um ein innergemeinschaftliches Geschäft handelt oder nicht, vom Land des Kunden ab. 

Hat der Kunde seinen Sitz **innerhalb** der EU, wird unter dem Gesamtbetrag folgender Hinweis gedruckt:

**Englisch**
> According to the reverse charge system, the amounts listed above are exclusive of sales tax. The sales tax must be calculated and paid by the recipient of the service.

**Deutsch**
> Die oben angeführten Beträge verstehen sich gemäß dem Reverse-Charge-System exklusive Umsatzsteuer. Die Umsatzsteuer muss vom Empfänger der Leistung berechnet und abgeführt werden.

Bei Kunden **außerhalb** der EU wird unter dem Gesamtbetrag ein etwas anderer Hinweis gedruckt:

**Englisch**
> The above amounts do not include sales tax. The sales tax must be calculated and paid by the recipient of the service.

**Deutsch**
> Die oben angeführten Beträge verstehen sich ohne Umsatzsteuer. Die Umsatzsteuer muss vom Empfänger der Leistung berechnet und abgeführt werden.

Werden Rechnungspositionen mit der Aktion `Ausgangsrechnung anlegen` automatisch generiert, hängt die Entscheidung über die Umsatzsteuer davon ab, ob das Heimatland des Kunden und des Rechnungsstellers dasselbe ist.

### Unternehmensdaten des Rechnungsstellers

In der Fußzeile des Rechnungsdokuments werden die Unternehmensdaten des Rechnungsstellers angezeigt. Diese Daten verwalten Sie unter [**Verwaltung --> Verrechnung --> Gesellschaften**](https://web.timecockpit.com/app/lists/entity/APP_Company).

![Formular Gesellschaft](/doc/project-time-tracking/images/company-form.png "Formular Gesellschaft")


>[!NOTE]
> Derzeit wird nur ein Unternehmen bzw. Rechnungssteller unterstützt.

## Zeitbuchungen zu einer bestehenden Rechnung hinzufügen

Gelegentlich wurde eine Zeitbuchung nicht in eine Rechnung aufgenommen. In diesem Fall können Sie die Aktion "Zu vorhandener Ausgangsrechnung zuordnen" verwenden. So gehen Sie vor:

1. Öffnen Sie die Liste [**Verwaltung --> Verrechnung --> Nicht verrechnete Zeitbuchungen**](https://web.timecockpit.com/app/lists/APP_UnbilledTimesheetsList).
2. Wählen Sie die Zeitbuchung aus, die Sie einer bestehenden Rechnung hinzufügen möchten.
3. Führen Sie die Aktion 'Zu vorhandener Ausgangsrechnung zuordnen' aus.

![Einer bestehenden Rechnung zuordnen](/doc/project-time-tracking/images/assign-to-existing-invoice.png "Einer bestehenden Rechnung zuordnen")

>[!NOTE]
> Beachten Sie, dass diese Aktion die Zeitbuchung der bestehenden Rechnung hinzufügt, ohne die Rechnungspositionen oder den Gesamtbetrag der Rechnung zu aktualisieren.
