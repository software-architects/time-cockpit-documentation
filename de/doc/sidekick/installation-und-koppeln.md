---
title: time cockpit sidekick installieren und koppeln
description: time cockpit sidekick unter Windows oder macOS herunterladen und installieren, mit dem Zeiterfassungskalender koppeln und Verbindungsprobleme lösen.
en_page: doc/sidekick/installation-and-pairing.md
---
# sidekick installieren und koppeln

> [!WARNING]
> Early Preview: time cockpit sidekick befindet sich in einer frühen Vorschauphase. Funktionen, Bezeichnungen und Einrichtungsschritte können sich ohne Vorankündigung ändern. sidekick läuft unter Windows 10/11; die macOS-Version wird noch getestet. Während der Preview funktioniert sidekick nur mit `https://web-preview.timecockpit.com`. Feedback: [support@timecockpit.com](mailto:support@timecockpit.com)

Die Einrichtung von time cockpit sidekick besteht aus drei Schritten: sidekick installieren, in sidekick ein Token erstellen und Adresse und Token in den Einstellungen des Zeiterfassungskalenders eintragen.

## sidekick installieren

sidekick läuft unter Windows 10 und 11 (x64) und unter macOS (Apple Silicon und Intel). Die macOS-Version wird noch getestet; ihre Einschränkungen stehen unter [Installation unter macOS](#installation-unter-macos).

<p class="tc-download"><a class="btn btn-primary btn-lg" href="https://www.timecockpit.com/download/sidekick/TimeCockpit.Sidekick-win-Setup.exe"><i class="bi bi-windows" aria-hidden="true"></i>Für Windows herunterladen</a><span class="tc-download-group"><a class="btn btn-outline-primary btn-lg" href="https://www.timecockpit.com/download/sidekick/timecockpit-sidekick-mac-arm64.dmg"><i class="bi bi-apple" aria-hidden="true"></i>macOS (Apple Silicon)</a><a class="btn btn-outline-primary btn-lg" href="https://www.timecockpit.com/download/sidekick/timecockpit-sidekick-mac-x64.dmg"><i class="bi bi-apple" aria-hidden="true"></i>macOS (Intel)</a></span></p>

### Installation unter Windows

1. Laden Sie das Installationsprogramm [TimeCockpit.Sidekick-win-Setup.exe](https://www.timecockpit.com/download/sidekick/TimeCockpit.Sidekick-win-Setup.exe) herunter. Die Einstellungen des Kalenders verlinken dieselbe Datei (**sidekick herunterladen**).
2. Führen Sie das Installationsprogramm aus. Es installiert sidekick nur für Ihren Windows-Benutzer, braucht keine Administratorrechte und stellt keine Fragen. Das Programm wird nach `%LOCALAPPDATA%\TimeCockpit.Sidekick` installiert, und ein Eintrag im Startmenü wird angelegt.
3. Windows SmartScreen warnt möglicherweise vor dem Installationsprogramm, weil sidekick ein neues Programm ist. Das Installationsprogramm ist signiert. Um fortzufahren, klicken Sie auf **Weitere Informationen** und dann auf **Trotzdem ausführen**.
4. Nach der Installation startet sidekick, schaltet seinen Autostart ein und öffnet sein Fenster. Sein Symbol, das time cockpit Logo, erscheint im Infobereich der Taskleiste (eventuell ausgeblendet unter dem Pfeil). Ein Banner oben im Fenster fragt, ob sidekick Nutzungsdaten senden darf; bis Sie zustimmen, wird nichts gesendet (siehe [Nutzungsdaten](~/doc/sidekick/datenschutz-und-daten.md#nutzungsdaten)).

Das Schließen des Fensters beendet sidekick nicht; sidekick zeichnet im Hintergrund weiter auf. Um das Fenster wieder zu öffnen, doppelklicken Sie auf das Symbol oder wählen Sie in seinem Menü **sidekick öffnen…**.

### Installation unter macOS

> [!NOTE]
> Die macOS-Version wird noch getestet. Anders als die Windows-Version ist sie nicht signiert und aktualisiert sich nicht selbst.

1. Laden Sie das Disk-Image für Ihren Mac herunter: [Apple Silicon](https://www.timecockpit.com/download/sidekick/timecockpit-sidekick-mac-arm64.dmg) (M1 und neuer) oder [Intel](https://www.timecockpit.com/download/sidekick/timecockpit-sidekick-mac-x64.dmg). Welchen Chip Ihr Mac hat, zeigt **Über diesen Mac** im Apple-Menü.
2. Öffnen Sie die heruntergeladene `.dmg`-Datei und ziehen Sie **time cockpit sidekick** in den Ordner **Programme**.
3. Starten Sie sidekick aus dem Ordner **Programme**. Weil die App nicht signiert ist, blockiert macOS den ersten Start. Öffnen Sie **Systemeinstellungen** > **Datenschutz & Sicherheit**, klicken Sie neben dem Hinweis zu time cockpit sidekick auf **Dennoch öffnen** und bestätigen Sie mit **Öffnen**. Unter älteren macOS-Versionen können Sie stattdessen bei gedrückter Ctrl-Taste auf die App klicken und **Öffnen** wählen.
4. sidekick läuft in der Menüleiste, nicht im Dock. Klicken Sie auf sein Symbol in der Menüleiste, um sein Menü zu öffnen.
5. Damit sidekick Fenstertitel aufzeichnen kann, erlauben Sie sidekick die Bildschirmaufnahme unter **Systemeinstellungen** > **Datenschutz & Sicherheit** > **Bildschirmaufnahme**, beenden Sie sidekick und starten Sie es neu. Ohne diese Berechtigung zeichnet sidekick auf, welche Anwendung im Vordergrund war, aber keine Fenstertitel. sidekick macht keine Bildschirmfotos.

Einschränkungen der macOS-Version:

- Keine automatischen Updates. Zum Aktualisieren laden Sie das Disk-Image erneut herunter und ersetzen die App im Ordner **Programme**.
- Der Autostart funktioniert bei der nicht signierten App möglicherweise nicht zuverlässig. Wenn sidekick nach der Anmeldung nicht läuft, starten Sie es aus dem Ordner **Programme**.
- macOS verrät nicht, welche Anwendung das Mikrofon benutzt. sidekick zeichnet auf, dass das Mikrofon in Gebrauch war, und nennt die Besprechungsanwendung, deren Fenster zu dieser Zeit im Vordergrund war, falls es eine gab.
- Seit macOS 14.4 erhalten nur Apps mit Zugriff auf die Ortungsdienste WLAN-Namen. Ohne diesen Zugriff zeichnet sidekick keine WLAN-Namen auf.
- Die Daten werden in `~/Library/Application Support/timecockpit-sidekick` gespeichert.

### Autostart und Updates

- Der Autostart ist die Einstellung **Mit dem Betriebssystem starten** in sidekick unter **Einstellungen** im Bereich **Aufbewahrung und Start**.
- Unter Windows aktualisiert sich sidekick selbst. Es sucht eine Minute nach dem Start und danach alle vier Stunden nach einer neuen Version und lädt eine neue Version im Hintergrund herunter. Das Menü des Symbols im Infobereich bietet dann **Update auf … installieren und neu starten** an; sonst wird das Update beim nächsten Start installiert. Der Bereich **Version und Updates** in den Einstellungen zeigt den aktuellen Stand.

## sidekick mit dem Kalender koppeln

> [!WARNING]
> Während der Preview kann sidekick nur mit der Preview-Umgebung von time cockpit gekoppelt werden, `https://web-preview.timecockpit.com`. Das Koppeln mit `https://web.timecockpit.com` ist noch nicht möglich. Öffnen Sie den Zeiterfassungskalender unter `https://web-preview.timecockpit.com` und koppeln Sie diese Adresse. Die Umgebungen sind im [Release-Plan](~/doc/erste-schritte/web-client.md#release-plan) beschrieben.

Der Kalender darf die Signale nur mit einem Token lesen, das sidekick für die Adresse Ihres time cockpit erstellt hat, während der Preview `https://web-preview.timecockpit.com`.

### In sidekick: Token erstellen

1. Öffnen Sie sidekick und wechseln Sie zum Reiter **Koppeln**.
2. Klicken Sie unter **Gekoppelte Kalender** auf **+ Kalender koppeln**. Solange kein Kalender gekoppelt ist, ist das Formular **Neuen Kalender koppeln** bereits offen.
3. Wählen Sie unter **Wo läuft er?** die Adresse, unter der Sie time cockpit im Browser öffnen. Während der Preview ist das `https://web-preview.timecockpit.com`. Die Liste enthält die Adressen von time cockpit. Um eine andere Adresse zu koppeln, wählen Sie den letzten Eintrag der Liste und fügen die Adresse aus der Adresszeile Ihres Browsers ein. sidekick übernimmt nur den Origin, also Schema, Hostname und Port, und verwirft den Pfad. Unter **Bezeichnung (optional)** können Sie einen Namen eingeben.
4. Klicken Sie auf **Token erstellen**. Ein Token gilt nur für diese Adresse. Es läuft nicht ab, sondern gilt, bis Sie den Kalender widerrufen. sidekick zeigt es nur einmal an, höchstens zehn Minuten lang.
5. Kopieren Sie **Adresse von sidekick** (meist `http://127.0.0.1:41337`) und **Token** mit den Schaltflächen **Kopieren**. Spätestens nach zehn Minuten verschwindet das Token aus dem Fenster und lässt sich nicht mehr anzeigen, tragen Sie es also gleich im Kalender ein.

sidekick speichert nur einen Hash des Tokens, nie das Token selbst. Wenn Sie das Token verlieren, erstellen Sie ein neues.

### Im Kalender: Adresse und Token eintragen

1. Öffnen Sie den Zeiterfassungskalender im time cockpit Web-Client unter `https://web-preview.timecockpit.com`, in einem Browser auf demselben Rechner.
2. Öffnen Sie das Zahnrad **Einstellungen**.
3. Wählen Sie unter **Signale** die Option **Signale von time cockpit sidekick anzeigen**.
4. Fügen Sie die Adresse in **Adresse von sidekick** und das Token in **Token** ein.
5. Klicken Sie auf **Verbindung testen**. Erreicht der Kalender sidekick, zeigt er **Verbunden mit**, gefolgt vom Namen des Geräts.
6. Klicken Sie auf **Speichern**.

Ihr Browser fragt möglicherweise, ob die time cockpit Seite auf Geräte in Ihrem lokalen Netzwerk zugreifen darf. Erlauben Sie es; sonst blockiert der Browser die Verbindung zu sidekick.

Der Kalender zeigt Signale immer nur aus einer Quelle an. Wenn Sie sidekick wählen, werden die Signale des [klassischen Signal Trackers](~/doc/signal-tracker/ueberblick.md) nicht mehr angezeigt.

## Verbindungsstatus im Kalender

Rechts oben im rechten Bereich des Kalenders zeigt ein Status, ob der Kalender sidekick erreicht. Wenn nicht, erklärt der rechte Bereich den Grund.

| Status | Was der Kalender anzeigt | Was zu tun ist |
|---|---|---|
| **sidekick verbunden** | — | Nichts. Der Kalender liest die Signale. |
| **Verbinde mit sidekick …** | — | Einen Moment warten. |
| **sidekick läuft nicht** | Starten Sie time cockpit sidekick auf diesem Rechner. Der Kalender verbindet sich von selbst, sobald er läuft. | Starten Sie sidekick, zum Beispiel über das Startmenü. |
| **Token passt nicht zu sidekick** | Das Token in den Einstellungen des Kalenders fehlt oder passt nicht zu sidekick. Tragen Sie das Token aus sidekick ein und testen Sie die Verbindung. | Erstellen Sie in sidekick ein neues Token, tragen Sie es in den Einstellungen des Kalenders ein und klicken Sie auf **Verbindung testen**. |
| **Token gehört zu einer anderen Adresse** | Das Token wurde für eine andere Adresse gekoppelt. Koppeln Sie diese Adresse in sidekick und tragen Sie das neue Token in den Einstellungen des Kalenders ein. | Wählen Sie in sidekick die Adresse, unter der Sie time cockpit geöffnet haben, erstellen Sie ein Token und tragen Sie es im Kalender ein. |
| **Browser blockiert sidekick** | sidekick läuft, aber der Browser lässt diese Seite nicht darauf zugreifen. Erlauben Sie der Seite den Zugriff auf das lokale Netzwerk, oder koppeln Sie diese Adresse in sidekick. | Erlauben Sie den Zugriff auf das lokale Netzwerk für die time cockpit Seite im Browser. Hilft das nicht, koppeln Sie genau die Adresse dieser Seite in sidekick (siehe unten). |

sidekick antwortet nur Adressen, die in seiner Adressliste stehen. Für jede andere Adresse erlaubt es dem Browser nicht, die Antwort zu lesen (CORS), und der Browser blockiert sie, genauso wie bei verweigertem Zugriff auf das lokale Netzwerk. Deshalb kann das Koppeln der Adresse **Browser blockiert sidekick** beheben. Steht die Adresse in der Liste, wurde das Token aber für eine andere Adresse erstellt, zeigt der Kalender stattdessen **Token gehört zu einer anderen Adresse**.

Bei **sidekick läuft nicht** und **Browser blockiert sidekick** versucht es der Kalender von selbst erneut, zuerst nach 15 Sekunden und dann seltener, bis zu alle fünf Minuten. Nach einem Token-Problem versucht er es nicht erneut; tragen Sie das neue Token in den Einstellungen ein und klicken Sie auf **Verbindung testen**.

Kann sidekick seinen Standard-Port 41337 nicht verwenden, weil ein anderes Programm ihn belegt, nimmt es den nächsten freien Port. Das Menü des Symbols im Infobereich zeigt den Port (**Verbindung zum Kalender: an (Port …)**), und der Reiter **Koppeln** zeigt die aktuelle **Adresse von sidekick**. Tragen Sie die neue Adresse in den Einstellungen des Kalenders ein.

## Das Menü des Symbols im Infobereich

Klicken Sie mit der rechten Maustaste auf das sidekick-Symbol im Infobereich, um sein Menü zu öffnen. Unter macOS klicken Sie auf das sidekick-Symbol in der Menüleiste.

- Die erste Zeile zeigt den Zustand: **Zeichnet auf**, **Pausiert bis …** oder **Fehler: …**.
- **Verbindung zum Kalender: an (Port …)** zeigt, ob der Kalender die Signale lesen kann und über welchen Port.
- **sidekick öffnen…** öffnet das Fenster.
- **Pause** pausiert die Aufzeichnung für **15 min**, **1 h** oder **bis Fortsetzen**. Während sidekick pausiert, beendet **Fortsetzen** die Pause.
- **Update auf … installieren und neu starten** erscheint, wenn ein Update bereitsteht.
- **Datenordner öffnen** öffnet den Ordner, in dem sidekick seine Daten speichert.
- **Beenden** beendet sidekick. Bis es wieder läuft, wird nichts aufgezeichnet.

Während die Aufzeichnung pausiert, zeichnet sidekick weiterhin auf, ob der Rechner lief und ob er gesperrt war. Deshalb erscheint eine Pause als Lücke in Ihrer Aktivität statt als Lücke im Tag.

## Einen gekoppelten Kalender widerrufen

Öffnen Sie in sidekick den Reiter **Koppeln**. Klicken Sie unter **Gekoppelte Kalender** neben dem Kalender auf **Widerrufen**. Der Kalender kann danach nichts mehr lesen.

Um allen Kalendern das Lesen zu verbieten, öffnen Sie in sidekick **Einstellungen** und deaktivieren Sie im Bereich **Verbindung zum Kalender** die Option **Gekoppelte Kalender dürfen lesen**.

## sidekick deinstallieren

Deinstallieren Sie time cockpit sidekick in den Windows-Einstellungen unter **Apps**. Das Deinstallationsprogramm beendet ein laufendes sidekick und entfernt das Programm und den Autostart-Eintrag. Unter macOS beenden Sie sidekick und ziehen die App aus dem Ordner **Programme** in den Papierkorb.

Ihre aufgezeichneten Daten bleiben in `%APPDATA%\timecockpit-sidekick` (unter macOS in `~/Library/Application Support/timecockpit-sidekick`). Um auch sie zu entfernen, löschen Sie sie vor der Deinstallation im Reiter **Daten** (siehe [Datenschutz und Daten in sidekick](~/doc/sidekick/datenschutz-und-daten.md)), oder löschen Sie den Ordner danach.
