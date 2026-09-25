---
title: Skripte automatisieren - Zeitgesteuerte Ausführung
description: "IronPython-Skripte in time cockpit mit ExecuteScript automatisiert ausführen: zeitgesteuert, mit Transaktionen und eingebunden in externe Systeme."
en_page: doc/scripting/automating-scripts.md
---
# Skripte automatisieren

Für die nicht interaktive, zeitgesteuerte Ausführung von IronPython-Skripten bietet time cockpit das Programm ExecuteScript. Dieses Thema beschreibt die Funktionen, Parameter und Anwendungsbeispiele für die automatisierte Ausführung von Skripten.

## Funktionen von ExecuteScript

Neben seinem Hauptzweck, IronPython-Skripte auszuführen, lässt sich das Verhalten des Werkzeugs über weitere Parameter steuern. Für die Einbindung in größere Systeme zeigt sein Rückgabewert Erfolg oder Misserfolg des Vorgangs an. Damit können Sie Befehlsaufrufe verketten oder den Wert über die Variable `%ERRORLEVEL%` in anderen Skripten verwenden. Die Ausgabe des Skripts kann direkt in eine angegebene Datei geschrieben werden, wobei sich das Verhalten für eine bereits vorhandene Ausgabedatei festlegen lässt. Standardmäßig wird das Skript mit dem Client-Datenkontext ausgeführt, ein Flag ermöglicht aber die Ausführung mit dem Server-Datenkontext. Ein weiteres Flag schließt die gesamte Skriptausführung in eine Transaktion ein, die zurückgesetzt wird, wenn während der Ausführung eine Ausnahme auftritt.

## Parameter

Die folgende Tabelle beschreibt die Parameter, die ExecuteScript unterstützt. Für die meisten Parameter gibt es austauschbare Kurz- und Langformen. Es muss entweder ein Skriptdateiname oder ein Aktionsname angegeben werden. Alle anderen Parameter sind optional.

Parameter | Beschreibung
--- | ---
-f &lt;scriptFileName&gt;<br/>--file &lt;scriptFileName&gt; | Auszuführende Skriptdatei.
--action &lt;actionName&gt; | Vordefinierte time cockpit-Aktion, die ausgelöst werden soll.
-o &lt;scriptFileName&gt;<br/>--output &lt;scriptFileName&gt; | Datei, in die die Ausgabe des Skripts geschrieben wird.
-O<br/>--overwrite | Ausgabedatei überschreiben, falls sie vorhanden ist.
-A<br/>--append | An die Ausgabedatei anhängen, falls sie vorhanden ist.
-T<br/>--transaction | Das Skript innerhalb einer Transaktion ausführen.
-s<br/>--server | Den Server-Datenkontext statt des Client-Datenkontexts verwenden.
-q<br/>--quiet | Keine Ausgabe anzeigen.
--help | Diese Hilfe anzeigen.

## Anwendungsbeispiel

Das folgende Beispiel zeigt, wie Sie ein sehr einfaches IronPython-Skript über die Befehlszeile mit dem Server-Datenkontext und einer Transaktion ausführen:

```
C:\Program Files\software architects\time cockpit\time cockpit 2010>TimeCockpit.ExecuteScript -s -T -f C:\Data\Scripts\HelloWorld.py
Hello World
```

> [!NOTE]
> Die Ausgabe des Skripts wird auf der Standardausgabe ausgegeben, sofern wir nicht das Flag quiet angeben.

Mit der Windows-Aufgabenplanung lässt sich eine regelmäßige Aufgabe einrichten, die die oben gezeigte Skriptausführung automatisiert. Nachdem Sie eine einfache (oder normale) Aufgabe erstellt und den Ausführungszeitpunkt festgelegt haben, geben Sie den Speicherort des Programms ExecuteScript und seine Parameter an.

![Assistent zum Erstellen einer Aufgabe](/doc/scripting/images/create-task-wizard.png "Assistent zum Erstellen einer Aufgabe")
