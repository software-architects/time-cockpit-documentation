---
title: Datenschutz und Daten in sidekick - Was aufgezeichnet wird
description: Was time cockpit sidekick aufzeichnet und nie aufzeichnet, wo die Daten liegen, wie der Kalender sie liest und wie Sie sie löschen.
en_page: doc/sidekick/privacy-and-data.md
---
# Datenschutz und Daten in sidekick

> [!WARNING]
> Early Preview: time cockpit sidekick befindet sich in einer frühen Vorschauphase. Funktionen, Bezeichnungen und Einrichtungsschritte können sich ohne Vorankündigung ändern. sidekick läuft unter Windows 10/11; die macOS-Version wird noch getestet. Während der Preview funktioniert sidekick nur mit `https://web-preview.timecockpit.com`. Feedback: [support@timecockpit.com](mailto:support@timecockpit.com)

time cockpit sidekick zeichnet Arbeitssignale auf Ihrem Rechner auf und behält sie dort. Diese Seite beschreibt genau, was aufgezeichnet wird, was nie aufgezeichnet wird, wo die Daten gespeichert werden, wer sie lesen kann und wo der Schutz endet.

## Was sidekick aufzeichnet

Ab der Installation zeichnet sidekick alle Quellen dieser Liste auf, außer geänderten Dateien, die standardmäßig aus sind. SSH-Anmeldungen werden nur für entfernte Rechner aufgezeichnet, die Sie hinzufügen.

Frühere Aktivität liest sidekick einmalig ebenfalls ein. Es übernimmt alle Claude-Code- und Codex-Sessions, die bereits auf Ihrem Rechner liegen, ohne zeitliche Grenze. Findet es ein Git-Repository zum ersten Mal, auch eines, das Sie später hinzufügen, übernimmt es die Commits der letzten 90 Tage. Für einen entfernten Rechner gilt dasselbe einmalig, außer Sie schalten das Einlesen des Verlaufs für diesen Rechner ab. Wie Sie Quellen abschalten, steht unter [Festlegen, was aufgezeichnet wird](#festlegen-was-aufgezeichnet-wird).

- Wann der Rechner lief, wann Sie ihn benutzt haben (aus dem Abstand zwischen Ihren Eingaben) und wann er gesperrt war.
- Welche Anwendung im Vordergrund war, wie lange, und ihr Fenstertitel.
- Welche Dateien sich in den von Ihnen gewählten Ordnern ändern (standardmäßig aus; beobachtet wird erst, wenn Sie die Quelle einschalten und Ordner wählen).
- Zeit und Nachricht von Git-Commits und Branchwechseln in den Repositorys in `%USERPROFILE%\source\repos`, falls es diesen Ordner gibt, und in den Ordnern, die Sie unter **Ordner mit Repositorys** hinzufügen.
- Wann und in welchem Projekt Sie mit Claude Code oder Codex gearbeitet haben, die Zeitpunkte Ihrer Prompts, den Tokenverbrauch und einen Namen je Session (siehe unten).
- Welche Anwendung das Mikrofon benutzt.
- Die Namen des verbundenen WLANs und der WLANs in Reichweite, mit ihrer Signalstärke.
- Interaktive SSH-Anmeldungen auf Linux-Rechnern, die Sie als entfernte Rechner hinzufügen.

Fenstertitel, Dateipfade und Commit-Nachrichten können viel über Ihre Arbeit verraten. Deshalb gibt es die unten beschriebenen Ausnahmen, die Pause und das Löschen.

## Was sidekick nie aufzeichnet

- Tastatureingaben. Ihre Aktivität wird aus dem Abstand zwischen Ihren Eingaben abgeleitet, nicht aus dem, was Sie tippen.
- Dateiinhalte.
- Bildschirmfotos.
- Die Zwischenablage.
- Terminal-Befehle.
- Browser-URLs.
- Jede Art von Ton. Das Mikrofonsignal sagt nur, welche Anwendung das Mikrofon geöffnet hatte. sidekick öffnet keinen Audiostream.
- Die BSSID, MAC-Adresse oder eine andere Hardware-Adresse eines WLANs. Aufgezeichnet werden nur Netzwerknamen.
- Den Text Ihrer Prompts an Claude Code und Codex. Die einzige Ausnahme ist der Name der Session: sidekick verwendet den Titel, den Claude Code für eine Session schreibt, und wenn es keinen gibt (bei Codex immer), die ersten 80 Zeichen des ersten Prompts.

## Wo die Daten gespeichert werden

sidekick speichert seine Daten in `%APPDATA%\timecockpit-sidekick` (unter macOS in `~/Library/Application Support/timecockpit-sidekick`). **Datenordner öffnen** im Menü des Symbols im Infobereich öffnet diesen Ordner.

- `signals.sqlite` enthält die Signale. Es ist eine unverschlüsselte SQLite-Datenbank in Ihrem Windows-Profil.
- `tokens.json` enthält nur einen Hash jedes Tokens für das Koppeln, nie das Token selbst.
- `backups` enthält eine geprüfte Kopie der Datenbank von jedem Tag. Die sieben neuesten Kopien werden aufbewahrt.
- `config.json` enthält die Einstellungen.
- `anchor-exclusions.json` und `meeting-dismissals.json` enthalten, was der Kalender an sidekick zurückschreibt (siehe [Wie der Kalender die Signale liest](#wie-der-kalender-die-signale-liest)).
- `tracker.log` ist eine Protokolldatei. Sie enthält keine Fenstertitel und keine Pfade.

Signale, die älter als 90 Tage sind, werden jede Nacht gelöscht. Den Zeitraum ändern Sie in sidekick unter **Einstellungen**, Bereich **Aufbewahrung und Start**, Einstellung **Signale aufbewahren (Tage)**.

## Was Ihren Rechner verlässt

- sidekick lädt keine Signale hoch und sendet keine Telemetrie.
- Auch der time cockpit Web-Client sendet die Signale nicht an den time cockpit Server. Der Kalender verarbeitet sie nur in Ihrem Browser, auch die Schlüsselwörter und den Buchungsvorschlag. Nur die Zeitbuchungen, die Sie anlegen, werden wie gewohnt in time cockpit gespeichert.
- Die einzige Anfrage, die sidekick von sich aus stellt, ist die Suche nach Updates: Eine Minute nach dem Start und danach alle vier Stunden liest es den Update-Feed unter `https://www.timecockpit.com/download/sidekick/` und lädt von dort eine neuere Version herunter. Die Anfrage enthält keine Daten von sidekick; der Server sieht die Adresse, von der die Anfrage kommt, wie bei jedem Download.
- Wenn Sie entfernte Rechner hinzufügen, verbindet sich sidekick über SSH mit ihnen, um ihre Signale zu lesen. Die Daten bleiben in der lokalen Datenbank.

## Wie der Kalender die Signale liest

- sidekick antwortet nur unter `127.0.0.1`. Andere Rechner im Netzwerk können es nicht erreichen.
- Jede time cockpit Adresse, zum Beispiel `https://web-preview.timecockpit.com`, braucht ihr eigenes Token. Ein Token, das für eine andere Adresse erstellt wurde, wird abgewiesen.
- Der Kalender fragt die Signale direkt aus Ihrem Browser ab. Die Signale gehen von sidekick direkt an Ihren Browser und werden nur dort verarbeitet; sie werden nie an den time cockpit Server gesendet.
- Außer dem Lesen schreibt der Kalender nur zwei Dinge an sidekick zurück: die Termine, die Sie ignorieren, mit Betreff und geplanten Zeiten, und die Signale, die Sie als Beleg für den Vorschlag ausschließen, mit der Schablone, für die Sie sie ausgeschlossen haben (die Kennungen und Namen etwa ihres Projekts und ihrer Aufgabe). sidekick speichert sie, damit der Kalender sie anzeigen und zurücknehmen kann. Beides ändert kein Signal.
- Der Reiter **Koppeln** in sidekick zeigt ein Zugriffsprotokoll der letzten Anfragen, und **Widerrufen** entzieht einem gekoppelten Kalender den Zugriff.
- Um allen Kalendern das Lesen zu verbieten, deaktivieren Sie **Gekoppelte Kalender dürfen lesen** unter **Einstellungen** im Bereich **Verbindung zum Kalender**.

## Festlegen, was aufgezeichnet wird

In sidekick unter **Einstellungen**:

- Jede Quelle außer der Präsenz lässt sich abschalten: **Fenster**, **Dateien**, **Mikrofon**, **WLAN**, **Claude Code**, **Codex** und **Git**.
- **Fenstertitel mitschreiben** im Bereich **Fenster** behält Anwendungsnamen und Zeiten, lässt aber alle Fenstertitel weg.
- **Ausnahmen** im Bereich **Fenster** gelten für einzelne Anwendungen oder Fenster. **Nur Zeit, ohne Titel** behält die Zeit, lässt aber den Fenstertitel weg. **Nicht aufzeichnen** zeichnet gar nichts auf; die Zeit verschwindet aus dem Tag. Ausnahmen werden angewendet, bevor etwas gespeichert wird.
- Standardmäßig werden Passwortmanager und private Browserfenster ohne ihre Titel aufgezeichnet, und das Fenster von sidekick selbst wird nicht aufgezeichnet. Der Kalender zeigt Fenster ohne Titel als **geschwärzt**.
- **Dateiänderungen beobachten** im Bereich **Dateien** ist standardmäßig aus, und ohne Ordner wird nichts beobachtet. sidekick zeichnet auf, welche Dateien sich ändern, nie ihren Inhalt.

Um die Aufzeichnung zu pausieren, verwenden Sie **Pause** im Menü des Symbols im Infobereich (**15 min**, **1 h** oder **bis Fortsetzen**). Während der Pause zeichnet sidekick weiterhin auf, ob der Rechner lief und ob er gesperrt war, sodass die Pause als Lücke in Ihrer Aktivität erscheint.

## Daten löschen

Öffnen Sie in sidekick den Reiter **Daten**. Im Bereich **Daten löschen**:

- **Heutigen Tag löschen…** löscht die Signale von heute.
- **Zeitraum löschen…** löscht die Signale zwischen zwei Tagen.
- **Alles löschen…** löscht alle Signale.

sidekick zeigt vor dem Löschen, wie viele Zeilen gelöscht werden. Die Sicherungen, die einen gelöschten Tag enthalten, werden ebenfalls gelöscht, und gelöschte Zeilen werden in der Datenbankdatei überschrieben. Nach **Alles löschen…** liest sidekick keinen früheren Verlauf mehr ein: Claude-Code- und Codex-Sessions und Git-Repositorys werden erst ab dann aufgezeichnet, auch Repositorys, die es später findet.

Die Deinstallation von sidekick löscht den Datenordner nicht.

## Wovor sidekick nicht schützt

- Vor jedem, der Zugriff auf Ihr Windows-Konto hat. Die Datenbank ist eine unverschlüsselte Datei in Ihrem Profil.
- Vor anderen Programmen, die unter Ihrem Windows-Konto laufen. Sie können die Datenbank und die Token-Datei direkt lesen oder Fenstertitel auf dieselbe Weise auslesen wie sidekick.
- Vor schädlichem oder kompromittiertem Code in der time cockpit Webanwendung selbst. Ein gekoppelter Kalender kann Ihre Signale lesen.

## WLAN-Namen ab Windows 11 24H2

Ab Windows 11 24H2 gibt Windows WLAN-Namen nur mit Standortzugriff an Desktop-Apps heraus. Ohne ihn zeichnet sidekick keine WLAN-Namen auf und meldet einen Fehler für die WLAN-Quelle. Um den Zugriff zu erlauben, öffnen Sie die Windows-Einstellungen, gehen Sie zu **Datenschutz und Sicherheit** > **Standort** und schalten Sie **Standortdienste** und **Desktop-Apps den Zugriff auf Ihren Standort erlauben** ein.

sidekick liest Ihren Standort nicht. Windows verlangt diese Einstellung nur, bevor es Netzwerknamen herausgibt.
