---
title: Überstunden und Urlaub auszahlen - Anleitung
description: So zahlen Sie in time cockpit Überstunden und Urlaub aus. Nutzen Sie Korrekturen des Arbeitszeitsaldos und Urlaubsansprüche für Auszahlungen an Mitarbeiter.
keywords: [überstundenkorrektur, arbeitszeitsaldo, stichtag, tagesbeginn, folgetag, austrittsdatum]
en_page: doc/getting-started/howtos/pay-off-overtime-vacation.md
---
# Überstunden/Urlaub auszahlen

## So zahlen Sie Überstunden aus
Um Überstunden auszuzahlen, legen Sie eine neue Korrektur des Arbeitszeitsaldos an. Beim Anlegen einer neuen Korrektur des Arbeitszeitsaldos füllen Sie folgende Felder aus:

| Feld           | Beschreibung                                                        |
| -------------- | ------------------------------------------------------------------- |
| Benutzer       | der Mitarbeiter, dem Überstunden ausgezahlt werden                    |
| Stichtag       | das Datum, ab dessen Tagesbeginn die Korrektur gilt                  |
| Overtime       | der gewünschte Überstundensaldo zum Stichtag                          |

> [!IMPORTANT]
> Der **Stichtag** einer Korrektur des Arbeitszeitsaldos gilt ab Beginn des angegebenen Tages. Soll der Saldo zum Ende eines Tages korrigiert werden, müssen Sie als **Stichtag** den Folgetag verwenden.

### Beispiel: Überstunden zum Monatsende auszahlen
Tim Smith hat Ende April 2017 44 Überstunden und möchte zu diesem Zeitpunkt 24 Stunden ausgezahlt bekommen. Dazu legen Sie eine Korrektur des Arbeitszeitsaldos mit dem **Stichtag** 1.5.2017 und einem **Overtime**-Wert von 20 Stunden (44 - 24) an.

### Beispiel: Saldo am letzten Beschäftigungstag auf 0 setzen
Scheidet ein Mitarbeiter zum 15.07. aus und soll der Arbeitszeitsaldo am Ende dieses Tages 0 Stunden betragen, legen Sie die Korrektur mit dem **Stichtag** 16.07. und einem **Overtime**-Wert von 0 Stunden an. Die Korrektur gilt ab 00:00 Uhr am 16.07. und setzt damit den Saldo zum Ende des 15.07. auf 0 Stunden.


## So zahlen Sie Urlaub aus
Um Urlaub auszuzahlen, legen Sie einen negativen Urlaubsanspruch an. Beim Anlegen eines neuen Urlaubsanspruchs füllen Sie folgende Felder aus:

| Feld                | Beschreibung                                                         |
| ------------------- | -------------------------------------------------------------------- |
| Benutzer            | der Mitarbeiter, dem Urlaub ausgezahlt wird                          |
| Entstehungsdatum    | das gewünschte Datum des Urlaubsanspruchs                            |
| Anzahl Wochen       | gewünschte Anzahl an Wochen, die ausgezahlt werden                   |

### Beispiel
Tim Smith hat Ende Juni 2017 2 Wochen Urlaub und möchte diese 2 Wochen ausgezahlt bekommen, weil sein Dienstverhältnis mit Juni 2017 endet. In diesem Fall legen Sie einen Urlaubsanspruch mit **Anzahl Wochen** -2 und **Entstehungsdatum** 30.6.2017 an.

