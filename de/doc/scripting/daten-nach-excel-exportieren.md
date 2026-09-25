---
title: Daten nach Excel exportieren - Skripte für Berichte
description: Daten aus time cockpit mit der integrierten Exportfunktion oder per Office-Automatisierung nach Microsoft Excel exportieren, inklusive Pivot-Tabellen.
en_page: doc/scripting/export-data-to-excel.md
---
# Anleitung: Daten nach Microsoft Excel exportieren

Für Berichte ist es oft notwendig, Daten automatisch nach Microsoft Office Excel zu exportieren. Sie könnten beispielsweise ein Exportskript für Zeitbuchungen erstellen, das automatisch einen Excel-Pivot-Bericht pro Benutzer erzeugt und diesen Bericht per E-Mail versendet.

time cockpit unterstützt zwei Wege, Daten nach Microsoft Office Excel zu exportieren:

- Verwenden Sie die [integrierte Exportfunktion](~/doc/datenaustausch/export.md) von time cockpit.
- Wenn Sie etwas sehr Spezielles benötigen (z. B. eine besondere Formatierung der erzeugten Microsoft-Office-Excel-Datei), können Sie die Microsoft-Office-Automatisierung in [IronPython](http://ironpython.net/) verwenden.

## Integrierte Exportfunktion für Microsoft Office Excel verwenden

Das folgende Beispiel zeigt, wie Sie das Ergebnis einer [TCQL-Abfrage](~/doc/tcql/ueberblick.md) in einem Skript mithilfe einer [Vorlagedatei](~/doc/datenaustausch/export.md) für den Export exportieren:

> [!NOTE]
> Die im folgenden Code gezeigte Methode Export erwartet entweder eine Vorlagedatei oder eine Listendefinition. Wenn Sie eine Vorlage angeben, wird die Listendefinition ignoriert. Wenn Sie keine Vorlagedatei angeben, müssen Sie eine Listendefinition angeben (die Vorlage wird dann automatisch auf Basis der Listendefinition erstellt).

```
clr.AddReference("TimeCockpit.Data.Export")
from TimeCockpit.Data.Export.Excel import *
from System.Threading import CancellationToken

resultingRows = Context.Select("From T In Timesheet Where T.APP_BeginTime > #2010-01-01# Select T")
sourceList = Context.Model.ModelEntityViews["APP_TimesheetList"].Configuration.Columns

XlsxExporter2.ExportToFile(
  "c:\\temp\\Template.xlsx",    # Path to template file  
  "c:\\temp\\export.xlsx",      # Target file name
  resultingRows,                # Rows that should be exported (has to be a list of entity objects)
  sourceList,                   # List definition that acts as the source for the export
  None,                         # Reserved; always pass None here
  CancellationToken(False))     # Cancellation token that could be used to cancel the export
```

## Microsoft-Office-Automatisierung in einem Skript verwenden

Das folgende Beispiel zeigt, wie Sie eine Microsoft-Office-Excel-Datei mit Microsoft-Office-Automatisierung erzeugen. Das Skript lädt eine Vorlagearbeitsmappe, erstellt durch Kopieren eines Arbeitsblatts ein Blatt pro Benutzer und füllt das Blatt mit Zeitbuchungen. Feiertage und Wochenenden werden besonders formatiert.

[!code-python[Export time sheet entries to excel](code/export-time-sheet-entries-per-user-to-excel.py)]

## Excel-Export mit einer Aktion in die Benutzeroberfläche integrieren

Sie können ein Exportskript in eine [Aktion](/api/TimeCockpit.Data.DataModel.Actions.ModelAction.html) umwandeln, um in der Benutzeroberfläche von time cockpit eine Schaltfläche anzubieten, die die Daten der ausgewählten Zeile einer Liste exportiert. Das folgende Beispiel zeigt, wie das oben gezeigte Beispiel als Aktion zur Entität APP_UserDetail hinzugefügt werden kann:

> [!NOTE]
> Beachten Sie, dass der Code der Aktion nur eine einzige `def`-Anweisung auf oberster Ebene enthalten darf! Wenn Sie Hilfsfunktionen benötigen, müssen Sie diese als verschachtelte Funktionen innerhalb der einen Funktion auf oberster Ebene definieren (siehe Beispielcode unten).

[!code-python[Export time sheet entries to excel action](code/export-time-sheet-entries-per-user-to-excel-action.py)]
