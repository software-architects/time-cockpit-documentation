---
title: Install and Pair time cockpit sidekick
description: Download and install time cockpit sidekick on Windows or macOS, pair it with the Time Sheet Calendar and solve connection problems.
---
# Installing and Pairing sidekick

> [!WARNING]
> Early preview: time cockpit sidekick is in an early preview. Features, labels and setup steps can change without notice. sidekick runs on Windows 10/11; the macOS version is still being tested. During the preview, sidekick works only with `https://web-preview.timecockpit.com`. Feedback: [support@timecockpit.com](mailto:support@timecockpit.com)

Setting up time cockpit sidekick takes three steps: install sidekick, create a token in sidekick, and enter the address and the token in the settings of the Time Sheet Calendar.

## Install sidekick

sidekick runs on Windows 10 and 11 (x64) and on macOS (Apple silicon and Intel). The macOS version is still being tested; see [Install on macOS](#install-on-macos) for its limitations.

<p class="tc-download"><a class="btn btn-primary btn-lg" href="https://www.timecockpit.com/download/sidekick/TimeCockpit.Sidekick-win-Setup.exe"><i class="bi bi-windows" aria-hidden="true"></i>Download for Windows</a><span class="tc-download-group"><a class="btn btn-outline-primary btn-lg" href="https://www.timecockpit.com/download/sidekick/timecockpit-sidekick-mac-arm64.dmg"><i class="bi bi-apple" aria-hidden="true"></i>macOS (Apple silicon)</a><a class="btn btn-outline-primary btn-lg" href="https://www.timecockpit.com/download/sidekick/timecockpit-sidekick-mac-x64.dmg"><i class="bi bi-apple" aria-hidden="true"></i>macOS (Intel)</a></span></p>

### Install on Windows

1. Download the installer [TimeCockpit.Sidekick-win-Setup.exe](https://www.timecockpit.com/download/sidekick/TimeCockpit.Sidekick-win-Setup.exe). The calendar settings link to the same file (**Download sidekick**).
2. Run the installer. It installs sidekick for your Windows user only, needs no administrator rights and asks no questions. The program goes to `%LOCALAPPDATA%\TimeCockpit.Sidekick`, and a Start menu entry is added.
3. Windows SmartScreen may warn about the installer, because sidekick is a new program. The installer is signed. To continue, click **More info** and then **Run anyway**.
4. After the installation sidekick starts, switches on its autostart and opens its window. Its icon, the time cockpit logo, appears in the notification area of the taskbar (possibly hidden under the arrow). A banner at the top of the window asks whether sidekick may send usage data; nothing is sent until you agree (see [Usage Data](privacy-and-data.md#usage-data)).

Closing the window does not stop sidekick; it keeps recording in the background. To open the window again, double-click the icon or choose **Open sidekick…** in its menu.

### Install on macOS

> [!NOTE]
> The macOS version is still being tested. Unlike the Windows version, it is not signed and does not update itself.

1. Download the disk image for your Mac: [Apple silicon](https://www.timecockpit.com/download/sidekick/timecockpit-sidekick-mac-arm64.dmg) (M1 and later) or [Intel](https://www.timecockpit.com/download/sidekick/timecockpit-sidekick-mac-x64.dmg). **About This Mac** in the Apple menu shows which chip your Mac has.
2. Open the downloaded `.dmg` file and drag **time cockpit sidekick** into the **Applications** folder.
3. Start sidekick from the **Applications** folder. Because the app is not signed, macOS blocks the first start. Open **System Settings** > **Privacy & Security**, click **Open Anyway** next to the message about time cockpit sidekick, and confirm with **Open**. On older macOS versions you can instead Control-click the app and choose **Open**.
4. sidekick runs in the menu bar, not in the Dock. Click its icon in the menu bar to open its menu.
5. To record window titles, allow screen recording for sidekick in **System Settings** > **Privacy & Security** > **Screen Recording**, then quit sidekick and start it again. Without this permission sidekick records which application was in front, but no window titles. sidekick does not take screenshots.

Limitations of the macOS version:

- No automatic updates. To update, download the disk image again and replace the app in the **Applications** folder.
- The autostart may not work reliably for the unsigned app. If sidekick is not running after you sign in, start it from the **Applications** folder.
- macOS does not say which application uses the microphone. sidekick records that the microphone was in use and names the meeting application whose window was in front at the time, if there was one.
- Since macOS 14.4, Wi-Fi names are only available to apps with location access. Without it, sidekick records no Wi-Fi names.
- The data is stored in `~/Library/Application Support/timecockpit-sidekick`.

### Autostart and Updates

- The autostart is the setting **Start with the operating system** in sidekick under **Settings** in the area **Retention and start**.
- On Windows, sidekick updates itself. It checks for a new version one minute after the start and then every four hours, and downloads a new version in the background. The menu of the tray icon then offers **Install update … and restart**; otherwise the update is installed at the next start. The area **Version and updates** in the settings shows the current state.

## Pair sidekick With the Calendar

> [!WARNING]
> During the preview, sidekick can be paired only with the preview environment of time cockpit, `https://web-preview.timecockpit.com`. Pairing with `https://web.timecockpit.com` is not possible yet. Open the Time Sheet Calendar at `https://web-preview.timecockpit.com` and pair that address. The environments are described in the [Release Plan](~/doc/getting-started/web-client.md#release-plan).

The calendar may read the signals only with a token that sidekick created for the address of your time cockpit, during the preview `https://web-preview.timecockpit.com`.

### In sidekick: Create a Token

1. Open sidekick and go to the tab **Pairing**.
2. Under **Paired calendars**, click **+ Pair a calendar**. As long as no calendar is paired, the form **Pair a new calendar** is already open.
3. Under **Where does it run?**, choose the address at which you open time cockpit in the browser. During the preview this is `https://web-preview.timecockpit.com`. The list contains the addresses of time cockpit. To pair another address, choose the last entry of the list and paste the address from the address bar of your browser. sidekick keeps only the origin, that is scheme, host name and port, and drops the path. You can enter a name under **Label (optional)**.
4. Click **Create token**. A token is valid only for this address. It does not expire; it stays valid until you revoke the calendar. sidekick shows it only once, for ten minutes at most.
5. Copy **Address of sidekick** (usually `http://127.0.0.1:41337`) and **Token** with the **Copy** buttons. After ten minutes at the latest the token disappears from the window and cannot be shown again, so enter it in the calendar right away.

sidekick stores only a hash of the token, never the token itself. If you lose the token, create a new one.

### In the Calendar: Enter Address and Token

1. Open the Time Sheet Calendar in the time cockpit web client at `https://web-preview.timecockpit.com`, in a browser on the same computer.
2. Open the gear **Settings**.
3. Under **Signals**, choose **Show signals of time cockpit sidekick**.
4. Paste the address into **Address of sidekick** and the token into **Token**.
5. Click **Test connection**. If the calendar reaches sidekick, it shows **Connected to** followed by the name of the device.
6. Click **Save**.

Your browser may ask whether the time cockpit page may access devices in your local network. Allow it; otherwise the browser blocks the connection to sidekick.

The calendar shows signals from only one source at a time. If you choose sidekick, the signals of the [classic signal tracker](~/doc/signal-tracker/overview.md) are no longer shown.

## Connection Status in the Calendar

At the top right of the right pane of the calendar, a status shows whether the calendar reaches sidekick. If it does not, the right pane explains why.

| Status | What the calendar says | What to do |
|---|---|---|
| **sidekick connected** | — | Nothing. The calendar reads the signals. |
| **Connecting to sidekick …** | — | Wait a moment. |
| **sidekick not running** | Start time cockpit sidekick on this computer. The calendar connects on its own once it runs. | Start sidekick, for example from the Start menu. |
| **Token does not match sidekick** | The token in the calendar settings is missing or does not match sidekick. Enter the token from sidekick and test the connection. | Create a new token in sidekick, enter it in the calendar settings and click **Test connection**. |
| **Token belongs to another address** | The token was paired for another address. Pair this address in sidekick and enter the new token in the calendar settings. | In sidekick, choose the address at which you opened time cockpit, create a token and enter it in the calendar. |
| **Browser blocks sidekick** | sidekick runs, but the browser does not let this page reach it. Allow the page to access the local network, or pair this address in sidekick. | Allow the browser's local network access for the time cockpit page. If that does not help, pair exactly the address of this page in sidekick (see below). |

sidekick answers only addresses that are in its list of addresses. For any other address it does not give the browser permission to read the answer (CORS), so the browser blocks it, just as it does when local network access is denied. That is why pairing the address can fix **Browser blocks sidekick**. If the address is in the list but the token was created for another address, the calendar shows **Token belongs to another address** instead.

The calendar retries **sidekick not running** and **Browser blocks sidekick** on its own, at first after 15 seconds and then less often, up to every five minutes. After a token problem it does not retry; enter the new token in the settings and click **Test connection**.

If sidekick cannot use its default port 41337 because another program uses it, it takes the next free port. The menu of the tray icon shows the port (**Connection to the calendar: on (port …)**), and the tab **Pairing** shows the current **Address of sidekick**. Enter the new address in the calendar settings.

## The Tray Icon Menu

Right-click the sidekick icon in the notification area to open its menu. On macOS, click the sidekick icon in the menu bar.

- The first line shows the state: **Recording**, **Paused until …** or **Error: …**.
- **Connection to the calendar: on (port …)** shows whether the calendar can read the signals and on which port.
- **Open sidekick…** opens the window.
- **Note…** opens the window for a [quick note](notes.md).
- **Pause** pauses the recording for **15 min**, **1 h** or **until resumed**. While sidekick is paused, **Resume** ends the pause.
- **Install update … and restart** appears when an update is ready.
- **Open data folder** opens the folder in which sidekick stores its data.
- **Quit** ends sidekick. Nothing is recorded until it runs again.

While recording is paused, sidekick still records whether the computer was on and whether it was locked. That is why a pause shows up as a gap in your activity instead of a gap in the day.

## Revoke a Paired Calendar

In sidekick, open the tab **Pairing**. Under **Paired calendars**, click **Revoke** next to the calendar. The calendar can then no longer read anything.

To stop every calendar from reading, open **Settings** in sidekick and clear **Paired calendars may read** in the area **Connection to the calendar**.

## Uninstall sidekick

Uninstall time cockpit sidekick in the Windows settings under **Apps**. The uninstaller stops a running sidekick and removes the program and the autostart entry. On macOS, quit sidekick and move the app from the **Applications** folder to the Trash.

Your recorded data stays in `%APPDATA%\timecockpit-sidekick` (on macOS in `~/Library/Application Support/timecockpit-sidekick`). To remove it as well, delete it in the tab **Data** before uninstalling (see [sidekick Privacy and Data](privacy-and-data.md)), or delete the folder afterwards.
