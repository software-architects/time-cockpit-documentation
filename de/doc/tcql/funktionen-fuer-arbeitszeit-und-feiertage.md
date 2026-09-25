---
title: TCQL-Funktionen - Arbeitszeit & Feiertage
description: Mit TCQL-Funktionen in time cockpit Sollarbeitszeit, verbleibende Urlaubswochen, Überstunden und tatsächliche Arbeitsstunden berechnen.
en_page: doc/tcql/functions-for-working-time-and-holidays.md
---
# Funktionen für Arbeitszeit und Feiertage (TCQL)

Seit Version 1.7 kann time cockpit die Sollarbeitszeit sowie Daten zum verbleibenden bezahlten Urlaub berechnen. Dieses Kapitel beschreibt die Funktionen, die time cockpit für solche Berechnungen in TCQL-Anweisungen oder Skripten enthält.

> [!NOTE]
> Beachten Sie, dass Sie diese Funktion nur in [TCQL-Abfragen](~/doc/tcql/ueberblick.md) verwenden können. Sie können sie nicht in [Ausdrücken](~/doc/tcql/ausdruckssprache.md), die im Speicher ausgewertet werden (z. B. wertabhängige Einfärbung im Zeiterfassungskalender), oder in berechneten Eigenschaften ([TimeCockpit.Data.DataModel.CalculatedProperty](/api/TimeCockpit.Data.DataModel.CalculatedProperty.html)) verwenden.

## RemainingVacationWeeks

Mit der Funktion `RemainingVacationWeeks` berechnen Sie den verbleibenden bezahlten Urlaub.

### Parameter

Parameter | Beschreibung
--- | ---
userUuid | ID des Benutzers, für den die Funktion das Ergebnis berechnet.
effectiveDate | Stichtag, für den die Funktion das Ergebnis berechnet.

### Beispiele

Die folgende TCQL-Abfrage zeigt den verbleibenden bezahlten Urlaub aller Benutzer in der Datenbank:

```
From U In UserDetail
Select New With
{
        .User = U,
        .RemainingPaidTimeOff = :RemainingVacationWeeks(U.APP_UserDetailUuid, #2011-12-31#)
}
```

Die folgende TCQL-Abfrage zeigt den verbleibenden bezahlten Urlaub des aktuellen Benutzers. Sie zeigt das Ergebnis für Ende Juni und Ende Dezember. Beachten Sie, dass das Beispiel [Environment.CurrentUser](~/doc/tcql/ausdruckssprache.md) verwendet, um den aktuellen time cockpit Benutzer zu ermitteln.

```
From U In UserDetail
Where U.UserDetailUuid = Environment.CurrentUser.UserDetailUuid
Select New With
{
        .RemainingPTO_2011_06 = :RemainingVacationWeeks(U.APP_UserDetailUuid, #2011-06-30#),
        .RemainingPTO_2011_12 = :RemainingVacationWeeks(U.APP_UserDetailUuid, #2011-12-31#)
}
```

## PlannedHoursOfWork

Mit der Funktion `PlannedHoursOfWork` berechnen Sie die Sollarbeitszeit eines Benutzers für einen bestimmten Zeitraum.

### Parameter

Parameter | Beschreibung
--- | ---
userUuid | ID des Benutzers, für den die Funktion das Ergebnis berechnet.
beginTime | Beginndatum/-zeit (inklusive), für die die Funktion das Ergebnis berechnet.
endTime | Enddatum/-zeit (inklusive), für die die Funktion das Ergebnis berechnet.
includeLumpSumOvertime | Gibt an, ob das Ergebnis die für den Benutzer definierte Überstundenpauschale enthalten soll.

### Beispiele

Die folgende TCQL-Abfrage vergleicht die Sollarbeitszeit mit der tatsächlichen Arbeitszeit:

```
From U In UserDetail
Select New With
{
        .User = U,
        .PlannedHoursOfWork = :PlannedHoursOfWork(U.UserDetailUuid, #2011-01-01#, #2011-12-31#, True),
        .ActualHoursOfWork = :ActualHoursOfWork(U.UserDetailUuid, #2011-01-01#, #2011-12-31#, True),
        .Deviation = :ActualHoursOfWork(U.UserDetailUuid, #2011-01-01#, #2011-12-31#, True) 
                - :PlannedHoursOfWork(U.UserDetailUuid, #2011-01-01#, #2011-12-31#, True)
}
```

## ActualHoursOfWork

Mit der Funktion ActualHoursOfWork berechnen Sie die tatsächlich geleisteten Arbeitsstunden eines Benutzers für einen bestimmten Zeitraum.

### Parameter

Parameter | Beschreibung
--- | ---
userUuid | ID des Benutzers, für den die Funktion das Ergebnis berechnet.
beginTime | Beginndatum/-zeit (inklusive), für die die Funktion das Ergebnis berechnet.
endTime | Enddatum/-zeit (inklusive), für die die Funktion das Ergebnis berechnet.
includeWeights | Gibt an, ob die Funktion Arbeitszeitgewichtungen berücksichtigt.

> [!NOTE]
> Einer Zeitbuchung können Sie über die Beziehung `APP_Timesheet.APP_WorkingTimeWeight` eine Gewichtung zuweisen. Die verfügbaren Gewichtungen pflegen Sie in der Entität `APP_WorkingTimeWeight`.

### Beispiele

Beispiele finden Sie im Abschnitt mit Beispielen im Kapitel [PlannedHoursOfWork](#plannedhoursofwork).

## Overtime

Mit der Funktion Overtime berechnen Sie die Überstunden eines Benutzers zu einem bestimmten Stichtag.

### Parameter

Parameter | Beschreibung
--- | ---
userUuid | ID des Benutzers, für den die Funktion das Ergebnis berechnet.
effectiveDate | Stichtag, für den die Funktion das Ergebnis berechnet.
includeWeights | Gibt an, ob die Funktion Arbeitszeitgewichtungen berücksichtigt.
includeLumpSumOvertime | Gibt an, ob das Ergebnis die für den Benutzer definierte Überstundenpauschale enthalten soll.

> [!NOTE]
> Einer Zeitbuchung können Sie über die Beziehung `APP_Timesheet.APP_WorkingTimeWeight` eine Gewichtung zuweisen. Die verfügbaren Gewichtungen pflegen Sie in der Entität `APP_WorkingTimeWeight`.

### Beispiele

Die folgende TCQL-Abfrage zeigt die Überstunden aller Benutzer in der Datenbank:

```
From U In UserDetail
Select New With
{
        .User = U,
        .Overtime = :Overtime(U.UserDetailUuid, #2011-12-31#, True, True)
}
```

## AverageHoursOfWorkPerDay
Mit der Funktion AverageHoursOfWorkPerDay berechnen Sie die durchschnittliche Sollarbeitszeit pro Arbeitstag eines Benutzers zu einem bestimmten Stichtag. Beispiele:

- Wochenarbeitszeit: Montag bis Freitag 7,7 Stunden<br/>
Ergebnis: 7,7 Stunden
- Wochenarbeitszeit: Montag bis Donnerstag 8 Stunden, Freitag 6 Stunden<br/>
Ergebnis: 7,6 Stunden
- Wochenarbeitszeit: Montag bis Mittwoch 4 Stunden<br/>
Ergebnis: 4 Stunden

### Parameter

Parameter | Beschreibung
--- | ---
userUuid | ID des Benutzers, für den die Funktion das Ergebnis berechnet.
effectiveDate | Stichtag, für den die Funktion das Ergebnis berechnet.

### Beispiele

Die folgende TCQL-Abfrage zeigt die durchschnittliche Arbeitszeit aller Benutzer in der Datenbank:

```
From U In UserDetail
Select New With
{
        .User = U,
        .HoursPerDay = :AverageHoursOfWorkPerDay(U.UserDetailUuid, #2011-12-31#)
}
```
