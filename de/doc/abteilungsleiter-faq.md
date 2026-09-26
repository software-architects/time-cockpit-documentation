---
title: Abteilungsleiter-FAQ - Genehmigungen und Zeitprüfung
description: "Abteilungsleiter-FAQ zu time cockpit: Abwesenheiten genehmigen, Teamzeiten prüfen, Überstunden kontrollieren und projektbezogene Zeiten einsehen."
keywords: [abteilungsleiter, abwesenheitsgenehmigung, zeiterfassung im team, überstunden, urlaubsgenehmigung, stundenzettel, zeitbuchungen des teams, abteilungsleiter faq]
faq: true
en_page: doc/department-lead-faq.md
---

# Abteilungsleiter-FAQ

Diese FAQ beantwortet häufige Fragen von Abteilungsleitern, die in time cockpit Abwesenheiten genehmigen und die Zeiterfassungsdaten ihres Teams prüfen.

> [!NOTE]
> Überprüft im April 2026.

> [!NOTE]
> Allgemeine Fragen zur Zeiterfassung beantwortet die [Anwender-FAQ](~/doc/anwender-faq.md). HR-spezifische Einrichtung und Stammdaten behandelt die [HR-Administrator-FAQ](~/doc/hr-administrator-faq.md).

## Genehmigung von Abwesenheiten

### Wie genehmige ich Urlaub für meine Teammitglieder?

Wenn der Genehmigungsworkflow für Abwesenheiten aktiviert ist, können Abteilungsleiter offene Abwesenheiten von Mitarbeitern der Abteilungen genehmigen oder ablehnen, die sie leiten.

1. Öffnen Sie den Abwesenheitskalender, der unter [Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md) beschrieben ist.

2. Prüfen Sie die offenen Abwesenheiten in der Liste über dem Kalender.
3. Wählen Sie eine Zeile aus, um die Abwesenheit im Kalender als Vorschau anzuzeigen und zum betreffenden Datum zu springen.
4. Verwenden Sie die Aktion zum Genehmigen oder Ablehnen in den Spalten ganz rechts.

Nützlicher Kontext aus der Standarddokumentation:

- Genehmigungen werden in den globalen Einstellungen und pro Benutzer gesteuert
- Abteilungsleiter können Abwesenheiten der Abteilungen prüfen, die sie leiten
- der beantragende Benutzer erhält nach der Genehmigung oder Ablehnung eine Benachrichtigung


**Siehe auch:**
- [Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md)
- [Standardberechtigungen](~/doc/arbeitszeiterfassung/standardberechtigungen.md)
- [HR-Administrator-FAQ](~/doc/hr-administrator-faq.md#wie-genehmige-oder-lehne-ich-urlaubsanträge-ab)

---

### Wie sehe ich, wer diese Woche oder diesen Monat abwesend ist?

Für eine teamweite Übersicht der Abwesenheiten verwenden Sie den Abwesenheitskalender. Abteilungsleiter sehen die Abwesenheiten ihrer eigenen Abteilung und der Abteilungen, denen sie als Leitung zugeordnet sind.

Für einen einzelnen Mitarbeiter können Sie auch den [Zeiterfassungskalender](~/doc/zeiterfassungskalender/kalender.md) verwenden:

1. Öffnen Sie das Modul **Zeiterfassung**.
2. Wechseln Sie über die **Benutzerauswahl** zum Mitarbeiter.
3. Wechseln Sie in die Ansicht **Woche** oder **Monat**.
4. Prüfen Sie die angezeigten Abwesenheiten zusammen mit den Zeitbuchungen des Mitarbeiters.

**Siehe auch:**
- [Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md)
- [Zeiterfassungskalender](~/doc/zeiterfassungskalender/kalender.md)

---

### Was tue ich, wenn mehrere Teammitglieder Urlaub für dieselben Tage beantragen?

Vergleichen Sie den Antrag im Abwesenheitskalender mit den bestehenden Abwesenheiten in der betreffenden Abteilung.

1. Wählen Sie den offenen Antrag in der Genehmigungsliste aus.
2. Prüfen Sie den hervorgehobenen Zeitraum im Kalender.
3. Vergleichen Sie ihn mit den bestehenden Abwesenheiten anderer Benutzer derselben Abteilung.
4. Genehmigen oder lehnen Sie den Antrag nach den Regeln Ihrer Organisation ab.

Die Standarddokumentation erklärt, wie Sie Überschneidungen im Kalender prüfen, legt aber keine integrierte Entscheidungsregel für konkurrierende Anträge fest. Wenn Sie Orientierung zu den Unternehmensregeln benötigen, stimmen Sie sich mit HR ab.

**Siehe auch:**
- [Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md)
- [HR-Administrator-FAQ](~/doc/hr-administrator-faq.md)

---

## Überblick über die Zeiterfassung im Team

### Wie prüfe ich, ob mein Team Zeiten korrekt erfasst?

Abteilungsleiter können für diese Prüfung **Stundenzettel**, **Zeiterfassungskalender** und die Liste **Zeitbuchungen** kombinieren.

Verwenden Sie den [Stundenzettel](~/doc/arbeitszeiterfassung/stundenzettel.md), wenn Sie eine Zusammenfassung der Arbeitszeit für einen Benutzer und einen Zeitraum benötigen. Der Bericht enthält Arbeitszeit, Pausen, Überstunden, Bemerkungen und zusammenfassende Informationen.

Wenn die Liste in Ihrer Navigation verfügbar ist, eignet sich auch der **Soll-Ist-Vergleich** für zeitraumbezogene Prüfungen. Dort legen Sie fest:

- **Startdatum**
- **Enddatum**
- **Arbeitszeitgewichtung berücksichtigen**
- **Inkl. ausgeblendeter Benutzer**

Die Liste zeigt dann pro Benutzer folgende Werte:

- Sollstunden
- Sollstunden inklusive inkludierter Überstunden
- Iststunden
- Abweichung
- Abweichung in Prozent

Verwenden Sie den [Zeiterfassungskalender](~/doc/zeiterfassungskalender/kalender.md), wenn Sie einen bestimmten Tag oder eine bestimmte Woche genauer ansehen möchten:

1. Wählen Sie den Mitarbeiter in der **Benutzerauswahl** aus.
2. Prüfen Sie die Einträge im Kalender.
3. Achten Sie auf sichtbare Lücken, Überschneidungen und die allgemeine Verteilung des Tages.

Verwenden Sie die Liste [Zeitbuchungen](~/doc/projektzeiterfassung/zeitbuchungen.md), wenn Sie eine tabellarische Ansicht der Einträge Ihres Teams zur Prüfung oder zum Export benötigen.

**Siehe auch:**
- [Stundenzettel](~/doc/arbeitszeiterfassung/stundenzettel.md)
- [Arbeiten mit Zeitbuchungen](~/doc/zeiterfassungskalender/arbeiten-mit-zeitbuchungen.md)
- [Zeitbuchungen](~/doc/projektzeiterfassung/zeitbuchungen.md)

---

### Wie überwache ich Überstunden und Auslastung meiner Abteilung?

Verwenden Sie den [Stundenzettel](~/doc/arbeitszeiterfassung/stundenzettel.md) als wichtigste Quelle. Er enthält Sollstunden, tatsächliche Arbeitsstunden, die Überstunden im gewählten Zeitraum und den Überstundenstand zu Beginn des Zeitraums.

Wenn die Liste in Ihrer Navigation verfügbar ist, bietet die Liste **Arbeitszeitsaldo** eine kompakte Momentaufnahme der Überstunden zu einem Datum. Sie hat folgende Filter:

- **Stichtag**
- **Inkl. ausgeblendeter Benutzer**

Für jeden Benutzer zeigt sie:

- den Benutzer
- die Überstunden in Stunden
- einen Datenbalken für den Überstundenwert
- einen Link zu den Korrekturen des Arbeitszeitsaldos des Benutzers

Für einen zeitraumbezogenen Vergleich ist der **Soll-Ist-Vergleich** die detailliertere Ansicht, weil er Sollstunden, Iststunden und Abweichung über einen Zeitraum vergleicht.

Für eine detaillierte Untersuchung:

1. Öffnen Sie den **Stundenzettel** für den betreffenden Mitarbeiter und Zeitraum.
2. Prüfen Sie die Überstunden zusammen mit Bemerkungen, Abwesenheiten und Pauseninformationen.
3. Wenn Sie die zugrunde liegenden Einträge benötigen, öffnen Sie den Mitarbeiter im [Zeiterfassungskalender](~/doc/zeiterfassungskalender/kalender.md) oder prüfen Sie die Liste [Zeitbuchungen](~/doc/projektzeiterfassung/zeitbuchungen.md).

**Siehe auch:**
- [Stundenzettel](~/doc/arbeitszeiterfassung/stundenzettel.md)
- [Arbeitszeitregelungen](~/doc/arbeitszeiterfassung/arbeitszeitregelungen.md)
- [Projektleiter-FAQ](~/doc/projektleiter-faq.md)

---

### Kann ich sehen, an welchen Projekten mein Team arbeitet?

Ja. Mit den Standardberechtigungen können Abteilungsleiter die Zeitbuchungen der Mitarbeiter ihrer Abteilung lesen.

Am einfachsten öffnen Sie die Liste [Zeitbuchungen](~/doc/projektzeiterfassung/zeitbuchungen.md) und prüfen die projektbezogenen Spalten für den betreffenden Zeitraum. Je nach Konfiguration Ihrer Ansicht können Sie auch filtern, sortieren, gruppieren oder exportieren, um sich auf einen Mitarbeiter, ein Projekt oder einen Zeitraum zu konzentrieren.

Für einen einzelnen Mitarbeiter und einen Tag oder eine Woche ist der [Zeiterfassungskalender](~/doc/zeiterfassungskalender/kalender.md) oft schneller.

**Siehe auch:**
- [Zeitbuchungen](~/doc/projektzeiterfassung/zeitbuchungen.md)
- [Zeiterfassungskalender](~/doc/zeiterfassungskalender/kalender.md)
- [Projektleiter-FAQ](~/doc/projektleiter-faq.md)

---

## Berichte für die Abteilung

### Welche Berichte sollte ich als Abteilungsleiter regelmäßig prüfen?

Die nützlichsten Standardansichten für Abteilungsleiter sind:

- [Stundenzettel](~/doc/arbeitszeiterfassung/stundenzettel.md) für Arbeitszeit, Pausen, Bemerkungen und Überstunden
- der Abwesenheitskalender unter [Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md) für genehmigte und offene Abwesenheiten
- [Zeitbuchungen](~/doc/projektzeiterfassung/zeitbuchungen.md) für die tabellarische Prüfung projektbezogener Zeitbuchungen
- `Arbeitszeitsaldo` für eine Momentaufnahme der Überstunden zu einem Stichtag
- `Soll-Ist-Vergleich` für den Vergleich von Sollstunden, Iststunden und Abweichung über einen Zeitraum

Wie oft Sie diese Ansichten prüfen, hängt von Ihrem internen Prozess ab. In der Produktdokumentation entsprechen sie vor allem drei Anwendungsfällen: Genehmigung von Abwesenheiten, Prüfung der Arbeitszeit und Prüfung projektbezogener Zeiten.

**Siehe auch:**
- [Stundenzettel](~/doc/arbeitszeiterfassung/stundenzettel.md)
- [Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md)
- [Projektleiter-FAQ](~/doc/projektleiter-faq.md#welche-berichte-sollte-ich-als-projektleiter-regelmäßig-prüfen)

---

## Verwaltung der Abteilung

### Wie nehme ich ein neues Teammitglied in meine Abteilung auf?

Trennen Sie dabei zwischen Einrichtung und täglicher Nutzung:

1. Stimmen Sie Konto, Abteilungszuordnung und Rollen mit HR oder der Kontoverwaltung ab.
2. Zeigen Sie dem Mitarbeiter das Modul **Zeiterfassung** und den [Zeiterfassungskalender](~/doc/zeiterfassungskalender/kalender.md).
3. Lassen Sie ihn mit den Schritten unter [Arbeiten mit Zeitbuchungen](~/doc/zeiterfassungskalender/arbeiten-mit-zeitbuchungen.md) einen ersten Eintrag anlegen.
4. Zeigen Sie ihm die relevante Anwenderdokumentation für die tägliche Zeiterfassung und für Abwesenheiten.

Für die Einrichtung des Kontos und die Stammdaten der Mitarbeiter lesen Sie die [HR-Administrator-FAQ](~/doc/hr-administrator-faq.md#wie-lege-ich-einen-neuen-mitarbeiter-in-time-cockpit-an). Für Anleitungen für Anwender beginnen Sie mit der [Anwender-FAQ](~/doc/anwender-faq.md).

**Siehe auch:**
- [Anwender-FAQ](~/doc/anwender-faq.md)
- [Arbeiten mit Zeitbuchungen](~/doc/zeiterfassungskalender/arbeiten-mit-zeitbuchungen.md)
- [HR-Administrator-FAQ](~/doc/hr-administrator-faq.md#wie-lege-ich-einen-neuen-mitarbeiter-in-time-cockpit-an)

---

## Brauchen Sie mehr Hilfe?

### Ressourcen für Abteilungsleiter

**Verwandte FAQs:**
- [Anwender-FAQ](~/doc/anwender-faq.md) - Allgemeine Zeiterfassung
- [HR-Administrator-FAQ](~/doc/hr-administrator-faq.md) - HR-Einrichtung und Stammdaten der Mitarbeiter
- [Projektleiter-FAQ](~/doc/projektleiter-faq.md) - Projektbezogene Teamführung
- [Mitarbeiter-FAQ](~/doc/mitarbeiter-faq.md) - Leitfaden für Ihre Teammitglieder
- [Entwickler-FAQ](~/doc/entwickler-faq.md) - API und Anpassungen

**Dokumentation:**
- [Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md)
- [Stundenzettel](~/doc/arbeitszeiterfassung/stundenzettel.md)
- [Standardberechtigungen](~/doc/arbeitszeiterfassung/standardberechtigungen.md)
- [Zeiterfassungskalender](~/doc/zeiterfassungskalender/kalender.md)

**Support:**
- **E-Mail:** support@timecockpit.com

---

*Zuletzt aktualisiert: April 2026.*
