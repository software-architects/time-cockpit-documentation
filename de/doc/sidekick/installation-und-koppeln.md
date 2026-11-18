---
title: time cockpit sidekick installieren und koppeln
description: time cockpit sidekick unter Windows oder macOS installieren, mit einem Klick mit dem Zeiterfassungskalender koppeln und Verbindungsprobleme lösen.
en_page: doc/sidekick/installation-and-pairing.md
---
# sidekick installieren und koppeln

> [!WARNING]
> Preview: time cockpit sidekick befindet sich in einer Vorschauphase. Funktionen, Bezeichnungen und Einrichtungsschritte können sich ohne Vorankündigung ändern. sidekick läuft unter Windows 10/11 und macOS. Während der Preview funktioniert sidekick nur mit `https://web-preview.timecockpit.com`. Feedback: [support@timecockpit.com](mailto:support@timecockpit.com)

Die Einrichtung von time cockpit sidekick besteht aus drei Schritten: sidekick installieren, im rechten Bereich des Zeiterfassungskalenders auf **Mit sidekick koppeln** klicken und die Anfrage in sidekick mit **Erlauben** bestätigen. Der rechte Bereich des Kalenders führt Sie durch diese Schritte.

## sidekick installieren

sidekick läuft unter Windows 10 und 11 (x64) und unter macOS (Apple Silicon und Intel). Die Einschränkungen der macOS-Version stehen unter [Installation unter macOS](#installation-unter-macos).

<div class="tc-dl" data-tc-download>
<p class="tc-dl-hint tc-dl-hint-first" data-dl-hint="mobile" hidden>sidekick läuft unter Windows und macOS. Laden Sie es auf dem Computer herunter, an dem Sie arbeiten.</p>
<p class="tc-dl-hint tc-dl-hint-first" data-dl-hint="desktop" hidden>sidekick läuft unter Windows und macOS. Linux-Rechner, auf denen Sie per SSH arbeiten, zeichnet es von Ihrem Windows-PC oder Mac aus mit auf.</p>
<div class="tc-dl-top">
<div>
<a class="btn btn-primary btn-lg tc-dl-main" data-dl="win" href="https://www.timecockpit.com/download/sidekick/TimeCockpit.Sidekick-win-Setup.exe"><i class="bi bi-windows" aria-hidden="true"></i><span>Für Windows herunterladen<small>Windows 10 und 11 (x64)</small></span></a>
<a class="btn btn-primary btn-lg tc-dl-main" data-dl="arm" href="https://www.timecockpit.com/download/sidekick/TimeCockpit.Sidekick-osx-arm64-Setup.pkg" hidden><i class="bi bi-apple" aria-hidden="true"></i><span>Für Mac mit Apple Silicon herunterladen<small>macOS auf Apple Silicon (M1 und neuer)</small></span></a>
<a class="btn btn-primary btn-lg tc-dl-main" data-dl="x86" href="https://www.timecockpit.com/download/sidekick/TimeCockpit.Sidekick-osx-x64-Setup.pkg" hidden><i class="bi bi-apple" aria-hidden="true"></i><span>Für Mac mit Intel-Prozessor herunterladen<small>macOS auf Intel-Prozessor</small></span></a>
</div>
<p class="tc-dl-side">Kostenlos und signiert. Unter Windows installiert sich sidekick nur für Ihren Benutzer und braucht keine Administratorrechte.</p>
</div>
<p class="tc-dl-others"><span data-mobile-label="Installer für Ihren Computer:">Weitere Versionen:</span>
<a data-dl="win" href="https://www.timecockpit.com/download/sidekick/TimeCockpit.Sidekick-win-Setup.exe" hidden>Windows</a>
<a data-dl="arm" href="https://www.timecockpit.com/download/sidekick/TimeCockpit.Sidekick-osx-arm64-Setup.pkg">Mac mit Apple Silicon</a>
<a data-dl="x86" href="https://www.timecockpit.com/download/sidekick/TimeCockpit.Sidekick-osx-x64-Setup.pkg">Mac mit Intel-Prozessor</a></p>
<p class="tc-dl-hint" data-dl-hint="mac" hidden>Welche Version passt? Im Apple-Menü unter <strong>Über diesen Mac</strong> steht bei Apple Silicon <strong>Chip</strong>, bei älteren Macs <strong>Prozessor</strong> mit Intel.</p>
</div>

### Installation unter Windows

1. Laden Sie das Installationsprogramm [TimeCockpit.Sidekick-win-Setup.exe](https://www.timecockpit.com/download/sidekick/TimeCockpit.Sidekick-win-Setup.exe) herunter. Der rechte Bereich des Kalenders bietet unter Windows dieselbe Datei an (**Für Windows herunterladen**); auf anderen Systemen öffnet ihr Link **Zum Download** diese Seite.
2. Führen Sie das Installationsprogramm aus. Es installiert sidekick nur für Ihren Windows-Benutzer, braucht keine Administratorrechte und stellt keine Fragen. Das Programm wird nach `%LOCALAPPDATA%\TimeCockpit.Sidekick` installiert, und ein Eintrag im Startmenü wird angelegt.
3. Windows SmartScreen warnt möglicherweise vor dem Installationsprogramm, weil sidekick ein neues Programm ist. Das Installationsprogramm ist signiert. Um fortzufahren, klicken Sie auf **Weitere Informationen** und dann auf **Trotzdem ausführen**.
4. Nach der Installation startet sidekick, schaltet seinen Autostart ein und öffnet sein Fenster. Sein Symbol, das time cockpit Logo, erscheint im Infobereich der Taskleiste (eventuell ausgeblendet unter dem Pfeil). Ein Banner oben im Fenster fragt, ob sidekick Nutzungsdaten senden darf; bis Sie zustimmen, wird nichts gesendet (siehe [Nutzungsdaten](~/doc/sidekick/datenschutz-und-daten.md#nutzungsdaten)).

Das Schließen des Fensters beendet sidekick nicht; sidekick zeichnet im Hintergrund weiter auf. Um das Fenster wieder zu öffnen, doppelklicken Sie auf das Symbol oder wählen Sie in seinem Menü **sidekick öffnen…**.

### Installation unter macOS

1. Laden Sie das Installationspaket für Ihren Mac herunter: [Apple Silicon](https://www.timecockpit.com/download/sidekick/TimeCockpit.Sidekick-osx-arm64-Setup.pkg) (M1 und neuer) oder [Intel](https://www.timecockpit.com/download/sidekick/TimeCockpit.Sidekick-osx-x64-Setup.pkg). Welchen Chip Ihr Mac hat, zeigt **Über diesen Mac** im Apple-Menü.
2. Öffnen Sie die heruntergeladene `.pkg`-Datei und folgen Sie dem Installationsprogramm. Das Installationspaket ist von software architects signiert und von Apple geprüft (notarisiert), deshalb öffnet macOS es ohne Warnung. Es installiert **time cockpit sidekick** in den Ordner **Programme**.
3. Starten Sie sidekick aus dem Ordner **Programme**, falls das Installationsprogramm es nicht schon gestartet hat.
4. sidekick läuft in der Menüleiste, nicht im Dock. Klicken Sie auf sein Symbol in der Menüleiste, um sein Menü zu öffnen.
5. Damit sidekick Fenstertitel aufzeichnen kann, erlauben Sie sidekick die Bildschirmaufnahme unter **Systemeinstellungen** > **Datenschutz & Sicherheit** > **Bildschirmaufnahme**, beenden Sie sidekick und starten Sie es neu. Ohne diese Berechtigung zeichnet sidekick auf, welche Anwendung im Vordergrund war, aber keine Fenstertitel. sidekick macht keine Bildschirmfotos.

Wenn Sie sidekick aus dem früheren Disk-Image (`.dmg`) installiert haben, können Sie das Installationsprogramm gleich ausführen: Beim ersten Start beendet die neue Version die alte, und Ihre aufgezeichneten Daten bleiben erhalten. Liegt noch eine Kopie der früheren Version auf Ihrem Mac, nennt sidekick sie in einem Band oben im Fenster; **In den Papierkorb legen** entfernt sie, **Später** fragt beim nächsten Start erneut. Entfernen Sie sie: Sie aktualisiert sich nicht und kann bei der Anmeldung statt der neuen Version starten.

Nach dem Wechsel fragt macOS einmal erneut nach der Bildschirmaufnahme und, für WLAN-Namen, nach den Ortungsdiensten, und den Autostart müssen Sie eventuell wieder einschalten. Fragt **Frag deine KI** erneut nach Ihrem API-Schlüssel, hat der Schlüsselbund den gespeicherten Schlüssel nicht an die neue Version freigegeben; geben Sie ihn noch einmal ein.

Einschränkungen der macOS-Version:

- Der Autostart ist nach der Installation ausgeschaltet. Damit sidekick bei der Anmeldung startet, schalten Sie **Mit dem Betriebssystem starten** ein (siehe [Autostart und Updates](#autostart-und-updates)).
- macOS verrät nicht, welche Anwendung das Mikrofon benutzt. sidekick zeichnet auf, dass das Mikrofon in Gebrauch war, und nennt die Besprechungsanwendung, deren Fenster zu dieser Zeit im Vordergrund war, falls es eine gab.
- Seit macOS 14.4 erhalten nur Apps mit Zugriff auf die Ortungsdienste WLAN-Namen. Ohne diesen Zugriff zeichnet sidekick keine WLAN-Namen auf.
- Unter macOS zeichnet sidekick nur das verbundene WLAN auf, keine WLANs in Reichweite.
- Die Daten werden in `~/Library/Application Support/timecockpit-sidekick` gespeichert.

### Autostart und Updates

- Der Autostart ist die Einstellung **Mit dem Betriebssystem starten** in sidekick unter **Einstellungen** im Bereich **Aufbewahrung und Start**.
- sidekick aktualisiert sich unter Windows und macOS selbst. Es sucht eine Minute nach dem Start und danach alle vier Stunden nach einer neuen Version und lädt eine neue Version im Hintergrund herunter. Das Menü des sidekick-Symbols (unter Windows im Infobereich, unter macOS in der Menüleiste) bietet dann **Update auf … installieren und neu starten** an; sonst wird das Update beim nächsten Start installiert. Ein Klick auf die Versionsnummer unten in der linken Leiste des sidekick-Fensters zeigt den Stand der Updates, mit **Nach Updates suchen** und **Vorabversionen erhalten**.

## sidekick mit dem Kalender koppeln

> [!WARNING]
> Während der Preview kann sidekick nur mit der Preview-Umgebung von time cockpit gekoppelt werden, `https://web-preview.timecockpit.com`. Das Koppeln mit `https://web.timecockpit.com` ist noch nicht möglich. Öffnen Sie den Zeiterfassungskalender unter `https://web-preview.timecockpit.com` und koppeln Sie diese Adresse. Die Umgebungen sind im [Release-Plan](~/doc/erste-schritte/web-client.md#release-plan) beschrieben.

Der Kalender darf die Signale nur mit einem Token lesen, das sidekick für die Adresse Ihres time cockpit erstellt hat, während der Preview `https://web-preview.timecockpit.com`. Sie müssen das Token weder selbst erstellen noch kopieren: Der Kalender fragt sidekick danach, und Sie bestätigen die Anfrage in sidekick mit einem Klick.

### Mit einem Klick koppeln

1. Starten Sie sidekick auf dem Rechner, auf dem Sie time cockpit im Browser verwenden.
2. Öffnen Sie den Zeiterfassungskalender im time cockpit Web-Client unter `https://web-preview.timecockpit.com`, in einem Browser auf demselben Rechner.
3. In einem Browser, in dem der Kalender noch keine Einstellungen gespeichert hat, ist sidekick bereits die Signalquelle des Kalenders. Andernfalls öffnen Sie das Zahnrad **Einstellungen**, wählen unter **Signale** die Option **time cockpit sidekick** und klicken auf **In der Leiste einrichten**: Der Kalender speichert die Einstellungen, schließt den Dialog und wechselt zum rechten Bereich.
4. Der rechte Bereich fragt **Woran haben Sie heute gearbeitet?** und zeigt zwei Schritte: **sidekick installieren** und **Kalender koppeln**. Ist sidekick noch nicht installiert, installieren Sie es zuerst: Unter Windows lädt **Für Windows herunterladen** das Installationsprogramm herunter; auf anderen Systemen öffnet **Zum Download** diese Seite.
5. Klicken Sie unter **Kalender koppeln** auf **Mit sidekick koppeln**. Der Kalender sucht sidekick auf diesem Rechner und fragt an. Ihr Browser fragt möglicherweise zuerst, ob die Seite auf Geräte im lokalen Netzwerk zugreifen darf. Erlauben Sie es; nur so erreicht der Kalender sidekick.
6. Während der Kalender wartet, meldet er **Klicken Sie im sidekick-Fenster auf „Erlauben“.** Darunter nennt er die Adresse, die das Fenster zeigt, und dass die Anfrage zwei Minuten gilt, und wo das sidekick-Symbol ist, falls kein Fenster erscheint. **Abbrechen** beendet das Koppeln und zieht die Anfrage in sidekick zurück.
7. Prüfen Sie in sidekick die Anfrage und klicken Sie auf **Erlauben** (siehe [Die Anfrage in sidekick](#die-anfrage-in-sidekick)).

Der Kalender erhält das Token, speichert es zusammen mit der Adresse von sidekick und meldet **Gekoppelt. Ihre Signale erscheinen jetzt im Kalender.** Der rechte Bereich zeigt dann die Signale; zu kopieren gibt es nichts.

Der Kalender zeigt Signale immer nur aus einer Quelle an. Wenn Sie sidekick koppeln, werden die Signale des [klassischen Signal Trackers](~/doc/signal-tracker/ueberblick.md) nicht mehr angezeigt.

### Die Anfrage in sidekick

sidekick zeigt die Anfrage in einem kleinen Fenster vor den anderen Fenstern, rechts unten auf dem Bildschirm mit dem Mauszeiger, auch wenn sidekick nur als Symbol im Infobereich oder in der Menüleiste läuft. Dieselbe Anfrage erscheint als Karte oben im Reiter **Koppeln**.

- **time cockpit möchte koppeln**, bei einer anderen Adresse als `https://web.timecockpit.com` mit der Umgebung, zum Beispiel **Preview**.
- Was der Kalender mit der Kopplung kann und dass Sie sie jederzeit unter **Koppeln** widerrufen können.
- Der Hinweis, nur zu erlauben, wenn Sie gerade selbst im Kalender auf „Mit sidekick koppeln“ geklickt haben.
- Die anfragende Adresse, der Browser, die Uhrzeit der Anfrage und ein Countdown. Die Adresse ist die, die Ihr Browser mit der Anfrage mitschickt, also die Adresse der Seite, auf der **Mit sidekick koppeln** geklickt wurde.
- **Erlauben** und **Ablehnen**.

Das kleine Fenster kommt von selbst nach vorne und schützt sich deshalb vor Tasten und Klicks, die einem anderen Fenster galten: Die Anfrage selbst hat den Fokus, nicht **Erlauben**, und beide Schaltflächen nehmen in der ersten Sekunde, nachdem die Anfrage erschienen oder das Fenster nach vorne gekommen ist, keine Antwort an, ebenso in der Sekunde nach einer Eingabe. Die Karte im Reiter **Koppeln** nimmt in der ersten Sekunde, nachdem die Anfrage dort erschienen oder eine Anfrage darüber beantwortet worden ist, keine Antwort an. Das gilt auch im Fenster vorne. Ein zu früher Klick geht nicht kommentarlos verloren; sidekick meldet dann **Einen Moment: Lesen Sie die Anfrage, gleich können Sie antworten.**

Eine Antwort an einer der beiden Stellen schließt beide. Das Schließen des kleinen Fensters (oder **Esc**) blendet es nur aus: Die Anfrage wartet im Reiter **Koppeln**, bis Sie sie beantworten oder sie nach zwei Minuten verfällt. Bricht der Kalender das Koppeln ab oder beginnt er ein neues, entfernt ein aktuelles sidekick die Anfrage sofort; ein älteres lässt sie verfallen. Nur **Erlauben** erstellt ein Token. Es wird mit dem Browser beschriftet, den die Anfrage nennt, und der Kalender holt es sich selbst ab. Erreicht das Token den Kalender beim ersten Mal nicht, bekommt er es mit seiner nächsten Anfrage; ein Token, das kein Kalender innerhalb einer Minute abholt, wird wieder widerrufen.

Was der Kalender meldet, wenn das Koppeln nicht gleich abgeschlossen wird:

| Was der Kalender anzeigt | Was zu tun ist |
|---|---|
| sidekick wird gesucht … | Einen Moment warten. |
| sidekick wurde nicht gefunden. Installieren oder starten Sie sidekick. Der Kalender sucht weiter. | Starten Sie sidekick oder [installieren Sie es](#sidekick-installieren). Der Kalender fragt an, sobald sidekick läuft. |
| Der Kalender erreicht sidekick nicht. Entweder antwortet ein anderes Programm an seiner Stelle, oder sidekick lässt … nicht zu. Installieren, starten oder aktualisieren Sie sidekick. Der Kalender sucht weiter. (Statt … nennt der Kalender seine eigene Adresse.) | Ein anderes Programm verwendet die Ports von sidekick, oder sidekick kennt die Adresse dieser Seite nicht. Installieren oder starten Sie sidekick, oder aktualisieren Sie es. |
| sidekick zeigt schon andere Anfragen zum Koppeln. Beantworten Sie diese im sidekick-Fenster; der Kalender fragt weiter. | Beantworten Sie die wartenden Anfragen in sidekick oder warten Sie, bis sie verfallen. Der Kalender fragt von selbst erneut an. |
| In sidekick abgelehnt. Sie können es jederzeit erneut versuchen. | Klicken Sie erneut auf **Mit sidekick koppeln**, wenn Sie koppeln möchten. |
| Die Anfrage ist nach zwei Minuten abgelaufen. Versuchen Sie es noch einmal. | Klicken Sie erneut auf **Mit sidekick koppeln** und beantworten Sie die Anfrage in sidekick innerhalb von zwei Minuten. |
| Der Browser blockiert den Zugriff auf sidekick. Klicken Sie links neben der Adresszeile auf das Symbol und erlauben Sie den Zugriff auf das lokale Netzwerk. Versuchen Sie es dann noch einmal. | Erlauben Sie den Zugriff auf das lokale Netzwerk für die time cockpit Seite in den Website-Einstellungen des Browsers und klicken Sie dann erneut auf **Mit sidekick koppeln**. |
| Diese sidekick-Version ist zu alt für das Koppeln per Klick. Aktualisieren Sie sidekick oder koppeln Sie manuell unter Kalender › Einstellungen › Signale. | Aktualisieren Sie sidekick (siehe [Autostart und Updates](#autostart-und-updates)) oder [koppeln Sie manuell](#manuell-koppeln-mit-adresse-und-token). |
| sidekick lässt … nicht zu. Aktualisieren Sie sidekick oder koppeln Sie manuell unter Kalender › Einstellungen › Signale. | sidekick kennt die Adresse dieser Seite nicht. Aktualisieren Sie sidekick oder fügen Sie die Adresse beim [manuellen Koppeln](#manuell-koppeln-mit-adresse-und-token) hinzu. |
| Das Koppeln ist fehlgeschlagen. Versuchen Sie es noch einmal oder koppeln Sie manuell unter Kalender › Einstellungen › Signale. | Klicken Sie erneut auf **Mit sidekick koppeln** oder [koppeln Sie manuell](#manuell-koppeln-mit-adresse-und-token). |

### Von sidekick aus starten

Solange kein Kalender gekoppelt ist, zeigt der Reiter **Koppeln** in sidekick die Karte **Ich nutze time cockpit**. Ihre Schaltfläche **time cockpit öffnen** öffnet den Zeiterfassungskalender unter `https://web.timecockpit.com` in Ihrem Browser. Der Kalender fragt dann von selbst bei sidekick an, und eine Benachrichtigung im Kalender zeigt, wie weit das Koppeln ist. Bestätigen Sie die Anfrage in sidekick mit **Erlauben**. Ist dieser Browser bereits gekoppelt, startet der Kalender kein neues Koppeln und meldet **Dieser Browser ist bereits mit sidekick gekoppelt. Erscheinen keine Signale, koppeln Sie im rechten Bereich erneut.**

Wenn Sie Preview oder eine Sandbox verwenden, öffnen Sie stattdessen Ihre Adresse wie gewohnt und klicken im Kalender auf **Mit sidekick koppeln**. Während der Preview ist das `https://web-preview.timecockpit.com`.

Um später einen weiteren Browser zu koppeln, öffnen Sie den Kalender in diesem Browser und klicken im rechten Bereich auf **Mit sidekick koppeln**.

### Adressen und Umgebungen

- Jede Adresse von time cockpit wird einmal gekoppelt. Danach liest der Kalender die Signale, ohne erneut zu fragen.
- Prod und der Release Candidate laufen unter derselben Adresse, `https://web.timecockpit.com`; ein Wechsel zwischen den beiden braucht deshalb keine neue Kopplung.
- Preview (`https://web-preview.timecockpit.com`) und Dev (`https://web-dev.timecockpit.com`) sind eigene Adressen. Koppeln Sie sie in dem Kalender, der dort läuft. sidekick bezeichnet sie als **Preview** und **Dev · Testumgebung**, und eine Anfrage von Dev trägt den Hinweis, dass Dev die Testumgebung von time cockpit ist. Wenn Sie Dev nicht verwenden, können Sie es entfernen: Wählen Sie es unter **Manuell koppeln mit Adresse und Token** bei **Wo läuft er?** und klicken Sie auf **Adresse entfernen**, solange kein Kalender damit gekoppelt ist. Ein Update von sidekick fügt es nicht wieder hinzu.
- Eine neue Kopplung brauchen Sie nur in einem anderen Browser, nachdem Sie den Kalender in sidekick widerrufen haben, oder wenn der Browser die für die Seite gespeicherten Daten verloren hat, zum Beispiel nach dem Löschen der Websitedaten.

### Manuell koppeln mit Adresse und Token

Verwenden Sie das manuelle Koppeln mit einer Version von sidekick, die noch nicht per Klick koppeln kann. In den Einstellungen des Kalenders und im Reiter **Koppeln** von sidekick ist es unter **Manuell koppeln mit Adresse und Token** eingeklappt.

#### In sidekick: Token erstellen

1. Öffnen Sie sidekick und wechseln Sie zum Reiter **Koppeln**.
2. Klappen Sie unter **Gekoppelte Kalender** den Bereich **Manuell koppeln mit Adresse und Token** auf. Er enthält das Formular **Neuen Kalender koppeln**.
3. Wählen Sie unter **Wo läuft er?** die Adresse, unter der Sie time cockpit im Browser öffnen. Während der Preview ist das `https://web-preview.timecockpit.com`. Die Liste enthält die Adressen von time cockpit. Um eine andere Adresse zu koppeln, wählen Sie den letzten Eintrag der Liste und fügen die Adresse aus der Adresszeile Ihres Browsers ein. sidekick übernimmt nur den Origin, also Schema, Hostname und Port, und verwirft den Pfad. Unter **Bezeichnung (optional)** können Sie einen Namen eingeben.
4. Klicken Sie auf **Token erstellen**. Ein Token gilt nur für diese Adresse. Es läuft nicht ab, sondern gilt, bis Sie den Kalender widerrufen. sidekick zeigt es nur einmal an, höchstens zehn Minuten lang.
5. Kopieren Sie **Adresse von sidekick** (meist `http://127.0.0.1:41337`) und **Token** mit den Schaltflächen **Kopieren**. Spätestens nach zehn Minuten verschwindet das Token aus dem Fenster und lässt sich nicht mehr anzeigen, tragen Sie es also gleich im Kalender ein.

sidekick speichert nur einen Hash des Tokens, nie das Token selbst. Wenn Sie das Token verlieren, erstellen Sie ein neues.

#### Im Kalender: Adresse und Token eintragen

1. Öffnen Sie den Zeiterfassungskalender im time cockpit Web-Client unter `https://web-preview.timecockpit.com`, in einem Browser auf demselben Rechner.
2. Öffnen Sie das Zahnrad **Einstellungen**.
3. Wählen Sie unter **Signale** die Option **time cockpit sidekick**.
4. Klappen Sie **Manuell koppeln mit Adresse und Token** auf.
5. Fügen Sie die Adresse in **Adresse von sidekick** und das Token in **Token** ein. Der Kalender akzeptiert nur eine Adresse von sidekick auf diesem Computer, `http://127.0.0.1:` oder `http://localhost:` gefolgt vom Port; das Token sendet er nirgendwo anders hin. Bei jeder anderen Adresse meldet er **Geben Sie die Adresse von sidekick auf diesem Computer ein, zum Beispiel http://127.0.0.1:41337.** und testet oder speichert sie nicht.
6. Klicken Sie auf **Verbindung testen**. Erreicht der Kalender sidekick, zeigt er **Verbunden mit**, gefolgt vom Namen des Geräts. Nach zu vielen ungültigen Tokens dieser Adresse nimmt sidekick eine Minute lang keine Anfragen an; der Test sagt das dann, und Sie versuchen es eine Minute später noch einmal.
7. Klicken Sie auf **Speichern**.

Ihr Browser fragt möglicherweise, ob die time cockpit Seite auf Geräte in Ihrem lokalen Netzwerk zugreifen darf. Erlauben Sie es; sonst blockiert der Browser die Verbindung zu sidekick.

### sidekick in den Einstellungen des Kalenders

Unter **Signale** in den Einstellungen des Kalenders wählen Sie die Signalquelle: **Keine**, **time cockpit sidekick** oder **Klassischer Signaltracker**. Neben **time cockpit sidekick** öffnet **Mehr über sidekick** den [Überblick](ueberblick.md). Die Einstellungen koppeln nicht; unter der Auswahl zeigen sie den Stand der Kopplung:

- **Noch nicht gekoppelt**: der Hinweis, dass der rechte Bereich durchs Installieren und Koppeln führt, und **In der Leiste einrichten**. Die Schaltfläche speichert die Einstellungen mit sidekick als Quelle, schließt den Dialog und wechselt zum rechten Bereich.
- **Mit sidekick gekoppelt**: mit einem Status dahinter, wenn sidekick nicht antwortet, und **Kopplung entfernen**. Das Entfernen löscht das Token in diesem Browser sofort; der Kalender meldet dann, dass die Kopplung nur in diesem Browser entfernt ist. Ganz widerrufen lässt sie sich im Reiter **Koppeln** von sidekick (siehe [Einen gekoppelten Kalender widerrufen](#einen-gekoppelten-kalender-widerrufen)).
- **Kopplung nicht mehr gültig**: sidekick akzeptiert diesen Browser nicht mehr. **Zum Koppeln** führt zum rechten Bereich, wo Sie erneut koppeln; **Kopplung entfernen** löscht das Token in diesem Browser.
- Während im rechten Bereich ein Koppeln läuft, zeigen die Einstellungen, worauf es wartet.

**Manuell koppeln mit Adresse und Token** bleibt darunter eingeklappt; siehe [Manuell koppeln mit Adresse und Token](#manuell-koppeln-mit-adresse-und-token).

### Den sidekick-Bereich ausblenden

Wenn Sie sidekick nicht verwenden möchten, klicken Sie unten im rechten Bereich unter **Lieber ohne sidekick arbeiten?** auf **Leiste ausblenden**. Der Kalender liest dann nicht mehr bei sidekick, und der Bereich verschwindet; sidekick selbst läuft weiter und zeichnet auf. Eine Meldung bietet **Rückgängig** an. Um den Bereich später wieder einzublenden, öffnen Sie das Zahnrad **Einstellungen**, wählen unter **Signale** die Option **time cockpit sidekick** und klicken auf **Speichern**.

## Verbindungsstatus im Kalender

Rechts oben im rechten Bereich des Kalenders zeigt ein Status, ob der Kalender sidekick erreicht. Wenn nicht, erklärt der rechte Bereich den Grund und bietet **Mit sidekick koppeln** an.

| Status | Was der rechte Bereich anzeigt | Was zu tun ist |
|---|---|---|
| **Noch nicht gekoppelt** | Woran haben Sie heute gearbeitet? sidekick weiß es. … mit den Schritten **sidekick installieren** und **Kalender koppeln**. | Installieren Sie sidekick bei Bedarf und klicken Sie auf **Mit sidekick koppeln** (siehe [Mit einem Klick koppeln](#mit-einem-klick-koppeln)). |
| **sidekick verbunden** | — | Nichts. Der Kalender liest die Signale. |
| **sidekick wird verbunden …** | — | Einen Moment warten. |
| **sidekick antwortet nicht** | Starten Sie sidekick auf diesem Computer. Der Kalender findet sidekick dann von selbst. Läuft sidekick bereits, koppeln Sie erneut. | Starten Sie sidekick, zum Beispiel über das Startmenü. Läuft es bereits, verwendet vielleicht ein anderes Programm seinen Port: Klicken Sie auf **Mit sidekick koppeln**. |
| **Kopplung nicht mehr gültig** | sidekick akzeptiert diesen Browser nicht mehr, etwa weil die Kopplung dort widerrufen wurde. Koppeln Sie erneut und klicken Sie in sidekick auf „Erlauben“. | Klicken Sie im rechten Bereich auf **Mit sidekick koppeln** und dann in sidekick auf **Erlauben**. |
| **Für eine andere Adresse gekoppelt** | Die Kopplung gilt nicht für … Koppeln Sie erneut und klicken Sie in sidekick auf „Erlauben“. (Statt … nennt der Kalender seine eigene Adresse.) | Klicken Sie im rechten Bereich auf **Mit sidekick koppeln** und dann in sidekick auf **Erlauben**. |
| **Browser blockiert sidekick** | Klicken Sie links neben der Adresszeile auf das Symbol und erlauben Sie den Zugriff auf das lokale Netzwerk. | Erlauben Sie den Zugriff auf das lokale Netzwerk für die time cockpit Seite im Browser, oder klicken Sie auf **Mit sidekick koppeln**: Der Browser fragt dann nach dem Zugriff. |

sidekick antwortet nur Adressen, die in seiner Adressliste stehen. Für jede andere Adresse erlaubt es dem Browser nicht, die Antwort zu lesen (CORS), und der Browser blockiert sie. Hat der Browser der time cockpit Seite den Zugriff auf das lokale Netzwerk erlaubt, stammt eine solche unlesbare Antwort von einem anderen Programm auf dem Port von sidekick oder von einem sidekick, das die Adresse nicht kennt; der Kalender zeigt dann **sidekick antwortet nicht**. Solange der Browser den Zugriff nicht erlaubt hat oder nicht mitteilt, ob er ihn erlaubt hat, zeigt der Kalender **Browser blockiert sidekick**. Nur eine Adresse aus der Liste von sidekick kann per Klick um eine Kopplung bitten. Steht die Adresse in der Liste, wurde das Token aber für eine andere Adresse erstellt, zeigt der Kalender stattdessen **Für eine andere Adresse gekoppelt**.

Bei **sidekick antwortet nicht** und **Browser blockiert sidekick** versucht es der Kalender von selbst erneut, zuerst nach 15 Sekunden und dann seltener, bis zu alle fünf Minuten. Nach einem Token-Problem versucht er es nicht erneut; klicken Sie auf **Mit sidekick koppeln** und bestätigen Sie die Anfrage in sidekick.

Kann sidekick seinen Standard-Port 41337 nicht verwenden, weil ein anderes Programm ihn belegt, nimmt es den nächsten freien Port. Der Kalender sucht sidekick beim Koppeln auf Port 41337 und den neun folgenden Ports. Antwortet ein gekoppeltes sidekick unter der gespeicherten Adresse nicht mehr, sucht der Kalender es ebenfalls dort und erkennt es an einem Nachweis seines Tokens für diesen Port, ohne das Token zu senden; die neue Adresse speichert er dann selbst, Sie müssen nichts neu eintragen. Das setzt ein aktuelles sidekick voraus; mit einem älteren klicken Sie im rechten Bereich auf **Mit sidekick koppeln**. Denselben Nachweis verlangt der Kalender von einem aktuellen sidekick auch unter der gespeicherten Adresse, bevor er sein Token sendet, beim Laden der Seite und nach einem Verbindungsverlust; ein Programm, das den Port von sidekick belegt hat, bekommt so kein Token. Passt der Nachweis nicht, sucht der Kalender auf den anderen Ports und zeigt sonst **Kopplung nicht mehr gültig**. Ein von Hand gekoppeltes Token sendet der Kalender ohne Nachweis, solange sidekick noch nie einen gezeigt hat, weil ältere Versionen von sidekick das nicht können; das Koppeln mit einem Klick vermeidet das. Das Menü des Symbols im Infobereich zeigt den Port (**Verbindung zum Kalender: an (Port …)**), und der Reiter **Koppeln** zeigt die aktuelle **Adresse von sidekick** unter **Manuell koppeln mit Adresse und Token**. Wenn Sie im Reiter **Koppeln** unter **Port und technische Details** einen Port außerhalb dieses Bereichs einstellen, tragen Sie die neue Adresse beim [manuellen Koppeln](#manuell-koppeln-mit-adresse-und-token) im Kalender ein.

## Das Menü des Symbols im Infobereich

Klicken Sie mit der rechten Maustaste auf das sidekick-Symbol im Infobereich, um sein Menü zu öffnen. Unter macOS klicken Sie auf das sidekick-Symbol in der Menüleiste.

- Die erste Zeile zeigt den Zustand: **Zeichnet auf**, **Gestoppt**, **Pausiert bis …** oder **Fehler: …**.
- **Verbindung zum Kalender: an (Port …)** zeigt, ob der Kalender die Signale lesen kann und über welchen Port.
- **sidekick öffnen…** öffnet das Fenster.
- **Notiz…** öffnet das Fenster für eine [Notiz](~/doc/sidekick/notizen.md).
- **Pause** pausiert die Aufzeichnung für **15 min**, **1 h** oder **bis Fortsetzen**. Während sidekick pausiert, beendet **Fortsetzen** die Pause.
- **Update auf … installieren und neu starten** erscheint, wenn ein Update bereitsteht.
- **Datenordner öffnen** öffnet den Ordner, in dem sidekick seine Daten speichert.
- **Beenden** beendet sidekick. Bis es wieder läuft, wird nichts aufgezeichnet.

Während die Aufzeichnung pausiert, zeichnet sidekick weiterhin auf, ob der Rechner lief und ob er gesperrt war. Deshalb erscheint eine Pause als Lücke in Ihrer Aktivität statt als Lücke im Tag.

## Einen gekoppelten Kalender widerrufen

Öffnen Sie in sidekick den Reiter **Koppeln**. Unter **Gekoppelte Kalender** hat jede Kopplung eine Zeile: **time cockpit** mit der Umgebung und der Adresse, dann der Browser (oder die Bezeichnung einer manuellen Kopplung), wann sie gekoppelt wurde und wann der Kalender zuletzt gelesen hat. Klicken Sie neben dem Kalender auf **Widerrufen**. Der Kalender kann danach nichts mehr lesen; um wieder zu lesen, muss er neu gekoppelt werden.

Um allen Kalendern das Lesen zu verbieten, deaktivieren Sie im Reiter **Koppeln** unter **Gekoppelte Kalender** die Option **Gekoppelte Kalender dürfen lesen**. Solange sie deaktiviert ist, liest kein Kalender; die Kopplungen bleiben erhalten.

## sidekick deinstallieren

Deinstallieren Sie time cockpit sidekick in den Windows-Einstellungen unter **Apps**. Das Deinstallationsprogramm beendet ein laufendes sidekick und entfernt das Programm und den Autostart-Eintrag. Unter macOS beenden Sie sidekick und ziehen die App aus dem Ordner **Programme** in den Papierkorb.

Ihre aufgezeichneten Daten bleiben in `%APPDATA%\timecockpit-sidekick` (unter macOS in `~/Library/Application Support/timecockpit-sidekick`). Um auch sie zu entfernen, löschen Sie sie vor der Deinstallation im Reiter **Daten** (siehe [Datenschutz und Daten in sidekick](~/doc/sidekick/datenschutz-und-daten.md)), oder löschen Sie den Ordner danach.
