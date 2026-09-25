---
title: Benutzerdefinierte Berichte - SSRS-Berichte einbinden
description: Eigene SSRS-Berichte in time cockpit erstellen und einbinden. Berichtsdefinition herunterladen, mit Report Builder anpassen und hochladen.
en_page: doc/reporting/custom-reports.md
---
# Benutzerdefinierte Berichte

Zusätzlich zu den generierten druckbaren Berichten können Sie einer time cockpit-Liste benutzerdefinierte Berichte hinzufügen. Die benutzerdefinierten Berichte erscheinen neben der Standardschaltfläche **Druckansicht**. Das folgende Kapitel beschreibt den Ablauf, mit dem Sie benutzerdefinierte Berichte in Ihre bestehenden time cockpit-Listen einbinden.

> [!NOTE]
> In diesem Artikel zeigen wir Ihnen, wie Sie die Berichtsfunktionen von time cockpit verwenden. Der Artikel erklärt jedoch nicht, wie Sie eigene Berichte in [Microsoft SQL Server 2008 R2 Report Builder 3.0](http://www.microsoft.com/en-us/download/details.aspx?id=6116) erstellen. Eine ausführliche Beschreibung dazu finden Sie unter [Building Custom Reports](https://www.timecockpit.com/blog/2014/02/27/Building-Custom-Reports-in-Time-Cockpit).

## Berichtsdefinition herunterladen

Am einfachsten beginnen Sie mit benutzerdefinierten Berichten, indem Sie die Berichtsdefinition aus dem Dropdown-Menü der geteilten Schaltfläche **Druckansicht** herunterladen. Klicken Sie auf **Download Report Definition**, um die Berichtsdefinition herunterzuladen, die für eine Standard-**Listenansicht** generiert wird.

![Berichtsdefinition herunterladen](/doc/reporting/images/download-report-definition.png "Berichtsdefinition herunterladen")

Von dort aus passen Sie den Bericht nach Ihren Wünschen an. Zum Bearbeiten einer .rdl-Datei empfehlen wir [Microsoft SQL Server 2008 R2 Report Builder 3.0](http://www.microsoft.com/en-us/download/details.aspx?id=6116).

## Bericht anpassen

Die Verwendung von [Reporting Services (SSRS)](http://msdn.microsoft.com/de-de/library/ms159106.aspx) ist nicht Gegenstand dieses Artikels. Eine ausführliche Anleitung zum Erstellen benutzerdefinierter Berichte finden Sie in diesem Video: [Building Custom Reports](https://www.timecockpit.com/blog/2014/02/27/Building-Custom-Reports-in-Time-Cockpit). Dort finden Sie auch einen umfangreichen Foliensatz zu [Reporting Services (SSRS)](http://msdn.microsoft.com/de-de/library/ms159106.aspx) im Allgemeinen.

## Bericht testen

Um eine benutzerdefinierte Berichtsdefinition zu testen, öffnen Sie das **Zahnrad**-Menü und klicken Sie auf **Load Report Definition**. Der benutzerdefinierte Bericht wird in die eingebettete Berichtsanzeige von time cockpit geladen. Als Datenquelle verwendet time cockpit das Ergebnis der Liste, an die der Bericht angehängt wurde. Wenn Sie den Filter dieser Liste ändern, wird der Bericht mit den Daten gemäß den neuen Filterkriterien gefüllt.

![Bericht testen](/doc/reporting/images/test-report.png "Bericht testen")

Nun können Sie den Bericht visuell "debuggen". Auch nachdem ein Bericht in time cockpit geladen wurde, können Sie ihn weiterhin in [Microsoft SQL Server 2008 R2 Report Builder 3.0](http://www.microsoft.com/en-us/download/details.aspx?id=6116) bearbeiten. Um Änderungen aus [Microsoft SQL Server 2008 R2 Report Builder 3.0](http://www.microsoft.com/en-us/download/details.aspx?id=6116) anzuzeigen, speichern Sie die Berichtsdefinition, wechseln Sie zu time cockpit und klicken Sie auf **Aktualisieren**. time cockpit lädt die aktualisierte Berichtsdefinition und füllt sie mit time cockpit-Daten.

## Bericht hochladen

Um einen benutzerdefinierten Bericht in time cockpit hochzuladen, klicken Sie im Kontextmenü der Schaltfläche des noch nicht gespeicherten Berichts (blau hervorgehoben) auf **Bericht speichern**.

![Bericht speichern](/doc/reporting/images/save-report.png "Bericht speichern")

Ein Klick auf **Bericht speichern** öffnet einen Dialog. Legen Sie dort einen aussagekräftigen Namen fest, der in der Oberfläche von time cockpit angezeigt wird.

Zusätzlich können Sie im Dialog erweiterte Einstellungen festlegen:

- Is Visible Expression: Ein TCQL-Ausdruck, der bestimmt, wann ein benutzerdefinierter Bericht sichtbar ist. Details zu TCQL-Ausdrücken finden Sie unter Expression Language (TCQL).
- Sort Order: Die Sortierreihenfolge bestimmt, an welcher Position Ihr benutzerdefinierter Bericht angezeigt wird.

> [!NOTE]
> Die Position der Standard-Listenansicht und der Druckansicht ist fest. Sie können nur die Position innerhalb Ihrer benutzerdefinierten Berichte festlegen.

Klicken Sie auf **Speichern & schließen**, und der Bericht wird dauerhaft an eine Liste angehängt. Nach der Synchronisierung steht der Bericht allen Benutzern eines time cockpit-Kontos zur Verfügung.

## Bericht aktualisieren

Um einen benutzerdefinierten Bericht zu aktualisieren, klicken Sie auf **Download Report Definition** und gehen Sie wie unter [Bericht anpassen](#bericht-anpassen) beschrieben vor. Wenn Sie mit den Änderungen am Bericht fertig sind, klicken Sie auf **Upload New Report Definition**. Damit wird die aktuelle Berichtsdefinition ersetzt.

![Bericht speichern](/doc/reporting/images/update-report.png "Bericht aktualisieren")
