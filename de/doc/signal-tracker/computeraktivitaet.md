---
title: Signal Tracker für Computeraktivität
description: Der Signal Tracker für Computeraktivität von time cockpit zeichnet auf, wann Ihr Computer ein- und ausgeschaltet wird, und zeigt so Betriebszeiten.
en_page: doc/signal-tracker/computer-activity.md
---
# Signal Tracker für Computeraktivität

Der Signal Tracker für Computeraktivität zeichnet auf, wann Ihr Computer ein- und ausgeschaltet wird. Diese Information ist besonders hilfreich, wenn Sie den Großteil Ihrer Arbeitszeit am PC verbringen. Die Zeitpunkte, zu denen Sie Ihren Computer ein- und ausschalten, markieren meist Beginn und Ende Ihres Arbeitstages.

## Gesammelte Daten

Der Signal Tracker für Computeraktivität zeichnet alle x Sekunden ein Signal auf, solange Ihr Computer eingeschaltet ist und der Signal Tracker läuft. Da der Signal Tracker beim Systemstart Ihres Computers gestartet wird, umfasst er üblicherweise den gesamten Zeitraum, in dem Ihr Computer läuft. Zeiten im Energiesparmodus werden nicht als aktiv gezählt.

Die Computeraktivität entspricht nicht der Zeit, in der Sie an Ihrem Computer arbeiten. Die Zeit, in der Sie tatsächlich an Ihrem Computer arbeiten, können Sie mit dem [Signal Tracker für Benutzeraktivität](~/doc/signal-tracker/benutzeraktivitaet.md) aufzeichnen. Er berücksichtigt, ob Sie die Maus bewegen oder die Tastatur verwenden. Erfolgt keine Eingabe, geht der [Signal Tracker für Benutzeraktivität](~/doc/signal-tracker/benutzeraktivitaet.md) davon aus, dass Sie gerade nicht arbeiten.

Zeiten, in denen der Signal Tracker für Computeraktivität nicht lief, werden im Zeiterfassungskalender so dargestellt, als wäre Ihr Computer nicht eingeschaltet gewesen.

## Konfigurationsparameter des Signal Trackers

Parametername | Datentyp | Beschreibung
--- | --- | ---
Abfrageintervall (Interval) | Zeitspanne | Intervall, in dem der Signal Tracker aufzeichnet, dass der Computer aktiv ist. Die Einstellung `00:00:10` legt fest, dass der Tracker alle 10 Sekunden aufzeichnet, dass der Computer aktiv ist. Kleinere Werte können die Leistung Ihres Computers verringern, größere Werte führen zu ungenaueren Werten. Wir empfehlen eine Zeitspanne von 10 Sekunden oder mehr.
