---
title: Datenimport - Excel- und CSV-Import
description: Daten aus Excel- und CSV-Dateien in time cockpit importieren. Importdefinitionen, Arbeitsblatt- und Spaltenzuordnungen sowie Auswahlkriterien.
en_page: doc/data-exchange/import.md
---
# Datenimport

Mit Version 1.10 von time cockpit haben wir ein Importmodul eingeführt, das Daten aus Excel- und CSV-Dateien importieren kann.

> [!TIP]
> Sie steigen von Excel um? Lesen Sie unseren ausführlichen [Leitfaden für die Migration von Excel zu time cockpit](https://www.timecockpit.com/blog/project-time-tracking-excel-migration-guide/) und erfahren Sie mehr über die [Integrationsmöglichkeiten](https://www.timecockpit.com/features/integration/) von time cockpit.

Häufig müssen Daten aus externen Quellen in time cockpit importiert werden. Beispiele sind der Import einer Liste von Projekten oder Kunden, von Zeitbuchungen aus früheren Zeiterfassungslösungen oder von einem externen Auftragnehmer, der seine Zeiten nicht mit time cockpit erfasst.

Damit der Import von time cockpit nützlich ist, muss er wissen, wie die Spalten eines Excel- oder CSV-Blatts mit den Eigenschaften und Beziehungen einer Entität zusammenhängen. Diese Information steht in einem Importdefinitionsobjekt, einer Struktur mit Zuordnungen von Spaltennamen zu Eigenschaften für mehrere Entitäten. Eine Importdefinition ist daher eine zweistufige Struktur aus Arbeitsblatt- und Spaltenzuordnungen. Eine Arbeitsblattzuordnung ordnet ein bestimmtes Arbeitsblatt in Excel genau einer bestimmten Entität in time cockpit zu und enthält eine oder mehrere Spaltenzuordnungen. Eine Spaltenzuordnung ordnet eine einzelne Spalte einer bestimmten Eigenschaft der Entität zu, die durch die übergeordnete Arbeitsblattzuordnung zugeordnet ist.

Nehmen wir als Beispiel den Import von Projekten. Die Importdefinition besteht aus einer einzigen Arbeitsblattzuordnung, die ein Excel-Arbeitsblatt der Entität Projekt zuordnet. Die Arbeitsblattzuordnung enthält mehrere Spaltenzuordnungen, die Felder wie den Projekttitel und die Beschreibung oder das Startdatum des Projekts zuordnen. Eine Spaltenzuordnung kann auch eine Beziehung zuordnen. In diesem Fall muss ein Auswahlkriterium gewählt werden. Das Auswahlkriterium ist eine Eigenschaft der verbundenen Entität, die die Information enthält, die mit dem Inhalt der importierten Zelle übereinstimmen muss. Der Import sucht in der Datenbank nach einer solchen Entität und stellt sicher, dass genau ein Element gefunden wird. Werden keine oder mehrere Treffer gefunden, meldet er einen Fehler.

> [!NOTE]
> Wichtig: Der Import aktualisiert keine bestehenden Zeilen, sondern legt immer neue an. Wenn Sie die Beispieldatei mehrmals importieren, entstehen doppelte Elemente in time cockpit. Prüfen Sie die neu angelegten Daten nach dem Import.

## Importdefinitionen anzeigen

Die Importdefinitionen finden Sie im Modul **Verwaltung** im Abschnitt **Einstellungen**.

![Importdefinitionen](/doc/data-exchange/images/wc-import-definitions-link.png "Importdefinitionen")

Der Link führt zu einer Liste der Importdefinitionen. Ein Doppelklick auf eine Importdefinition öffnet den Importdefinitionseditor. Wenn Sie die Liste zum ersten Mal öffnen, ist sie leer. Eine neue Importdefinition legen Sie wie gewohnt über die Schaltfläche für neue Elemente im Menüband an. Damit öffnet sich der unten beschriebene Importdefinitionseditor.

![Liste der Importdefinitionen](/doc/data-exchange/images/wc-import-definitions-list.png "Liste der Importdefinitionen")

## Neue Importdefinitionen automatisch generieren

Öffnen Sie die Liste der Importdefinitionen und klicken Sie im Menüband auf 'Neu'. Damit öffnet sich der unten abgebildete Importdefinitionseditor. Der Importdefinitionseditor besteht aus vier Hauptbereichen:

- Allgemeine Informationen: der Name, der Quelltyp und ob ein Berichtsprotokoll gespeichert werden soll.
- Umgang mit der Beispieldatei: eine Beispieldatei für eine Importdefinition laden, speichern oder generieren.
- Die Tabelle der Arbeitsblattzuordnungen: listet die Zuordnungen von Arbeitsblättern zu Entitäten auf.
- Die Tabelle der Spaltenzuordnungen: listet die Zuordnungen von Quellspalten zu Eigenschaften für die aktuell ausgewählte Arbeitsblattzuordnung auf.

![Importdefinition](/doc/data-exchange/images/wc-import-definition.png "Importdefinition")

Um eine Spaltenzuordnung festzulegen, benötigt der Importdefinitionseditor einen Anhaltspunkt zu den Quelldaten, die importiert werden sollen. Es gibt zwei typische Szenarien: Im ersten möchten Sie das Excel-Blatt verwenden, um Daten schnell einzugeben. In diesem Szenario können Sie die Struktur der Quelldaten frei festlegen. Dann lassen Sie am besten den Import von time cockpit die Quelldatei und die Spaltenzuordnung automatisch generieren. Im zweiten Szenario werden Ihnen die Daten in einem bestimmten Format geliefert. In diesem Fall müssen Sie die Zuordnungen manuell anpassen.

![Auswahl der Entität im Modell](/doc/data-exchange/images/wc-model-entity-selection.png "Auswahl der Entität im Modell")

Gehen wir zunächst vom ersten Szenario aus, in dem der Import eine Importdefinition und eine Beispieldatei für uns automatisch generieren soll. Klicken Sie auf **Vorlagedatei generieren** und wählen Sie **Customer** aus der Liste der verfügbaren Entitäten. Sie können auch mehrere Entitäten auswählen. Der Import legt dann mehrere Arbeitsblattzuordnungen an, eine pro ausgewählter Entität.

Ein Klick auf **Auswählen** generiert eine Excel-Datei und eine passende Importdefinition. Wenn wir die angelegte Arbeitsblattzuordnung betrachten, sehen wir, dass der Import eine Arbeitsblattzuordnung für ein Arbeitsblatt namens **Customer** zur Entität **Customer** generiert hat, dazu eine Spaltenzuordnung für jede Eigenschaft von Customer (Kundennummer, Firmenbuchnummer, Firmenname, Kontaktinformationen, E-Mail, Fax usw.) und eine Spaltenzuordnung für die Beziehung zum Land.

![Automatisch generierte Importdefinition für Kunden](/doc/data-exchange/images/wc-autogenerated-customer-import-definition.png "Automatisch generierte Importdefinition für Kunden")
Die Beziehung zum Land ist ein Sonderfall, da der Import den Wert der Eigenschaft nicht einfach auf den Namen des Landes setzen kann. Stattdessen muss er sie auf das Entitätsobjekt setzen, das durch den Wert in der Spalte identifiziert wird. Nach welchem Kriterium das verbundene Objekt gesucht wird, ändern Sie über das 'Auswahlkriterium' der Spaltenzuordnung. In diesem einfachen Szenario könnte das Auswahlkriterium nur auf den ISO-Code des Landes geändert werden, da die Entität Land keine anderen passenden Eigenschaften hat.

> [!NOTE]
> Das Auswahlkriterium muss eine eindeutige Eigenschaft der verbundenen Entität sein, da der Import eine Warnung ausgibt und die Daten nicht importiert, wenn Beziehungen zu mehrdeutigen Verweisen führen.

> [!NOTE]
> Das Auswahlkriterium muss nicht unbedingt eine direkte Eigenschaft der verbundenen Entität sein. Es kann jede Eigenschaft sein, die von der Zielentität aus 'erreichbar' ist.

Schließlich sehen wir, dass die automatisch generierte Importdefinition auch eine Statusspalte zuordnet. In die Statusspalte schreibt der Import zurück, ob der Import der jeweiligen Zeile erfolgreich war. Ist ein Fehler aufgetreten, wird eine Meldung in die Zelle geschrieben, damit Sie Probleme beim Importieren schnell erkennen und beheben können.

Um die generierte Beispieldatei anzusehen, klicken Sie auf 'Vorlagedatei speichern'. Der Editor fragt nach einem Dateipfad und speichert die Beispieldatei am gewählten Ort. Wenn Sie die gespeicherte Datei öffnen, sehen Sie eine Excel-Datei ähnlich der folgenden Abbildung:

![Generierte Excel-Datei für Kunden](/doc/data-exchange/images/customer-excel.png "Generierte Excel-Datei für Kunden")

Der Name des Arbeitsblatts ist der Name des Quellblatts in der Importdefinition, und der Name der Spalte ist der Inhalt der ersten Zelle jeder Spalte. Da die Importdefinition für uns passt, geben wir einen Namen ein (z. B. 'Customer import') und speichern die Importdefinition. Sie erscheint dann in der Liste der Importdefinitionen.

## Einen Import durchführen

Im vorigen Abschnitt haben wir eine Importdefinition für die Entität Customer angelegt. Wir haben dabei noch keine Daten importiert, sondern eine Beispieldatei und eine Zuordnung der Spalten der Arbeitsblätter dieser Beispieldatei zu den jeweiligen Entitäten und Eigenschaften vorbereitet. Dieser Vorgang wird üblicherweise nur einmal durchgeführt. Bei jedem weiteren Import von Daten mit dieser Struktur werden Importdefinition und Beispieldatei wiederverwendet.

Um tatsächlich Daten zu importieren, füllen Sie zunächst eine Beispieldatei mit den Daten der Kunden, die Sie importieren möchten. Für diesen Test verwenden wir folgende Beispieldaten:

Customer Code | Commercial Register Number | Company Name | Contact Information | Email | Fax | Hourly Rate | Invoice FAO | Invoicing Rules | Phone | Street | Town | VAT ID | ZIP Code | Country
--- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---
CUST1 | 123450001 | Nowhere Corp | Ms. Customer 1 | nobody@nowhere.com | +4350609020 | 120 | Mr. Nowhere | none | +4350609019 | nowhere road | nowhere town | 90603010 | 204041 | Austria

Die Statusspalte bleibt leer, da der Import sie mit dem Ergebnis des Imports für die jeweilige Zeile füllt.

Um die Datei mit den Kundendaten zu importieren, klicken wir in der Liste der Importdefinitionen auf den Link 'Import'. Damit öffnet sich der Importdialog. In diesem Dialog importieren Sie Dateien für die gewählte Importdefinition. Stellen Sie sicher, dass die zu importierende Datei nicht in Excel geöffnet ist, und wählen Sie die Quelldatei über 'Datei auswählen' aus.

> [!NOTE]
> Die Quelldatei wird in dem Moment gelesen, in dem Sie sie auswählen. Spätere Änderungen an der Quelldatei übernimmt der Import nicht automatisch. Wenn sich die Quelle ändert, müssen Sie die Quelldatei erneut auswählen. Der Zeitstempel neben dem Dateinamen zeigt, wann die Datei ausgewählt wurde.

![Quelldatei auswählen](/doc/data-exchange/images/wc-select-source-file.png "Quelldatei auswählen")

Nachdem Sie eine Quelldatei ausgewählt haben, werden zwei Schaltflächen aktiv: **Import testen** und **Import durchführen**. Beim Testen eines Imports wird die Transaktion nach Abschluss zurückgesetzt. So können Sie den Import testen und sehen, ob er erfolgreich wäre, ohne tatsächlich Zeilen zu importieren. Beim Durchführen des Imports wird die Transaktion nur dann festgeschrieben, wenn überhaupt keine Fehler aufgetreten sind. Um zu prüfen, ob unser Beispielimport korrekt funktioniert, klicken Sie auf die Schaltfläche **Import testen**:

![Erfolgreicher Importtest](/doc/data-exchange/images/wc-import-test-successful.png "Erfolgreicher Importtest")

> [!NOTE]
> Beim Durchführen eines Imports wird die Transaktion nur festgeschrieben, wenn kein Fehler aufgetreten ist. Zeilen, die einen Fehler verursachen, müssen aus der Quelldatei entfernt oder so geändert werden, dass sie fehlerfrei sind, damit überhaupt eine Zeile des Imports gespeichert wird.

Sowohl der Test als auch der eigentliche Import erzeugen eine Ergebnisdatei, die Sie speichern können. Klicken Sie dazu auf die Schaltfläche **Save results** und wählen Sie eine Datei, in die gespeichert werden soll. Die Ergebnisdatei ist identisch mit der Quelldatei, aber die Statusspalte (sofern eine zugeordnet wurde) enthält Fehlermeldungen oder eine Meldung ('Ok.'), die anzeigt, dass der Import erfolgreich war.

Nach dem Test lösen Sie den eigentlichen Import mit **Import durchführen** aus. Nach dem erfolgreichen Import zeigt die Kundenliste den neu importierten Kunden.

## Fortgeschrittenes Beispiel: Projekte importieren

Im vorigen Beispiel wurden eine Importdefinition und eine Beispieldatei für eine bestimmte Entität generiert. In diesem Beispiel importieren wir Projekte, nehmen aber nur die Felder auf, die zum Anlegen eines Projekts tatsächlich erforderlich sind.

Legen Sie zuerst ein leeres Excel-Blatt an und geben Sie die Namen der Spalten ein, die importiert werden sollen. Für den Import von Projekten zeigt ein erster Blick auf ein leeres Formular für ein neues Projekt, dass drei Felder erforderlich sind: der Kunde (eine Beziehung), die Projektnummer und der Projektname.

Wir legen also ein neues Excel-Arbeitsblatt an, benennen es in 'Project' um und tragen in die erste Zelle der ersten drei Spalten 'Project Name', 'Projectcode' und 'Customer Code' ein. Außerdem geben wir einige Beispielprojekte ein, um die Importdefinition später auszuprobieren. Ihr Excel-Blatt sollte ungefähr wie in der folgenden Abbildung aussehen:

![Excel-Datei für Projekte](/doc/data-exchange/images/project-import-excel.png "Excel-Datei für Projekte")

Als Nächstes legen Sie eine neue Importdefinition an. Öffnen Sie die Liste 'Importdefinition' und fügen Sie eine neue Importdefinition hinzu. Geben Sie einen Namen ein (z. B. 'Project minimal') und klicken Sie auf 'Vorlagedatei laden'.

Nachdem Sie die Beispieldatei geladen haben, legen Sie eine neue Arbeitsblattzuordnung an, indem Sie auf das '+'-Zeichen unter der Tabelle der Arbeitsblattzuordnungen klicken. Klicken Sie in der neu erschienenen Zeile auf die Quellspalte, um das Kombinationsfeld zu öffnen, und wählen Sie das Arbeitsblatt 'Project'. Wählen Sie außerdem in der Spalte 'Zielentität' die passende Entität 'Project'.

> [!NOTE]
> Der Import von time cockpit kann Zuordnungen automatisch finden, wenn die Namen übereinstimmen. Diese Funktion können Sie auch bei selbst angelegten Beispielarbeitsmappen nutzen, indem Sie auf die Schaltfläche 'Zuordnung automatisch generieren' klicken. Es ist daher empfehlenswert, die Spalten in Arbeitsblättern genauso zu benennen wie die Eigenschaften der Entität oder deren (lokalisierte) Namen.

Im zweiten Schritt ordnen Sie die Spaltennamen den Eigenschaften der Zielentität zu (in diesem Fall Projekt). Auch das geschieht über das '+'-Zeichen, diesmal unter der Tabelle der Spaltenzuordnungen. Da drei Spalten zugeordnet werden, fügen wir drei Spaltenzuordnungen hinzu und ordnen die folgenden Spalten und Eigenschaften zu:

Quellspalte | Zieleigenschaft | Auswahlkriterium
--- | --- | ---
Project Name | Project Name | (leer)
Projectcode | Project Code | (leer)
Customer Code | Customer | Customer Code

> [!NOTE]
> Wenn Sie das Auswahlkriterium für die Beziehung 'Customer' wählen, wählen Sie zuerst die Zieleigenschaft, da das Kombinationsfeld für das Auswahlkriterium deaktiviert bleibt, bis tatsächlich eine Beziehung ausgewählt ist.

Nach dem Zuordnen der Spalten sollte die Importdefinition ähnlich wie in der folgenden Abbildung aussehen. Die Reihenfolge der Spaltenzuordnungen spielt keine Rolle.

![Importdefinition für Projekte](/doc/data-exchange/images/wc-import-definition-project-minimal.png "Importdefinition für Projekte")

> [!NOTE]
> In diesem Beispiel haben wir keine Statusspalte verwendet. Die Statusspalte ist optional, beim Import komplexer Datenbestände aber meist sinnvoll, da sie das Auffinden von Fehlern erleichtert.

Nach dem Speichern der Importdefinition können Sie den Import genauso durchführen wie bei einer automatisch generierten Importdefinition.

## Empfehlungen und häufige Fehlerquellen

Die Reihenfolge, in der die Arbeitsblätter importiert werden, ist in der Importdefinition festgelegt. Mit den Pfeilen unter den Arbeitsblattzuordnungen ändern Sie die Reihenfolge der Arbeitsblattzuordnungen. Innerhalb eines Arbeitsblatts beginnt der Import in der zweiten Zeile (die erste Zeile ist die Kopfzeile) und arbeitet sich bis zur letzten Zeile nach unten.

Wenn Sie mehrere Entitäten mit einem Excel-Blatt importieren, ist die Reihenfolge der Arbeitsblätter in der Importdefinition wichtig, da verbundene Objekte sonst möglicherweise nicht gefunden werden. Damit Abhängigkeiten korrekt importiert werden, stellen Sie sicher, dass Entitäten, auf die in nachfolgenden Arbeitsblattzuordnungen verwiesen wird, zuerst importiert werden.

Hat eine Entität eine Beziehung zu sich selbst, ist die Reihenfolge der Zeilen im Excel-Blatt wichtig. Um verbundene Objekte auflösen zu können, müssen diese bereits in der Datenbank gespeichert sein. Achten Sie daher darauf, dass verbundene Objekte in der Excel-Datei zuerst vorkommen (in einer Zeile mit einer niedrigeren Zeilennummer).

Entfernen Sie alle Daten, die nicht zur Importtabelle gehören, aus dem Quellarbeitsblatt, da der Import sonst möglicherweise einen falschen Bereich ermittelt. Er versucht dann zum Beispiel, leere Zeilen zu importieren. Im Zweifel kopieren Sie die Tabelle in eine neue Excel-Arbeitsmappe und benennen das Arbeitsblatt entsprechend.

In manchen Situationen kann eine vorherige Zeile die aktuelle Zeile beeinflussen. Es empfiehlt sich daher, Fehler in der Reihenfolge ihres Auftretens zu beheben, beginnend mit der ersten Zeile mit einer Fehlermeldung im ersten zugeordneten Arbeitsblatt.

Da die Validierungsregeln von time cockpit in der Datenzugriffsschicht definiert sind, gelten sie auch für den Import. Allgemein können Sie davon ausgehen, dass das Importieren von Daten mit dem Import dem manuellen Eingeben der Daten entspricht.

Geben Sie einer Importdefinition einen Namen, bevor Sie automatisch eine Beispieldatei generieren, da der Name der Beispieldatei sonst leer bleibt.
