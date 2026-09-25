---
title: Zeitbericht - Zusammenfassung der Arbeitszeit
description: Erstellen Sie in time cockpit Zeitberichte mit Arbeitszeiten, Pausen, Homeoffice-Tagen, Überstunden und Zusammenfassungen für bestimmte Zeiträume.
en_page: doc/employee-time-tracking/time-report.md
---
# Zeitberichte

Die Funktion **Zeitbericht** in time cockpit liefert eine detaillierte Zusammenfassung arbeitszeitbezogener Informationen für einen bestimmten Benutzer in einem festgelegten Arbeitszeitraum. Mit diesem umfassenden Bericht können Sie Arbeitszeiten, Pausen und weitere wichtige Details nachverfolgen und auswerten.

Sie finden den Bericht unter **BENUTZER --> ARBEITSZEIT --> Zeitbericht**

![Menü Zeitbericht](/doc/employee-time-tracking/images/time-report-menu.png "Menü Zeitbericht")

## Die wichtigsten Elemente des Berichts

![Zeitbericht](/doc/employee-time-tracking/images/time-report.png "Zeitbericht")

1. **Benutzerinformationen:** Der Bericht beginnt mit dem Namen des Benutzers, sodass Sie leicht erkennen, auf wen sich der Bericht bezieht.

2. **Datum:** Jede Zeile steht für ein bestimmtes Datum innerhalb des Arbeitszeitraums.

3. **Arbeitszeit:** Zeigt die Arbeitszeit des Benutzers am jeweiligen Datum einschließlich Beginn- und Endzeit.

4. **Pausen:** Die Summe aller Pausen während der Arbeitszeit, also die gesamte nicht gebuchte Zeit.

4. **Pausenzeit:** Der Bericht listet die Pausen des Tages auf, einschließlich der gesamten Pausenzeit an diesem Datum.

5. **Homeoffice:** Manche Benutzer arbeiten von zu Hause. Dieses Feld zeigt, ob der Benutzer an einem bestimmten Datum im Homeoffice gearbeitet hat. Der Bericht berechnet die Homeoffice-Tage immer ab Jahresbeginn. Zusätzlich zeigt er die Anzahl der Homeoffice-Tage im gewählten Zeitraum.

6. **Anmerkungen:** Enthält zusätzliche Kommentare oder Notizen zur Arbeit oder zu besonderen Umständen wie Urlaub, Zeitausgleich oder Krankenstand. Informationen zu den eigentlichen Zeitbuchungen enthält es nicht.

7. **Zusammenfassung:** Gegen Ende des Berichts zeigt ein Zusammenfassungsbereich die wichtigsten Informationen für den gesamten Berichtszeitraum. Dazu gehören die gesamte Arbeitszeit, die Anzahl der Arbeitstage und gegebenenfalls die Überstunden.

8. **Spalte Überstunden:** Der Bericht informiert Sie über
* den Überstundensaldo zu Beginn des Zeitraums
* die Sollstunden des Benutzers
* die tatsächliche Arbeitszeit des Benutzers
* die Überstunden im gewählten Zeitraum
* die inkludierte Überstundenpauschale pro Monat
* die tatsächlichen Überstunden, die über die inkludierte Überstundenpauschale hinausgehen

9. **Spalte Urlaub:** Hat der Benutzer im Berichtszeitraum Urlaub genommen, gibt dieser Bereich einen Überblick über verbleibende und genommene Urlaubstage.

9. **Spalte Homeoffice:** Dieser Bereich zeigt, ob der Benutzer im laufenden Jahr oder im gewählten Zeitraum Homeoffice-Tage hat.

10. **Unterschrift:** Dieser Bereich ist für eine digitale Unterschrift oder Bestätigung vorgesehen.

> [!NOTE]
> Wie immer können Sie mit SSRS eigene [Berichte](~/doc/berichte/benutzerdefinierte-berichte.md) erstellen oder uns unter support@timecockpit.com kontaktieren, damit wir Ihren individuellen Bericht für Sie erstellen.

### Anwendungsfälle

- **Mitarbeiterzeiten nachverfolgen:** Personalabteilung und Management können mit diesem Bericht die täglichen Arbeitszeiten eines Mitarbeiters verfolgen und so die Einhaltung von Arbeitszeitplänen und Vorschriften sicherstellen.

- **Überstunden überwachen:** Der Bericht hilft, die vom Mitarbeiter im angegebenen Zeitraum geleisteten Überstunden zu erkennen.

- **Urlaubsverwaltung:** Er vereinfacht die Nachverfolgung von Urlaubstagen und verbleibendem Urlaubsanspruch für Lohnverrechnung und Planung.

## Zeitberichte für mehrere Benutzer herunterladen [Beta]

>[!NOTE]
> Derzeit ist diese Funktion darauf ausgelegt, pro Ausführung Berichte für bis zu 20 Mitarbeiter pro Monat zu erstellen. Diese Einschränkung ergibt sich aus der SSRS-Bibliothek, die keine parallele Ausführung unterstützt. Wir arbeiten aktiv an dieser Herausforderung und werden sie in einer künftigen Version lösen.

Benutzer können Zeitberichte für einen bestimmten Zeitraum bequem im PDF- oder Excel-Format erstellen. Diese Funktion ist besonders nützlich, wenn Sie Zeitberichte für mehrere Personen erstellen müssen, vor allem am Monatsende.

<div class="tc-video" data-vimeo="869442493" data-title="Zeitberichte drucken" data-poster="/images/video-posters/869442493.jpg" style="--bs-aspect-ratio: 56.25%"></div>

### Funktion aufrufen
1. Öffnen Sie in time cockpit die Benutzerliste.
2. Wählen Sie die Benutzer aus, für die Sie Zeitberichte erstellen möchten.
3. Klicken Sie auf das Menü „Aktionen“.

### Zeitberichte erstellen
1. Wählen Sie im Menü „Aktionen“ die Option „Print Time Reports“.
2. Es öffnet sich ein Dialog, in dem Sie die Berichtserstellung konfigurieren.

### Zeitberichte konfigurieren
1. Im Dialog legen Sie den gewünschten Zeitraum fest, für den die Berichte erstellt werden sollen.
2. Wählen Sie das Dateiformat, PDF oder Excel.

### Berichte erstellen
1. Nachdem Sie die Parameter konfiguriert haben, führen Sie die Aktion aus.
2. time cockpit startet die Berichtserstellung für jeden ausgewählten Benutzer.
3. Die erstellten Berichte werden in ein ZIP-Archiv gepackt.
4. Laden Sie die Berichte herunter.
