---
title: Abwesenheit ablehnen - Aktionsreferenz
description: Referenz zur Standardaktion Abwesenheit Ablehnen in time cockpit mit dem Parameter für den Ablehnungsgrund und dem standardmäßigen Löschverhalten.
en_page: doc/reference/actions/reject-absence.md
---

# Abwesenheit ablehnen

Die Aktion **Abwesenheit Ablehnen** lehnt offene Abwesenheitsanträge ab.

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

Der ausführende Benutzer muss außerdem berechtigt sein, die jeweilige Abwesenheit abzulehnen. In der Standardlogik bedeutet das:

- der Benutzer ist HR-Administrator, oder
- die Abwesenheit gehört zu einem Benutzer in einer Abteilung, die der ausführende Benutzer leitet

## Parameter

Wenn Sie die Aktion ausführen, öffnet time cockpit ein kleines Parameterformular mit diesem Feld:

| Feld | Technische Referenz | Bedeutung |
|---|---|---|
| Reason for Rejection | `APP_RejectionReason` | Optionaler Ablehnungsgrund, der gespeichert wird, bevor die Abwesenheit entfernt wird |

## Was die Aktion ändert

Ist die Aktion erfolgreich, führt sie diese Standardschritte aus:

1. Sie lädt die ausgewählten offenen Abwesenheiten neu.
2. Sie prüft für jede ausgewählte Zeile die Berechtigung zur Ablehnung.
3. Wurde ein Grund eingegeben, schreibt sie den Ablehnungsgrund in den Abwesenheitsdatensatz.
4. Sie löscht den abgelehnten Abwesenheitsdatensatz.

Die Aktion wendet dieselbe Logik an auf:

- `APP_Vacation`
- `APP_SickLeave`
- `APP_CompensatoryTime`

## Nebeneffekte und Standardlogik

Wichtige Standardverhalten:

- Abgelehnte Abwesenheiten werden im Standardablauf gelöscht.
- Der Ablehnungsgrund ist optional; wird er eingegeben, wird er vor dem Löschen gespeichert.
- Die Aktion betrifft nur nicht genehmigte Abwesenheitszeilen.

Im umgebenden Standardablauf erhält der beantragende Benutzer eine Benachrichtigung, in die der Ablehnungsgrund aufgenommen werden kann.

## Typische Gründe, warum die Aktion fehlschlägt

Die Standardaktion bricht mit einem Validierungsfehler ab, wenn:

- der aktuelle Benutzer für einen der ausgewählten Benutzer keine Berechtigung zur Ablehnung hat

## Verwandte Seiten

- [Abwesenheitskalender](~/doc/referenz/listen/abwesenheitskalender.md)
- [Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md)
- [Abteilungsleiter-FAQ](~/doc/abteilungsleiter-faq.md)
- [HR-Administrator-FAQ](~/doc/hr-administrator-faq.md)
