---
title: Signal Tracker für Netzwerkverbindungen
description: Zeichnen Sie LAN-Verbindungen und WLANs in time cockpit auf und erkennen Sie Arbeitsorte anhand verbundener und verfügbarer Netzwerke.
en_page: doc/signal-tracker/network-connections.md
---
# Signal Tracker für Netzwerkverbindungen	

Der Signal Tracker für Netzwerkverbindungen zeichnet alle Netzwerke auf, mit denen der Computer verbunden war, sowie alle verfügbaren WLANs. Wenn Sie mit Ihrem Laptop an verschiedenen Orten arbeiten, helfen Ihnen die Namen der verbundenen und verfügbaren Netzwerke dabei, den Kunden zu erkennen, für den Sie gearbeitet haben.

## Gesammelte Daten

Der Signal Tracker für Netzwerkverbindungen zeichnet alle x Sekunden alle Netzwerke auf, mit denen Ihr Computer verbunden ist, sowie alle verfügbaren WLANs.

Wenn Sie den Signal Tracker beenden oder pausieren, zeichnet er keine Netzwerkverbindungen auf.

## Konfigurationsparameter des Signal Trackers

Parametername | Datentyp | Beschreibung
--- | --- | ---
Query interval (`Interval`) | Zeitspanne | Intervall, in dem der Signal Tracker Netzwerkverbindungen aufzeichnet. Die Einstellung `00:01:00` legt fest, dass der Tracker Netzwerkverbindungen jede Minute aufzeichnen soll. Kleinere Werte können die Performance Ihres Computers verringern, größere Werte führen zu ungenaueren Werten. Wir empfehlen eine Zeitspanne von 1 Minute.
