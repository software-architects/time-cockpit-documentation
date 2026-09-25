---
title: Signal Tracker - Aktivitätserfassung
description: "Die Signal Tracker von time cockpit zeichnen aktive Fenster, Benutzeraktivität, E-Mails und Telefonate auf und erleichtern so die Zeiterfassung."
en_page: doc/signal-tracker/overview.md
---
# Signal Tracker

time cockpit enthält eine Reihe von Signal Trackern, die Ihre Aktivitäten auf Ihrem PC aufzeichnen. Die aufgezeichneten Aktivitäten heißen in time cockpit Signale. Sie werden im grafischen Zeiterfassungskalender angezeigt, damit Sie Ihre Zeit einfacher buchen können.

> [!TIP]
> Erfahren Sie, wie Ihnen die [automatische Aktivitätserfassung](https://www.timecockpit.com/features/activity-tracking/) hilft, sich daran zu erinnern, woran Sie im Laufe des Tages gearbeitet haben, und die Zeiterfassung mühelos und genau macht.

time cockpit enthält die folgenden Signal Tracker:

- [Computeraktivität](~/doc/signal-tracker/computeraktivitaet.md)
- [Benutzeraktivität](~/doc/signal-tracker/benutzeraktivitaet.md)
- [Aktive Fenster](~/doc/signal-tracker/aktive-fenster.md)
- [Gesendete E-Mails (Microsoft Office Outlook)](~/doc/signal-tracker/gesendete-e-mails.md)
- [Geänderte Dateien](~/doc/signal-tracker/geaenderte-dateien.md)
- [Netzwerkverbindungen](~/doc/signal-tracker/netzwerkverbindungen.md)
- [Benutzernotizen](~/doc/signal-tracker/notizen.md)
- [Telefonate](~/doc/signal-tracker/telefonate.md)
- [Microsoft Team Foundation Server](~/doc/signal-tracker/team-foundation-server.md)
- [Import von Signalen aus Textdateien](~/doc/signal-tracker/signale-aus-textdateien-importieren.md)

## Signal-Tracker-Konfiguration

![Signal-Tracker-Konfiguration](/doc/signal-tracker/images/signal-tracker-config.png "Signal-Tracker-Konfiguration")

Die Signal Tracker laufen im Hintergrund. Ein time cockpit Symbol im Infobereich zeigt an, dass die Signal Tracker laufen. Doppelklicken Sie auf das Symbol, um time cockpit zu öffnen. Klicken Sie mit der rechten Maustaste auf das Symbol, um weitere Optionen zu erhalten, z. B. um die Signal Tracker zu beenden.

![Symbol des Signal Trackers im Infobereich](/doc/signal-tracker/images/signal-tracker-tray-icon.png "Symbol des Signal Trackers im Infobereich")

Wenn die Signal Tracker nicht laufen, starten Sie einfach time cockpit. Beim Start prüft time cockpit, ob die Signal Tracker laufen, und bietet Ihnen an, sie zu starten, falls das nicht der Fall ist.

## Datenschutz

Solange die Signal Tracker im Hintergrund laufen, zeichnen sie Ihre Aktivitäten auf Ihrem PC auf (siehe Signal-Tracker-Konfiguration). Um die Aufzeichnung von Aktivitäten zu verhindern, haben Sie die folgenden Möglichkeiten:

- Beenden Sie einzelne Signal Tracker in der [Signal-Tracker-Konfiguration](#signal-tracker-konfiguration). Beachten Sie, dass ein beendeter Signal Tracker nicht automatisch wieder gestartet wird, auch nicht nach einem Neustart Ihres Computers. Wenn er wieder aufzeichnen soll, müssen Sie ihn manuell starten.
- Wenn Sie die Signalaufzeichnung vorübergehend anhalten möchten, können Sie die Signal Tracker entweder in der [Signal-Tracker-Konfiguration](#signal-tracker-konfiguration) oder im Kontextmenü des Symbols im Infobereich pausieren. Dadurch werden alle Signal Tracker pausiert. Beachten Sie, dass die Signal Tracker nach einem Neustart automatisch gestartet werden.

![Symbol des pausierten Signal Trackers im Infobereich](/doc/signal-tracker/images/signal-tracker-tray-icon-paused.png "Symbol des pausierten Signal Trackers im Infobereich")

Die Signal Tracker zeichnen nicht den Inhalt der erfassten Elemente auf, etwa den Text von E-Mails, Dateien oder besuchten Websites. Sie zeichnen nur den Namen oder Titel dieser Elemente auf, z. B. den Betreff einer E-Mail, den Dateinamen oder den Titel von Websites.

Aufgezeichnete Signale sind personenbezogene Daten des Benutzers. time cockpit enthält keine Funktionen, mit denen Signale anderer Benutzer angezeigt werden können, und es gibt keine Möglichkeit, Signale zu aggregieren, um sie benutzerübergreifend auszuwerten.

Wenn Sie Ihre Zeitbuchungen für einen bestimmten Zeitraum abgeschlossen haben und die zugehörigen Signale löschen möchten oder wenn Sie Signale aufgezeichnet haben, die Sie nicht behalten möchten, können Sie mit der Ribbon-Schaltfläche **Delete signals** Signale für einen Zeitraum entfernen. Sie können alle Signale oder nur ausgewählte Signaltypen löschen.

![Signale löschen](/doc/signal-tracker/images/delete-signals.png "Signale löschen")

> [!NOTE]
> Sie können den Signal Tracker über einen Registry-Schlüssel von einem Opt-out-Modell auf ein Opt-in-Modell umstellen. Details finden Sie unter Auto-Start Behavior of Signal Trackers
