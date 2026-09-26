---
title: Signal Tracker für Benutzeraktivität - Tastatur & Maus
description: Zeichnen Sie in time cockpit Tastatur- und Mausaktivität auf, um Arbeitszeit zu erkennen. Pausen werden automatisch erkannt.
en_page: doc/signal-tracker/user-activity.md
---
# Signal Tracker für Benutzeraktivität

Der Signal Tracker für Benutzeraktivität zeichnet auf, wann Sie an Ihrem Computer arbeiten, indem er Ihre Tastatur- und Mausaktivität verfolgt. Wir zeichnen nicht auf, was Sie tippen, sondern nur, dass Sie gerade die Tastatur verwenden. Dieser Signal Tracker hilft Ihnen, Zeiten zu erkennen, in denen Sie nicht am Computer waren, z. B. in der Mittagspause oder in Besprechungen.

## Gesammelte Daten

Der Signal Tracker für Benutzeraktivität zeichnet den Abstand zwischen Ihren Tastatur- und Mausinteraktionen auf. Überschreitet der Abstand einen festgelegten Wert, geht der Signal Tracker davon aus, dass Sie gerade nicht an Ihrem Computer arbeiten.

Zeiten, in denen der Signal Tracker für Benutzeraktivität nicht lief, werden im Zeiterfassungskalender so dargestellt, als hätten Sie nicht an Ihrem Computer gearbeitet.

## Konfigurationsparameter des Signal Trackers

Parametername | Datentyp| Beschreibung
--- | --- | ---
Abfrageintervall (Interval)| Zeitspanne | Intervall, in dem der Signal Tracker Tastatur- und Mausaktivität aufzeichnet. Die Einstellung `00:00:10` legt fest, dass der Tracker die Aktivität der Eingabegeräte alle 10 Sekunden aufzeichnet. Kleinere Werte können die Leistung Ihres Computers verringern, größere Werte führen zu ungenaueren Werten. Wir empfehlen eine Zeitspanne von 10 Sekunden oder mehr.
Inaktivitätszeitgrenze (ActivityTimeout)| Zeitspanne | Das Inaktivitätslimit legt fest, ab wann ein Zeitraum ohne Tastatur- oder Mausinteraktion als Pause gilt. Die Einstellung `00:00:30` bedeutet, dass nach 30 Sekunden ohne Benutzerinteraktion eine Pause beginnt. Die Pause dauert, bis die nächste Benutzerinteraktion aufgezeichnet wird.	Kleinere Werte können die Leistung Ihres Computers verringern, größere Werte führen zu ungenaueren Werten. Wir empfehlen eine Zeitspanne von 30 Sekunden oder mehr.

> [!NOTE]
> Beachten Sie, dass Sie das Inaktivitätslimit auch in den Optionen des Zeiterfassungskalenders ändern können. Die Einstellung im Signal Tracker legt das genaueste Inaktivitätsintervall fest, das Sie für spätere Auswertungen verwenden können.
