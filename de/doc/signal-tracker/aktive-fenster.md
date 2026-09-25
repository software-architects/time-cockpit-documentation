---
title: Signal Tracker für aktive Fenster
description: Zeichnen Sie in time cockpit aktive Applikationen und Fenstertitel auf. Sehen Sie, welche Programme Sie verwenden, um Projekte und Kunden zu erkennen.
en_page: doc/signal-tracker/active-windows.md
---
# Signal Tracker für aktive Fenster

Der Signal Tracker für aktive Fenster zeichnet das Programm auf, mit dem Sie gerade arbeiten. Zusätzlich zeichnet er den Titel des aktiven Fensters auf. Der Name des Programms und der Fenstertitel lassen oft auf den Kunden und das Projekt schließen, an dem Sie gerade arbeiten.

## Gesammelte Daten

Der Signal Tracker für aktive Fenster zeichnet alle x Sekunden das Programm, mit dem Sie gerade arbeiten, und den Titel des aktiven Fensters auf.

Wenn Sie den Signal Tracker beenden oder pausieren, zeichnet er die verwendeten Programme und aktiven Fenster nicht auf.

## Konfigurationsparameter des Signal Trackers

Parametername | Datentyp| Beschreibung
--- | --- | ---
Query interval (Interval) | Timespan | Intervall, in dem der Signal Tracker das aktive Programm und den Titel des aktiven Fensters aufzeichnet. Die Einstellung `00:00:02` legt fest, dass der Tracker Programm und Fenstertitel alle 2 Sekunden aufzeichnet. Kleinere Werte können die Leistung Ihres Computers verringern, größere Werte führen zu ungenaueren Werten. Wir empfehlen eine Zeitspanne von 2 Sekunden.
