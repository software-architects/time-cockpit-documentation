---
title: Arbeiten mit Zeitbuchungen
description: Zeitbuchungen im Kalender von time cockpit anlegen, bearbeiten, kopieren, verschieben und löschen, mit Drag & Drop, Tastenkürzeln und Formatierung.
en_page: doc/timesheet-calendar/working-with-timesheet-entries.md
---
# Arbeiten mit Zeitbuchungen

## Anlegen

Sie können Zeitbuchungen auf verschiedene Arten anlegen:

- Doppelklicken Sie an der Stelle im Kalender, an der Ihre Zeitbuchung beginnen soll. Das Formular für die Zeitbuchung wird geöffnet. Als Beginnzeit ist die Zeit vorbelegt, an die Sie geklickt haben.
- Klicken Sie in der Symbolleiste des grafischen Kalenders auf **+ Hinzufügen**.
- Drücken Sie **STRG + I**.
- Doppelklicken Sie auf einen Microsoft Office Outlook-Termin (siehe [Microsoft Office Outlook-Termine](~/doc/zeiterfassungskalender/outlook-termine.md)).
- Kopieren Sie eine bestehende Zeitbuchung.
<!-- - Double-click an area in the signals (see [signals](~/doc/zeiterfassungskalender/signale.md)). -->

Unabhängig vom gewählten Weg erhalten Sie das Formular für eine neue Zeitbuchung. Um die Zeitbuchung zu speichern, klicken Sie auf **Speichern** oder drücken Sie auf der Tastatur **STRG + Enter**.

In der Standardkonfiguration von time cockpit müssen Sie eine Beschreibung eingeben. Zusätzlich stehen Felder wie Ort, Homeoffice, Projekt, Tätigkeit usw. zur Verfügung.

![Formular für Zeitbuchungen](/doc/timesheet-calendar/images/wc-first-timesheet-entry.png "Formular für Zeitbuchungen")

> [!NOTE]
> Wenn die Standardeigenschaften nicht zu Ihrem Unternehmen passen, schreiben Sie uns an support@timecockpit.com. Mit den Anpassungsmöglichkeiten von time cockpit können Sie eigene Eigenschaften, Formulare, Listen usw. hinzufügen, um time cockpit in Ihre Organisationsstruktur und Ihre Prozesse zu integrieren und Ihre Arbeit zu vereinfachen. Einen Überblick über die Anpassungsmöglichkeiten von time cockpit finden Sie unter [Anpassung des Datenmodells](~/doc/datenmodell-anpassung/ueberblick.md)


## Ändern

Sie können Zeitbuchungen auf folgende Arten ändern:

- Doppelklicken Sie auf die Zeitbuchung, die Sie ändern möchten, und ändern Sie Beginn- und Endzeit.
- Wählen Sie eine Zeitbuchung durch Klicken aus und klicken Sie in der Symbolleiste auf **Bearbeiten**.
- Wählen Sie eine Zeitbuchung aus, klicken Sie mit der rechten Maustaste darauf und wählen Sie im Kontextmenü **Bearbeiten**.

Farbe und Text einer Zeitbuchung im Kalender hängen von Ihrem gewählten Formatprofil ab. Wie Sie die Darstellung Ihrer Zeitbuchungen konfigurieren, lesen Sie unter [Formatprofile](~/doc/zeiterfassungskalender/formatprofil.md).

Im Formular der Zeitbuchung können Sie alle Details einer Zeitbuchung ändern. Beginn- und Endzeit lassen sich auch im Zeiterfassungskalender mit der Maus ändern. Dazu bewegen Sie den Mauszeiger auf den oberen oder unteren Rand der Zeitbuchung, klicken, halten die Maustaste gedrückt und bewegen die Maus.

![Endzeit ändern](/doc/timesheet-calendar/images/wc-drag-end-time.png "Endzeit ändern")

Um eine Zeitbuchung zu verschieben, klicken Sie auf die Zeitbuchung, halten die Maustaste gedrückt und bewegen die Maus.

> [!NOTE]
> In der Wochenansicht können Sie Zeitbuchungen per Drag & Drop von einem Tag auf einen anderen verschieben oder kopieren.

## Kopieren

Sie können Zeitbuchungen mit der Maus nicht nur verschieben, sondern auch kopieren. Gehen Sie genau wie beim Verschieben von Zeitbuchungen vor, halten Sie aber zusätzlich die Taste STRG gedrückt. Neben dem Mauszeiger erscheint ein kleines Pluszeichen (+). Wenn Sie die Maustaste loslassen (STRG weiterhin gedrückt halten), wird die Zeitbuchung an die gewählte Zeit kopiert.

![Zeitbuchung kopieren](/doc/timesheet-calendar/images/copy-drag-drop.png "Zeitbuchung kopieren")

## Löschen

Sie können Zeitbuchungen auf folgende Arten löschen:

- Wählen Sie eine Zeitbuchung durch Klicken aus und drücken Sie die Taste ENTF.
- Wählen Sie eine Zeitbuchung durch Klicken aus und klicken Sie in der Symbolleiste auf **Löschen**.
- Wählen Sie eine Zeitbuchung aus, klicken Sie mit der rechten Maustaste darauf und wählen Sie im Kontextmenü **Löschen**.


## Aktionen im Zeiterfassungskalender

Wenn Sie wiederkehrende Aufgaben im Zeiterfassungskalender erledigen möchten, können Sie in time cockpit Aktionen anlegen. Wie Sie eine neue Aktion erstellen, lesen Sie unter [Aktionen](~/doc/scripting/aktionen.md). Benötigt die Aktion kein Input-Set, ist sie immer verfügbar. Erwartet die Aktion eine oder mehrere Zeitbuchungen als Input-Set, können Sie sie nur aufrufen, wenn Sie im Kalender eine oder mehrere Zeitbuchungen ausgewählt haben.

![Aktionen](/doc/timesheet-calendar/images/wc-action-in-calendar.png "Aktionen")
