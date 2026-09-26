---
title: Signaldetails - Aktivitäten analysieren
description: "Analysieren Sie Signaldaten im Signaldetailbereich von time cockpit: Applikationen, geänderte Dateien, Fenstertitel, Schlagwörter und Netzwerke."
en_page: doc/timesheet-calendar/signal-details.md
---
# Signaldetails

Der Signaldetailbereich zeigt Details zu den gesammelten Signaldaten an (siehe auch [Signal Tracker](~/doc/signal-tracker/ueberblick.md)).

time cockpit zeigt im Signaldetailbereich die folgenden zusätzlichen Informationen an:

- Applikationen (listet die verwendeten Applikationen auf)
- Geänderte Dateien (listet die geänderten Dateien auf)
- Fenstertitel (listet die Applikationsfenster auf, die im Fokus waren)
- Schlagwörter ([Schlagwortwolke](http://en.wikipedia.org/wiki/Tag_cloud))
- LAN Verbindungen
- Verfügbare WLANs

## Mit dem Signaldetailbereich arbeiten

Der Signaldetailbereich zeigt Informationen zum aktuell ausgewählten Zeitraum an. Wenn Sie eine Zeitbuchung auswählen, zeigt der Signaldetailbereich Details zu den Signalen an, die im entsprechenden Zeitraum aufgezeichnet wurden. Wenn Sie keinen Zeitraum auswählen, zeigt der Signaldetailbereich die Details aller Signale an, die an diesem Tag aufgezeichnet wurden.

Jede Signalkategorie (Applikationen, geänderte Dateien …) im Signaldetailbereich lässt sich zuklappen. Das ist besonders hilfreich, wenn Sie auf Geräten mit wenig Bildschirmfläche arbeiten. time cockpit zeigt für jede Signalkategorie nur die wichtigsten Elemente an, also jene, mit denen Sie die meiste Zeit verbracht haben. Bei Histogrammen können Sie zwischen den Detailstufen Niedrig, Mittel und Hoch wählen. Die Schlagwortwolke zeigt ein Schlagwort umso größer an, je mehr Zeit Sie damit verbracht haben.

![Detailstufe ändern](/doc/timesheet-calendar/images/change-detail-level.png "Detailstufe ändern")

> [!NOTE]
> In der Schlagwortwolke können Sie die Detailstufe entweder im Kontextmenü ändern (vergleiche Histogramme) oder mit **STRG** und dem Mausrad.

Um Informationen darüber zu liefern, wann Sie was getan haben, arbeitet der Signaldetailbereich mit der Spur für kombinierte Aktivität im Zeiterfassungskalender zusammen. Sie können im Signaldetailbereich ein Element auswählen (z. B. einen Balken in der Signalkategorie Applikationen), und time cockpit zeigt den Zeitraum an, in dem Sie die betreffende Applikation verwendet haben. Wenn Sie weitere Balken bei gedrückter **STRG**-Taste auswählen, können Sie mehrere Balken auswählen.

Wenn Sie mit der Maus über einen einzelnen Balken fahren, zeigt ein Tooltip die Dauer der Applikation an, über der sich der Mauszeiger gerade befindet. Wenn Sie mehrere Applikationen auswählen, zeigt time cockpit die Summe der Dauer rechts unten in der Statusleiste an.

![Ausgewählte Signaldetails](/doc/timesheet-calendar/images/signal-detail-pane-interaction-selected.png "Ausgewählte Signaldetails")

Wenn Sie in der Spur für kombinierte Aktivität einen Zeitraum auswählen, zeigt der Signaldetailbereich nur Informationen zu den Signalen an, die im ausgewählten Zeitraum aufgezeichnet wurden. Der ausgewählte Zeitraum wird in der Spur für kombinierte Aktivität als schwarzer Balken am linken Rand der Spur dargestellt. Sie können nun im Signaldetailbereich ein Element auswählen (z. B. Microsoft Office Outlook), und time cockpit zeigt Ihnen nur das Vorkommen des ausgewählten Signals im ausgewählten Zeitraum an.

![Ausgewählte Signaldetails](/doc/timesheet-calendar/images/signal-detail-pane-interaction.png "Ausgewählte Signaldetails")

## Applikationen

Die Applikationen, die Sie im Laufe eines Tages auf einem Gerät verwendet haben, werden in der Kategorie Applikationen im Signaldetailbereich als [Histogramm](https://en.wikipedia.org/wiki/Histogram) dargestellt. Es zeigt die Daten, die der [Signal Tracker für aktive Fenster](~/doc/signal-tracker/aktive-fenster.md) aufgezeichnet hat.

Die Länge eines Balkens im Histogramm gibt an, wie lange eine Applikation im Vordergrund und im Fokus war. Programme im Hintergrund (z. B. Programme ohne Fokus oder Hintergrunddienste) werden nicht berücksichtigt.

![Signaldetails zu Applikationen](/doc/timesheet-calendar/images/applications.png "Signaldetails zu Applikationen")

## Geänderte Dateien

Das [Histogramm](https://en.wikipedia.org/wiki/Histogram) der geänderten Dateien zeigt die Dateien, die Sie angelegt oder geändert haben. Die Daten für dieses Histogramm liefert der [Signal Tracker für geänderte Dateien](~/doc/signal-tracker/geaenderte-dateien.md).

Das Anlegen oder Ändern einer Datei ist per Definition kein exakter Zeitpunkt. Daher verknüpft time cockpit die Änderung einer Datei mit der Applikation, die während der Änderung im Vordergrund und im Fokus war (siehe auch [Applikationen](#applikationen)). So kann time cockpit eine zusammenhängende Dauer berechnen, in der Sie an einer Datei gearbeitet haben.

![Geänderte Dateien](/doc/timesheet-calendar/images/changed-files.png "Geänderte Dateien")

## Fenstertitel

Fenstertitel werden als [Histogramm](https://en.wikipedia.org/wiki/Histogram) dargestellt. Die Daten für dieses Histogramm liefert der [Signal Tracker für aktive Fenster](~/doc/signal-tracker/aktive-fenster.md).

Die Länge eines Balkens im Histogramm gibt an, wie lange ein Fenster im Vordergrund und im Fokus war. Programme im Hintergrund (z. B. Programme ohne Fokus oder Hintergrunddienste) werden nicht berücksichtigt. Wenn Sie mit der Maus über einen ausgewählten Fenstertitel fahren, zeigt time cockpit an, wie lange Sie die Applikation verwendet haben. Wenn Sie mehrere Fenstertitel auswählen, zeigt time cockpit die Summe der Dauer rechts unten in der Statusleiste an.

![Fenstertitel](/doc/timesheet-calendar/images/window-titles.png "Fenstertitel")

## Schlagwörter

Die Schlagwörter werden als [Schlagwortwolke](https://en.wikipedia.org/wiki/Tag_cloud) dargestellt. Sie fasst die Daten aller anderen Kategorien zusammen (Applikationen, Fenstertitel, geänderte Dateien …) und erhält Daten von allen anderen Signal Trackern.

Die Schriftgröße eines Begriffs in der Schlagwortwolke steht für die Dauer des entsprechenden Signals. Je größer ein Begriff in der Schlagwortwolke ist, desto länger waren Sie damit beschäftigt. Wie in den anderen Signalkategorien im Signaldetailbereich können Sie auch in der Schlagwortwolke mehrere Begriffe auswählen. Wenn Sie mit der Maus über einen ausgewählten Fenstertitel fahren, zeigt time cockpit an, wie lange Sie die Applikation verwendet haben. Wenn Sie mehrere Fenstertitel auswählen, zeigt time cockpit die Summe der Dauer rechts unten in der Statusleiste an.

![Schlagwörter](/doc/timesheet-calendar/images/keywords.png "Schlagwörter")

## LAN Verbindungen

Die LAN-Verbindungen werden als [Histogramm](https://en.wikipedia.org/wiki/Histogram) dargestellt. Es zeigt, mit welchen LAN-Verbindungen ein Gerät, an dem Sie gearbeitet haben, im Laufe eines Tages verbunden war. Die Daten liefert der [Signal Tracker für Netzwerkverbindungen](~/doc/signal-tracker/netzwerkverbindungen.md).

Die Länge eines Balkens im Histogramm gibt an, wie lange Sie mit einer verfügbaren Verbindung verbunden waren. Wie bei allen anderen Signalkategorien gilt: Wenn Sie im Signaldetailbereich ein Netzwerk auswählen, wird der Zeitraum, in dem Sie mit dem Netzwerk verbunden waren, in der Spur für kombinierte Aktivität im Zeiterfassungskalender markiert.

![LAN-Verbindungen](/doc/timesheet-calendar/images/lan-connections.png "LAN-Verbindungen")

## Verfügbare WLANs

Die WLAN-Netzwerke werden als [Histogramm](https://en.wikipedia.org/wiki/Histogram) dargestellt. Es zeigt, mit welchen WLAN-Netzwerken ein Gerät, an dem Sie gearbeitet haben, im Laufe eines Tages verbunden war. Die Daten liefert der [Signal Tracker für Netzwerkverbindungen](~/doc/signal-tracker/netzwerkverbindungen.md).

Die Länge eines Balkens im Histogramm gibt an, wie lange ein WLAN-Netzwerk verfügbar war. Dabei spielt es keine Rolle, ob Sie mit dem Netzwerk verbunden waren. time cockpit zeichnet nur die Verfügbarkeit auf.

> [!NOTE]
> Dieser Tracker ist sehr hilfreich, wenn Sie viel unterwegs sind und mit unterschiedlichen WLANs arbeiten. Viele Kunden haben ihren Namen in der WLAN-SSID. Daher lässt sich oft leicht feststellen, wo Sie waren, indem Sie nachsehen, mit welchen WLANs Sie verbunden waren.

![WLAN-Signale](/doc/timesheet-calendar/images/wifi-signals.png "WLAN-Signale")
