---
title: SqlCeLockTimeoutException - Datenbanksperre beheben
description: SqlCeLockTimeoutException in time cockpit beheben. Lösen Sie Sperren der lokalen Datenbank durch einen Neustart von Vollclient und Signal Tracker.
en_page: doc/getting-started/troubleshooting/sql-ce-lock-timeout-exception.md
---
# SqlCeLockTimeoutException

## Fehlerursache
Bei einer ```SqlCeLockTimeoutException``` besteht eine Sperre auf Ihrer lokalen time cockpit-Client-Datenbank. Eine Sperre kann entstehen, wenn mehrere Prozesse (Signal Tracker, time cockpit-Vollclient) gleichzeitig auf dieselben Daten zugreifen.

## Lösung
Um die Sperre aufzuheben, müssen Sie den time cockpit-Vollclient und seinen Signal Tracker beenden und neu starten. 
