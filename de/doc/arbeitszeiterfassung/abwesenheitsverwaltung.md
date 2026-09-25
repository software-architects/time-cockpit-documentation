---
title: Abwesenheitsverwaltung - Urlaub und Krankenstand
description: Urlaub, Krankenstand und Zeitausgleich in time cockpit verwalten. Abwesenheiten erfassen, Resturlaub berechnen und Ansprüche verwalten.
en_page: doc/employee-time-tracking/absence-time-management.md
---

# Genehmigungsworkflow für Abwesenheiten (Urlaub, Zeitausgleich, Krankenstand)

> [!NOTE]
> Überprüft im April 2026.

time cockpit unterstützt einen Genehmigungsworkflow für Abwesenheiten, den Sie in den [Global Settings](https://web.timecockpit.com/app/forms/entity/APP_GlobalSettings) pro Abwesenheitsart aktivieren und im [Abwesenheitskalender](https://web.timecockpit.com/app/absence-time-calendar) prüfen können.

Urlaub, Krankenstand und Zeitausgleich können unter [Benutzer -> Urlaub](https://web.timecockpit.com/app/lists/entity/APP_Vacation), [Benutzer -> Krankenstand](https://web.timecockpit.com/app/lists/entity/APP_SickLeave) und [Benutzer -> Zeitausgleich](https://web.timecockpit.com/app/lists/entity/APP_CompensatoryTime) sowie im Zeiterfassungskalender angelegt werden. Alle drei Abwesenheitsarten unterstützen ganztägige und stundenweise Einträge.

> [!NOTE]
> Die Genehmigung von Abwesenheiten wird an zwei Stellen gesteuert:
> - Global Settings (pro Abwesenheitsart)
> - Benutzerstammdaten (pro Benutzer über „Absence approval required“)

## Abwesenheitsarten mit Genehmigung

Der Genehmigungsworkflow kann für alle drei Abwesenheitsarten in time cockpit getrennt aktiviert werden:

- [Urlaub/Sonderurlaub](https://web.timecockpit.com/app/forms/entity/APP_Vacation)
- [Zeitausgleich](https://web.timecockpit.com/app/forms/entity/APP_CompensatoryTime)
- [Krankenstand](https://web.timecockpit.com/app/forms/entity/APP_SickLeave)

Sobald Sie die Genehmigung für eine Kategorie aktivieren, müssen Benutzer ihre Abwesenheiten dieser Kategorie entweder von ihrer Führungskraft oder von einem Benutzer mit der Rolle HR-Administrator genehmigen lassen.

## Wann ist eine Genehmigung der Abwesenheit erforderlich?

Genehmigungen sind nur für Benutzer erforderlich, bei denen dies in den Benutzerstammdaten über das Kontrollkästchen „Absence approval required“ aktiviert ist.

Für Benutzer, bei denen keine Genehmigung erforderlich ist, werden neu angelegte Abwesenheiten automatisch als genehmigt markiert, sofern der Genehmigungsworkflow in den Global Settings für die jeweilige Abwesenheitsart aktiviert ist.

> [!TIP]
> Wenn Genehmigungen global aktiviert sind, ein Benutzer aber keine Genehmigung benötigt, werden seine neuen Abwesenheiten automatisch genehmigt.

## Wichtig: Bestehende Abwesenheiten nach dem Aktivieren der Genehmigung

Sobald Sie den Workflow in den Global Settings und in den Benutzerstammdaten aktivieren, werden nicht genehmigte Abwesenheiten – auch vergangene Abwesenheiten, die vor dem Aktivieren dieser Funktion angelegt wurden – je nach Berechtigungen im Abwesenheitskalender als nicht genehmigt angezeigt. Abgeschlossene Abwesenheiten aus der Zeit vor der Aktivierung müssen daher nachträglich genehmigt werden.

> [!IMPORTANT]
> Nach dem Aktivieren des Workflows können ältere Abwesenheiten als nicht genehmigt erscheinen und müssen gegebenenfalls nachträglich genehmigt werden.

## Sichtbarkeit im Abwesenheitskalender nach Benutzerrolle

Die folgende Tabelle gibt einen schnellen Überblick, was jede Rolle im Abwesenheitskalender sehen und tun kann.

| Rolle | Im Kalender angezeigte Abwesenheiten | Abwesenheitsart bei Kollegen sichtbar | Liste offener Genehmigungen | Kann genehmigen / ablehnen | Zusätzliche Filter |
|---|---|---:|---:|---:|---|
| Zeiterfassungsbenutzer | Zugewiesene Abteilung | Nein | Nur eigene | Nein | – |
| Abteilungsleiter | Eigene Abteilung + Abteilungen, in denen der Benutzer Abteilungsleiter ist | Ja | Eigene + Benutzer in der Abteilung des Abteilungsleiters | Ja | – |
| HR-Administrator | Zugewiesene Abteilung (Standard) | Ja | Nur eigene (Standard) | Ja (im Namen der Abteilungsleiter) | Show all users, Abteilung, Benutzer |

### Zeiterfassungsbenutzer

Sieht im Abwesenheitskalender alle Abwesenheiten der Benutzer in der zugewiesenen Abteilung. Bei Abwesenheiten von Kollegen ist die Abwesenheitsart bewusst nicht sichtbar. In der Liste über dem Kalender werden nur die eigenen nicht genehmigten Abwesenheiten des Benutzers angezeigt.

> [!NOTE]
> Diese Datenschutzeinstellung verhindert, dass Benutzer erkennen können, ob ein Kollege auf Urlaub, im Krankenstand oder im Zeitausgleich ist.

### Abteilungsleiter

Sieht alle Abwesenheiten der Benutzer in der zugewiesenen Abteilung und zusätzlich die Abwesenheiten der Benutzer in allen Abteilungen, in denen der Benutzer als Abteilungsleiter eingetragen ist.

In der Abwesenheitsliste sieht der Abteilungsleiter seine eigenen nicht genehmigten Abwesenheiten sowie die nicht genehmigten Abwesenheiten der Benutzer in den betreffenden Abteilungen.

### HR-Administrator

Sieht im Abwesenheitskalender alle Abwesenheiten der Benutzer in der zugewiesenen Abteilung. In der Liste der nicht genehmigten Abwesenheiten werden standardmäßig nur die eigenen nicht genehmigten Abwesenheiten des Benutzers angezeigt.

Als HR-Administrator können Sie Abwesenheiten aller Benutzer im Namen der Abteilungsleiter genehmigen. Dazu stehen Ihnen zusätzliche Filter zur Verfügung:

- Kontrollkästchen „Show all users“
- Dropdown „Abteilung“
- Dropdown „Benutzer“

> [!TIP]
> Verwenden Sie „Show all users“ nur bei Bedarf und grenzen Sie die Auswahl dann über Abteilung und Benutzer ein, damit Kalender und Genehmigungsliste übersichtlich bleiben.

## Abwesenheiten genehmigen und ablehnen

Abteilungsleiter und HR-Administratoren können Abwesenheiten mit offener Genehmigung in der Liste über dem Abwesenheitskalender genehmigen oder ablehnen. Dazu verwenden Sie die beiden Aktionen in den Spalten ganz rechts.

Vor dem Genehmigen oder Ablehnen können Sie eine Zeile auswählen, um die Abwesenheit im Kalender darunter in einer Vorschau zu sehen. Der Kalender springt automatisch zum Beginndatum der Abwesenheit. So können Sie die Abwesenheit leichter mit bestehenden Abwesenheiten anderer Benutzer derselben Abteilung vergleichen und Überschneidungen bei der Genehmigungsentscheidung berücksichtigen.

> [!TIP]
> Wählen Sie eine Abwesenheit in der Liste aus, um sie im Kalender hervorzuheben und direkt zum betreffenden Zeitraum zu springen.

Ansicht als HR-Administrator:

![Abwesenheitskalender](/doc/employee-time-tracking/images/absence-time-calendar.png "Abwesenheitskalender")

## Automatische Benachrichtigungen im Genehmigungsworkflow

Wenn ein Benutzer eine neue Abwesenheit anlegt, werden die Abteilungsleiter dieses Benutzers automatisch über eine Benachrichtigung in time cockpit über die offene Genehmigung informiert.

Bei Bedarf können Benachrichtigungen für Abteilungsleiter pro Abteilungsleiter in den Stammdaten der Abteilung deaktiviert werden.

![Benachrichtigung deaktivieren](/doc/employee-time-tracking/images/department-lead-receive-notification.png "Benachrichtigung deaktivieren")

Wird eine Abwesenheit genehmigt oder abgelehnt, werden die für die Abteilungsleiter erstellten Benachrichtigungen automatisch gelöscht.

Nach der Genehmigung oder Ablehnung erhält auch der antragstellende Benutzer eine Benachrichtigung, aus der hervorgeht, wann und von wem die Abwesenheit bearbeitet wurde. Bei einer Ablehnung kann die bearbeitende Person einen Ablehnungsgrund angeben, der in die Benachrichtigung an den antragstellenden Benutzer übernommen wird.

Zusätzlich wird eine abgelehnte Abwesenheit gelöscht. Benachrichtigungen zu genehmigten Abwesenheiten werden nicht automatisch gelöscht und können als schriftliche Bestätigung aufbewahrt werden.

> [!WARNING]
> Abgelehnte Abwesenheiten werden gelöscht. Benachrichtigungen zu genehmigten Abwesenheiten bleiben erhalten und können als schriftliche Bestätigung dienen.

![Benachrichtigung zur Abwesenheit](/doc/employee-time-tracking/images/absence-time-notification.png "Benachrichtigung zur Abwesenheit")
