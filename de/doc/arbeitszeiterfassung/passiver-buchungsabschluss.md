---
title: Passiver Buchungsabschluss - Buchungszeiträume sperren
description: Legen Sie in time cockpit ein Buchungsabschlussdatum fest, um Zeitbuchungen und Abwesenheiten per TCQL-Ausdruck für Änderungen zu sperren.
en_page: doc/employee-time-tracking/passive-booking-completion.md
---
# Passiver Buchungsabschluss in time cockpit

## Überblick

Im Zuge der Einführung der neuen Standardberechtigungen wurde den globalen Einstellungen in **time cockpit** ein neues Feld hinzugefügt, in dem Sie die Regeln für den passiven Buchungsabschluss konfigurieren. In diesem Feld können Sie einen beliebigen TCQL-Ausdruck verwenden, der ein gültiges Datum zurückgeben muss. 

Standardmäßig setzt der vorkonfigurierte TCQL-Ausdruck das Buchungsabschlussdatum ab dem **15. jedes Monats** auf den letzten Tag des Vormonats. Ab dem 15. des aktuellen Monats können Zeitbuchungen und Abwesenheiten des Vormonats also nicht mehr geändert werden.

![Buchungsabschlussdatum konfigurieren](/doc/employee-time-tracking/images/booking-completion-date-config.png "Buchungsabschlussdatum konfigurieren")

> [!NOTE]
> Derzeit ist die Funktion **Buchungsabschluss** technisch an die Funktion **Standardberechtigungen** gekoppelt (Details finden Sie in unserem [Migrationsleitfaden](/doc/migration-guides/default-permissions.html)).
Wenn Sie die Funktion in Ihrer Umgebung aktivieren möchten, wenden Sie sich gerne an [support@timecockpit.com](mailto:support@timecockpit.com) – wir aktivieren sie gerne für Sie.

## Funktionsweise

### Standardkonfiguration

- Um die Konfiguration zu ändern, öffnen Sie [Global Settings](https://web.timecockpit.com/app/lists/entity/APP_GlobalSettings).
- Der Standard-TCQL-Ausdruck stellt sicher, dass:
  - ab dem **15. jedes Monats** der **Buchungszeitraum** des Vormonats abgeschlossen ist.
  - Zeitbuchungen und Abwesenheiten aus dem abgeschlossenen Zeitraum nicht mehr geändert werden können.

### Beispiel
Ist heute der **16. April**, ist der Buchungszeitraum für **März** bereits abgeschlossen, und Zeitbuchungen oder Abwesenheiten dieses Zeitraums können nicht mehr bearbeitet werden.

> [!NOTE]
> Benutzer dürfen Zeitbuchungen UND Abwesenheiten vor dem Buchungsabschlussdatum nicht mehr ändern.

### Geltung für alle Rollen

Diese Regel gilt für **alle Benutzerrollen**, auch für Benutzer mit der Rolle „Human Resources Admin“. Auch HR-Administratoren können Zeitbuchungen oder Abwesenheiten in einem gesperrten Zeitraum nicht ändern.

## Buchungsabschluss anpassen

Sind Änderungen an Zeitbuchungen in einem gesperrten Zeitraum erforderlich, kann für den Buchungsabschluss eine **individuelle Ausnahme** konfiguriert werden. Benutzer mit der Rolle „Human Resources Admin“ können in den Einstellungen einzelner Benutzer ein **abweichendes Buchungsabschlussdatum** festlegen.

### Abweichendes Buchungsabschlussdatum festlegen
Beim Festlegen eines abweichenden Datums gilt:
1. **Gültigkeitszeitraum**: Legen Sie fest, wie lange die Ausnahme gelten soll.
2. Nach Ablauf des Gültigkeitszeitraums gelten automatisch wieder die globalen Einstellungen.

## Einschränkungen beim Wiedereröffnen von Buchungszeiträumen

Für das Öffnen eines abgeschlossenen Buchungszeitraums gelten folgende Einschränkungen:
- Der Buchungszeitraum **kann nicht wieder geöffnet werden**, wenn der Benutzer im wieder zu öffnenden Zeitraum **Überstundenkorrekturen** hat.
- Ist das Wiedereröffnen trotz bestehender Überstundenkorrekturen erforderlich:
  1. Die Überstundenkorrekturen müssen zuerst **gelöscht** werden.
  2. Nachdem die Zeitbuchungen angepasst wurden, müssen die Korrekturen **mit den richtigen Werten neu angelegt** werden.

> [!NOTE]
> Diese Einschränkungen stellen sicher, dass die Anwesenheitszeit immer konsistent bleibt.

## Konfigurationsbeispiel

Das folgende Beispiel zeigt die Maske der globalen Einstellungen zum Konfigurieren des passiven Buchungsabschlusses:

![Buchungsabschlussdatum ändern](/doc/employee-time-tracking/images/change-booking-completion-date.png "Buchungsabschlussdatum ändern")

> [!NOTE]
> Bitte beachten Sie: Wenn Sie das Formular UserDetail in time cockpit angepasst haben, sind die Felder für den Buchungsabschluss möglicherweise nicht sichtbar. Wenden Sie sich in diesem Fall an support@timecockpit.com.

Bei weiteren Fragen zur Konfiguration des passiven Buchungsabschlusses oder wenn Sie Unterstützung benötigen, wenden Sie sich an Ihren Systemadministrator.
