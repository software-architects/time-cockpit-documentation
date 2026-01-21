---
title: User Notes Signal Tracker - Quick Notes
description: Capture lightweight notes about your work in time cockpit. Use keyboard shortcuts or automatic prompts after breaks.
---
# Signal Tracker for Notes	

The signal tracker for user notes allows you to capture small notes about your work. Notes are more lightweight than time sheet entries so you interrupt your workflow less when capturing a note.

## Collected Data

The signal tracker for user notes does not track data without user input. You can hit a keyboard shortcut to enter a note. Additionally the signal tracker is able to determine breaks (see also [Signal Tracker for user activity](user-activity.md)) and ask you for a note when you continue with your work. This may for example happen when you return from a meeting to your PC.

If you exit or pause the signal tracker the keyboard shortcut to enter notes is not available and time cockpit will not ask you for notes after a break.

## Configuration Parameters for the Signal Tracker

Parameter Name | Data Type | Description
--- | --- | ---
Ask for notes after breaks (`ReminderNotification`) | Boolean (true / false) | Specifies if time cockpit should ask for a note after a break.
Timespan for inactivity for breaks (`ReminderTimeout`) | Timespan | Specifies the minimum length of a break before time cockpits asks for a note. This parameter is only relevant if ReminderNotification is active (`true`).
Keyboard shortcut (`Shortcut`) | Text | Keyboard shortcut that allows you to enter a note (e.g. `Ctrl+Shift+N`).
Entity for notes (`EntityType`) | Text | Name of the entity that is used to store notes. At the moment this parameters has to be set to `UserNoteSignal`.
Name of the form (`Form`) | Text | Name of the form that is used to enter a note. The default form for notes is the `UserNoteForm`.