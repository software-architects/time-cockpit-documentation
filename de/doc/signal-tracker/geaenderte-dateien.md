---
title: Signal Tracker für geänderte Dateien
description: Erfassen Sie Schreibzugriffe auf Dateien mit dem Signal Tracker für geänderte Dateien und erkennen Sie so Projekte und Kunden in time cockpit.
en_page: doc/signal-tracker/changed-files.md
---
# Signal Tracker für geänderte Dateien	

Der Signal Tracker für geänderte Dateien zeichnet Schreibzugriffe auf Dateien auf Ihrem Computer auf. Die Namen der Dateien und Ordner helfen Ihnen oft dabei, den Kunden und das Projekt zu erkennen, an dem Sie arbeiten.

## Gesammelte Daten

Der Signal Tracker für geänderte Dateien zeichnet Schreibzugriffe auf Dateien auf Ihrem Computer auf. Üblicherweise ist die Anzahl der Schreibzugriffe recht groß. Deshalb können Sie die aufgezeichneten Dateien einschränken, indem Sie festlegen, welche Ordner aufgezeichnet werden sollen, und Ausschlussmuster angeben.

Wenn Sie den Signal Tracker beenden oder pausieren, zeichnet er Ihre Schreibzugriffe auf Dateien nicht auf.

> [!NOTE]
> Wenn Sie einen Vorgang ausführen möchten, der sehr viele Dateien in die aufgezeichneten Ordner schreibt (z. B. eine .zip-Datei entpacken), empfehlen wir, den Signal Tracker für Schreibzugriffe auf Dateien zu beenden oder zu pausieren. Andernfalls erzeugt der Signal Tracker sehr viele Signale, die die Performance von time cockpit verringern können. Wenn bereits sehr viele Dateisignale vorhanden sind, können Sie diese im Ribbon-Menü des Zeiterfassungskalenders löschen.

## Konfigurationsparameter des Signal Trackers

Parametername | Datentyp | Beschreibung
--- | --- | ---
Selected folders (`Paths`) | XML | Liste der Ordner, die aufgezeichnet werden sollen. Für jeden Ordner können Sie festlegen, ob Unterordner rekursiv aufgezeichnet werden sollen.<br/>Standardmäßig zeichnet time cockpit Ihren Ordner Dokumente auf.<br/><br/>Der Signal Tracker für Schreibzugriffe auf Dateien unterstützt nur lokale Laufwerke. Netzlaufwerke werden derzeit nicht unterstützt. Außerdem können Laufwerke, die nicht beschreibbar sind, nicht aufgezeichnet werden.
Ignore patterns (`ExcludePatterns`) | XML	| Liste der Muster, die ignoriert werden sollen. Verwenden Sie * als Platzhalter. Beispiele für Ausschlussmuster:<br/><br/>`*.tmp` = alle Dateien, die auf .tmp enden<br/>`*\iTunes\*` = alle Dateien, deren Pfad iTunes enthält<br/><br/>time cockpit ignoriert alle Schreibzugriffe auf Dateien in den folgenden Ordnern, unabhängig davon, ob sie in den ausgewählten Ordnern enthalten sind (weitere Informationen zu diesen Spezialordnern finden Sie im MSDN):<br/><br/>`Environment.SpecialFolder.Windows`<br/>`Environment.SpecialFolder.ProgramFiles`<br/>`Environment.SpecialFolder.ProgramFilesX86`

> [!NOTE]
> Oft brauchen Sie etwas Zeit, bis Sie gute Einstellungen für den Signal Tracker für Schreibzugriffe auf Dateien gefunden haben. Wir empfehlen, mit den Standardeinstellungen zu beginnen und sie mit der Zeit anzupassen. Wenn Sie in der Auswertung Dateien finden, die nicht hilfreich sind, schließen Sie den Ordner aus oder legen Sie ein Ausschlussmuster für die Datei fest.
