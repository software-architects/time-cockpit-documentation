---
title: Quick Notes with time cockpit sidekick
description: Write down what you just did in a quick note with time cockpit sidekick and book it later from the Time Sheet Calendar. Early preview.
---
# Quick Notes with sidekick

> [!WARNING]
> Early preview: time cockpit sidekick is in an early preview. Features, labels and setup steps can change without notice. sidekick runs on Windows 10/11; the macOS version is still being tested. During the preview, sidekick works only with `https://web-preview.timecockpit.com`. Feedback: [support@timecockpit.com](mailto:support@timecockpit.com)

Signals show when you worked and with which applications, but not always what the work was. A phone call, a conversation at the desk or a quick fix leaves few traces. With a quick note you write it down in a few words at the end of the activity, without leaving the application you are in. sidekick keeps the note with its time, and the [Time Sheet Calendar](~/doc/timesheet-calendar/calendar.md) shows it next to the signals, so you can book it later with its text.

## Open the Note Window

- Press the key combination for a new note: **Ctrl+Alt+N** on Windows, **⌘⌥N** on macOS. You can change or switch off the combination in the settings (see [Key Combination](#key-combination)).
- Or choose **Note…** in the menu of the tray icon.

The window **Note** opens over any application, on the screen with the mouse pointer, and the cursor is in the text field. Type what you just did and press **Enter**.

## The Note Window

| Field | What it does |
|---|---|
| Text field | What you did, in a few words. **Shift+Enter** starts a new line. |
| **Point in time** | When the note applies. It starts with the current time (hint **now**) and can be changed. |
| **Closes** | Whether the note covers a time range. **None** is preselected; see below. |
| **Workspace** | Which of today's workspaces or meetings the note belongs to. |

**Enter** or **Save** saves the note, and sidekick confirms it with a silent notification **Note saved**. **Esc** discards the note. If you close the window with its close button instead, the text is kept for the next time you open it.

### A Note with a Begin

With **None** selected under **Closes**, you can enter an optional **Begin**. The note then covers the time from the begin to its point in time; without a begin, it marks a single point in time. The chips next to the begin set it with one click:

- "since 10:12 · back at the desk": the end of your last break of at least 15 minutes today, with its time.
- **−15 min**, **−30 min** and **−1 h**: that long before the point in time.

For example, when you hang up after a call, open the note window, type "Call with the customer about the offer" and choose **−30 min**.

### Close an Earlier Note

Below **None**, **Closes** lists today's notes that have no end yet, at most five, the newest first. Choose one to end it at the point in time of the new note. The new note itself is then a single point in time.

For example, write "Workshop preparation" when you start, and when you are done, write the next note and choose "Workshop preparation" under **Closes**.

### Workspace

**Workspace** shows today's workspaces and meetings as chips, in the same colours as in the day view of sidekick. The one that was in front during the last quarter hour is preselected. Choose another chip, or **None** for a note without a workspace. The calendar draws the note in the colour of its workspace.

## Edit and Delete Notes

Notes are edited and deleted only in sidekick. Open the tab **Day view**:

- On a day with notes, the track **Notes** right of **Active** shows a sheet symbol for each note at its time, in the colour of its workspace. A note with an end has a thin bar down to its end. The tooltip shows the text.
- The right pane starts with the section **Notes**: the notes of the day, or of the selected range. The search of the pane finds notes as well.
- **Edit** opens a small form in the row with the text, **Begin**, **End (optional)** and **Context**. **Ctrl+Enter** or **Save** saves the changes, **Esc** or **Cancel** discards them.
- **Delete** asks **Delete this note?** in the row. Confirm with **Delete**, or keep the note with **Cancel**.

## Key Combination

In sidekick, open **Settings** and, in the group **For all machines**, the area **Notes**.

- Click into the field **Key combination for a new note** and press the keys you want. A combination needs **Ctrl** (**⌘** on macOS), **Alt** or **Win** and exactly one other key.
- **Off** switches the key combination off. **Default** restores **Ctrl+Alt+N** (**⌘⌥N** on macOS).
- The change takes effect when you save the settings.

While sidekick runs, no other application gets this key combination. If another application already uses it, the area says so; choose another combination. **Note…** in the menu of the tray icon keeps working either way.

## Notes in the Time Sheet Calendar

The calendar reads your notes from sidekick together with the signals:

- In the day view, the lane **Notes** shows each note at its time. Its tooltip shows the text, copies it and books the note with its text. See [Notes](calendar-signals.md#notes).
- In the week view, a small tab at the left edge of the bookings of a day marks each note. A click on the tab books the note.
- A note that covers a time range, because it has a begin or was closed by a later note, becomes a draft in the bookings over that range, as long as nothing is booked there yet. A double-click books it with the note's text. See [Drafts from Notes](calendar-signals.md#drafts-from-notes).

The calendar never changes or deletes a note.

## Privacy and Deletion

Notes stay on your computer, in the same database as the signals, and are included in the daily backups. sidekick never uploads them, and the calendar reads them in the same way as the signals: only from the browser on the same computer, and only for paired calendars.

Unlike signals, notes are not deleted after the retention period; they stay until you delete them. **Delete data** in the tab **Data** keeps your notes unless you select **Delete notes as well**. See [sidekick Privacy and Data](privacy-and-data.md#deleting-data).

## Related Pages

- [time cockpit sidekick](overview.md)
- [sidekick Signals in the Time Sheet Calendar](calendar-signals.md)
- [sidekick Privacy and Data](privacy-and-data.md)
