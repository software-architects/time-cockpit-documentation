---
title: Arbeitszeitanzeige - Soll- und Ist-Arbeitszeit
description: Zeigen Sie im Kalender von time cockpit die Soll- und Ist-Arbeitszeit pro Tag, Woche und Monat an, mit Details zur Berechnung.
en_page: doc/timesheet-calendar/working-time.md
---
# Arbeitszeit

Die Arbeitszeitanzeige zeigt die Soll-Arbeitszeit und die Ist-Arbeitszeit für den

- aktuellen Tag,
- die aktuelle Woche und
- den aktuellen Monat.

![Arbeitszeit](/doc/timesheet-calendar/images/wc-attendance-time-info.png "Arbeitszeit")

## Ermittlung von Soll- und Ist-Arbeitszeit
In den Kapiteln [Soll-Arbeitszeit](/doc/employee-time-tracking/working-time.html#planned-hours-of-work) und [Ist-Arbeitszeit](/doc/employee-time-tracking/working-time.html#actual-hours-of-work) finden Sie ausführliche Informationen dazu, wie die Zeiten in der Arbeitszeitanzeige ermittelt werden.

> [!NOTE]
> In dieser Dokumentation finden Sie ein Beispielskript, das zeigt, wie Sie [Feiertage für ein bestimmtes Jahr automatisch anlegen](/doc/scripting/add-holidays.html). Das Beispiel enthält alle üblichen Feiertage. Sie können es an Ihre konkreten Anforderungen anpassen.

<!-- ## Private Time Sheet Entries

> [!WARNING]
> Please consider that all versions after time cockpit 1.7 do not support hiding time sheets entries via the [TCQL expression](/doc/tcql/expression-language.html) configured in the options dialogue anymore. This function has been replaced by the significantly more powerful solution of working time weight (see chapter [actual hours of work](/doc/employee-time-tracking/working-time.html#actual-hours-of-work)). If you use the old function of private time sheet entries, a warning will appear if you start time cockpit for first time which will indicate to use working time weight in the future.

In time cockpit cockpit you have the possibility to enter private time sheet entries, which won’t be included in the actual hours of work (e.g. times for advanced training, travelling time without consideration to actual hours of work, etc.). If you want to use private time sheet entries, create a working time weight with 0 % (see chapter [actual hours of work](/doc/employee-time-tracking/working-time.html#actual-hours-of-work)).

If you want to include e.g. times you spend at the University for further education but don’t want them considered in the actual hours of work, assign the working time weight with 0 % to the time sheet entries.

![Private time](/doc/timesheet-calendar/images/private-time.png "Private time") -->
