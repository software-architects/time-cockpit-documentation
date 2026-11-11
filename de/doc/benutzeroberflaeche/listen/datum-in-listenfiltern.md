---
title: Datum in Listenfiltern - Schnellauswahl und dynamisches Datum
description: Häufige Datumswerte mit einem Klick setzen und Listenfilter mit dynamischen Datumswerten wie dem Vormonat aktuell halten, die das Listenprofil neu berechnet.
en_page: doc/ui/lists/filter-dates.md
---
# Datum in Listenfiltern

Jedes Datumsfeld im time cockpit Web-Client öffnet einen Kalender. Unter dem Kalender setzt die Schnellauswahl häufige Datumswerte mit einem Klick. Im Filter einer Liste sind diese Werte dynamisch: Ein [Listenprofil](~/doc/ui/lists/entityview-profiles.md) speichert die Regel statt des Datums, deshalb wird der Filter bei jedem Öffnen der Liste neu berechnet.

## Schnellauswahl

Die Schnellauswahl eines Felds, das einen Tag auswählt, steht in zwei Spalten, das frühere Datum jedes Paars links:

| Links | Rechts |
|-------|--------|
| **Gestern** | **Heute** |
| **Anfang der Woche** | **Ende der Woche** |
| **Monatsanfang** | **Monatsende** |
| **Anfang Vormonat** | **Ende Vormonat** |

- Unter jedem Namen steht der Wochentag und das Datum, für das der Eintrag heute steht.
- Der erste Tag der Woche richtet sich nach Ihren Kultureinstellungen.
- **Heute**, **Monatsende** und **Ende Vormonat** zeigen die Taste, die im Datumsfeld dasselbe Datum setzt: **T**, **N** und **P** (siehe [Tastatur](#tastatur)).
- Ein Feld, das einen Monat auswählt, bietet **Vormonat** und **Dieser Monat**, ein Feld, das ein Jahr auswählt, **Vorjahr** und **Dieses Jahr**.
- Ein Eintrag, dessen Datum außerhalb des erlaubten Bereichs des Felds liegt, ist deaktiviert.
- Außerhalb von Listenfiltern, zum Beispiel in einem Formular, setzt die Schnellauswahl ein festes Datum.

## Dynamisches Datum in Listenfiltern

Im Filter einer Liste heißt die Schnellauswahl **Dynamisches Datum**. Ein Eintrag setzt ein dynamisches Datum:

- Das Datumsfeld zeigt das Datum kursiv und dahinter ein fx-Symbol. Der Tooltip nennt die Regel und das heutige Datum, zum Beispiel „Dynamisch: Erster Tag des Vormonats (derzeit Do., 01.10.2026)“.
- Der gewählte Eintrag trägt ein Häkchen. Unter der Schnellauswahl steht, dass das Datum bei jedem Öffnen der Liste neu berechnet wird.
- Wenn Sie ein Listenprofil speichern, speichert es die Regel. Ein Profil, dessen **Von** auf den ersten und dessen **Bis** auf den letzten Tag des Vormonats steht, zeigt immer den vorigen Monat.

**Festes Datum verwenden** neben dem Titel behält das aktuelle Datum und entfernt die Regel. Auch ein im Kalender gewählter Tag oder ein eingetipptes Datum ersetzt ein dynamisches Datum durch ein festes.

## Eigene Regel

Für andere dynamische Datumswerte klappen Sie unter der Schnellauswahl **Eigene Regel** auf. Sie liest sich wie ein Satz: ein Bezugspunkt, eine Anzahl, eine Einheit und **vor heute** oder **nach heute**. Die Bezugspunkte heißen wie die Einträge der Schnellauswahl, dazu kommen **Genau der Tag**, **Jahresanfang** und **Jahresende**. Bei der Anzahl 0 spielt die Richtung keine Rolle und ist deaktiviert.

| Dynamisches Datum | Bezugspunkt | Anzahl und Einheit | Richtung |
|-------------------|-------------|--------------------|----------|
| Vor 7 Tagen | **Genau der Tag** | 7 Tage | **vor heute** |
| Erster Tag des Monats vor drei Monaten | **Monatsanfang** | 3 Monate | **vor heute** |
| Letzter Tag der nächsten Woche | **Ende der Woche** | 1 Woche | **nach heute** |

Die eigene Regel gibt es in Listenfilter-Feldern, die einen Tag auswählen. Sie klappt von selbst auf, wenn ein Filter ein dynamisches Datum enthält, für das kein Eintrag der Schnellauswahl steht.

Erlaubt ein Feld nur einen bestimmten Bereich und ergibt eine eigene Regel oder ein Tastenkürzel heute ein Datum außerhalb davon, wird das Feld rot, und der Tooltip sagt „Das dynamische Datum liegt heute außerhalb des erlaubten Bereichs.“

## Tastatur

- **Alt** + **Pfeil nach unten** oder **F4** im Datumsfeld öffnet und schließt den Kalender.
- Bei geöffnetem Kalender wechselt **Tab** in die Schnellauswahl.
- **Esc** schließt den Kalender und kehrt in das Datumsfeld zurück.
- In einem Feld, das einen Tag auswählt, setzt **T** (oder **C**) das heutige Datum, **N** den letzten Tag dieses Monats und **P** den letzten Tag des Vormonats. Im Filter einer Liste setzen diese Tasten dasselbe dynamische Datum wie der Eintrag der Schnellauswahl, der sie zeigt; sonst setzen sie ein festes Datum.

## Verwandte Seiten

- [Listenprofile](~/doc/ui/lists/entityview-profiles.md): Filter, Spalten, Gruppierung und Sortierung einer Liste speichern
- [Listen gruppieren](~/doc/ui/lists/grouping.md): eine Liste gruppieren, Gruppen oder eine ganze Gruppierungsebene auf- und zuklappen
