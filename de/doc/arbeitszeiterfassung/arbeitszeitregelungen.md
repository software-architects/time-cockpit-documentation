---
title: Arbeitszeitregelungen - Österreich und Deutschland
description: "Arbeitszeitgrenzen für Österreich und Deutschland in time cockpit konfigurieren: Verstöße, Pausen, Ruhezeiten sowie Tages- und Wochengrenzen prüfen."
en_page: doc/employee-time-tracking/working-time-regulations.md
---
# Arbeitszeitregelungen

Seit Version 1.39 bietet time cockpit vordefinierte Regeln für Österreich und Deutschland, mit denen Sie Verstöße gegen Arbeitszeitgrenzen in einem bestimmten Zeitraum ermitteln können.

> [!WARNING]
> Bitte beachten Sie, dass time cockpit nicht sicherstellt, dass gesetzliche Verpflichtungen erfüllt werden. Es liegt in der Verantwortung des Unternehmens, das time cockpit einsetzt, die geltenden Arbeitszeitgrenzen zu ermitteln und durchzusetzen. time cockpit hilft lediglich dabei, mögliche Verstöße gegen Arbeitszeitgrenzen aufzuzeigen.

## Vordefinierte Arbeitszeitgrenzen

Für Österreich und Deutschland werden vordefinierte Arbeitszeitgrenzen mitgeliefert.

> [!WARNING]
> Bitte beachten Sie, dass time cockpit nicht für die Richtigkeit dieser Regeln haftet.

- Grenzen für Österreich (Stand 5.12.2023)
  - Maximale Arbeitszeit pro Tag ohne Reisezeit [h]: 12h
  - Maximale tägliche Arbeitszeit inklusive aktiver Reisezeit: 12h
  - Maximale tägliche Arbeitszeit inklusive aktiver und passiver Reisezeit: -
  - Maximale Arbeitszeit pro Woche inklusive aktiver Reisezeit [h]: 60h
  - Maximale Arbeitszeit pro Woche inklusive aktiver und passiver Reisezeit [h]: -
  - Pausen: 30m nach 6h, Aufteilungsmöglichkeiten: 2x15m/3x10m
  - Frühester Beginn/Spätestes Ende
  - Ruhezeiten (Nachtruhe, Wochenendruhe, Feiertagsruhe)
  - Weitere Informationen: 
    - [Arbeitszeit (WKO)](https://www.wko.at/arbeitszeit/uebersicht)
    - [Arbeitszeitrechner](https://ratgeber.wko.at/cgi-bin/expertred/enb.cgi?SHOWMODE=1&WIZARD=ARBEITSZEIT12&TRAEGER=DEFAULT&BEREICH=FRAU&FORTSCHRITT=5&LAYOUT=HELP)
- Grenzen für Deutschland (Stand 5.12.2023)
  - Maximale tägliche Arbeitszeit: 10h
  - Maximale wöchentliche Arbeitszeit: 48h
  - Pausen: 30m nach 6h, Aufteilungsmöglichkeit 2x15m. 45m nach 9h, Aufteilungsmöglichkeit 3x15m
  - Ruhezeiten (Nachtruhe, Wochenendruhe, Feiertagsruhe)
  - Weitere Informationen: 
    - [ArbZG Deutschland](https://www.gesetze-im-internet.de/arbzg/BJNR117100994.html)

> [!IMPORTANT]
> Die neuen Funktionen sind für bestehende Kunden standardmäßig nicht aktiviert. So unterbrechen wir keine bestehenden Prozesse. Wenn Sie die neuen Funktionen ausprobieren möchten oder wissen, dass Sie eine angepasste Logik für Arbeitszeitverstöße verwenden, wenden Sie sich bitte an support@timecockpit.com

**Erweiterte Arbeitszeitprüfung (Update Mai 2025)**

Mit dem Release vom Mai 2025 führt time cockpit mehrere wichtige Verbesserungen bei Arbeitszeitregelungen und der Prüfung von Ruhezeiten ein – insbesondere bei Verwendung des Web-Clients:

- time cockpit kann jetzt **Verstöße gegen Ruhezeiten automatisch prüfen**, darunter:
  - **Nachtruhe**
  - **Wochenendruhe**
  - **Feiertagsruhe**
- Sie können außerdem einen **frühesten Beginn** und ein **spätestes Ende** festlegen.  
  Arbeitet ein Benutzer außerhalb dieses Zeitrahmens, wird ein Verstoß ausgelöst.

---

**Flexible Arbeitszeitgrenzen**

Bisher konnten Arbeitszeitgrenzen nur global festgelegt werden (z. B. dieselbe Grenze für alle Mitarbeiter).  
Mit dem Update vom Mai 2025 können Sie jetzt **individuelle Arbeitszeitgrenzen pro Benutzer** direkt in der Konfiguration der **Wochenarbeitszeit** festlegen.

Das ermöglicht:

- Benutzerspezifische Grenzen für Gruppen wie Lehrlinge oder Teilzeitkräfte  
  (in Österreich gelten z. B. für Lehrlinge besondere gesetzliche Grenzen).
- Nahtlose Übergänge – wird ein Lehrling 18, legen Sie einfach einen neuen Eintrag in der Wochenarbeitszeit mit einer anderen oder ohne Grenze an.
- **Historische Genauigkeit** – time cockpit ermittelt automatisch die richtige Grenze für den gewählten Zeitraum und ermöglicht so eine präzise nachträgliche Prüfung.

---

**Verbesserte Konfigurationsmöglichkeiten**

Bisher konnten Einstellungen wie die anzuwendenden Prüfungen (z. B. Nachtruhe, Höchststunden) nur global festgelegt werden.  
Mit diesem Update können Sie diese Prüfungen jetzt **für jede Arbeitszeitgrenze einzeln festlegen** und haben damit deutlich mehr Kontrolle und Flexibilität.


> [!WARNING]
> Bitte beachten Sie, dass time cockpit mit Stand Dezember 2023 NICHT prüft, ob die durchschnittliche WÖCHENTLICHE Arbeitszeit über einen Durchrechnungszeitraum (DE/AT: 16 Wochen) überschritten wurde.

Standardmäßig prüft time cockpit keine Arbeitszeitgrenzen. Sie müssen die Prüfungen einmalig in den globalen Einstellungen aktivieren. Außerdem müssen Sie die Prüfungen aktivieren, die tatsächlich durchgeführt werden sollen. Sie können also bestimmte Prüfungen deaktivieren, wenn sie für Ihr Unternehmen nicht gelten.

![Arbeitszeitgrenzen](/doc/employee-time-tracking/images/working-time-limits-web.png "Arbeitszeitgrenzen")

Standardmäßig berücksichtigt time cockpit Reisezeiten nicht, wenn es die Überschreitung einer Arbeitszeitgrenze ermittelt. Eine Zeitbuchung gilt als Reise, wenn zumindest ein Verkehrsmittel ausgewählt ist.

Standardmäßig berücksichtigt time cockpit keine Dauerbuchungen. Das liegt daran, dass Dauerbuchungen keine Beginn- oder Endzeit haben. Deshalb kann time cockpit nicht feststellen, ob innerhalb eines bestimmten Zeitraums eine Pause eingehalten wurde.

Im Modul **Benutzer** finden Sie im Abschnitt **Arbeitszeit** unter **Arbeitszeitverstöße** die Verstöße. Sie können nach einem bestimmten Benutzer filtern und einen Zeitraum auswählen, der auf Verstöße geprüft werden soll.

> [!NOTE]
> Bitte beachten Sie, dass time cockpit standardmäßig den aktuellen Monat als Zeitraum auswählt. time cockpit erweitert den gewählten Zeitraum jedoch so, dass er am Anfang und am Ende immer volle Wochen umfasst. Andernfalls könnten Verstöße gegen eine wöchentliche Arbeitszeitgrenze übersehen werden. Überschreitungen der Arbeitszeit pro Tag werden nur für den genau im Filter gewählten Zeitraum berechnet.

![Arbeitszeitverstöße](/doc/employee-time-tracking/images/working-time-violations-web.png "Arbeitszeitverstöße")

## Konfigurierbare Arbeitszeitgrenzen

Wenn die Arbeitszeitgrenzen für Österreich und Deutschland für Sie nicht gelten, können Sie in time cockpit eigene Arbeitszeitgrenzen konfigurieren. Das machen Sie unter **Arbeitszeitgrenzen** im Modul **Benutzer**. Damit die Arbeitszeitgrenze funktioniert, müssen Sie vier Parameter festlegen:

- Maximale Arbeitszeit pro Tag: die maximale Anzahl an Arbeitsstunden an einem Tag
- Maximale Arbeitszeit pro Woche: die maximale Anzahl an Arbeitsstunden in einer Woche
- Pause nach: die Anzahl an Stunden, nach der die erste Pause gemacht werden muss
- Mindestpausenlänge: die Mindestanzahl an Minuten nach „Pause nach“

> [!NOTE]
> Anders als bei den vorkonfigurierten Grenzen für Österreich und Deutschland können Sie keine Aufteilungsmöglichkeiten für Pausen konfigurieren.

## Eigene Arbeitszeitgrenzen

Reichen weder die österreichischen/deutschen noch konfigurierte Grenzen aus, können Sie eigene Regeln umsetzen. Das kann nötig sein, wenn Sie eigene Arbeitszeitgewichtungen haben, die nicht zur Arbeitszeit zählen, oder wenn in Ihrem Unternehmen komplexe Regeln für die Aufteilung von Pausen gelten. Wenn Sie wissen möchten, wie Sie eigene Arbeitszeitgrenzen umsetzen können, wenden Sie sich bitte an [support@timecockpit.com](mailto:support@timecockpit.com).
