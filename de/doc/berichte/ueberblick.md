---
title: Berichte - SSRS-Berichte und benutzerdefinierte Berichte
description: Druckbare Berichte in time cockpit mit Microsoft Reporting Services (SSRS) erstellen. RDL-Dateien, Berichtsfilter und Datenquellen für eigene Berichte.
en_page: doc/reporting/overview.md
---
# Berichte

In Versionen ab 1.22 kann time cockpit Ihre Daten in Form druckbarer Berichte anzeigen. Für Berichte verwendet time cockpit [Reporting Services (SSRS)](http://msdn.microsoft.com/de-de/library/ms159106.aspx).

Diese Seite erklärt die Berichtstechnologie in time cockpit, was benutzerdefinierte Berichte können und was nicht, und wie Berichtsfilter und Datenzugriff funktionieren.

> [!NOTE]
> Überprüft im April 2026.

## Überblick

Benutzerdefinierte Berichte in time cockpit basieren auf RDL-Dateien. Zur Laufzeit liest time cockpit nicht direkt aus der Datenbank. Die Berichtsdaten werden über die Geschäftslogikschicht von time cockpit bereitgestellt, sodass Berechtigungen, berechnete Eigenschaften und Geschäftslogik weiterhin gelten.

Im Standardablauf basieren Berichte auf einer einzelnen time cockpit-Liste. Die Filter dieser Liste werden an den Bericht übergeben. Zusätzliche SSRS-spezifische Parameter oder die direkte Kombination mehrerer Datenquellen sind nicht Teil des Standardablaufs für Berichte.

> [!NOTE]
> Ersetzen Sie die von time cockpit generierte Datenquelle in der RDL-Datei nicht. Sie ist nur für die Entwurfszeit gedacht. Zur Laufzeit stellt time cockpit die tatsächliche Datenquelle bereit.

## Typische Verwendung

Berichte eignen sich gut, wenn Sie

- druckbare Berichte für eine time cockpit-Liste erstellen,
- die Berechtigungen und berechneten Felder dieser Liste wiederverwenden oder
- eigene Layouts auf Basis bestehender Listendaten gestalten möchten.

Wenn Sie Daten aus mehreren Bereichen benötigen, bereiten Sie diese Daten üblicherweise zuerst in einer skriptbasierten Liste auf und erstellen dann den Bericht auf Basis dieser Liste.

## FAQ

1. **Benötigen wir für diese Funktion einen eigenen Microsoft Reporting Services Server?**<br/>
Nein. time cockpit verwendet eine eingebettete Version von Microsoft Reporting Services.

1. **Ich kenne Microsoft Reporting Services nicht. Wie kann ich es lernen?**<br/>
Wir empfehlen das Buch [Professional Microsoft SQL Server 2012 Reporting Services](http://www.amazon.de/gp/product/1118101111/).

1. **Wird diese neue Berichtsfunktion gesondert verrechnet?**<br/>
Nein. Beachten Sie bitte, dass Ihr time cockpit-Abonnement nicht die Lizenzen umfasst, die Sie für die Microsoft-Werkzeuge zum Bearbeiten von *Reporting Services Definition (RDL)*-Dateien benötigen (siehe auch die nächste Frage).

1. **Wie können wir die RDL-Dateien bearbeiten, die time cockpit erstellt?**<br/>
Sie haben die Wahl zwischen Microsoft Visual Studio 2012 zusammen mit [Microsofts SQL Server Data Tools BI für Visual Studio 2012](http://www.microsoft.com/en-us/download/details.aspx?id=36843) und [Microsoft SQL Server 2008 R2 Report Builder 3.0](http://www.microsoft.com/en-us/download/details.aspx?id=6116). Visual Studio ist ideal, wenn Sie als Entwickler täglich mit Visual Studio arbeiten. Verwenden Sie Report Builder, wenn Sie keinen Hintergrund in der Softwareentwicklung haben und Visual Studio nicht kennen.<br/><br/>
Sie können [Microsoft SQL Server 2008 R2 Report Builder 3.0](http://www.microsoft.com/en-us/download/details.aspx?id=6116) von der Website von Microsoft herunterladen. Er ist kostenlos, wenn Sie eine gültige Lizenz für einen SQL Server besitzen. Details zu den Nutzungsbedingungen von Report Builder finden Sie in seinem Installationsassistenten.

1. **Profitieren nur time cockpit-Administratoren von dieser neuen Funktion?**<br/>
Derzeit können nur time cockpit-Administratoren benutzerdefinierte Berichte erstellen und anzeigen. Mit dem Release im April 2014 werden wir die Möglichkeit ergänzen, benutzerdefinierte Berichte in Ihre time cockpit-Datenbank hochzuladen. Hochgeladene Berichte stehen dann auch anderen Benutzern zur Verfügung (Vollclient und Web-Client). Das Erstellen benutzerdefinierter Berichte bleibt jedoch immer time cockpit-Administratoren vorbehalten.

1. **Greifen die benutzerdefinierten Berichte direkt auf die Datenbank von time cockpit zu?**<br/>
Nein. Berichte erhalten ihre Daten über die Geschäftslogikschicht von time cockpit. Daher gelten Berechtigungen, Geschäftslogik (z. B. berechnete Eigenschaften) usw. und stehen zur Verfügung.<br/><br/>
Beachten Sie bitte, dass Sie die Datenquelle, die time cockpit in den RDL-Dateien generiert hat, nicht ändern dürfen. Die Datenquelle wird nur für die Entwurfszeit angelegt. Zur Laufzeit ignoriert time cockpit sie und liefert die passenden Daten dynamisch.

1. **Kann ich einen Bericht in das Menü von time cockpit aufnehmen?**<br/>
Derzeit nicht. Wir planen, diese Möglichkeit in einer der nächsten Versionen von time cockpit zu ergänzen.

1. **Kann ich die Parameter und Filter von Reporting Services verwenden?**<br/>
Ja und nein. Benutzerdefinierte Berichte in time cockpit verwenden den bestehenden Filtermechanismus von time cockpit. Sie können Ihrer Liste bei Bedarf neue Berichtsfilter hinzufügen. time cockpit übergibt diese Filterbedingungen automatisch an Reporting Services. Beachten Sie bitte, dass Sie die Filtermechanismen von time cockpit verwenden müssen. Sie können keine zusätzlichen Filter oder Parameter direkt in Reporting Services hinzufügen.

1. **Kann ich Daten aus mehreren time cockpit-Listen in einem einzigen Bericht kombinieren?**<br/>
Nein, das wird derzeit nicht unterstützt. Die Listen-Engine von time cockpit ist sehr leistungsfähig. Sie können sogar Listen auf Basis von [time cockpit-Skripten](/doc/scripting/overview.html) erstellen. In einem solchen Skript können Sie Daten aus allen Bereichen von time cockpit zusammenführen. Das ist allerdings ein recht fortgeschrittenes Szenario. Wenn Sie einen solchen Bericht erstellen möchten und Fragen dazu haben, wenden Sie sich bitte an [support@timecockpit.com](mailto:support@timecockpit.com).

1. **Kann ich Daten aus time cockpit und anderen Quellen in einem einzigen Bericht kombinieren?**<br/>
Nein, das wird derzeit nicht unterstützt. Wenn Sie Daten in Ihren Bericht aufnehmen möchten, müssen Sie diese zuerst in time cockpit importieren. Dafür können Sie den [Excel-Import](~/doc/datenaustausch/import.md) von time cockpit verwenden.

1. **Kann ich Berichte automatisch an Benutzer senden?**<br/>
Nein, das wird derzeit nicht unterstützt.

1. **Ich bräuchte einige Berichte, habe aber keine Zeit, sie selbst zu erstellen. Können Sie das für mich übernehmen?**<br/>
Ja. Teilen Sie uns mit, wie Ihre Berichte aussehen sollen, und wir senden Ihnen gerne einen Kostenvoranschlag.

1. **Wie kann ich Feedback geben?**<br/>
Bitte senden Sie Ihre Fragen und Ihr Feedback an [support@timecockpit.com](mailto:support@timecockpit.com).
