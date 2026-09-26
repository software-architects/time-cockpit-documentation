---
title: Kunden-, Projekt- und Tätigkeitshierarchie
description: "Das hierarchische Datenmodell für Kunden, Projekte und Tätigkeiten in time cockpit: Stundensätze, Budgets, verrechenbare Projekte und globale Tätigkeiten."
en_page: doc/project-time-tracking/customer-project-task.md
---
# Hierarchie Kunde / Projekt / Tätigkeit

> [!NOTE]
> Überprüft im April 2026.

Diese Seite beschreibt die Standardhierarchie aus Kunde, Projekt und Tätigkeit, die Teil des Standarddatenmodells von time cockpit ist.

> [!NOTE]
> Sie können Entitäten des Standarddatenmodells erweitern, aber nicht löschen. Das ist notwendig, damit Upgrades des Standarddatenmodells möglich sind. Ihre Änderungen bleiben bei Upgrades unverändert erhalten. <br/><br/>Standardlisten und -formulare können Sie nicht direkt ändern. Wenn Sie eigene Listen und Formulare anlegen möchten, kopieren Sie die entsprechenden Definitionen im [Modul Anpassungen](~/doc/datenmodell-anpassung/ueberblick.md), passen Sie die Kopie an und verknüpfen Sie sie in Ihrer Navigation. Änderungen an Standardlisten und -formularen werden nicht automatisch in Ihre Kopien übernommen.

## Kunde

In time cockpit werden Kunden, Projekte und Tätigkeiten hierarchisch verwaltet. An der Spitze dieser Hierarchie steht der Kunde.

Kunden verwalten Sie unter [Verwaltung -> Kunden](https://web.timecockpit.com/app/lists/entity/APP_Customer).

Für jeden Kunden können Sie einen Standardstundensatz (`APP_HourlyRate`) eingeben. Wenn Sie in einem Projekt oder einer Tätigkeit keinen abweichenden Stundensatz eingeben, gilt der Stundensatz des Kunden für alle Projekte und Tätigkeiten, die dem Kunden zugeordnet sind.

## Projekt

Jeder Kunde kann mehrere Projekte haben.

Projekte verwalten Sie unter [Verwaltung -> Projekte](https://web.timecockpit.com/app/lists/entity/APP_Project).

Pro Projekt können Sie das Budget in Stunden (`APP_BudgetInHours`) und das monetäre Budget (`APP_Budget`) festlegen. Diese Felder können Sie für die Budgetkontrolle des Projekts verwenden.

Für jedes Projekt können Sie einen Stundensatz (`APP_HourlyRate`) festlegen, der vom Stundensatz des Kunden abweicht. Wenn Sie keinen abweichenden Satz eingeben, wird der Standardstundensatz des Kunden verwendet. Den tatsächlich gültigen Stundensatz eines Projekts finden Sie in der berechneten Eigenschaft `APP_HourlyRateActual.`

time cockpit unterscheidet zwischen verrechenbaren und nicht verrechenbaren Projekten (`APP_Billable`).

## Tätigkeiten

Jedes Projekt kann mehrere Tätigkeiten haben.

Tätigkeiten verwalten Sie unter [Verwaltung -> Tätigkeiten](https://web.timecockpit.com/app/lists/entity/APP_Task).

Für jede Tätigkeit können Sie das Budget in Stunden (`APP_BudgetInHours`) und das monetäre Budget (`APP_Budget`) festlegen. Diese Felder können Sie für die Budgetkontrolle eines Projekts verwenden.

Für jede Tätigkeit können Sie einen Stundensatz (`APP_HourlyRate`) festlegen, der vom Stundensatz des Projekts abweicht. Wenn Sie keinen abweichenden Satz eingeben, wird der Standardstundensatz des Projekts verwendet. Den tatsächlich gültigen Stundensatz einer Tätigkeit finden Sie in der berechneten Eigenschaft `APP_HourlyRateActual`.

Tätigkeiten können als nicht verrechenbar markiert werden (`APP_NoBilling`).

Seit time cockpit Version 1.7 können Sie globale Tätigkeiten aktivieren. Globale Tätigkeiten sind keinem bestimmten Projekt zugeordnet, sondern stehen für alle Projekte zur Verfügung, zum Beispiel Reisen, Vertrieb oder Support. Um globale Tätigkeiten in Versionen größer als 1.7 zu aktivieren, müssen Sie die Beziehung zwischen Tätigkeit und Projekt als optional ("nullable") konfigurieren. Globale Tätigkeiten sind standardmäßig nicht aktiviert. Wenn Sie diese Funktion nutzen möchten, gehen Sie wie folgt vor:

- Wechseln Sie in das [Modul Anpassungen](~/doc/datenmodell-anpassung/ueberblick.md).
- Wechseln Sie zu Server.
- Suchen Sie im Entitätenbaum die Entität `APP_Task`. Klicken Sie mit der rechten Maustaste auf den Knoten und klicken Sie auf `Edit Entity`.
- Wechseln Sie zu den Validierungsregeln.
- Doppelklicken Sie auf die Regel `APP_ProjectRequired` und deaktivieren Sie die Regel.
- Speichern Sie Ihre Änderungen.

Nach dieser Änderung können Sie Tätigkeiten anlegen, ohne sie einem Projekt zuzuordnen. Diese Tätigkeiten sehen Sie im Formular für Zeitbuchungen bei jedem Projekt.

> [!WARNING]
> Wenn Sie das Formular für Zeitbuchungen angepasst haben, müssen Sie die Einstellungen für das Feld `Task` aus dem Standardformular für Zeitbuchungen (`APP_TimesheetForm`) übernehmen und in Ihr geändertes Formular einfügen.

> [!WARNING]
> Beachten Sie bei Abfragen auf Tätigkeiten, dass die Beziehung zwischen Tätigkeit und Projekt nicht gesetzt sein muss (`null`). Wenn Sie zum Beispiel einen Bericht über Zeitbuchungen pro Projekt erstellen möchten, können Sie nicht über `Timesheet.Task.Project` auf das Projekt zugreifen. Sie müssen `Timesheet.Task` und `Timesheet.Project` verwenden.
