---
title: Zeitbuchungen - Tabellarische Ansicht und Export
description: "Zeitbuchungen in time cockpit tabellarisch nutzen: exportieren, Stundensätze einsehen und verrechenbare Einträge für die Rechnung verwalten."
en_page: doc/project-time-tracking/timesheet.md
---
# Zeitbuchungen

In time cockpit können Sie Zeitbuchungen im grafischen Zeiterfassungskalender anlegen, bearbeiten und löschen. Sie können Zeitbuchungen aber auch in tabellarischer Form aufrufen. Das ist vor allem in folgenden Situationen hilfreich:

- Zeitbuchungen sollen exportiert werden, z. B. als Liste, die einer Rechnung beigelegt wird.
- Sie möchten eine tabellarische Liste aller Zeitbuchungen, z. B. für eine bestimmte Rechnung.
- Sie möchten Zeitbuchungen für Auswertungszwecke exportieren.

> [!NOTE]
> time cockpit wird mit einer Excel-Beispielvorlage für den Export der Standardliste der Zeitbuchungen ausgeliefert (siehe folgendes Register). Diese Beispieldatei TimesheetListPivotAnalysis.xlsx finden Sie im Installationsverzeichnis von time cockpit.

Für jede Zeitbuchung können Sie einen eigenen Stundensatz (`APP_HourlyRate`) festlegen, der von Kunde, Projekt oder Tätigkeit abweicht. Wenn Sie keinen eigenen Satz eingeben, wird der Standardstundensatz von Projekt, Kunde oder Tätigkeit verwendet. Den tatsächlich gültigen Stundensatz einer Zeitbuchung finden Sie in der berechneten Eigenschaft `APP_HourlyRateActual`.

Zeitbuchungen können als nicht verrechenbar markiert werden (`APP_NoBilling`). Ob eine bestimmte Zeitbuchung verrechenbar ist oder nicht, sehen Sie in der Spalte `APP_Billable`.
