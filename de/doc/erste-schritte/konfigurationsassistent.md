---
title: Konfigurationsassistent - Ersteinrichtung
description: So richten Sie time cockpit mit dem Konfigurationsassistenten ein. Legen Sie Sprache, Anmeldedaten, Synchronisierung und Signal Tracker fest.
en_page: doc/getting-started/configuration-wizard.md
---
# Konfigurationsassistent

> [!NOTE]
> Nach der erfolgreichen Installation von time cockpit führt Sie der Konfigurationsassistent durch die ersten Schritte der Konfiguration. Wenn Sie den Konfigurationsassistenten abbrechen, zeigt time cockpit ihn beim nächsten Start erneut an.

> [!NOTE]
> Für die Installation und Konfiguration von time cockpit benötigen Sie einen Internetzugang. Im Kapitel [Systemanforderungen](~/doc/erste-schritte/installationsanleitung.md#systemanforderungen) finden Sie die Anforderungen an die Firewall-Konfiguration. Kann time cockpit keine Verbindung zu SQL Azure herstellen, lässt sich der Konfigurationsassistent nicht abschließen.

## Schritt 1 - Sprache wählen

Wählen Sie zuerst die Sprache Ihrer time cockpit-Installation. Sie können die Sprache später jederzeit im Optionen-Dialog ändern.

![Konfigurationsassistent Schritt 1](/doc/getting-started/images/configuration-step-1.png "Konfigurationsassistent Schritt 1")

## Schritt 2 - Benutzername und Passwort eingeben

Geben Sie Benutzername und Passwort Ihres time cockpit-Benutzers ein. Sie müssen Ihre Anmeldedaten nur beim ersten Start von time cockpit eingeben. Sie werden verschlüsselt auf Ihrem Computer gespeichert, sodass Sie sie nicht erneut eingeben müssen.

Wenn Sie noch kein time cockpit haben, können Sie auf der [time cockpit-Website](https://www.timecockpit.com) ein neues anlegen. Nachdem Ihr Konto erfolgreich angelegt wurde, erhalten Sie eine E-Mail mit Installations- und Konfigurationsanweisungen.

![Konfigurationsassistent Schritt 2](/doc/getting-started/images/configuration-step-2.png "Konfigurationsassistent Schritt 2")

## Schritt 3 - Lokalen Speicherort wählen

Wählen Sie den Speicherort Ihrer lokalen time cockpit-Datenbank. time cockpit ist offlinefähig, ähnlich wie Microsoft Office Outlook. Wenn Sie Internetzugang haben, werden Änderungen automatisch alle 15 Minuten synchronisiert, und Sie können die Synchronisierung auch manuell auslösen. Sie können time cockpit aber auch offline verwenden.

Weitere technische Informationen zum lokalen Speicher finden Sie im Kapitel [Systemarchitektur](~/doc/erste-schritte/systemarchitektur.md).

> [!NOTE]
> Time cockpit unterstützt keine Netzlaufwerke als Speicherort.

![Konfigurationsassistent Schritt 3](/doc/getting-started/images/configuration-step-3.png "Konfigurationsassistent Schritt 3")

## Schritt 4 - Namen des Geräts eingeben

Sie können time cockpit auf mehreren Geräten installieren (z. B. auf Ihrem Desktop-Computer im Büro, Ihrem Notebook und Ihrem Computer zu Hause). time cockpit synchronisiert Änderungen automatisch auf alle Ihre Geräte, daher muss jedes Gerät einen eindeutigen Namen haben. Wenn Sie time cockpit auf einem neuen Gerät installieren, geben Sie einen neuen, eindeutigen Namen ein. time cockpit schlägt Ihren Computernamen vor. Wenn time cockpit auf diesem Gerät bereits früher installiert war, können Sie den Namen des Geräts in der Liste "existing devices" auswählen.

> [!NOTE]
> Wenn Sie einen bestehenden Gerätenamen verwenden, achten Sie darauf, dass Sie nicht zwei Geräte mit demselben Namen gleichzeitig verwenden. time cockpit funktioniert sonst nicht korrekt und kann beim Synchronisieren von zwei Geräten mit demselben Namen sogar Daten verlieren.

![Konfigurationsassistent Schritt 4](/doc/getting-started/images/configuration-step-4.png "Konfigurationsassistent Schritt 4")

## Schritt 5 - Signaldatenpasswort wählen

Wir müssen Ihren time cockpit-Benutzernamen und Ihr Passwort (als Hash) auf unseren Servern speichern, damit Sie sich bei unseren Diensten anmelden können. Ihre automatisch aufgezeichneten Signaldaten (siehe [Signal Tracker](/doc/signal-tracker/overview.html)) halten wir aber für noch schützenswerter. Deshalb können Sie ein eigenes Passwort wählen, mit dem Ihre Signaldaten verschlüsselt werden.

Anders als das Passwort für die Anmeldung an unseren Servern wird das Signaldatenpasswort nie an unsere Server gesendet. Ihre Signaldaten lassen sich daher auf keinem anderen Computer als Ihrem eigenen entschlüsseln. Wenn Sie mehrere Geräte verwenden, müssen Sie es auf jedem Gerät eingeben, auf dem Sie time cockpit verwenden. Wenn Sie den Silverlight-Web-Client verwenden, müssen Sie Ihre Signaldaten ebenfalls eingeben.

> [!WARNING]
> Da Ihr Passwort nicht auf unseren Servern gespeichert wird, bewahren Sie Ihr Signaldatenpasswort bitte sorgfältig auf. Wenn Sie das Passwort verlieren, verlieren Sie alle gespeicherten Signale. Es gibt keine Möglichkeit, sie wiederherzustellen.

![Konfigurationsassistent Schritt 5](/doc/getting-started/images/configuration-step-5.png "Konfigurationsassistent Schritt 5")

## Schritt 6 - Synchronisierung

time cockpit hat nun alle nötigen Informationen und synchronisiert die Daten vom Server. Das dauert üblicherweise nur wenige Minuten. Danach können Sie den Konfigurationsassistenten abschließen. time cockpit ist jetzt einsatzbereit.

![Konfigurationsassistent Schritt 6](/doc/getting-started/images/configuration-step-6.png "Konfigurationsassistent Schritt 6")

## Konfiguration zurücksetzen

In verschiedenen Situationen kann es nötig sein, die lokale Konfiguration eines time cockpit-Clients zurückzusetzen:

- Ein anderer time cockpit-Benutzer soll verwendet werden.
- Ein Gerät wurde lange nicht verwendet und ist nicht mehr mit den anderen Geräten Ihres Kontos kompatibel.
- Die lokale Datenbank wurde entfernt oder kann nicht mehr verwendet oder synchronisiert werden.

Beim nächsten Start der Anwendung nach dem Zurücksetzen der Konfiguration wird der Konfigurationsassistent angezeigt. So können Sie für diesen Client eine neue initiale Synchronisierung durchführen.

> [!WARNING]
> Beachten Sie, dass alle Daten, die auf dem Client angelegt oder geändert und noch nicht synchronisiert wurden, verworfen werden.

Sie setzen die Konfiguration zurück, indem Sie TimeCockpit.UI.exe mit dem folgenden Befehlszeilenparameter starten:

```
--reset-configuration
```

Der vollständige Befehl zum Zurücksetzen der Konfiguration einer Standardinstallation lautet zum Beispiel:

```
C:\Program Files\software architects\time cockpit\time cockpit 2010\TimeCockpit.UI.exe --reset-configuration
```

Nachdem die Konfiguration zurückgesetzt wurde, sollten Sie den Befehlszeilenparameter nicht mehr an die Anwendung übergeben, damit sie wieder normal arbeitet.

Alternativ können Sie die Konfiguration zurücksetzen, indem Sie die lokale Konfigurationsdatei und die Daten manuell löschen.

- **Konfigurationsdatei**: Löschen Sie Time Cockpit.config im Ordner `%LocalAppData%\software architects\time cockpit`.
- **Daten**: Der Standardspeicherort der Datenbank ist `%LocalAppData%\software architects\time cockpit\data`. Die Datei time cockpit.tic und der Ordner time cockpit blob store müssen entfernt werden. In früheren Versionen von time cockpit war der Standardspeicherort der Datenbank ein Ordner time cockpit in `My Documents`.
