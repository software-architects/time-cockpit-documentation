---
title: Aktivitäten aufzeichnen mit time cockpit sidekick
description: time cockpit sidekick zeichnet Arbeitssignale auf Ihrem Windows-PC auf und zeigt sie in Ihrem eigenen Zeiterfassungskalender. Early Preview.
en_page: doc/sidekick/overview.md
---
# time cockpit sidekick

> [!WARNING]
> Early Preview: time cockpit sidekick befindet sich in einer frühen Vorschauphase. Funktionen, Bezeichnungen und Einrichtungsschritte können sich ohne Vorankündigung ändern. sidekick läuft unter Windows 10/11; die macOS-Version wird noch getestet. Während der Preview funktioniert sidekick nur mit `https://web-preview.timecockpit.com`. Feedback: [support@timecockpit.com](mailto:support@timecockpit.com)

time cockpit sidekick ist eine kleine Desktop-App, die im Infobereich von Windows oder in der macOS-Menüleiste läuft. Sie zeichnet Arbeitssignale auf Ihrem Rechner auf, zum Beispiel wann Sie aktiv waren, welche Anwendung im Vordergrund war und welche Git-Commits Sie gemacht haben, und behält sie auf diesem Rechner. Der Zeiterfassungskalender des time cockpit Web-Clients liest diese Signale von sidekick und zeigt sie neben Ihren Zeitbuchungen an. So buchen Sie Ihre Zeit nach dem, was tatsächlich passiert ist, statt den Tag aus dem Gedächtnis zu rekonstruieren.

Die Signale erscheinen nur in Ihrem eigenen Kalender.

## Was sidekick aufzeichnet

Ab der Installation zeichnet sidekick alle Quellen außer geänderten Dateien auf. Jede Quelle außer der Präsenz lässt sich in sidekick unter **Einstellungen** abschalten.

| Signal | Standard | Was aufgezeichnet wird |
|---|---|---|
| Präsenz und Aktivität | Immer an | Wann der Rechner lief, wann Sie ihn benutzt haben (aus dem Abstand zwischen Ihren Eingaben, nicht aus dem, was Sie tippen) und wann er gesperrt war. |
| Vordergrundfenster | An | Welche Anwendung im Vordergrund war, wie lange, und ihr Fenstertitel. Fenstertitel lassen sich abschalten, und Ausnahmeregeln zeichnen ein Fenster ohne Titel oder gar nicht auf. |
| Geänderte Dateien | Aus | Welche Dateien sich in den von Ihnen gewählten Ordnern ändern, nie ihr Inhalt. Beobachtet wird erst, wenn Sie die Quelle einschalten und Ordner wählen. |
| Git | An | Zeit und Nachricht von Commits und Branchwechseln. sidekick sucht Repositorys in `%USERPROFILE%\source\repos`, falls es diesen Ordner gibt, und in den Ordnern, die Sie unter **Ordner mit Repositorys** hinzufügen. Kein Code. |
| Claude-Code- und Codex-Sessions | An | Wann und in welchem Projekt Sie mit Claude Code oder Codex gearbeitet haben, samt Tokenverbrauch. Vom Text Ihrer Prompts höchstens der Anfang des ersten Prompts, als Name der Session. |
| Mikrofon | An | Welche Anwendung das Mikrofon benutzt, niemals Ton. |
| WLAN | An | Der Name des verbundenen WLANs und die Namen der WLANs in Reichweite, nie eine Hardware-Adresse. |
| SSH-Anmeldungen | Nur für hinzugefügte Rechner | Interaktive SSH-Anmeldungen auf Linux-Rechnern, die Sie in den Einstellungen von sidekick als entfernte Rechner hinzufügen. |

sidekick kann auch Linux-Rechner auslesen, auf denen Sie über SSH arbeiten, zum Beispiel einen Entwicklungsserver: deren Commits, Claude-Code- und Codex-Sessions, Dateiänderungen und SSH-Anmeldungen. Auf diesem Rechner wird nichts installiert; sidekick verwendet Ihre eigene OpenSSH-Konfiguration und speichert keine Zugangsdaten.

Was sidekick nie aufzeichnet, wo die Daten gespeichert werden und wie Sie sie löschen, beschreibt [Datenschutz und Daten in sidekick](~/doc/sidekick/datenschutz-und-daten.md).

## sidekick und der klassische Signal Tracker

sidekick ist der Nachfolger des [klassischen Signal Trackers](~/doc/signal-tracker/ueberblick.md), der Teil des time cockpit Fullclients ist. sidekick wird den klassischen Signal Tracker in den kommenden Monaten ablösen.

Die wichtigsten Unterschiede:

- sidekick ist eine eigene App. Sie brauchen den Fullclient nicht.
- sidekick behält seine Signale auf Ihrem Rechner. Der Kalender liest sie direkt von sidekick.

Der Kalender zeigt Signale immer nur aus einer Quelle an. In den Einstellungen des Kalenders wählen Sie unter **Signale** entweder **Keine Signale anzeigen**, **Signale vom klassischen time cockpit Signaltracker anzeigen** oder **Signale von time cockpit sidekick anzeigen**.

## Voraussetzungen

- Windows 10 oder 11 (x64) oder macOS auf Apple Silicon oder Intel. Die macOS-Version wird noch getestet und hat einige Einschränkungen; siehe [Installation unter macOS](~/doc/sidekick/installation-und-koppeln.md#installation-unter-macos).
- Unter Windows keine Administratorrechte: sidekick wird nur für Ihren Windows-Benutzer installiert.
- Der time cockpit Web-Client in der Preview-Umgebung (`https://web-preview.timecockpit.com`), geöffnet in einem Browser auf demselben Rechner, auf dem sidekick läuft. Der Kalender erreicht sidekick unter `127.0.0.1`, und diese Adresse ist nur von diesem Rechner aus erreichbar.

## Nächste Schritte

- [sidekick installieren und koppeln](~/doc/sidekick/installation-und-koppeln.md): Download, Installation und Verbindung mit dem Kalender.
- [sidekick-Signale im Zeiterfassungskalender](~/doc/sidekick/signale-im-kalender.md): das Aktivitätsband, die Detailspuren und der rechte Bereich.
- [Datenschutz und Daten in sidekick](~/doc/sidekick/datenschutz-und-daten.md): was aufgezeichnet wird, was nie aufgezeichnet wird, Speicherung und Löschen.
