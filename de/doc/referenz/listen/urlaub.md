---
title: Urlaub
description: Referenz der Standardliste Urlaub in time cockpit mit Urlaubseinträgen, Anspruchs- und Abzugszeilen sowie dem Verlauf des Resturlaubs.
en_page: doc/reference/lists/vacation.md
---

# Urlaub

Die Liste **Urlaub** ist mehr als eine reine Liste von Urlaubsanträgen. Sie kombiniert Urlaubseinträge mit Anspruchs- und Abzugszeilen, sodass Sie den Saldo im Zeitverlauf nachvollziehen können.

## Typische Zielgruppe

Diese Liste ist typischerweise relevant für:

- Mitarbeiter, die ihren eigenen Urlaubsverlauf prüfen
- Abteilungsleiter, die Anträge ihres Teams prüfen
- HR-Administratoren, die Urlaubsdaten prüfen und pflegen

## Navigation

- Standardnavigation: `Benutzer -> Urlaub`
- Deeplink: `https://web.timecockpit.com/app/lists/entity/APP_Vacation`

## Standardfilter

| Filter | Technische Referenz | Bedeutung |
|---|---|---|
| Benutzer | `@UserDetail` | Benutzer, dessen Urlaubsverlauf angezeigt wird |
| Since | `@YearParam` | Startjahr des angezeigten Verlaufs |

## Spalten

| Spalte | Technische Referenz | Bedeutung | Ermittlung des Werts |
|---|---|---|---|
| Benutzer | `UserDetailName` | Benutzer der Zeile | Anzeigewert des Benutzerdetails |
| Is Whole Day | `IsWholeDay` | Ob die Abwesenheitszeile ganztägig ist | Aus den Urlaubszeilen übernommen; bei anderen Zeilen ausgeblendet |
| From | `BeginTime` | Beginn der Zeile | Bei Urlaubszeilen der Beginn der Abwesenheit; bei Anspruchs- und Abzugszeilen das Anspruchsdatum |
| To | `EndTime` | Ende der Zeile | Bei Urlaubszeilen das Ende der Abwesenheit |
| Description | `Description` | Beschreibung der Zeile | Aus dem Urlaubs- oder Anspruchsdatensatz übernommen, bei Anspruchszeilen mit einem Standardtext |
| Special Leave | `SpecialLeave` | Ob die Urlaubszeile Sonderurlaub ist | Aus dem Urlaubsdatensatz übernommen |
| Number of Weeks | `NumberOfWeeks` | Durch die Zeile hinzugefügte oder verbrauchte Wochen | Urlaubszeilen verwenden die berechnete Urlaubsdauer in Wochen und sind negativ. Anspruchszeilen verwenden den gespeicherten Anspruchswert. |
| Remaining Weeks | `RemainingWeeks` | Resturlaub nach der Zeile | Mit der Standardfunktion für den Resturlaub zum Stichtag der Zeile berechnet |
| Approved | `IsApproved` | Genehmigungsstatus einer Urlaubszeile | Aus dem Urlaubsdatensatz übernommen und angezeigt, wenn die Urlaubsgenehmigung aktiv ist |

## Hinweise

- Die Liste kombiniert verschiedene Zeilenarten wie Urlaub, Anspruch und Abzug.
- Urlaubszeilen verringern den Saldo und werden daher mit negativen Wochenwerten angezeigt.
- Anspruchszeilen können je nach Wert des Anspruchsdatensatzes Wochen hinzufügen oder abziehen.

## Verwandte Seiten

- [Urlaubsanspruch](~/doc/referenz/listen/urlaubsanspruch.md)
- [Urlaub zum Stichtag](~/doc/referenz/listen/urlaub-zum-stichtag.md)
- [Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md)
