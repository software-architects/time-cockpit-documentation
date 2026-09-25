---
title: Initiale Synchronisierung erzwingen - Lokale DB zurücksetzen
description: Erzwingen Sie eine initiale Synchronisierung in time cockpit, um die lokale Datenbank zurückzusetzen und Synchronisierungsfehler zu beheben.
en_page: doc/getting-started/troubleshooting/force-initial-sync.md
---
# Initiale Synchronisierung von time cockpit erzwingen

In manchen Fällen ist es nötig, für den Vollclient von time cockpit eine initiale Synchronisierung zu erzwingen. Dabei wird Ihre lokale Datenbank (Client-Datenbank) gelöscht und durch den aktuellen Stand der time cockpit-Serverdatenbank ersetzt. 
> [!NOTE]
> Beachten Sie, dass nicht synchronisierte Daten der Client-Datenbank nach einer initialen Synchronisierung verloren sind.

Beispiele, in denen eine initiale Synchronisierung nötig ist:
* Allgemeiner Fehler bei der Synchronisierung
* Seit mehr als zwei Monaten wurde keine Synchronisierung durchgeführt
* Das Gerät wurde als veraltet markiert

## So erzwingen Sie eine initiale Synchronisierung
1. Beenden Sie den Signal Tracker, falls er läuft: Klicken Sie mit der rechten Maustaste auf das time cockpit-Logo im Infobereich der Taskleiste (rechts unten neben der Uhr) und wählen Sie "Shutdown".

1. Setzen Sie Ihre time cockpit-Konfiguration zurück. 
   Dazu müssen Sie die Konfiguration löschen. Löschen Sie bitte alle Dateien im folgenden Verzeichnis: „C:\Users\[YourUserName]\AppData\Local\software architects\Time Cockpit“.

1. Starten Sie time cockpit. Der Konfigurationsassistent für die Ersteinrichtung führt Sie durch die Konfiguration. Danach sollten Sie time cockpit wie gewohnt verwenden können
