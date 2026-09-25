---
title: Signal Tracker für Notizen - Notizen schnell erfassen
description: Halten Sie in time cockpit kurze Notizen zu Ihrer Arbeit fest, per Tastenkombination oder nach einer automatischen Nachfrage nach Pausen.
en_page: doc/signal-tracker/notes.md
---
# Signal Tracker für Notizen	

Mit dem Signal Tracker für Benutzernotizen können Sie kurze Notizen zu Ihrer Arbeit festhalten. Notizen sind schlanker als Zeitbuchungen, sodass Sie Ihren Arbeitsfluss beim Festhalten einer Notiz weniger unterbrechen.

## Gesammelte Daten

Der Signal Tracker für Benutzernotizen zeichnet keine Daten ohne Eingabe des Benutzers auf. Mit einer Tastenkombination können Sie eine Notiz eingeben. Zusätzlich kann der Signal Tracker Pausen erkennen (siehe auch [Signal Tracker für Benutzeraktivität](~/doc/signal-tracker/benutzeraktivitaet.md)) und Sie um eine Notiz bitten, wenn Sie Ihre Arbeit fortsetzen. Das kann z. B. passieren, wenn Sie von einer Besprechung an Ihren PC zurückkehren.

Wenn Sie den Signal Tracker beenden oder pausieren, steht die Tastenkombination zum Eingeben von Notizen nicht zur Verfügung, und time cockpit fragt nach einer Pause nicht nach Notizen.

## Konfigurationsparameter des Signal Trackers

Parametername | Datentyp | Beschreibung
--- | --- | ---
Ask for notes after breaks (`ReminderNotification`) | Boolean (true / false) | Legt fest, ob time cockpit nach einer Pause nach einer Notiz fragen soll.
Timespan for inactivity for breaks (`ReminderTimeout`) | Zeitspanne | Legt die Mindestdauer einer Pause fest, bevor time cockpit nach einer Notiz fragt. Dieser Parameter ist nur relevant, wenn ReminderNotification aktiv ist (`true`).
Keyboard shortcut (`Shortcut`) | Text | Tastenkombination, mit der Sie eine Notiz eingeben können (z. B. `Ctrl+Shift+N`).
Entity for notes (`EntityType`) | Text | Name der Entität, in der Notizen gespeichert werden. Derzeit muss dieser Parameter auf `UserNoteSignal` gesetzt sein.
Name of the form (`Form`) | Text | Name des Formulars, mit dem eine Notiz eingegeben wird. Das Standardformular für Notizen ist `UserNoteForm`.
