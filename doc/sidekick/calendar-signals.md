---
title: sidekick Signals in the Time Sheet Calendar
description: How the Time Sheet Calendar shows time cockpit sidekick signals - activity band, detail lanes, keywords and booking proposals.
---
# sidekick Signals in the Time Sheet Calendar

> [!WARNING]
> Early preview: time cockpit sidekick is in an early preview. Features, labels and setup steps can change without notice. sidekick runs on Windows 10/11; the macOS version is still being tested. Feedback: [support@timecockpit.com](mailto:support@timecockpit.com)

Once time cockpit sidekick is [paired with the calendar](installation-and-pairing.md), the [Time Sheet Calendar](~/doc/timesheet-calendar/calendar.md) shows its signals next to your bookings. This page describes what you see and how to work with it.

The signals appear only in your own calendar. If you open the calendar of another user, the right pane says **Only in your own calendar**.

## The Activity Band

In every view of the calendar, a narrow band next to each day shows your activity as recorded by sidekick. It distinguishes:

- time in which you were active and which is already booked,
- time in which you were active and which is not booked yet,
- time in which the computer was on without your input.

The unbooked active time is the time you most likely still have to book.

In the week view the calendar shows only this band. For the details of a day, switch to the day view, for example with the button **Day view** at the top of the right pane.

## Detail Lanes in the Day View

In the day view, the calendar draws detail lanes next to your bookings. The head of the lanes groups them under **Presence**, **Work** and **Proposal** and shows a key figure for each lane, for example the covered time or the number of commits.

| Lane | What it shows |
|---|---|
| **Active** | When you were active at the computer. |
| **Microphone** | When an application used the microphone. The tooltip names the application; sidekick never records sound. |
| **Claude** | Claude Code sessions, one column per session, grouped by project, with prompts and token usage. |
| **Codex** | Codex sessions, in the same way as Claude. |
| **Git** | Commits and branch switches. |
| **Files** | File changes per folder. A click on a folder block shows its folder tree in the right pane. |
| **Wi-Fi** | The connected Wi-Fi network. |
| **SSH** | Logins on remote machines. Shown only on days with a login. |
| **Projects** | The projects the signals point to, per quarter hour. |
| **Proposal** | The proposed bookings for the day (see below). |

Hover over a block to see its details in a tooltip. The **Legend** button (palette icon) at the top of the right pane shows the colours of the detail lanes of the day. A project has the same colour in the calendar as in sidekick.

Bookings are created on the calendar grid as usual, never in the lanes.

## The Right Pane

The right pane shows the signals of one day: the day you selected in the week view, otherwise today or the first day of the view. If you select blocks in the lanes, the right pane is narrowed to their time ranges. The pane has two tabs.

### Signals

The tab **Signals** lists the signals by kind, each in its own section:

- **Keywords**: the words that came up in window titles, file paths, commit subjects, session titles and meeting names, as a word cloud.
- **Files**: the folders and files that changed.
- **AI**: your time with Claude Code and Codex, the tokens and an estimated cost based on API list prices. A subscription is billed differently.
- **Applications**: the applications in the foreground, with their durations and window titles.
- **Window titles**: the window titles of the day.
- **Wi-Fi**: the connected networks and the networks in reach.

### Proposal

The tab **Proposal** shows the proposed bookings of the day by pattern: when, what spoke for it, and a **Book** button. **Book** opens the form for a new booking with the project, task and text of the pattern.

The proposal learns from your bookings of the last 30 days and needs an up-to-date version of sidekick. If a signal does not fit a pattern, you can stop counting it as evidence for that pattern; the tab lists such exclusions so you can undo them.

A block of the **Proposal** lane can also be booked with a double-click. If an Office 365 meeting took place while the microphone was in use, the lane proposes it as a block of its own with the subject of the meeting. **Ignore meeting** in the tooltip of such a block stops proposing it; ignored meetings are listed in the tab **Proposal** under **Ignored meetings**, where you can propose them again.

## Marking Times

- Click a keyword, a file, an application or another entry in the right pane to mark in the calendar when it occurred. **Esc** clears the marking.
- Press **/** to search the keywords. The search filters the word cloud and marks in the calendar when the matching words came up. **Esc** clears the search.
- Click a block in a lane to select its time range. **Ctrl** + click adds another block; a click on empty space in the lanes clears the selection.

## Refresh

While today is visible in the calendar, the signals are loaded again every minute. Other days are not reloaded automatically.

## Related Pages

- [Time Sheet Calendar](~/doc/timesheet-calendar/calendar.md)
- [time cockpit sidekick](overview.md)
- [sidekick Privacy and Data](privacy-and-data.md)
