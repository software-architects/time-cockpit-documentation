---
title: CryptographicException - Konfigurationsassistent
description: CryptographicException in time cockpit beheben. Fehlende Schaltfläche Next im Konfigurationsassistenten durch Löschen ungültiger Schlüssel lösen.
en_page: doc/getting-started/troubleshooting/next-button-missing-configuration-wizard.md
---
# Fehler CryptographicException

Dieser Fehler kann sich in time cockpit auf zwei Arten äußern:

* Wenn beim Start von time cockpit der Fehlerdialog ```CryptographicException``` erscheint, müssen Sie den Windows-Datenschutzschlüssel von time cockpit löschen und eine initiale Synchronisierung durchführen. 

* Wenn Sie time cockpit erstmals einrichten, fehlt in einem Schritt des Konfigurationsassistenten möglicherweise die Schaltfläche "Next".

![Schaltfläche Next fehlt](/doc/getting-started/troubleshooting/images/next-button-missing-en.png "Schaltfläche Next fehlt")

## Fehlerursache
Der von Microsoft Windows bereitgestellte Datenschutzschlüssel von time cockpit ist nicht mehr gültig. Das kann z. B. passieren, wenn Ihr Windows-Profil auf einen anderen PC übertragen wurde. Der bestehende Schlüssel muss daher gelöscht werden, damit ein neuer, gültiger Schlüssel erstellt werden kann.

## Hintergrund
Zum Schutz Ihrer persönlichen Daten (z. B. Signale) verwendet time cockpit die Datenschutzfunktion von Windows. Damit ist sichergestellt, dass geschützte Daten nur mit Ihrem Windows-Profil gelesen werden können.

## Fehlerbehebung (Entfernen des ungültigen Datenschutzschlüssels)
1. Beenden Sie den Signal Tracker, falls er läuft

1. Laden Sie die folgende Befehlszeilenanwendung herunter:
https://statictimecockpit.blob.core.windows.net/utils/ResetTimeCockpitConfigurationEncryption.2015-04-09.zip

1. Wechseln Sie in den Ordner, in den Sie das Tool entpackt haben, starten Sie die Anwendung und beantworten Sie die Frage („Are you sure that you want to reset the time cockpit configuration encryption? [yes/no]“) mit „y“. Bestätigen Sie mit der Eingabetaste.

1. Die Anwendung versucht nun, den ungültigen Datenschutzschlüssel zu löschen. Das Ergebnis wird in eine automatisch erzeugte Ausgabedatei geschrieben, die im selben Verzeichnis angelegt wird, in dem die Befehlszeilenanwendung läuft.

1. In manchen Fällen kann die Anwendung den Datenschutzschlüssel nicht löschen. Dann müssen Sie den Schlüssel selbst im Datei-Explorer löschen. Prüfen Sie daher, ob der Schlüssel noch vorhanden ist. Pfad und Name des zu löschenden Schlüssels finden Sie in der Ausgabedatei an der Stelle „Possible TC key at“

1. Nachdem Sie den Schlüssel entfernt haben, müssen Sie Ihre time cockpit-Konfiguration zurücksetzen. Dazu müssen Sie die Konfiguration löschen. Löschen Sie bitte alle Dateien im folgenden Verzeichnis: „C:\Users[YourUserName]\AppData\Local\software architects\Time Cockpit“.

1. Starten Sie time cockpit. Der Konfigurationsassistent für die Ersteinrichtung führt Sie durch die Konfiguration. Danach sollten Sie time cockpit wie gewohnt verwenden können.
