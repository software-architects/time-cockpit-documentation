---
title: Abwesenheitskalender (Absence Calendar)
description: Referenz zur Standardliste Abwesenheitskalender in time cockpit mit Filtern, Sichtbarkeitsregeln und Aktionen für die Genehmigung.
en_page: doc/reference/lists/absence-calendar.md
---

# Abwesenheitskalender

Die Liste **Absence Calendar** fasst Urlaub, Krankenstand und Zeitausgleich in einer kalenderorientierten Liste zusammen. Sie ist besonders nützlich für offene Genehmigungen und für den Überblick über mehrere Benutzer.

## Typische Zielgruppe

Diese Liste ist typischerweise relevant für:

- Mitarbeiter, die ihre eigenen offenen Anträge prüfen
- Abteilungsleiter, die Genehmigungen in ihren Abteilungen prüfen
- HR-Administratoren, die Abwesenheiten über mehrere Benutzer hinweg prüfen

## Navigation

- Standard-Deeplink: `https://web.timecockpit.com/app/lists/APP_DefaultAbsenceTimeCalendarList`
- Hinweis: Diese Liste wird von Abwesenheits- und Genehmigungsabläufen verwendet, ist in der Standardkonfiguration der Navigation aber kein eigener Eintrag im Hauptmenü.

## Standardfilter

| Filter | Technische Referenz | Bedeutung |
|---|---|---|
| From | `@BeginTime` | Beginn des Kalenderintervalls |
| To | `@EndTime` | Ende des Kalenderintervalls |
| Benutzer | `@UserDetail` | Schränkt die Liste auf einen Benutzer ein |
| Department | `@Department` | Schränkt die Liste auf eine Abteilung ein |
| Show All Users | `@ShowAllUsers` | Nur für HR verfügbare Option, um das Ergebnis zu erweitern |
| Show Only Pending List | `@ShowOnlyPendingList` | Interner Modus, um sich auf offene Anträge zu konzentrieren |

## Spalten

| Spalte | Technische Referenz | Bedeutung | Ermittlung des Werts |
|---|---|---|---|
| Category | `PendingAbsenceType` | Offene Kategorie der Zeile | Wird auf Kategorien wie eigene offene Anträge oder offene Genehmigungen im Team gesetzt |
| Department | `DepartmentName` | Abteilung des abwesenden Benutzers | Aus der Abteilung des Benutzers übernommen |
| Benutzer | `UserDetailName`, `UserDetailUuid` | In der Zeile angezeigter Benutzer | Anzeigewert des Benutzerdetails |
| Absence | `AbsenceTypeDisplayName` | Anzeigename der Abwesenheitsart | Aus der Abwesenheitsentität abgeleitet und für Sonderurlaub angepasst |
| Description | `AbsenceDescription` | Beschreibung der Abwesenheit | Wird direkt angezeigt, wenn der aktuelle Benutzer sie sehen darf; andernfalls wird die Zeile verallgemeinert |
| Begin | `BeginTime` | Beginn der Abwesenheit | Aus dem Abwesenheitsdatensatz übernommen und als Tag oder als Datum/Uhrzeit formatiert |
| End | `EndTime` | Ende der Abwesenheit | Aus dem Abwesenheitsdatensatz übernommen und als Tag oder als Datum/Uhrzeit formatiert |
| Approved | `Approved` | In der Liste sichtbarer Genehmigungsstatus | Aus dem Abwesenheitsdatensatz und der Genehmigungskonfiguration abgeleitet |
| Approve | `APP_ApproveAbsenceAction` | Standardaktion zur Genehmigung | Sichtbar für offene Genehmigungen im Team |
| Reject | `APP_RejectAbsenceAction` | Standardaktion zur Ablehnung | Sichtbar für offene Genehmigungen im Team |

## Hinweise

- Die Liste führt drei Abwesenheitsarten zusammen: Urlaub, Krankenstand und Zeitausgleich.
- Die Sichtbarkeit hängt von der Rolle des aktuellen Benutzers, vom Umfang seiner Abteilungen und davon ab, ob die Zeile zum aktuellen Benutzer gehört.
- Darf ein Betrachter keine Details sehen, kann die Liste den Abwesenheitstext verallgemeinern.

## Verwandte Seiten

- [Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md)
- [Urlaub](~/doc/referenz/listen/urlaub.md)
- [Krankenstand](~/doc/referenz/listen/krankenstand.md)
- [Zeitausgleich](~/doc/referenz/listen/zeitausgleich.md)
