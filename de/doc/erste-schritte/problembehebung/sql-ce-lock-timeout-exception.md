---
title: SqlCeLockTimeoutException - Datenbanksperre beheben
description: SqlCeLockTimeoutException in time cockpit beheben. Lösen Sie Sperren der lokalen Datenbank durch einen Neustart von Fullclient und Signal Tracker.
en_page: doc/getting-started/troubleshooting/sql-ce-lock-timeout-exception.md
---
# SqlCeLockTimeoutException

## Fehlerursache
Bei einer ```SqlCeLockTimeoutException``` besteht eine Sperre auf Ihrer lokalen time cockpit-Client-Datenbank. Eine Sperre kann entstehen, wenn mehrere Prozesse (Signal Tracker, time cockpit-Fullclient) gleichzeitig auf dieselben Daten zugreifen.

## Lösung
Um die Sperre aufzuheben, müssen Sie den time cockpit-Fullclient und seinen Signal Tracker beenden und neu starten. 
