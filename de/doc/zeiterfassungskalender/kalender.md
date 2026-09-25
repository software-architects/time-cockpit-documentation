---
title: Zeiterfassungskalender - Zeitbuchungen anlegen und verwalten
description: "Der grafische Kalender von time cockpit: Tages-, Wochen- und Monatsansicht, Navigation, Zoom und Benutzerauswahl für die Zeiterfassung."
en_page: doc/timesheet-calendar/calendar.md
---
# Zeiterfassungskalender

Der Zeiterfassungskalender ist das zentrale Werkzeug, um in time cockpit Zeitbuchungen anzulegen. In diesem Abschnitt beschreiben wir die wichtigsten Bereiche des Zeiterfassungskalenders. Wie Sie Ihre Zeitbuchungen anlegen und bearbeiten, lesen Sie unter [Arbeiten mit Zeitbuchungen](~/doc/zeiterfassungskalender/arbeiten-mit-zeitbuchungen.md).

> [!TIP]
> Möchten Sie den Kalender in Aktion sehen? Auf unserer [Funktionsseite zum Zeiterfassungskalender](https://www.timecockpit.com/features/time-tracking-calendar/) finden Sie einen interaktiven Überblick und Videos.

## Elemente des Zeiterfassungskalenders

![Zeiterfassungskalender](/doc/timesheet-calendar/images/wc-calendar-overview.png "Zeiterfassungskalender")

Der Zeiterfassungskalender besteht aus folgenden Bereichen:

- [Zeiterfassungskalender](#zeiterfassungskalender)
  - [Elemente des Zeiterfassungskalenders](#elemente-des-zeiterfassungskalenders)
  - [Hauptmenü](#hauptmenü)
  - [Symbolleiste](#symbolleiste)
  - [Benutzerauswahl](#benutzerauswahl)
  - [Zeiterfassungskalender](#zeiterfassungskalender-1)
    - [Tagesansicht, Arbeitswochenansicht, Wochenansicht und Monatsansicht](#tagesansicht-arbeitswochenansicht-wochenansicht-und-monatsansicht)
    - [Zoom](#zoom)
    - [Navigation](#navigation)

## Hauptmenü

Das Hauptmenü besteht aus sogenannten Modulen (Zeiterfassung, Verwaltung, Benutzer).

![Hauptmenü](/doc/timesheet-calendar/images/wc-menu.png "Hauptmenü")

* Das Modul **Zeiterfassung** öffnet den Zeiterfassungskalender.
* Das Modul **Verwaltung** enthält Listen zur Verwaltung Ihrer Stammdaten (Kunden, Projekte, Aufgaben usw.).
* Das Modul **Benutzer** enthält Listen zur Verwaltung aller Daten rund um Benutzer und Mitarbeiter.

## Symbolleiste

Die Symbolleiste enthält Befehle, die für den Zeiterfassungskalender oder für ausgewählte Zeitbuchungen verfügbar sind.

![Symbolleiste](/doc/timesheet-calendar/images/wc-toolbar.png "Symbolleiste")

## Benutzerauswahl

In der Benutzerauswahl wählen Sie den Benutzer, dessen Zeitbuchungen angezeigt werden sollen. Beachten Sie dabei folgende Einschränkungen:

- time cockpit bietet ein ausgefeiltes Berechtigungssystem. Sie können Lese- und Schreibberechtigungen für Benutzer und Gruppen festlegen. Weitere Informationen zu Berechtigungen finden Sie unter [Berechtigungsverwaltung](/doc/data-model-customization/permission.html).

> [!NOTE]
> Standardmäßig liefert time cockpit keine Berechtigungen aus. Alle Benutzer dürfen alles sehen.

![Benutzerauswahl](/doc/timesheet-calendar/images/wc-user-selection.png "Benutzerauswahl")

Seit Version 1.7 von time cockpit können Sie Benutzer in der Benutzerauswahl ausblenden. Wechseln Sie im Hauptmenü zu **Benutzer** und öffnen Sie die Liste **User Details**. Öffnen Sie den Benutzer, den Sie ausblenden möchten, und aktivieren Sie das Kontrollkästchen **Hidden**.

## Zeiterfassungskalender

Der Zeiterfassungskalender zeigt verschiedene Arten von Informationen:

* Zeitbuchungen
* Abwesenheiten (Urlaub, Zeitausgleich, Krankenstand). Siehe auch [Abwesenheitsverwaltung](/doc/employee-time-tracking/absence-time-management.html).
* Outlook-Termine und gesendete E-Mails aus Ihrem Office 365-Konto. Siehe auch [Office 365](~/doc/zeiterfassungskalender/office-365-integration.md).

Sie können Zeitbuchungen manuell anlegen, ändern oder löschen, oder Sie legen sie mithilfe von Signalen oder Microsoft Office Outlook-Terminen an. Der Zeiterfassungskalender besteht aus folgenden Bereichen:

![Zeiterfassungskalender](/doc/timesheet-calendar/images/wc-timesheet-calendar.png "Zeiterfassungskalender")

### Tagesansicht, Arbeitswochenansicht, Wochenansicht und Monatsansicht

Über die Symbolleiste wechseln Sie im Zeiterfassungskalender zwischen den folgenden Ansichten.

![Ansicht auswählen](/doc/timesheet-calendar/images/wc-select-view.png "Ansicht auswählen")

Verwenden Sie die Tagesansicht zum Beispiel, wenn Sie Ihre Zeitbuchungen auf Basis Ihrer Microsoft Office Outlook-Termine anlegen möchten. Die Wochenansicht und die Arbeitswochenansicht geben Ihnen einen Überblick über Ihre Arbeitszeit, Sie können in diesen Ansichten aber auch Zeitbuchungen anlegen und ändern. Diese beiden Ansichten sind auch praktisch, wenn Sie eine Zeitbuchung auf einen anderen Tag derselben Woche kopieren oder verschieben möchten.

![Tagesansicht](/doc/timesheet-calendar/images/wc-day-view.png "Tagesansicht")

![Arbeitswochenansicht](/doc/timesheet-calendar/images/wc-work-week-view.png "Arbeitswochenansicht")

![Wochenansicht](/doc/timesheet-calendar/images/wc-week-view.png "Wochenansicht")

Neben der Granularität des Zeiterfassungskalenders können Sie auch wählen, wie Ihre Daten dargestellt werden. Wenn Sie die Office 365-Integration aktiviert haben, können Sie Outlook-Termine und Zeitbuchungen nebeneinander anzeigen.

![Ansicht nebeneinander](/doc/timesheet-calendar/images/wc-side-by-side.png "Ansicht nebeneinander")

Wenn Sie diese Option aktivieren, werden Zeitbuchungen und Outlook-Termine nebeneinander angezeigt.

![Ansicht nebeneinander aktiviert](/doc/timesheet-calendar/images/wc-side-by-side-enabled.png "Ansicht nebeneinander aktiviert")

### Zoom

In der Tagesansicht, der Arbeitswochenansicht und der Wochenansicht können Sie die Skalierung der Zeitachse durch Hinein- und Herauszoomen ändern. Die Zoomstufe ändern Sie auf eine der folgenden Arten:

- Halten Sie die Taste **STRG** gedrückt und ändern Sie die Zoomstufe mit dem Mausrad.
- Verwenden Sie die Zoom-Befehle **Hinein zoomen** und **Heraus zoomen** rechts oben im Zeiterfassungskalender.

### Navigation

Sie können im Kalender auf folgende Arten zwischen Tagen und Wochen wechseln:

* In der Tagesansicht drücken Sie **STRG + Pfeil nach rechts** für den nächsten Tag und **STRG + Pfeil nach links** für den vorigen Tag.

* In der Wochenansicht drücken Sie **STRG + Pfeil nach rechts** für die nächste Woche und **STRG + Pfeil nach links** für die vorige Woche.

Um ein bestimmtes Datum auszuwählen, verwenden Sie die Datumsauswahl oben im Zeiterfassungskalender.

![Datumsauswahl](/doc/timesheet-calendar/images/wc-date-picker.png "Datumsauswahl")
