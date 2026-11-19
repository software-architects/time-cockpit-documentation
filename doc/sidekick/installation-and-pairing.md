---
title: Install and Pair time cockpit sidekick
description: Download and install time cockpit sidekick on Windows or macOS, pair it with the Time Sheet Calendar in one click and solve connection problems.
---
# Installing and Pairing sidekick

> [!WARNING]
> Preview: time cockpit sidekick is in a preview. Features, labels and setup steps can change without notice. sidekick runs on Windows 10/11 and macOS. During the preview, sidekick works only in the environments Preview and release candidate (RC). You open both at `https://web.timecockpit.com`; the badge at the top right of the web client shows which one you use (**PREVIEW** or **RC**, see [Release Plan](~/doc/getting-started/web-client.md#release-plan)). Feedback: [support@timecockpit.com](mailto:support@timecockpit.com)

Setting up time cockpit sidekick takes three steps: install sidekick, click **Pair with sidekick** in the right pane of the Time Sheet Calendar, and confirm the question in sidekick with **Allow**. The right pane of the calendar guides you through these steps.

## Install sidekick

sidekick runs on Windows 10 and 11 (x64) and on macOS (Apple silicon and Intel). The limitations of the macOS version are listed under [Install on macOS](#install-on-macos).

<div class="tc-dl" data-tc-download>
<p class="tc-dl-hint tc-dl-hint-first" data-dl-hint="mobile" hidden>sidekick runs on Windows and macOS. Download it on the computer you work on.</p>
<p class="tc-dl-hint tc-dl-hint-first" data-dl-hint="desktop" hidden>sidekick runs on Windows and macOS. Linux machines you work on over SSH are recorded from your Windows PC or Mac.</p>
<div class="tc-dl-top">
<div>
<a class="btn btn-primary btn-lg tc-dl-main" data-dl="win" href="https://www.timecockpit.com/download/sidekick/TimeCockpit.Sidekick-win-Setup.exe"><i class="bi bi-windows" aria-hidden="true"></i><span>Download for Windows<small>Windows 10 and 11 (x64)</small></span></a>
<a class="btn btn-primary btn-lg tc-dl-main" data-dl="arm" href="https://www.timecockpit.com/download/sidekick/TimeCockpit.Sidekick-osx-arm64-Setup.pkg" hidden><i class="bi bi-apple" aria-hidden="true"></i><span>Download for Mac with Apple silicon<small>macOS on Apple silicon (M1 and later)</small></span></a>
<a class="btn btn-primary btn-lg tc-dl-main" data-dl="x86" href="https://www.timecockpit.com/download/sidekick/TimeCockpit.Sidekick-osx-x64-Setup.pkg" hidden><i class="bi bi-apple" aria-hidden="true"></i><span>Download for Mac with Intel processor<small>macOS on an Intel processor</small></span></a>
</div>
<p class="tc-dl-side">Free and signed. On Windows, sidekick installs for your user only and needs no administrator rights.</p>
</div>
<p class="tc-dl-others"><span data-mobile-label="Installers for your computer:">Other versions:</span>
<a data-dl="win" href="https://www.timecockpit.com/download/sidekick/TimeCockpit.Sidekick-win-Setup.exe" hidden>Windows</a>
<a data-dl="arm" href="https://www.timecockpit.com/download/sidekick/TimeCockpit.Sidekick-osx-arm64-Setup.pkg">Mac with Apple silicon</a>
<a data-dl="x86" href="https://www.timecockpit.com/download/sidekick/TimeCockpit.Sidekick-osx-x64-Setup.pkg">Mac with Intel processor</a></p>
<p class="tc-dl-hint" data-dl-hint="mac" hidden>Which version fits? Under <strong>About This Mac</strong> in the Apple menu, a Mac with Apple silicon shows <strong>Chip</strong>, an older Mac shows <strong>Processor</strong> with Intel.</p>
</div>

### Install on Windows

1. Download the installer [TimeCockpit.Sidekick-win-Setup.exe](https://www.timecockpit.com/download/sidekick/TimeCockpit.Sidekick-win-Setup.exe). The right pane of the calendar offers the same file on Windows (**Download for Windows**); on other systems its link **Go to the download** opens this page.
2. Run the installer. It installs sidekick for your Windows user only, needs no administrator rights and asks no questions. The program goes to `%LOCALAPPDATA%\TimeCockpit.Sidekick`, and a Start menu entry is added.
3. Windows SmartScreen may warn about the installer, because sidekick is a new program. The installer is signed. To continue, click **More info** and then **Run anyway**.
4. After the installation sidekick starts, switches on its autostart and opens its window. Its icon, the time cockpit logo, appears in the notification area of the taskbar (possibly hidden under the arrow). A banner at the top of the window asks whether sidekick may send usage data; nothing is sent until you agree (see [Usage Data](privacy-and-data.md#usage-data)).

Closing the window does not stop sidekick; it keeps recording in the background. To open the window again, double-click the icon or choose **Open sidekick…** in its menu.

### Install on macOS

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
- On macOS, sidekick records only the connected Wi-Fi network, not the networks in reach.
- The data is stored in `~/Library/Application Support/timecockpit-sidekick`.

### Autostart and Updates

- The autostart is the setting **Start with the operating system** in sidekick under **Settings** in the area **Retention and start**.
- sidekick updates itself on Windows and macOS. It checks for a new version one minute after the start and then every four hours, and downloads a new version in the background. The menu of the sidekick icon (in the notification area on Windows, in the menu bar on macOS) then offers **Install update … and restart**; otherwise the update is installed at the next start. If the sidekick window was open when the update started, also minimized, sidekick opens it again after the restart. A click on the version number at the bottom of the left rail of the sidekick window shows the state of the updates, with **Check for updates** and **Get pre-release versions**.

## Pair sidekick With the Calendar

> [!WARNING]
> During the preview, sidekick can be paired only with the environments Preview and release candidate (RC) of time cockpit. You open both at `https://web.timecockpit.com`, and this is the address you pair. The badge at the top right of the web client shows which environment you use: **PREVIEW** or **RC**. The environments are described in the [Release Plan](~/doc/getting-started/web-client.md#release-plan).

The calendar may read the signals only with a token that sidekick created for the address of your time cockpit, that is for `https://web.timecockpit.com`. You do not have to create or copy the token yourself: the calendar asks sidekick for it, and you confirm the question in sidekick with one click.

> [!NOTE]
> Pairing in one click needs time cockpit 2026.12 or later. In an older version, the calendar does not offer **Pair with sidekick**; pair [manually with address and token](#pair-manually-with-address-and-token) instead.

### Pair in One Click

1. Start sidekick on the computer on which you use time cockpit in the browser.
2. Open the Time Sheet Calendar in the time cockpit web client at `https://web.timecockpit.com`, in a browser on the same computer.
3. In a browser in which the calendar has no settings stored yet, sidekick is the signal source of the calendar already. Otherwise open the gear **Settings**, choose **time cockpit sidekick** under **Signals** and click **Set up in the pane**: the calendar saves the settings, closes the dialog and goes to the right pane.
4. The right pane asks **What did you work on today?** and shows two steps: **Install sidekick** and **Pair the calendar**. If sidekick is not installed yet, install it first: on Windows, **Download for Windows** downloads the installer; on other systems, **Go to the download** opens this page.
5. Under **Pair the calendar**, click **Pair with sidekick**. The calendar looks for sidekick on this computer and asks it. Your browser may first ask whether the page may access devices on the local network. Allow it; the calendar needs it to reach sidekick.
6. While the calendar waits, it says **Click “Allow” in the sidekick window.** Below, it names the address the window shows and that the request is valid for two minutes, and where the sidekick icon is if no window appears. **Cancel** stops the pairing and withdraws the question from sidekick.
7. In sidekick, check the question and click **Allow** (see [The Question in sidekick](#the-question-in-sidekick)).

The calendar receives the token, saves it together with the address of sidekick and says **Paired. Your signals now appear in the calendar.** The right pane then shows the signals; there is nothing to copy.

The calendar shows signals from only one source at a time. If you pair sidekick, the signals of the [classic signal tracker](~/doc/signal-tracker/overview.md) are no longer shown.

### The Question in sidekick

sidekick shows the question in a small window in front of the other windows, at the bottom right of the screen with the mouse pointer, also when sidekick runs only as an icon in the notification area or in the menu bar. The same question appears as a card at the top of the tab **Pairing**.

- **time cockpit wants to pair**, with the environment for an address other than `https://web.timecockpit.com`, for example **Preview**.
- What the calendar can do with the pairing, and that you can revoke it at any time under **Pairing**.
- The note to allow only if you just clicked "Pair with sidekick" in the calendar yourself.
- The address that asks, the browser, the time of the question and a countdown. The address is the one your browser sends with the question, that is, the address of the page on which **Pair with sidekick** was clicked.
- **Allow** and **Decline**.

The small window comes to the front by itself, so it guards against keys and clicks meant for another window: the question itself has the focus, not **Allow**, and both buttons take no answer in the first second after the question appeared or the window came to the front, nor in the second after you typed something. The card in the tab **Pairing** takes no answer in the first second after the question appeared there or another question above it was answered. The window in front also does this. A click that comes too early is not lost without a word; sidekick then says **One moment: read the question, you can answer in a second.**

Answering in either place closes both. Closing the small window (or pressing **Esc**) only hides it: the question waits in the tab **Pairing** until you answer it or it expires after two minutes. If the calendar cancels the pairing or starts a new one, a current sidekick removes the question at once; an older one lets it expire. Only **Allow** creates a token. It is labelled with the browser the question named, and the calendar picks it up by itself. If the token does not reach the calendar on the first try, the calendar gets it with its next question; a token that no calendar picks up within a minute is revoked again.

What the calendar says when the pairing does not complete at once:

| What the calendar says | What to do |
|---|---|
| Looking for sidekick … | Wait a moment. |
| sidekick was not found. Install or start sidekick. The calendar keeps looking. | Start sidekick, or [install it](#install-sidekick). The calendar asks as soon as sidekick runs. |
| The calendar cannot reach sidekick. Either another app answers in its place, or sidekick does not accept … Install, start or update sidekick. The calendar keeps looking. (In place of … the calendar names its own address.) | Another program uses the ports of sidekick, or sidekick does not know the address of this page. Install or start sidekick, or update it. |
| sidekick already shows other questions to pair. Answer them in the sidekick window; the calendar keeps asking. | Answer the waiting questions in sidekick, or wait until they expire. The calendar asks again by itself. |
| Declined in sidekick. You can try again at any time. | Click **Pair with sidekick** again if you want to pair. |
| The request expired after two minutes. Try again. | Click **Pair with sidekick** again and answer the question in sidekick within two minutes. |
| The browser blocks access to sidekick. Click the icon to the left of the address bar and allow access to the local network. Then try again. | Allow the local network access for the time cockpit page in the site settings of the browser, then click **Pair with sidekick** again. |
| This sidekick version is too old to pair in one click. Update sidekick, or pair manually under Calendar › Settings › Signals. | Update sidekick (see [Autostart and Updates](#autostart-and-updates)), or [pair manually](#pair-manually-with-address-and-token). |
| sidekick does not accept … Update sidekick, or pair manually under Calendar › Settings › Signals. | sidekick does not know the address of this page. Update sidekick, or add the address in the [manual pairing](#pair-manually-with-address-and-token). |
| Pairing failed. Try again, or pair manually under Calendar › Settings › Signals. | Click **Pair with sidekick** again, or [pair manually](#pair-manually-with-address-and-token). |

### Start From sidekick

As long as no calendar is paired, the tab **Pairing** in sidekick shows the card **I use time cockpit**. Its button **Open time cockpit** opens the Time Sheet Calendar at `https://web.timecockpit.com` in your browser. The calendar then asks sidekick on its own, and a notification in the calendar shows how far the pairing is. Confirm the question in sidekick with **Allow**. If this browser is paired already, the calendar starts no new pairing and says **This browser is already paired with sidekick. If no signals appear, pair again in the right pane.**

This also holds if your time cockpit runs in Preview or in the RC. If you use time cockpit at another address, for example at `https://web-dev.timecockpit.com`, open that address as usual and click **Pair with sidekick** in the calendar instead.

To pair another browser later, open the calendar in that browser and click **Pair with sidekick** in the right pane.

A calendar before time cockpit 2026.12 does not ask sidekick when you open it with **Open time cockpit**. Pair [manually with address and token](#pair-manually-with-address-and-token) instead.

### Addresses and Environments

- Each address of time cockpit is paired once. After that, the calendar reads the signals without asking again.
- Preview, release candidate and Prod run at the same address, `https://web.timecockpit.com`. time cockpit decides which environment your tenant or individual users get; switching the environment needs no new pairing.
- `https://web-preview.timecockpit.com` and Dev (`https://web-dev.timecockpit.com`) are addresses of their own. If you open time cockpit there, pair them in the calendar that runs there. sidekick labels them **Preview** and **Dev · test environment**, and a question from Dev carries a note that Dev is the test environment of time cockpit. If you do not use Dev, you can remove it: under **Pair manually with address and token**, choose it under **Where does it run?** and click **Remove address**, as long as no calendar is paired with it. An update of sidekick does not add it again.
- You need a new pairing only in another browser, after you revoked the calendar in sidekick, or when the browser has lost the data it stored for the page, for example after you cleared the site data.

### Pair Manually With Address and Token

Use the manual pairing if your time cockpit is older than 2026.12 or your version of sidekick cannot pair in one click yet. In the tab **Pairing** of sidekick, and from time cockpit 2026.12 also in the calendar settings, it is folded under **Pair manually with address and token**.

#### In sidekick: Create a Token

1. Open sidekick and go to the tab **Pairing**.
2. Under **Paired calendars**, unfold **Pair manually with address and token**. It contains the form **Pair a new calendar**.
3. Under **Where does it run?**, choose the address at which you open time cockpit in the browser, usually `https://web.timecockpit.com`, also in Preview and in the RC. The list contains the addresses of time cockpit. To pair another address, choose the last entry of the list and paste the address from the address bar of your browser. sidekick keeps only the origin, that is scheme, host name and port, and drops the path. You can enter a name under **Label (optional)**.
4. Click **Create token**. A token is valid only for this address. It does not expire; it stays valid until you revoke the calendar. sidekick shows it only once, for ten minutes at most.
5. Copy **Address of sidekick** (usually `http://127.0.0.1:41337`) and **Token** with the **Copy** buttons. After ten minutes at the latest the token disappears from the window and cannot be shown again, so enter it in the calendar right away.

sidekick stores only a hash of the token, never the token itself. If you lose the token, create a new one.

#### In the Calendar: Enter Address and Token

1. Open the Time Sheet Calendar in the time cockpit web client at `https://web.timecockpit.com`, in a browser on the same computer.
2. Open the gear **Settings**.
3. Under **Signals**, choose **time cockpit sidekick**.
4. From time cockpit 2026.12, unfold **Pair manually with address and token**. In older versions, the fields are right below **time cockpit sidekick**.
5. Paste the address into **Address of sidekick** and the token into **Token**. From time cockpit 2026.12, the calendar accepts only an address of sidekick on this computer, `http://127.0.0.1:` or `http://localhost:` followed by the port; it sends the token nowhere else. For any other address it says **Enter the address of sidekick on this computer, for example http://127.0.0.1:41337.** and neither tests nor saves it.
6. Click **Test connection**. If the calendar reaches sidekick, it shows **Connected to** followed by the name of the device. After too many invalid tokens from this address, sidekick refuses requests for a minute; from time cockpit 2026.12, the test then says so. Try again a minute later.
7. Click **Save**.

Your browser may ask whether the time cockpit page may access devices in your local network. Allow it; otherwise the browser blocks the connection to sidekick.

### sidekick in the Calendar Settings

Under **Signals** in the calendar settings you choose the signal source: **None**, **time cockpit sidekick** or **Classic signal tracker**. Next to **time cockpit sidekick**, **More about sidekick** opens the [overview](overview.md). The settings do not pair; under the choice they show the state of the pairing:

- **Not paired yet**: the note that the right pane guides you through installing and pairing, and **Set up in the pane**. The button saves the settings with sidekick as the source, closes the dialog and goes to the right pane.
- **Paired with sidekick**: with a status after it when sidekick does not answer, and **Remove pairing**. Removing the pairing deletes the token in this browser at once; the calendar then says that the pairing is removed in this browser only. To revoke the pairing altogether, use the tab **Pairing** in sidekick (see [Revoke a Paired Calendar](#revoke-a-paired-calendar)).
- **Pairing no longer valid**: sidekick no longer accepts this browser. **Go to pairing** leads to the right pane, where you pair again; **Remove pairing** deletes the token in this browser.
- While a pairing runs in the right pane, the settings show what it waits for.

**Pair manually with address and token** stays folded below; see [Pair Manually With Address and Token](#pair-manually-with-address-and-token).

### Hide the sidekick Pane

If you do not want to use sidekick, click **Hide the pane** at the bottom of the right pane, below **Rather work without sidekick?**. The calendar then stops reading sidekick and the pane disappears; sidekick itself keeps running and recording. A message offers **Undo**. To show the pane again later, open the gear **Settings**, choose **time cockpit sidekick** under **Signals** and click **Save**.

## Connection Status in the Calendar

At the top right of the right pane of the calendar, a status shows whether the calendar reaches sidekick. If it does not, the right pane explains why and offers **Pair with sidekick**.

| Status | What the right pane says | What to do |
|---|---|---|
| **Not paired yet** | What did you work on today? sidekick knows. … with the steps **Install sidekick** and **Pair the calendar**. | Install sidekick if needed and click **Pair with sidekick** (see [Pair in One Click](#pair-in-one-click)). |
| **sidekick connected** | — | Nothing. The calendar reads the signals. |
| **Connecting to sidekick …** | — | Wait a moment. |
| **sidekick not answering** | Start sidekick on this computer. The calendar then finds sidekick on its own. If sidekick is already running, pair again. | Start sidekick, for example from the Start menu. If it is running already, another program may use its port: click **Pair with sidekick**. |
| **Pairing no longer valid** | sidekick no longer accepts this browser, for example because the pairing was revoked there. Pair again and click “Allow” in sidekick. | Click **Pair with sidekick** in the right pane, then **Allow** in sidekick. |
| **Paired for another address** | The pairing does not cover … Pair again and click “Allow” in sidekick. (In place of … the calendar names its own address.) | Click **Pair with sidekick** in the right pane, then **Allow** in sidekick. |
| **Browser blocks sidekick** | Click the icon to the left of the address bar and allow access to the local network. | Allow the browser's local network access for the time cockpit page, or click **Pair with sidekick**: the browser then asks for the access. |

sidekick answers only addresses that are in its list of addresses. For any other address it does not give the browser permission to read the answer (CORS), so the browser blocks it. If the browser has allowed the time cockpit page to access the local network, such an unreadable answer comes from another program on the port of sidekick or from a sidekick that does not know the address; the calendar then shows **sidekick not answering**. As long as the browser has not allowed the access, or does not say whether it has, the calendar shows **Browser blocks sidekick**. Only an address in the list of sidekick can ask to pair in one click. If the address is in the list but the token was created for another address, the calendar shows **Paired for another address** instead.

The calendar retries **sidekick not answering** and **Browser blocks sidekick** on its own, at first after 15 seconds and then less often, up to every five minutes. After a token problem it does not retry; click **Pair with sidekick** and confirm the question in sidekick.

If sidekick cannot use its default port 41337 because another program uses it, it takes the next free port. The calendar looks for sidekick on port 41337 and the next nine ports when it pairs. When a paired sidekick no longer answers at the saved address, the calendar looks for it there as well and recognises it by a proof of its token for that port, without sending the token; it then saves the new address itself, so there is nothing to enter again. This needs a current sidekick; with an older one, click **Pair with sidekick** in the right pane. The calendar asks a current sidekick for the same proof at the saved address before it sends its token, when the page loads and after the connection was lost, so a program that took the port of sidekick gets no token. If the proof does not match, the calendar looks on the other ports and otherwise shows **Pairing no longer valid**. With a token paired by hand, the calendar sends it without a proof as long as sidekick has never shown one, because older versions of sidekick cannot; pairing in one click avoids this. The menu of the tray icon shows the port (**Connection to the calendar: on (port …)**), and the tab **Pairing** shows the current **Address of sidekick** under **Pair manually with address and token**. If you set a port outside this range under **Port and technical details** in the tab **Pairing**, enter the new address in the [manual pairing](#pair-manually-with-address-and-token) of the calendar.

## Open sidekick With a Key Combination

Press **Ctrl+Alt+S** on Windows or **⌘⌥S** on macOS to bring the sidekick window to the front from any application. The key combination works while sidekick runs, also when only its icon in the notification area or the menu bar is shown.

To change the combination, open **Settings** in sidekick and, in the group **For all machines**, the area **Retention and start**.

- Click into the field **Key combination to open sidekick** and press the keys you want. A combination needs **Ctrl** (**⌘** on macOS), **Alt** or **Win** and exactly one other key.
- **Off** switches the key combination off. **Default** restores **Ctrl+Alt+S** (**⌘⌥S** on macOS).
- The change takes effect when you save the settings.

While sidekick runs, no other application gets this key combination. Visual Studio and the JetBrains IDEs, for example IntelliJ IDEA or Rider, use **Ctrl+Alt+S** as well; if you use them, choose another combination for sidekick or switch it off. If another application already uses the combination, the area says so. The combination cannot be the same as the [key combination for a new note](notes.md#key-combination). **Open sidekick…** in the menu of the tray icon keeps working either way.

## The Tray Icon Menu

Right-click the sidekick icon in the notification area to open its menu. On macOS, click the sidekick icon in the menu bar.

- The first line shows the state: **Recording**, **Stopped**, **Paused until …** or **Error: …**.
- **Connection to the calendar: on (port …)** shows whether the calendar can read the signals and on which port.
- **Open sidekick…** opens the window. The menu shows the [key combination](#open-sidekick-with-a-key-combination) next to it while it is active.
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
