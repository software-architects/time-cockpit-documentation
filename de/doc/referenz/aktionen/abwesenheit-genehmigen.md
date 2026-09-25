---
title: Abwesenheit genehmigen (Approve Absence) - Aktionsreferenz
description: Referenz zur Standardaktion Approve Absence in time cockpit mit Verfügbarkeit, Prüfung der Berechtigungen und Nebeneffekten im Standardablauf.
en_page: doc/reference/actions/approve-absence.md
---

# Abwesenheit genehmigen

Die Aktion **Approve Absence** genehmigt offene Abwesenheitsanträge.

Sie wird für diese Standardabwesenheitsarten verwendet:

- Urlaub
- Krankenstand
- Zeitausgleich

## Wo die Aktion verfügbar ist

In der Standardkonfiguration ist diese Aktion in der Liste der offenen Genehmigungen oberhalb des Abwesenheitskalenders verfügbar, der unter [Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md) beschrieben ist.

Sie wird für Zeilen angezeigt, die offene Genehmigungen im Team darstellen.

Mit den Standardberechtigungen ist diese Aktion vorgesehen für:

- Abteilungsleiter für Benutzer in den Abteilungen, die sie leiten
- HR-Administratoren, die stellvertretend für Abteilungsleiter handeln

## Bevor Sie beginnen

Die Aktion verarbeitet nur Abwesenheitseinträge, die noch nicht genehmigt sind.

Der ausführende Benutzer muss außerdem berechtigt sein, die jeweilige Abwesenheit zu genehmigen. In der Standardlogik bedeutet das:

- der Benutzer ist HR-Administrator, oder
- die Abwesenheit gehört zu einem Benutzer in einer Abteilung, die der ausführende Benutzer leitet

## Parameter

Diese Aktion hat in der Standardkonfiguration kein Parameterformular für den Benutzer.

## Was die Aktion ändert

Ist die Aktion erfolgreich, führt sie diese Standardschritte aus:

1. Sie lädt die ausgewählten offenen Abwesenheiten neu.
2. Sie prüft für jede ausgewählte Zeile die Berechtigung zur Genehmigung.
3. Sie setzt den Zeitstempel der Genehmigung auf die aktuelle UTC-Zeit.
4. Sie speichert den aktuellen Benutzer als genehmigende Person.

Die Aktion wendet dieselbe Logik an auf:

- `APP_Vacation`
- `APP_SickLeave`
- `APP_CompensatoryTime`

## Nebeneffekte und Standardlogik

Wichtige Standardverhalten:

- Die Aktion betrifft nur nicht genehmigte Abwesenheitszeilen.
- Sie schreibt die genehmigende Person und den Zeitstempel der Genehmigung direkt in den Abwesenheitsdatensatz.
- Sie berücksichtigt pro ausgewähltem Benutzer den Zuständigkeitsbereich als Abteilungsleiter und als HR-Administrator.

Im umgebenden Standardablauf wirkt sich die Genehmigung außerdem auf die Ansicht der offenen Genehmigungen und auf die zugehörigen Benachrichtigungen aus, die unter [Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md) beschrieben sind.

## Typische Gründe, warum die Aktion fehlschlägt

Die Standardaktion bricht mit einem Validierungsfehler ab, wenn:

- der aktuelle Benutzer für einen der ausgewählten Benutzer keine Berechtigung zur Genehmigung hat

## Verwandte Seiten

- [Abwesenheitskalender](~/doc/referenz/listen/abwesenheitskalender.md)
- [Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md)
- [Abteilungsleiter-FAQ](~/doc/abteilungsleiter-faq.md)
- [HR-Administrator-FAQ](~/doc/hr-administrator-faq.md)
