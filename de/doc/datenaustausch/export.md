---
title: Datenexport - Export nach Excel, Word und PDF
description: Daten aus time cockpit nach Excel, Word und PDF exportieren. Mit Schnellexport, Vorlagen oder benutzerdefinierten SSRS-Berichten.
en_page: doc/data-exchange/export.md
---
# Datenexport

## Berichte

time cockpit kann jede Liste nach Excel, Word und PDF exportieren. Dafür stellt es eine automatisch generierte Druckansicht bereit, die alle Spalten der Liste enthält.

Wenn Sie nur Teile der Liste exportieren möchten, können Sie mit [Microsoft Reporting Services (SSRS)](http://msdn.microsoft.com/de-de/library/ms159106.aspx) eigene Druckansichten erstellen.

[Mehr über Berichte in time cockpit ...](~/doc/berichte/ueberblick.md)

## Excel-Schnellexport (nur Vollclient)

Der Vollclient von time cockpit bietet eine weitere Möglichkeit, die Daten einer Liste nach Microsoft Excel zu exportieren. Verwenden Sie **Excel Export** im Menüband. Sie können entweder alle Datensätze einer Liste oder nur die ausgewählten Elemente exportieren.

![Schnellexport](/doc/data-exchange/images/quick-export.png "Schnellexport")

Sie können den Schnellexport mit oder ohne Vorlage verwenden. Mit einer Vorlage können Sie die Daten auf besondere Weise formatieren oder Auswertungen und Diagramme hinzufügen.

> [!NOTE]
> Beachten Sie bitte, dass time cockpit nur mit Microsoft Office 2007 oder neuer funktioniert. Wenn Sie ältere Versionen von Microsoft Office verwenden, benötigen Sie das [Microsoft Office Compatibility Pack](http://support.microsoft.com/kb/924074/en).

### Standardformat für den Excel-Export

Wenn Sie Ihre Daten ohne Vorlage exportieren, werden alle Spalten Ihrer Liste exportiert. Die generierte Excel-Datei enthält alle Filterbedingungen und alle Daten. Gruppierungen werden nicht berücksichtigt.

![Schnellexport ohne Vorlage](/doc/data-exchange/images/quick-export-without-template.png "Schnellexport ohne Vorlage")

### Exportvorlage

time cockpit sucht in der Excel-Vorlage nach einem benannten Bereich **TemplateRow**. Dieser Bereich kann [TCQL-Ausdrücke](/doc/tcql/expression-language.html) in eckigen Klammern enthalten (z. B. `[=Current.USR_ProjectCode]`). Auf die exportierten Objekte greifen Sie mit `Current` zu.

> [!NOTE]
> Mit **STRG + F3** öffnen Sie den **Namens-Manager** von Excel, um den benannten Bereich **TemplateRow** festzulegen.

Außerhalb der TemplateRow können Sie alles nach Belieben anordnen. Es wird beim Export nicht verändert. Daten unterhalb der TemplateRow werden nach unten verschoben. Formeln mit Bezügen auf die TemplateRow werden automatisch erweitert (siehe Kommentar im Screenshot unten). So können Sie Summenzeilen in Ihre Vorlage aufnehmen.

time cockpit wird mit einer Vorlage für die Standardliste **Zeitbuchungen** ausgeliefert. Sie finden die Vorlage **TimesheetListPivotAnalysis.xlsx** im Installationsordner von time cockpit.

![Vorlage für den Schnellexport](/doc/data-exchange/images/quick-export-template.png "Vorlage für den Schnellexport")
