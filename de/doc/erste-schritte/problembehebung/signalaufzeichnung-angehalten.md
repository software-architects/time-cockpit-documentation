---
title: Signalaufzeichnung angehalten - Lösung
description: Angehaltene Signalaufzeichnung in time cockpit nach einer Änderung der Systemzeit beheben. Systemuhr korrigieren und Signal Tracker neu starten.
en_page: doc/getting-started/troubleshooting/signal-tracking-suspended.md
---
# Die Signalaufzeichnung wurde angehalten

## Mögliche Exception

MessageSecurityException

## Fehlerursache
Aufgrund einer unerwarteten Änderung der Systemzeit wurde die Signalaufzeichnung angehalten, um bestehende Signaldaten nicht zu überschreiben oder zu beschädigen.

## Lösung
1. Schließen Sie die time cockpit-Anwendung und den Signal Tracker
1. Korrigieren Sie Ihre Systemuhr
1. Starten Sie die time cockpit-Anwendung und den Signal Tracker erneut?  
   Warten Sie 10 Minuten und prüfen Sie, ob time cockpit wieder Signale aufzeichnet
