---
title: Arbeitszeit - Überstunden und Urlaub verwalten
description: Arbeitszeit erfassen, Überstunden berechnen, Urlaubsanspruch verwalten und Soll- mit Iststunden vergleichen in time cockpit. Inklusive Feiertagskalender.
en_page: doc/employee-time-tracking/working-time.md
---
# Arbeitszeit

> [!NOTE]
> Überprüft im April 2026.

Die Erfassung der Arbeitszeit ist die Kernfunktion von time cockpit. Auf Basis von Zeitbuchungen, Wochenarbeitszeit, Urlaubsanspruch und Feiertagen kann time cockpit für jeden Mitarbeiter Sollstunden, Iststunden, Überstunden und Resturlaub berechnen.

> [!NOTE]
> Der Vergleich von Ist- und Soll-Arbeitszeit sowie die Berechnung von Überstunden und Resturlaub sind optionale Funktionen von time cockpit und müssen nicht verwendet werden. Für diese Funktionen ist es notwendig, dass die gesamte Arbeitszeit erfasst wird.

Diese Seite behandelt:

- Wochenarbeitszeit mit Gültigkeitszeiträumen
- Urlaubsanspruch und Resturlaub
- Kalender der gesetzlichen Feiertage
- Soll- und Iststunden im Vergleich
- Überstunden und Korrekturen des Arbeitszeitsaldos

## Wochenarbeitszeit
Vor Version 1.7 von time cockpit konnte nur die aktuelle Soll-Arbeitszeit pro Woche gespeichert werden. Sie wurde verwendet, um im Zeiterfassungskalender ein Diagramm mit Soll- und Ist-Arbeitszeit anzuzeigen. Wurden die Sollstunden pro Woche geändert, änderten sich die berechneten Sollstunden pro Tag, Woche und Monat auch für die Vergangenheit.

Seit Version 1.7 unterstützt time cockpit eine historische Wochenarbeitszeit. Das heißt, Sie können time cockpit mitteilen, von wann bis wann die geplante Wochenarbeitszeit gilt. Die Wochenarbeitszeit verwalten Sie unter [Benutzer -> Wochenarbeitszeit](https://web.timecockpit.com/app/lists/entity/APP_WeeklyHoursOfWork).

Die Soll-Arbeitszeit wird pro Wochentag gespeichert. Sie können die Wochenarbeitszeit gleichmäßig auf alle Arbeitstage aufteilen (z. B. für Vollzeitbeschäftigte) oder für jeden Tag unterschiedliche Stunden festlegen (z. B. für einen Mitarbeiter, der nur am Montag und Dienstag arbeitet). Zur Kontrolle zeigt Ihnen time cockpit die Summe aller Tage an. Zusätzlich können Sie die inkludierten Überstunden pro Monat angeben (nur relevant, wenn Sie Überstunden berechnen möchten).

> [!WARNING]
> Bitte beachten Sie, dass sich die Gültigkeitszeiträume **nicht überschneiden dürfen**. Es ist nicht erlaubt, 38,5 Stunden Wochenarbeitszeit für 1.1.2013 bis 31.12.2013 und 40 Stunden Wochenarbeitszeit für 1.12.2013 bis 31.12.2014 anzugeben. Für Dezember 2013 wären beide Werte gültig, und time cockpit kann die Soll-Arbeitszeit nicht korrekt berechnen.

In [TCQL-Abfragen](~/doc/tcql/ueberblick.md) können Sie die Soll-Arbeitszeit eines Mitarbeiters mit der Funktion [AverageHoursOfWorkPerDay](~/doc/tcql/funktionen-fuer-arbeitszeit-und-feiertage.md#averagehoursofworkperday) berechnen.

## Urlaubsanspruch

Damit time cockpit den Resturlaub für jeden Mitarbeiter berechnen kann, müssen Sie den Urlaubsanspruch pro Mitarbeiter in Wochen erfassen. Wenn Sie einen neuen Mitarbeiter einstellen, können Sie zum Beispiel 5 Wochen Urlaubsanspruch für das erste Jahr eintragen. Ein Jahr später müssen Sie einen neuen Anspruch von 5 Wochen hinzufügen. Alternativ können Sie die Urlaubsansprüche aller Mitarbeiter am ersten Tag des Kalender- oder Geschäftsjahres erfassen.

Sie können für den Urlaubsanspruch auch negative Werte eingeben. Verwenden Sie negative Werte, wenn Sie nicht verbrauchten Urlaub auszahlen oder den aktuellen Urlaubsanspruch aus einem anderen Grund korrigieren müssen.

> [!NOTE]
> Bitte beachten Sie, dass time cockpit nicht sicherstellt, dass gesetzliche Verpflichtungen erfüllt werden.

Den Urlaubsanspruch verwalten Sie unter [Benutzer -> Urlaubsanspruch](https://web.timecockpit.com/app/lists/entity/APP_VacationEntitlement).

## Urlaubsverwaltung

> [!NOTE]
> Details zur Genehmigung von Abwesenheiten (Urlaub, Zeitausgleich, Krankenstand) finden Sie unter [Genehmigungsworkflow für Abwesenheiten](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md).


Über den Menüpunkt [Benutzer -> Urlaub](https://web.timecockpit.com/app/lists/entity/APP_Vacation) verwalten Sie die Urlaube Ihrer Mitarbeiter. Die Berechnung des Resturlaubs basiert auf Wochen. Mitarbeiter haben Anspruch auf eine bestimmte Anzahl von Urlaubswochen. In vielen Fällen ist es nicht möglich, Urlaub in Tagen statt in Wochen zu berechnen, weil Teilzeitbeschäftigte an jedem Tag unterschiedlich viele Stunden arbeiten oder weil sich die Wochenarbeitszeit ändert. Für die Berechnung des Resturlaubs gelten folgende Regeln:

Jeder Urlaubsverbrauch wird automatisch in Wochen umgerechnet. Dabei werden die Sollstunden jedes Tages berücksichtigt (siehe Wochenarbeitszeit). Auch nicht ganztägige Urlaube werden in Wochen umgerechnet.
Gesetzliche Feiertage während eines Urlaubs verringern den Resturlaub nicht. Wie Sie gesetzliche Feiertage automatisch mit einem Skript anlegen, lesen Sie unter [Feiertage mit Skripten hinzufügen](~/doc/scripting/feiertage-per-skript-hinzufuegen.md).
Urlaube, die als Sonderurlaub markiert sind, verringern den Resturlaub nicht. Mit Sonderurlaub können Sie zusätzlichen bezahlten Urlaub aus besonderen Anlässen wie Hochzeit oder Umzug gewähren.

> [!NOTE]
> In time cockpit können Sie außerdem Krankenstände und Zeitausgleich unter [Benutzer -> Krankenstand](https://web.timecockpit.com/app/lists/entity/APP_SickLeave) und [Benutzer -> Zeitausgleich](https://web.timecockpit.com/app/lists/entity/APP_CompensatoryTime) verwalten.

> [!NOTE]
> time cockpit kennt keine Regeln für den automatischen Verfall von Urlaubsansprüchen. Sie müssen das manuell lösen, indem Sie einen negativen Urlaubsanspruch eintragen.
Für die Abfrage von Urlaubsdaten stehen Ihnen in time cockpit zwei vordefinierte Listen zur Verfügung:

- Die Liste [Benutzer -> Urlaub](https://web.timecockpit.com/app/lists/entity/APP_Vacation) zeigt für einen Mitarbeiter den Verlauf von Urlaubsanspruch, Urlaubsverbrauch und Resturlaub.
- Die Liste [Benutzer -> Resturlaub](https://web.timecockpit.com/app/lists/APP_VacationPerEffectiveDateList) zeigt alle Mitarbeiter mit ihrem Resturlaub zu einem Stichtag.

In [TCQL-Abfragen](~/doc/tcql/ueberblick.md) können Sie den Resturlaub eines Mitarbeiters mit der Funktion [RemainingVacationWeeks](~/doc/tcql/funktionen-fuer-arbeitszeit-und-feiertage.md#remainingvacationweeks) berechnen.

## Gesetzliche Feiertage

Unter [Benutzer -> Feiertagskalender](https://web.timecockpit.com/app/lists/entity/APP_LegalHolidayCalendar) legen Sie einen oder mehrere Feiertagskalender an, zum Beispiel pro Land, pro Region oder für unternehmensspezifische Anforderungen.

Unter [Benutzer -> Feiertage](https://web.timecockpit.com/app/lists/entity/APP_LegalHoliday) pflegen Sie die konkreten Feiertage, die zu einem Kalender gehören.

Jedem Benutzer kann anschließend in **Benutzerdetails** ein Feiertagskalender zugewiesen werden. time cockpit verwendet den zugewiesenen Kalender bei der Berechnung von Soll-Arbeitszeit, Überstunden und urlaubsbezogenen Werten.

## Soll-Arbeitszeit

Seit Version 1.7 kann time cockpit die Soll-Arbeitszeit eines Mitarbeiters für einen bestimmten Zeitraum berechnen. Dabei werden folgende Daten verwendet:

- Die [Wochenarbeitszeit](#wochenarbeitszeit) des Mitarbeiters. time cockpit kann die Soll-Arbeitszeit des Mitarbeiters inklusive oder exklusive der inkludierten Überstunden pro Monat berechnen. Die Liste **Benutzer -> Soll-Ist-Vergleich** enthält beide Werte.
- [Verbrauchter Urlaub und Krankenstände](#urlaubsverwaltung) des Mitarbeiters.
- Alle [gesetzlichen Feiertage](#gesetzliche-feiertage), die in time cockpit erfasst sind.

> [!WARNING]
> Bitte beachten Sie, dass Eintritts- und Austrittsdatum bei der Berechnung nicht berücksichtigt werden. Es wird nur der Gültigkeitszeitraum der Wochenarbeitszeit verwendet.

Die Liste **Benutzer -> Soll-Ist-Vergleich** zeigt Ihnen Soll- und Ist-Arbeitszeit pro Mitarbeiter. Für Abweichungen zwischen Ist- und Sollstunden gelten folgende Regeln:

- Hat ein Mitarbeiter weniger Stunden gearbeitet als die berechneten Sollstunden exkl. inkludierter Überstunden, wird die Abweichung zwischen Iststunden und Sollstunden exkl. inkludierter Überstunden angezeigt (negativer Wert).
- Hat ein Mitarbeiter mehr Stunden gearbeitet als die berechneten Sollstunden inkl. inkludierter Überstunden, wird die Abweichung zwischen Iststunden und Sollstunden inkl. inkludierter Überstunden angezeigt (positiver Wert).
- Liegen die Iststunden zwischen den berechneten Sollstunden exkl. inkludierter Überstunden und den Sollstunden inkl. inkludierter Überstunden, beträgt die Abweichung 0.

In [TCQL-Abfragen](~/doc/tcql/ueberblick.md) können Sie die Soll-Arbeitszeit eines Mitarbeiters für einen bestimmten Zeitraum mit der Funktion [PlannedHoursOfWork](~/doc/tcql/funktionen-fuer-arbeitszeit-und-feiertage.md#plannedhoursofwork) berechnen.

## Ist-Arbeitszeit

Die Ist-Arbeitszeit wird berechnet, indem alle Zeitbuchungen summiert werden. Überschneiden sich Zeitbuchungen, werden die Stunden nicht doppelt gezählt. Legen Sie zum Beispiel eine Zeitbuchung von 9 bis 11 Uhr und eine weitere von 10 bis 12 Uhr an, werden nur 3 Stunden gezählt. Seit Version 1.7 können Sie optional für jede Zeitbuchung eine Arbeitszeitgewichtung angeben (z. B. 150 % für Zeitbuchungen an Samstagen und Sonntagen). Die verfügbaren Arbeitszeitgewichtungen verwalten Sie im Menüpunkt **Arbeitszeitgewichtung**. Bei der Berechnung der Ist-Arbeitszeit wird die Dauer einer Zeitbuchung in Stunden mit der Arbeitszeitgewichtung multipliziert (sofern vorhanden).

> [!NOTE]
> time cockpit bietet keine Funktionen, um Arbeitszeitgewichtungen automatisch auszuwerten. Sie müssen die Gewichtung für jede Zeitbuchung manuell angeben. Ihre konkreten Berechnungsregeln für Arbeitszeitgewichtungen können Sie in Skripten und Aktionen abbilden. Bei Fragen wenden Sie sich bitte an support@timecockpit.com.

In [TCQL-Abfragen](~/doc/tcql/ueberblick.md) können Sie die Ist-Arbeitszeit eines Mitarbeiters mit der Funktion [ActualHoursOfWork](~/doc/tcql/funktionen-fuer-arbeitszeit-und-feiertage.md#actualhoursofwork) abfragen.

## Überstundenberechnung

Die Liste **Benutzer -> Arbeitszeitsaldo** ähnelt der Liste **Benutzer -> Soll-Ist-Vergleich**. In **Benutzer -> Soll-Ist-Vergleich** können Sie einen Zeitraum für die Berechnung von Ist- und Soll-Arbeitszeit wählen, während **Benutzer -> Arbeitszeitsaldo** die Überstunden ab dem Eintrittsdatum des Mitarbeiters berechnet.

Bei der Berechnung der Überstunden werden die Arbeitszeitgewichtung und die [inkludierten Überstunden](#wochenarbeitszeit) berücksichtigt.

Über den Menüpunkt **Benutzer -> Korrektur Arbeitszeitsaldo** können Sie die Überstunden eines Mitarbeiters für ein bestimmtes Datum manuell festlegen (z. B. um unvollständige Zeitbuchungen zu korrigieren oder wenn Überstunden ausbezahlt werden).

> [!NOTE]
> Bitte beachten Sie, dass die Korrektur des Arbeitszeitsaldos den Überstundenstand zum angegebenen Datum darstellt. Wenn Sie 100 eingeben, bedeutet das, dass der Mitarbeiter zum angegebenen Datum 100 Überstunden hat. Es bedeutet nicht, dass die Überstunden um 100 Stunden verringert oder erhöht werden.

In [TCQL-Abfragen](~/doc/tcql/ueberblick.md) können Sie die Überstunden mit der Funktion [Overtime](~/doc/tcql/funktionen-fuer-arbeitszeit-und-feiertage.md#overtime) berechnen.

> [!WARNING]
> Bitte beachten Sie, dass Eintritts- und Austrittsdatum bei der Berechnung nicht berücksichtigt werden. Es wird nur der Gültigkeitszeitraum der Wochenarbeitszeit verwendet.

## Sonderfälle bei Soll-Arbeitszeit und Überstunden

Üblicherweise ändert sich die Wochenarbeitszeit zum Monatsende. Tragen Sie in diesem Fall beim ersten Datensatz den letzten Tag des Monats unter **Gültig bis** und beim zweiten Datensatz den ersten Tag des Folgemonats unter **Gültig ab** ein.

Ändert sich die Wochenarbeitszeit, wird die Überstundenberechnung komplexer. In diesem Fall teilt time cockpit die inkludierten Überstunden durch die Anzahl der Arbeitstage im Monat (unter Berücksichtigung von Urlaub, gesetzlichen Feiertagen und Krankenständen). Arbeitet ein Mitarbeiter in den ersten beiden Januarwochen 3 Tage pro Woche und in den letzten beiden Januarwochen 5 Tage pro Woche, ergeben sich ungefähr 7 Arbeitstage in der ersten und 12 Arbeitstage in der zweiten Januarhälfte. Die inkludierten Überstunden werden durch 19 (17 + 12) geteilt.

Zusätzlich können sich auch die inkludierten Überstunden geändert haben. Gibt es im obigen Beispiel in den ersten beiden Januarwochen 4 Stunden und in den letzten beiden Januarwochen 15 Stunden inkludierte Überstunden, berechnet time cockpit für die ersten beiden Wochen Überstunden von 7 / 19 * 4 und für die letzten beiden Wochen von 12 / 19 * 15. Bitte beachten Sie, dass time cockpit die Überstunden gleichmäßig auf alle Arbeitstage verteilt, auch wenn der Mitarbeiter zum Beispiel am Montag 6 Stunden, am Dienstag 8 Stunden usw. arbeitet.

Ein weiterer Sonderfall liegt vor, wenn ein Mitarbeiter wegen Urlaubs einen ganzen Monat lang keinen Arbeitstag hat. In diesem Fall gibt es keinen Arbeitstag mit Soll-Arbeitszeit und damit keine Tage, auf die die inkludierten Überstunden aufgeteilt werden können. Die Soll-Arbeitszeit für solche Monate ist immer 0 (inkl. und exkl. inkludierter Überstunden). Erfasst ein Mitarbeiter für einen solchen Monat Zeitbuchungen, zählt jede Stunde automatisch als Überstunde.
