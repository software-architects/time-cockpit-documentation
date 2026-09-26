---
title: Signale - Dauer- und Punktsignale im Überblick
description: "So funktionieren Signale im Kalender von time cockpit: Dauersignale, Punktsignale, kombinierte Aktivitäten und ihr Nutzen für genaue Zeiterfassung."
en_page: doc/timesheet-calendar/signals.md
---
# Signale

Im rechten Bereich des Zeiterfassungskalenders sehen Sie die verarbeiteten Signale, die der [Signal Tracker](~/doc/signal-tracker/ueberblick.md) aufgezeichnet hat. Signaldaten helfen Benutzern, sich zu erinnern, womit sie ihre Zeit verbracht haben, und Zeitbuchungen genau anzulegen. time cockpit unterscheidet zwischen **Dauersignalen** und **Punktsignalen**. Dauersignale sind z. B. Applikationen, Fenstertitel oder Benutzeraktivität. Beispiele für Punktsignale sind gesendete E-Mails, eingehende und ausgehende Telefonate oder eine Benutzernotiz.

![Signal-Tracker-Bereich](/doc/timesheet-calendar/images/signal-tracker-pane.png "Signal-Tracker-Bereich")

time cockpit zeigt die folgenden Signaltypen direkt im Zeiterfassungskalender an:

- Dauersignale
    - Kombinierte Aktivität
    - Computer- und Benutzeraktivität
    - Telefonate
- Punktsignale
    - Benutzernotizen
    - Gesendete E-Mails
    - TFS-Work-Item-Änderungen
    - TFS-Changesets

Zusätzlich zu diesen Signalen zeigt time cockpit im Signaldatenbereich weitere Signaltypen an:

- Dauersignale
    - Fenstertitel
    - Applikationen
    - LAN Verbindungen
    - Verfügbare WLANs

Die zusätzlichen Signaltypen und ihre Darstellung sind unter [Signaldetails](~/doc/zeiterfassungskalender/signaldetails.md) ausführlich beschrieben.

## Signale verwenden

Signale werden vom sogenannten [Signal Tracker](~/doc/signal-tracker/ueberblick.md) gesammelt und können von Benutzern nicht geändert werden. Mithilfe der Signaldaten können Sie nachvollziehen, was Sie im Laufe eines Tages getan haben, und daraus genaue Zeitbuchungen anlegen. Wenn Sie auf die Spur der Benutzeraktivität doppelklicken, zeigt time cockpit ein Formular für eine Zeitbuchung an. time cockpit übernimmt dabei automatisch den ausgewählten Zeitraum für die Zeitbuchung. Wenn Sie mit der Maus über ein Punktsignal fahren, zeigt time cockpit zusätzliche Informationen zu diesem Punktsignal an und bietet kontextabhängige Aktionen an.

![Mauszeiger über einem Signal](/doc/timesheet-calendar/images/signal-hovering.png "Mauszeiger über einem Signal")

Dauersignale liefern viele Informationen darüber, was ein Benutzer getan hat und wie lange er damit beschäftigt war. Wie Sie Dauersignale richtig lesen, erfahren Sie unter [Signaldetails](~/doc/zeiterfassungskalender/signaldetails.md).

## Kombinierte Aktivitäten

Die Signalspur für kombinierte Aktivitäten ist der Balken ganz links im Zeiterfassungskalender. Diese Spur ist nicht nur in der Tagesansicht, sondern auch in der Wochen- und Monatsansicht sichtbar. Sie fasst die folgenden Informationen zusammen:

- Aktivität auf einem Ihrer Geräte
- Zeit, die Sie nicht an Ihrem Gerät (z. B. Computer) verbracht haben
- Zeiträume, für die keine Zeitbuchung existiert

Zeiträume, in denen Sie auf einem Ihrer Geräte aktiv waren und für die Sie bereits eine Zeitbuchung angelegt haben, werden **dunkelgrün** (1) dargestellt. Zeiträume der Inaktivität (z. B. wenn Sie eine Pause gemacht haben) werden **hellgrün** (2) dargestellt. Zeiträume, in denen Sie auf einem Ihrer Geräte aktiv waren, für die Sie aber noch keine Zeitbuchung angelegt haben, werden **gelb** (3) dargestellt.

![Signalspuren](/doc/timesheet-calendar/images/visualization-tracks.png "Signalspuren")

> [!NOTE]
> Standardmäßig werden Zeiträume der Inaktivität, die länger als 15 Minuten dauern, als Pausen interpretiert (hellgrün). Den Schwellenwert in Minuten können Sie jedoch im Optionsdialog ändern. Weitere Informationen finden Sie unter [Optionen des Signal Trackers](~/doc/signal-tracker/optionen.md).

Mit der Spur für kombinierte Aktivitäten finden Benutzer schnell Zeiträume, in denen sie auf einem ihrer Geräte gearbeitet, aber noch keine Zeitbuchungen angelegt haben. So hilft Ihnen time cockpit, keine Zeit ungebucht und unverrechnet zu lassen.

![Spur für kombinierte Aktivität](/doc/timesheet-calendar/images/combined-activity-track.png "Spur für kombinierte Aktivität")

## Computer- und Benutzeraktivität

Die Spur für Computer- und Benutzeraktivität (CUA) gibt es für jedes Ihrer Geräte. In der Tagesansicht zeigt time cockpit die CUA nur für die aktuell ausgewählten Geräte an (**grün**). Welche Geräte in der Tagesansicht angezeigt werden, wählen Sie im Signaldatenbereich auf der linken Seite von time cockpit aus. Der folgende Screenshot zeigt time cockpit mit zwei aktiven Geräten im Zeiterfassungskalender. Beide Geräte sind **grün** eingefärbt. Ist ein Gerät in einem bestimmten Zeitraum inaktiv, wird seine grüne Spur in einem helleren Grün dargestellt. Wenn Sie auf mehreren Geräten arbeiten, können Sie so leicht ableiten, wann Sie auf welchem Gerät gearbeitet haben und was Sie auf diesem Gerät getan haben.

![Zwei aktive Geräte](/doc/timesheet-calendar/images/two-active-devices.png "Zwei aktive Geräte")

Die CUA-Spur fasst die folgenden Informationen für Sie zusammen:

- Zeitraum, in dem Ihr Gerät (z. B. Ihr Desktop-PC) eingeschaltet war
- Zeitraum, in dem Sie auf einem bestimmten Gerät aktiv waren
- Zeiträume der Inaktivität (Pausen?) auf einem bestimmten Gerät

## Telefonate

Telefonatsignale werden als gerichtete Pfeile dargestellt. Eingehende Telefonate zeigen nach rechts, ausgehende nach links. Telefonate werden nicht direkt vom Signal Tracker von time cockpit aufgezeichnet, sondern müssen aus einem Mobiltelefon oder einer Telefonielösung importiert werden. Ausführliche Informationen zum Import von Telefonaten finden Sie unter [Signal Tracker für Telefonate](~/doc/signal-tracker/telefonate.md).

> [!NOTE]
> Sie können die Mindestdauer eines Telefonats festlegen. Telefonate, die kürzer als die festgelegte Mindestdauer sind, werden im Zeiterfassungskalender nicht angezeigt. Die Mindestdauer ändern Sie im Optionsdialog Signalverarbeitung (siehe [Optionen des Signal Trackers](~/doc/signal-tracker/optionen.md)).

![Telefonat](/doc/timesheet-calendar/images/phone-call.png "Telefonat")

## Benutzernotizen

Eine Benutzernotiz ist eine Erinnerung, die sich ein Benutzer selbst hinterlassen kann und die im Zeiterfassungskalender angezeigt wird. Üblicherweise erinnert man sich mit Benutzernotizen an Arbeit, die man abseits des Computers erledigt hat, z. B. ungeplante Aufgaben, kurze Besprechungen usw.

## Gesendete E-Mails

time cockpit kann die E-Mails anzeigen, die Sie mit Microsoft Office Outlook gesendet haben. Gesendete E-Mails deuten oft auf zwei Dinge hin. Wenn Sie viele E-Mails hintereinander gesendet haben, haben Sie sehr wahrscheinlich an administrativen Aufgaben gearbeitet. Finden Sie eine gesendete E-Mail am Ende einer zusammenhängenden Tätigkeit (z. B. der Arbeit an einem bestimmten Dokument), bedeutet das oft, dass Sie diese Tätigkeit abgeschlossen und z. B. das Ergebnis an einen Kunden gesendet haben. Wenn Sie mit der Maus über ein Signal einer gesendeten E-Mail fahren, zeigt time cockpit zusätzliche Informationen zur E-Mail an, und Sie können die E-Mail direkt aus dem Zeiterfassungskalender öffnen. Weitere Informationen finden Sie unter [Signal Tracker für E-Mails](~/doc/signal-tracker/gesendete-e-mails.md).

![Gesendete E-Mail](/doc/timesheet-calendar/images/sent-mail.png "Gesendete E-Mail")

## TFS-Changesets

Changeset-Signale stehen für Änderungen an Work Items in Ihrem Microsoft Team Foundation Server. Check-ins sind besonders für Softwareentwickler hilfreich, weil sie meist entweder den Beginn oder das Ende einer Aufgabe markieren, z. B. eines Bugs, Features oder Backlog Items. Mit Beginn- und Endzeit lässt sich leicht ableiten, wie lange man an einer Aufgabe gearbeitet hat. Wenn Sie einen Check-in einer Work-Item-Änderung zuordnen, zeigt time cockpit diese Information im Zeiterfassungskalender an. Weitere Informationen finden Sie unter [Signal Tracker für Team Foundation Server](~/doc/signal-tracker/team-foundation-server.md).

![Work-Item-Änderung](/doc/timesheet-calendar/images/work-item-change.png "Work-Item-Änderung")

## TFS-Check-ins

Wenn der [Signal Tracker für Team Foundation Server](~/doc/signal-tracker/team-foundation-server.md) aktiviert ist, überwacht time cockpit die Check-ins in Ihren Projekten in TFS. Jeder Check-in wird im Zeiterfassungskalender als eigenes Signal angezeigt. Check-ins sind besonders für Softwareentwickler hilfreich, weil sie meist entweder den Beginn oder das Ende der Arbeit an einem Bug, Feature oder Backlog Item markieren. Mit Beginn- und Endzeit lässt sich leicht ableiten, wie lange man an einer Aufgabe gearbeitet hat.

Wenn Sie mit der Maus über ein Check-in-Signal fahren, zeigt time cockpit zusätzliche Informationen zur Änderung an. Zum einen zeigt es den Zeitpunkt des Changesets. Außerdem zeigt es die Changeset-Nummer. Schließlich zeigt es alle Dateien an, die geändert (mit der jeweiligen Operation, z. B. Bearbeiten, Löschen, Mergen …) und eingecheckt wurden.

![Signal einer Work-Item-Änderung](/doc/timesheet-calendar/images/work-item-change-signal.png "Signal einer Work-Item-Änderung")
