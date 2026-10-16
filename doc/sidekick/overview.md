---
title: Activity Tracking with time cockpit sidekick
description: time cockpit sidekick records work signals on your computer and shows them in your own Time Sheet Calendar. Early preview.
---
# time cockpit sidekick

> [!WARNING]
> Early preview: time cockpit sidekick is in an early preview. Features, labels and setup steps can change without notice. sidekick runs on Windows 10/11; the macOS version is still being tested. During the preview, sidekick works only with `https://web-preview.timecockpit.com`. Feedback: [support@timecockpit.com](mailto:support@timecockpit.com)

time cockpit sidekick is a small desktop app that runs in the notification area of Windows or in the macOS menu bar. It records work signals on your computer, for example when you were active, which application was in front and which Git commits you made, and keeps them on that computer. The Time Sheet Calendar of the time cockpit web client reads these signals from sidekick and shows them next to your bookings. You book your time from what actually happened instead of reconstructing the day from memory.

The signals appear only in your own calendar.

## What sidekick Records

From the moment it is installed, sidekick records every source except changed files. It also reads earlier activity once: all Claude Code and Codex sessions that are already on your computer, and the commits of the last 90 days of every Git repository it finds. Every source except presence can be switched off in sidekick under **Settings**.

| Signal | Default | What is recorded |
|---|---|---|
| Presence and activity | Always on | When the computer was on, when you were using it (from the time between your inputs, not from what you type), and when it was locked. |
| Foreground windows | On | Which application was in front, for how long, and its window title. Window titles can be switched off, and exclusion rules record a window without its title or not at all. |
| Changed files | Off | Which files changed in the folders you choose, never their content. Nothing is watched until you switch it on and choose folders. |
| Git | On | Time and message of commits and branch switches. sidekick looks for repositories in `%USERPROFILE%\source\repos`, if that folder exists, and in the folders you add under **Folders with repositories**. No code. |
| Claude Code and Codex sessions | On | When and in which project you worked with Claude Code or Codex, including token usage. Of the text of your prompts, at most the start of the first prompt, as the name of the session. |
| Microphone | On | Which application uses the microphone, never any audio. |
| Wi-Fi | On | The names of the connected Wi-Fi network and of the networks in reach, with their signal strength, never a hardware address. |
| SSH logins | Only for added machines | Interactive SSH logins on Linux machines you add as remote machines in sidekick's settings. |

sidekick can also read Linux machines you work on over SSH, for example a development server: their commits, Claude Code and Codex sessions, file changes and SSH logins. Nothing is installed on that machine; sidekick uses your own OpenSSH configuration and stores no credentials.

What sidekick never records, where the data is stored and how to delete it is described in [sidekick Privacy and Data](privacy-and-data.md).

## Quick Notes

For what leaves no signal, for example a phone call, sidekick takes quick notes: a key combination opens a small window over any application, you type what you just did, and sidekick keeps the note with its time. The calendar shows your notes next to the signals and turns a note that covers a time range into a booking draft. See [Quick Notes with sidekick](notes.md).

## sidekick and the Classic Signal Tracker

sidekick is the successor to the [classic signal tracker](~/doc/signal-tracker/overview.md), which is part of the time cockpit full client. sidekick will replace the classic signal tracker over the coming months.

The main differences:

- sidekick is a separate app. You do not need the full client.
- sidekick keeps its signals on your computer. The calendar reads them directly from sidekick and processes them only in your browser; they are not sent to the time cockpit server.

The calendar shows signals from only one source at a time. In the calendar settings under **Signals** you choose either **Do not show signals**, **Show signals of the classic time cockpit signal tracker** or **Show signals of time cockpit sidekick**.

## Requirements

- Windows 10 or 11 (x64), or macOS on Apple silicon or Intel. The macOS version is still being tested and has some limitations; see [Install on macOS](installation-and-pairing.md#install-on-macos).
- On Windows, no administrator rights: sidekick installs for your Windows user only.
- The time cockpit web client in the preview environment (`https://web-preview.timecockpit.com`), opened in a browser on the same computer on which sidekick runs. The calendar reaches sidekick at `127.0.0.1`, which is only reachable from that computer.

## Next Steps

- [Installing and Pairing sidekick](installation-and-pairing.md): download, installation and connection to the calendar.
- [sidekick Signals in the Time Sheet Calendar](calendar-signals.md): the activity band, the detail lanes and the right pane.
- [Quick Notes with sidekick](notes.md): writing down what you just did and booking it from the calendar.
- [sidekick Privacy and Data](privacy-and-data.md): what is recorded, what is never recorded, storage and deletion.
