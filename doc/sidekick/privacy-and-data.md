---
title: sidekick Privacy and Data - What Is Recorded
description: What time cockpit sidekick records and never records, where the data is stored, how the calendar reads it and how to delete it.
---
# sidekick Privacy and Data

> [!WARNING]
> Early preview: time cockpit sidekick is in an early preview. Features, labels and setup steps can change without notice. sidekick runs on Windows 10/11; the macOS version is still being tested. Feedback: [support@timecockpit.com](mailto:support@timecockpit.com)

time cockpit sidekick records work signals on your computer and keeps them there. This page states exactly what is recorded, what is never recorded, where the data is stored, who can read it, and where the protection ends.

## What sidekick Records

From the moment it is installed, sidekick records every source in this list except changed files, which are off by default. SSH logins are recorded only for remote machines you add. See [Controlling What Is Recorded](#controlling-what-is-recorded) to switch sources off.

- When the computer was on, when you were using it (from the time between your inputs) and when it was locked.
- Which application was in the foreground, for how long, and its window title.
- Which files changed in the folders you choose (off by default; nothing is watched until you switch it on and choose folders).
- Time and message of Git commits and branch switches in the repositories in `%USERPROFILE%\source\repos`, if that folder exists, and in the folders you add under **Folders with repositories**.
- When and in which project you worked with Claude Code or Codex, the times of your prompts, the token usage, and a name for each session (see below).
- Which application uses the microphone.
- The names of the connected Wi-Fi network and of the networks in reach, with their signal strength.
- Interactive SSH logins on Linux machines you add as remote machines.

Window titles, file paths and commit messages can say a lot about your work. That is why exclusions, the pause and the deletion described below exist.

## What sidekick Never Records

- Keystrokes. Your activity is derived from the time between your inputs, not from what you type.
- File contents.
- Screenshots.
- The clipboard.
- Terminal commands.
- Browser URLs.
- Any audio. The microphone signal only says which application had the microphone open. sidekick opens no audio stream.
- The BSSID, MAC address or any other hardware address of a Wi-Fi network. Only network names are recorded.
- The text of your prompts to Claude Code and Codex. The only exception is the session name: sidekick uses the title Claude Code writes for a session, and when there is none (always for Codex), the first 80 characters of the first prompt.

## Where the Data Is Stored

sidekick stores its data in `%APPDATA%\timecockpit-sidekick` (on macOS in `~/Library/Application Support/timecockpit-sidekick`). **Open data folder** in the menu of the tray icon opens this folder.

- `signals.sqlite` holds the signals. It is an unencrypted SQLite database in your Windows profile.
- `tokens.json` holds only a hash of each pairing token, never the token itself.
- `backups` holds a verified copy of the database from each day. The seven newest copies are kept.
- `config.json` holds the settings.
- `tracker.log` is a log file. It contains no window titles and no paths.

Signals older than 90 days are deleted every night. You can change the period in sidekick under **Settings**, area **Retention and start**, setting **Keep signals (days)**.

## What Leaves Your Computer

- sidekick uploads no signals and sends no telemetry.
- The only request sidekick makes on its own is the update check: one minute after the start and then every four hours, it reads the update feed at `https://www.timecockpit.com/download/sidekick/` and downloads a newer version from there. The request carries no data from sidekick; the server sees the address the request comes from, as with any download.
- If you add remote machines, sidekick connects to them over SSH to read their signals. The data stays in the local database.

## How the Calendar Reads the Signals

- sidekick answers only on `127.0.0.1`. Other computers in the network cannot reach it.
- Every time cockpit address, for example `https://web.timecockpit.com`, needs its own token. A token that was created for another address is refused.
- The calendar requests the signals directly from your browser. The signals go from sidekick directly to your browser.
- Besides reading, the calendar writes only two things back to sidekick: the meetings you ignore and the signals you exclude as evidence for the proposal. Neither changes a signal.
- The tab **Pairing** in sidekick shows an access log of the latest requests, and **Revoke** removes the access of a paired calendar.
- To stop every calendar from reading, clear **Paired calendars may read** under **Settings** in the area **Connection to the calendar**.

## Controlling What Is Recorded

In sidekick under **Settings**:

- Every source except presence can be switched off: **Windows**, **Files**, **Microphone**, **Wi-Fi**, **Claude Code**, **Codex** and **Git**.
- **Record window titles** in the area **Windows** keeps the application names and times but drops all window titles.
- **Exclusions** in the area **Windows** apply to single applications or windows. **Time only, without title** keeps the time but drops the window title. **Do not record** records nothing at all; the time disappears from the day. Exclusions are applied before anything is stored.
- By default, password managers and private browser windows are recorded without their titles, and the window of sidekick itself is not recorded. The calendar shows windows without titles as **redacted**.
- **Watch file changes** in the area **Files** is off by default, and without folders nothing is watched. sidekick records which files change, never their content.

To pause the recording, use **Pause** in the menu of the tray icon (**15 min**, **1 h** or **until resumed**). While paused, sidekick still records whether the computer was on and whether it was locked, so the pause shows up as a gap in your activity.

## Deleting Data

In sidekick, open the tab **Data**. In the area **Delete data**:

- **Delete today…** deletes the signals of today.
- **Delete period…** deletes the signals between two days.
- **Delete everything…** deletes all signals.

sidekick shows how many rows will be deleted before it deletes them. The backups that contain a deleted day are deleted as well, and deleted rows are overwritten in the database file. After **Delete everything…**, sidekick does not import the existing Claude Code, Codex and Git history again.

Uninstalling sidekick does not delete the data folder.

## What sidekick Does Not Protect Against

- Anyone with access to your Windows account. The database is an unencrypted file in your profile.
- Other programs that run under your Windows account. They can read the database and the token file directly, or read window titles the same way sidekick does.
- Malicious or compromised code in the time cockpit web application itself. A paired calendar can read your signals.

## Wi-Fi Names on Windows 11 24H2 and Later

Windows 11 24H2 and later give Wi-Fi names to desktop apps only with location access. Without it, sidekick records no Wi-Fi names and reports an error for the Wi-Fi source. To allow it, open the Windows settings, go to **Privacy & security** > **Location**, and turn on **Location services** and **Let desktop apps access your location**.

sidekick does not read your location. Windows only requires this setting before it hands out network names.
