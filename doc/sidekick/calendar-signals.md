---
title: sidekick Signals in the Time Sheet Calendar
description: How the Time Sheet Calendar shows time cockpit sidekick signals - activity band, detail lanes, keywords and booking proposals.
---
# sidekick Signals in the Time Sheet Calendar

> [!WARNING]
> Early preview: time cockpit sidekick is in an early preview. Features, labels and setup steps can change without notice. sidekick runs on Windows 10/11; the macOS version is still being tested. During the preview, sidekick works only with `https://web-preview.timecockpit.com`. Feedback: [support@timecockpit.com](mailto:support@timecockpit.com)

Once time cockpit sidekick is [paired with the calendar](installation-and-pairing.md), the [Time Sheet Calendar](~/doc/timesheet-calendar/calendar.md) shows its signals next to your bookings. This page describes what you see and how to work with it.

The signals appear only in your own calendar. If you open the calendar of another user, the right pane says **Only in your own calendar**.

## The Activity Band

In every view of the calendar, a narrow band next to each day shows your activity as recorded by sidekick. It distinguishes:

- time in which you were active and which is already booked,
- time in which you were active and which is not booked yet,
- time in which the computer was on without your input.

The unbooked active time is the time you most likely still have to book.

In the week view the calendar shows only this band. For the details of a day, switch to the day view, for example with the day view button (calendar icon) at the top of the right pane.

## Detail Lanes in the Day View

In the day view, the calendar draws detail lanes next to your bookings. The head of the lanes groups them under **Presence**, **Work** and **Proposal** and shows a key figure for each lane, for example the covered time or the number of commits.

| Lane | What it shows |
|---|---|
| **Active** | When you were active at the computer. |
| **Microphone** | When an application used the microphone. The tooltip names the application; sidekick never records sound. |
| **Claude** | Claude Code sessions, one column per session, grouped by project, with the times of your prompts and the token usage. |
| **Codex** | Codex sessions, in the same way as Claude. |
| **Git** | Commits and branch switches. |
| **Files** | File changes per folder. A click on a folder block shows its folder tree in the right pane. |
| **Wi-Fi** | The connected Wi-Fi network. |
| **SSH** | Logins on remote machines. Shown only on days with a login. |
| **Projects** | For each quarter hour, the booking patterns the signals point to. A booking pattern is a combination you booked before, for example a project and a task. |
| **Proposal** | The proposed bookings for the day (see below). |

Hover over a block to see its details in a tooltip. The **Legend** button (palette icon) at the top of the right pane shows the colours of the detail lanes of the day. Local contexts, for example a Claude Code project, a Git repository or a folder, have the same colour in the calendar as in sidekick. The booking patterns in the lanes **Projects** and **Proposal** are coloured by the calendar.

Bookings are created on the calendar grid as usual, never in the lanes.

## The Right Pane

The right pane shows the signals of one day: the day you selected in the week view, otherwise today or the first day of the view. If you select blocks in the lanes, the right pane is narrowed to their time ranges. The pane has two tabs.

### Signals

The tab **Signals** lists the signals by kind, each in its own section:

- **AI**: your time with Claude Code and Codex, and the time the agents worked alone, per project and session.
- **Window titles**: what was in the foreground. **By title** lists the window titles of the day, **By application** the applications with their durations. Your choice is kept.
- **Files**: the folders and files that changed.
- **Keywords**: the words that came up in window titles, file paths, commit subjects, session titles and meeting names, as a word cloud.
- **Wi-Fi**: the connected networks and the time without Wi-Fi.

Each section shows at first what a booking needs. The sliders icon in the band of a section shows its details, and a second click hides them again:

| Section | Details |
|---|---|
| **AI** | The tokens and an estimated cost based on API list prices, split by token type. A subscription is billed differently. |
| **Window titles** | The application under each title, or the titles under each application. |
| **Files** | The changes by kind (new, changed, deleted) and the individual runs of the bulk changes. |
| **Keywords** | The time after the most frequent words. |
| **Wi-Fi** | When each network was connected, and the networks in reach. |

Hover over a row of the section **AI** to see its time, tokens and cost in a tooltip. **Ctrl** + mouse wheel over a section shows more or fewer rows, in **Files** one level more or less of the folder tree. The number of open levels stays when you reload the page or move to another day.

### Proposal

The tab **Proposal** shows the proposed bookings of the day by pattern: when, what spoke for it, and a **Book** button. **Book** opens the form for a new booking with the project, task and text of the pattern.

The proposal learns from your bookings of the last 30 days and needs an up-to-date version of sidekick. If a signal does not fit a pattern, you can stop counting it as evidence for that pattern; the tab lists such exclusions so you can undo them.

A block of the **Proposal** lane can also be booked with a double-click. If an Office 365 meeting took place while the microphone was in use, the lane proposes it as a block of its own with the subject of the meeting. **Ignore meeting** in the tooltip of such a block stops proposing it; ignored meetings are listed in the tab **Proposal** under **Ignored meetings**, where you can propose them again.

## Marking Times

- Click a keyword, a file, an application or another entry in the right pane to mark in the calendar when it occurred. **Esc** clears the marking.
- Click a block in a lane to select its time range. **Ctrl** + click adds another block; a click on empty space in the lanes clears the selection.

## Searching the Signals

The search button (magnifier icon) at the top of the right pane, or **/**, opens a search field above the sections of the tab **Signals**. Each section then shows only the entries that contain every word you type, in any order and regardless of upper case and accents: window titles and applications, file paths, keywords, Wi-Fi networks, and AI sessions by workspace, title or first prompt. The matching text is highlighted, and a section without a match collapses and says **no matches**. Matching keywords are also marked in the calendar.

Under the field, a ruler of the day shows when the matches occurred, and a button for each section with matches jumps to it.

If you selected blocks in the lanes, the search covers the selection. **Whole day** searches the whole day instead and keeps the selection; the ruler of the selection then shows the matches of the whole day. Both buttons show their number of matches.

**Esc** clears the field; in an empty field it closes the search. The text stays while you move to other days, until the page is reloaded.

## Refresh

While today is visible in the calendar, the signals are loaded again every minute. Other days are not reloaded automatically.

## Related Pages

- [Time Sheet Calendar](~/doc/timesheet-calendar/calendar.md)
- [time cockpit sidekick](overview.md)
- [sidekick Privacy and Data](privacy-and-data.md)
