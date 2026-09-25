---
title: Netzwerkfehler - Verbindungsprobleme beheben
description: Netzwerkfehler in time cockpit beheben. Lösen Sie Verbindungsprobleme zu SQL Server, Timeouts und Probleme mit der Firewall-Konfiguration.
en_page: doc/getting-started/troubleshooting/network-related-error.md
---
# Netzwerkbezogener oder instanzspezifischer Fehler

## Mögliche Exceptions im Fehlerdialog
* ```SqlException (0x80131904)``` A network-related or instance-specific error occurred while establishing a connection to SQL Server
* ```SqlException (0x80131904)```: Connection Timeout Expired
* ```WebException```: The remote name could not be resolved: 'management.timecockpit.com'
* ```EndpointNotFoundException```: There was no endpoint listening

## Fehlerursache
Dieser Fehler weist darauf hin, dass Sie nicht mit dem Internet verbunden sind oder Ihre Internetverbindung instabil ist.

## Lösung
Prüfen Sie Ihre Netzwerkverbindung und Ihre Firewall-Einstellungen - möglicherweise ist der ausgehende Port 1433 blockiert. 
