---
title: Install and Pair time cockpit sidekick
description: Download and install time cockpit sidekick on Windows or macOS, pair it with the Time Sheet Calendar in one click and solve connection problems.
---
# Installing and Pairing sidekick

> [!WARNING]
> Early preview: time cockpit sidekick is in an early preview. Features, labels and setup steps can change without notice. sidekick runs on Windows 10/11; the macOS version is still being tested. During the preview, sidekick works only with `https://web-preview.timecockpit.com`. Feedback: [support@timecockpit.com](mailto:support@timecockpit.com)

Setting up time cockpit sidekick takes three steps: install sidekick, click **Pair with sidekick** in the settings of the Time Sheet Calendar, and confirm the question in sidekick with **Allow**.

## Install sidekick

sidekick runs on Windows 10 and 11 (x64) and on macOS (Apple silicon and Intel). The macOS version is still being tested; see [Install on macOS](#install-on-macos) for its limitations.

<p class="tc-download"><a class="btn btn-primary btn-lg" href="https://www.timecockpit.com/download/sidekick/TimeCockpit.Sidekick-win-Setup.exe"><i class="bi bi-windows" aria-hidden="true"></i>Download for Windows</a><span class="tc-download-group"><a class="btn btn-outline-primary btn-lg" href="https://www.timecockpit.com/download/sidekick/TimeCockpit.Sidekick-osx-arm64-Setup.pkg"><i class="bi bi-apple" aria-hidden="true"></i>macOS (Apple silicon)</a><a class="btn btn-outline-primary btn-lg" href="https://www.timecockpit.com/download/sidekick/TimeCockpit.Sidekick-osx-x64-Setup.pkg"><i class="bi bi-apple" aria-hidden="true"></i>macOS (Intel)</a></span></p>

### Install on Windows

1. Download the installer [TimeCockpit.Sidekick-win-Setup.exe](https://www.timecockpit.com/download/sidekick/TimeCockpit.Sidekick-win-Setup.exe). The calendar settings link to the same file (**Download sidekick**).
2. Run the installer. It installs sidekick for your Windows user only, needs no administrator rights and asks no questions. The program goes to `%LOCALAPPDATA%\TimeCockpit.Sidekick`, and a Start menu entry is added.
3. Windows SmartScreen may warn about the installer, because sidekick is a new program. The installer is signed. To continue, click **More info** and then **Run anyway**.
4. After the installation sidekick starts, switches on its autostart and opens its window. Its icon, the time cockpit logo, appears in the notification area of the taskbar (possibly hidden under the arrow). A banner at the top of the window asks whether sidekick may send usage data; nothing is sent until you agree (see [Usage Data](privacy-and-data.md#usage-data)).

Closing the window does not stop sidekick; it keeps recording in the background. To open the window again, double-click the icon or choose **Open sidekick…** in its menu.

### Install on macOS

> [!NOTE]
> The macOS version is still being tested.

1. Download the installer for your Mac: [Apple silicon](https://www.timecockpit.com/download/sidekick/TimeCockpit.Sidekick-osx-arm64-Setup.pkg) (M1 and later) or [Intel](https://www.timecockpit.com/download/sidekick/TimeCockpit.Sidekick-osx-x64-Setup.pkg). **About This Mac** in the Apple menu shows which chip your Mac has.
2. Open the downloaded `.pkg` file and follow the installer. The installer is signed by software architects and checked by Apple (notarised), so macOS opens it without a warning. It installs **time cockpit sidekick** into the **Applications** folder.
3. Start sidekick from the **Applications** folder if the installer has not started it.
4. sidekick runs in the menu bar, not in the Dock. Click its icon in the menu bar to open its menu.
5. To record window titles, allow screen recording for sidekick in **System Settings** > **Privacy & Security** > **Screen Recording**, then quit sidekick and start it again. Without this permission sidekick records which application was in front, but no window titles. sidekick does not take screenshots.

If you installed sidekick from the earlier disk image (`.dmg`), you can run the installer right away: at its first start the new version stops the old one, and your recorded data stays. If a copy of the earlier version is still on your Mac, sidekick names it in a band at the top of its window; **Move to Trash** removes it, **Later** asks again at the next start. Remove it: it does not update itself and can start at sign-in instead of the new version.

After the switch, macOS asks once more for screen recording and, for Wi-Fi names, for location access, and the autostart may have to be switched on again. If **Ask your AI** asks for your API key again, the keychain did not release the stored key to the new version; enter it once more.

Limitations of the macOS version:

- The autostart is off after the installation. To start sidekick when you sign in, switch on **Start with the operating system** (see [Autostart and Updates](#autostart-and-updates)).
- macOS does not say which application uses the microphone. sidekick records that the microphone was in use and names the meeting application whose window was in front at the time, if there was one.
- Since macOS 14.4, Wi-Fi names are only available to apps with location access. Without it, sidekick records no Wi-Fi names.
- The data is stored in `~/Library/Application Support/timecockpit-sidekick`.

### Autostart and Updates

- The autostart is the setting **Start with the operating system** in sidekick under **Settings** in the area **Retention and start**.
- sidekick updates itself on Windows and macOS. It checks for a new version one minute after the start and then every four hours, and downloads a new version in the background. The menu of the sidekick icon (in the notification area on Windows, in the menu bar on macOS) then offers **Install update … and restart**; otherwise the update is installed at the next start. The area **Version and updates** in the settings shows the current state.

## Pair sidekick With the Calendar

> [!WARNING]
> During the preview, sidekick can be paired only with the preview environment of time cockpit, `https://web-preview.timecockpit.com`. Pairing with `https://web.timecockpit.com` is not possible yet. Open the Time Sheet Calendar at `https://web-preview.timecockpit.com` and pair that address. The environments are described in the [Release Plan](~/doc/getting-started/web-client.md#release-plan).

The calendar may read the signals only with a token that sidekick created for the address of your time cockpit, during the preview `https://web-preview.timecockpit.com`. You do not have to create or copy the token yourself: the calendar asks sidekick for it, and you confirm the question in sidekick with one click.

### Pair in One Click

1. Start sidekick on the computer on which you use time cockpit in the browser.
2. Open the Time Sheet Calendar in the time cockpit web client at `https://web-preview.timecockpit.com`, in a browser on the same computer.
3. Open the gear **Settings**.
4. Under **Signals**, choose **Show signals of time cockpit sidekick**.
5. Click **Pair with sidekick**. The calendar looks for sidekick on this computer and asks it. Your browser may first ask whether the page may access devices on the local network. Allow it; otherwise the browser blocks the connection to sidekick.
6. While the calendar waits, it asks you to confirm in sidekick with “Allow” and names the address from which sidekick shows the request. **Cancel** stops the pairing.
7. In sidekick, check the question and click **Allow** (see [The Question in sidekick](#the-question-in-sidekick)).

The calendar receives the token, saves it together with the address of sidekick and says **Paired with sidekick.** The signals appear right away; there is nothing to copy.

The calendar shows signals from only one source at a time. If you pair sidekick, the signals of the [classic signal tracker](~/doc/signal-tracker/overview.md) are no longer shown.

### The Question in sidekick

sidekick shows the question in a small window in front of the other windows, at the bottom right of the screen with the mouse pointer, also when sidekick runs only as an icon in the notification area or in the menu bar. A notification announces it as well. The same question appears as a card at the top of the tab **Pairing**.

- **time cockpit wants to pair**, with the environment for an address other than `https://web.timecockpit.com`, for example **Preview**.
- What the calendar can do with the pairing, and that you can revoke it at any time under **Pairing**.
- The note to allow only if you just clicked "Pair with sidekick" in the calendar yourself.
- The address that asks, the browser, the time of the question and a countdown. The address is the one your browser sends with the question, that is, the address of the page on which **Pair with sidekick** was clicked.
- **Allow** and **Decline**.

Answering in either place closes both. Closing the small window (or pressing **Esc**) only hides it: the question waits in the tab **Pairing** until you answer it or it expires after two minutes. Only **Allow** creates a token. It is labelled with the browser the question named, and the calendar picks it up by itself.

What the calendar says when the pairing does not complete:

| What the calendar says | What to do |
|---|---|
| Looking for sidekick on this computer … | Wait a moment. |
| sidekick is not running on this computer. Install or start it – the calendar keeps looking. | Start sidekick, or [install it](#install-sidekick). The calendar asks as soon as sidekick runs. |
| Declined in sidekick. | Click **Pair with sidekick** again if you want to pair. |
| No answer in sidekick – the request expired. Try again. | Click **Pair with sidekick** again and answer the question in sidekick within two minutes. |
| The browser does not let this page reach sidekick. Allow local network access in the site settings of the browser. | Allow the local network access for the time cockpit page in the site settings of the browser, then click **Pair with sidekick** again. |
| This version of sidekick cannot pair in one click yet. Update sidekick or pair manually. | Update sidekick (see [Autostart and Updates](#autostart-and-updates)), or [pair manually](#pair-manually-with-address-and-token). |
| sidekick does not allow … Update sidekick or pair manually. | sidekick does not know the address of this page. Update sidekick, or add the address in the [manual pairing](#pair-manually-with-address-and-token). |
| Pairing did not work. Try again or pair manually. | Click **Pair with sidekick** again, or [pair manually](#pair-manually-with-address-and-token). |

### Start From sidekick

As long as no calendar is paired, the tab **Pairing** in sidekick shows the card **I use time cockpit**. Its button **Open time cockpit** opens the Time Sheet Calendar at `https://web.timecockpit.com` in your browser. The calendar then asks sidekick on its own, and a notification in the calendar shows how far the pairing is. Confirm the question in sidekick with **Allow**.

If you use Preview or a sandbox, open your address as usual and click **Pair with sidekick** in the calendar instead. During the preview, this is `https://web-preview.timecockpit.com`.

To pair another browser later, open the calendar in that browser and click **Pair with sidekick** under **Settings**.

### Addresses and Environments

- Each address of time cockpit is paired once. After that, the calendar reads the signals without asking again.
- Prod and the release candidate run under the same address, `https://web.timecockpit.com`, so a move between them needs no new pairing.
- Preview (`https://web-preview.timecockpit.com`) and Dev (`https://web-dev.timecockpit.com`) are addresses of their own. Pair them in the calendar that runs there. sidekick labels them **Preview** and **Dev · test environment**, and a question from Dev carries a note that Dev is the test environment of time cockpit.
- You need a new pairing only in another browser, after you revoked the calendar in sidekick, or when the browser has lost the data it stored for the page, for example after you cleared the site data.

### Pair Manually With Address and Token

Use the manual pairing in Safari and with a version of sidekick that cannot pair in one click yet. In the calendar settings and in the tab **Pairing** of sidekick, it is folded under **Pair manually with address and token**.

#### In sidekick: Create a Token

1. Open sidekick and go to the tab **Pairing**.
2. Under **Paired calendars**, unfold **Pair manually with address and token**. It contains the form **Pair a new calendar**.
3. Under **Where does it run?**, choose the address at which you open time cockpit in the browser. During the preview this is `https://web-preview.timecockpit.com`. The list contains the addresses of time cockpit. To pair another address, choose the last entry of the list and paste the address from the address bar of your browser. sidekick keeps only the origin, that is scheme, host name and port, and drops the path. You can enter a name under **Label (optional)**.
4. Click **Create token**. A token is valid only for this address. It does not expire; it stays valid until you revoke the calendar. sidekick shows it only once, for ten minutes at most.
5. Copy **Address of sidekick** (usually `http://127.0.0.1:41337`) and **Token** with the **Copy** buttons. After ten minutes at the latest the token disappears from the window and cannot be shown again, so enter it in the calendar right away.

sidekick stores only a hash of the token, never the token itself. If you lose the token, create a new one.

#### In the Calendar: Enter Address and Token

1. Open the Time Sheet Calendar in the time cockpit web client at `https://web-preview.timecockpit.com`, in a browser on the same computer.
2. Open the gear **Settings**.
3. Under **Signals**, choose **Show signals of time cockpit sidekick**.
4. Unfold **Pair manually with address and token**.
5. Paste the address into **Address of sidekick** and the token into **Token**.
6. Click **Test connection**. If the calendar reaches sidekick, it shows **Connected to** followed by the name of the device.
7. Click **Save**.

Your browser may ask whether the time cockpit page may access devices in your local network. Allow it; otherwise the browser blocks the connection to sidekick.

## Connection Status in the Calendar

At the top right of the right pane of the calendar, a status shows whether the calendar reaches sidekick. If it does not, the right pane explains why. For a missing or wrong token and when sidekick is not running, it also offers the button **Pair with sidekick**.

| Status | What the calendar says | What to do |
|---|---|---|
| **sidekick connected** | — | Nothing. The calendar reads the signals. |
| **Connecting to sidekick …** | — | Wait a moment. |
| **sidekick not running** | Start time cockpit sidekick on this computer. The calendar connects on its own once it runs. | Start sidekick, for example from the Start menu. If the calendar is not paired yet, click **Pair with sidekick**. |
| **Token does not match sidekick** | The token in the calendar settings is missing or does not match sidekick. Pair the calendar with sidekick: click below, then “Allow” in sidekick. | Click **Pair with sidekick** in the right pane, then **Allow** in sidekick. |
| **Token belongs to another address** | The token was paired for another address. Pair … again – with “Pair with sidekick” it takes one click. (In place of … the calendar names its own address.) | Click **Pair with sidekick** in the right pane, then **Allow** in sidekick. |
| **Browser blocks sidekick** | sidekick runs, but the browser does not let this page reach it. Allow the page to access the local network, or pair this address in sidekick. | Allow the browser's local network access for the time cockpit page. If that does not help, add exactly the address of this page in the [manual pairing](#pair-manually-with-address-and-token) in sidekick. |

sidekick answers only addresses that are in its list of addresses. For any other address it does not give the browser permission to read the answer (CORS), so the browser blocks it, just as it does when local network access is denied. That is why adding the address can fix **Browser blocks sidekick**. Only an address in this list can ask to pair in one click. If the address is in the list but the token was created for another address, the calendar shows **Token belongs to another address** instead.

The calendar retries **sidekick not running** and **Browser blocks sidekick** on its own, at first after 15 seconds and then less often, up to every five minutes. After a token problem it does not retry; click **Pair with sidekick** and confirm the question in sidekick.

If sidekick cannot use its default port 41337 because another program uses it, it takes the next free port. The calendar looks for sidekick on port 41337 and the next nine ports, both when it pairs and when a paired sidekick no longer answers at the saved address; it then saves the new address itself, so there is nothing to enter again. The menu of the tray icon shows the port (**Connection to the calendar: on (port …)**), and the tab **Pairing** shows the current **Address of sidekick** under **Pair manually with address and token**. If you set a port outside this range under **Port and technical details** in the tab **Pairing**, enter the new address in the [manual pairing](#pair-manually-with-address-and-token) of the calendar.

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

In sidekick, open the tab **Pairing**. Under **Paired calendars**, each pairing has a row: **time cockpit** with the environment and the address, then the browser (or the label of a manual pairing), when it was paired and when it last read. Click **Revoke** next to the calendar. The calendar can then no longer read anything; to read again, it has to be paired again.

To stop every calendar from reading, clear **Paired calendars may read** under **Paired calendars** in the tab **Pairing**. While it is cleared, no calendar reads; the pairings stay.

## Uninstall sidekick

Uninstall time cockpit sidekick in the Windows settings under **Apps**. The uninstaller stops a running sidekick and removes the program and the autostart entry. On macOS, quit sidekick and move the app from the **Applications** folder to the Trash.

Your recorded data stays in `%APPDATA%\timecockpit-sidekick` (on macOS in `~/Library/Application Support/timecockpit-sidekick`). To remove it as well, delete it in the tab **Data** before uninstalling (see [sidekick Privacy and Data](privacy-and-data.md)), or delete the folder afterwards.
