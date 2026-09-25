---
title: HR-Administrator-FAQ - Mitarbeiter und Abwesenheiten
description: "HR-Administrator-FAQ zu time cockpit: Mitarbeiterdaten pflegen, Abwesenheiten verwalten, Arbeitszeit prüfen und Exporte zur Weiterverarbeitung erstellen."
keywords: [hr-administrator, mitarbeiterdaten, abwesenheitsgenehmigung, krankenstand, urlaubsanspruch, arbeitszeit, lohnverrechnung export, hr faq]
faq: true
en_page: doc/hr-administrator-faq.md
---

# HR-Administrator-FAQ

Diese FAQ beantwortet häufige Fragen von HR-Administratoren, die in time cockpit Mitarbeiterdaten pflegen, Abwesenheiten verwalten und Arbeitszeitinformationen prüfen.

> [!NOTE]
> Allgemeine Fragen zur Zeiterfassung beantwortet die [Anwender-FAQ](~/doc/anwender-faq.md). Fragen zu Entwicklung und API beantwortet die [Entwickler-FAQ](~/doc/entwickler-faq.md).

> [!NOTE]
> Überprüft im April 2026.

## Mitarbeiterverwaltung und Onboarding

### Wie lege ich einen neuen Mitarbeiter in time cockpit an?

Im Standard von time cockpit besteht das Onboarding in der Regel aus zwei Teilen:

1. Legen Sie das Benutzerkonto in der [Kontoverwaltung](~/doc/kontoverwaltung/kontoverwaltung.md) an oder aktivieren Sie es.
2. Pflegen Sie die Stammdaten des Mitarbeiters unter **Benutzer -> User Details**.

Die Standardeinrichtung durch HR umfasst in der Regel:

- Sichtbarkeit
- Abteilungszuordnung
- Feiertagskalender
- Wochenarbeitszeit
- Urlaubsanspruch
- Rollenzuordnung, falls nötig

Der Urlaubsanspruch wird separat unter **Benutzer -> Urlaubsanspruch** gepflegt.

Typische Standardrollen sind:

- **Time Tracking User**
- **Project Manager**
- **Project Controller**
- **Department Lead**
- **HR Admin**
- **Billing Admin**

Für das Offboarding:

1. Setzen Sie im Mitarbeiterdatensatz das **Date of Separation**.
2. Setzen Sie den Benutzer in der **Kontoverwaltung** auf **Active = false**, wenn er keinen Zugriff mehr haben und nicht mehr verrechnet werden soll.
3. Setzen Sie **Hidden**, wenn der Benutzer nicht mehr in Auswahllisten erscheinen soll.
4. Löschen Sie den Benutzer nicht, wenn Sie historische Daten behalten müssen.

**Siehe auch:**
- [Kontoverwaltung](~/doc/kontoverwaltung/kontoverwaltung.md)
- [Arbeitszeit / Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/arbeitszeit.md)
- [Standardberechtigungen](~/doc/arbeitszeiterfassung/standardberechtigungen.md)

---

### Wie richte ich unterschiedliche Arbeitszeitmodelle ein (Vollzeit, Teilzeit)?

Im Standard von time cockpit legt die Wochenarbeitszeit die Sollstunden pro Wochentag fest. Sie legt keine genauen Normalarbeitszeiten wie `08:00-17:00` fest.

Übliche Einrichtungen sind zum Beispiel:

- Vollzeit mit denselben Sollstunden an jedem Arbeitstag
- Teilzeit mit reduzierten Sollstunden pro Tag
- Teilzeit mit Sollstunden nur an ausgewählten Wochentagen
- verdichtete Wochen mit mehr Sollstunden an weniger Tagen

So richten Sie das ein:

1. Öffnen Sie **Benutzer -> Wochenarbeitszeit**.
2. Legen Sie den Datensatz für den Mitarbeiter an oder bearbeiten Sie ihn.
3. Geben Sie die Sollstunden für jeden Wochentag ein.
4. Setzen Sie Tage ohne Sollarbeitszeit auf `0` oder lassen Sie sie leer.
5. Tragen Sie inkludierte Überstunden pro Monat nur ein, wenn Sie die Überstundenberechnung verwenden.
6. Verwenden Sie Gültigkeitszeiträume, wenn sich die Soll-Arbeitszeit im Lauf der Zeit ändert.

Wichtiges Standardverhalten:

- die Wochenarbeitszeit wird pro Mitarbeiter gepflegt
- Gültigkeitszeiträume dürfen sich nicht überschneiden
- die Sollstunden werden für den Soll-Ist-Vergleich, die Überstunden und die Berechnung des Resturlaubs verwendet
- genaue Normalarbeitszeiten werden in dieser Liste nicht gepflegt

**Siehe auch:**
- [Arbeitszeit / Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/arbeitszeit.md)
- [Zeitbericht](~/doc/arbeitszeiterfassung/zeitbericht.md)

---

### Wie aktualisiere ich Mitarbeiterdaten in großer Menge?

Verwenden Sie den Export, wenn Sie eine Datei zur Prüfung oder Übergabe benötigen, aber seien Sie mit dem Import im Standard von time cockpit vorsichtig: Der Import legt neue Zeilen an und aktualisiert keine bestehenden.

Das bedeutet:

- verwenden Sie den [Datenexport](~/doc/datenaustausch/export.md), um die aktuellen Mitarbeiterdaten außerhalb des Systems zu prüfen
- verwenden Sie den [Datenimport](~/doc/datenaustausch/import.md), um neue Datensätze kontrolliert anzulegen
- aktualisieren Sie bestehende Stammdaten der Mitarbeiter in den betreffenden Listen oder verwenden Sie eine Anpassung, wenn Sie echte Massenaktualisierungen bestehender Datensätze benötigen

Wenn Sie Daten extern vorbereiten, testen Sie zuerst die Zuordnung für den Import und prüfen Sie das Ergebnis, bevor Sie es produktiv verwenden.

**Siehe auch:**
- [Datenimport](~/doc/datenaustausch/import.md)
- [Datenexport](~/doc/datenaustausch/export.md)
- [Entwickler-FAQ](~/doc/entwickler-faq.md)

---

## Urlaub und Abwesenheitsverwaltung

### Wie konfiguriere ich Urlaubsregelungen und Urlaubsansprüche?

Im Standard von time cockpit wird der Urlaubsanspruch pro Mitarbeiter gepflegt und zusammen mit der Wochenarbeitszeit berechnet.

Die grundlegende Einrichtung:

1. Pflegen Sie die Soll-Arbeitszeit des Mitarbeiters unter **Benutzer -> Wochenarbeitszeit**.
2. Pflegen Sie den Anspruch des Mitarbeiters unter **Benutzer -> Urlaubsanspruch**.
3. Verwenden Sie die Urlaubslisten und die Berechnung des Resturlaubs für die laufende Prüfung.

Wichtiges Standardverhalten:

- der Urlaubsanspruch wird in Wochen verwaltet
- auch der Resturlaub wird in Wochen berechnet
- verbrauchter Urlaub wird auf Basis der Sollstunden des Mitarbeiters umgerechnet
- Teilzeit und historische Änderungen der Wochenarbeitszeit werden bei der Berechnung berücksichtigt

Wenn Ihr Unternehmen besondere Regeln für den Aufbau oder Verfall von Urlaub benötigt, prüfen Sie Ihre aktuelle Konfiguration sorgfältig, denn die Standarddokumentation beschreibt vor allem die Berechnung von Urlaubsanspruch und Resturlaub, nicht die Automatisierung eigener Regelungen.

**Siehe auch:**
- [Arbeitszeit / Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/arbeitszeit.md)
- [Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md)

---

### Wie genehmige oder lehne ich Urlaubsanträge ab?

Wenn der Genehmigungsworkflow aktiviert ist, können HR-Administratoren Abwesenheiten aller Benutzer im Namen der Abteilungsleiter genehmigen.

1. Öffnen Sie den Abwesenheitskalender, der unter [Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md) beschrieben ist.
2. Aktivieren Sie **Show all users**, wenn Sie abteilungsübergreifend arbeiten müssen.
3. Grenzen Sie das Ergebnis bei Bedarf mit den Filtern **Abteilung** und **Benutzer** ein.
4. Wählen Sie eine offene Zeile in der Liste über dem Kalender aus, um die Abwesenheit als Vorschau anzuzeigen.
5. Verwenden Sie die Aktion zum Genehmigen oder Ablehnen in den Spalten ganz rechts.

Für diesen Ablauf dokumentiertes Standardverhalten:

- HR-Administratoren können im Namen der Abteilungsleiter genehmigen
- der Kalender springt zum Beginndatum der ausgewählten Abwesenheit
- der beantragende Benutzer erhält nach der Genehmigung oder Ablehnung eine Benachrichtigung
- abgelehnte Abwesenheiten werden gelöscht

**Siehe auch:**
- [Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md)
- [Abteilungsleiter-FAQ](~/doc/abteilungsleiter-faq.md)

---

### Wie gehe ich mit Krankenständen und medizinisch bedingten Abwesenheiten um?

Verwenden Sie **Benutzer -> Krankenstand** für Krankenstandsdatensätze. Ist der Genehmigungsworkflow für Krankenstände aktiviert, wird die Genehmigung im selben Abwesenheitskalender abgewickelt wie bei den anderen Abwesenheitsarten.

Im Alltag bedeutet das in der Regel:

1. Legen Sie den Krankenstand an oder prüfen Sie ihn.
2. Öffnen Sie den Abwesenheitskalender, wenn eine Genehmigung erforderlich ist.
3. Genehmigen oder lehnen Sie den Datensatz dort ab.
4. Prüfen Sie das Ergebnis im Abwesenheitsverlauf des Mitarbeiters und in den zugehörigen Arbeitszeitansichten.

Die Standarddokumentation beschreibt die Erfassung und Genehmigung von Abwesenheiten, dokumentiert aber keine integrierte Verwaltung von ärztlichen Bestätigungen oder anderen externen Dokumenten. Wenn Ihr Prozess die Ablage von Dokumenten umfasst, prüfen Sie die Einrichtung Ihres Mandanten gesondert.

**Siehe auch:**
- [Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md)
- [Arbeitszeit / Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/arbeitszeit.md)

---

### Was ist der Unterschied zwischen Urlaub, Krankenstand und Zeitausgleich?

Im Standard von time cockpit sind das getrennte Abwesenheitsarten:

- **Urlaub** wird für Abwesenheiten verwendet, die auf den Urlaubsanspruch angerechnet werden.
- **Krankenstand** wird getrennt vom Urlaub erfasst.
- **Zeitausgleich** wird ebenfalls getrennt vom Urlaub erfasst.

Der Genehmigungsworkflow kann für jede Abwesenheitsart separat aktiviert werden. Urlaubsanspruch und Resturlaub sind in der Dokumentation zur Arbeitszeit beschrieben, der Genehmigungsworkflow für alle drei Arten in der Dokumentation zu Abwesenheiten.

**Siehe auch:**
- [Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md)
- [Arbeitszeit / Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/arbeitszeit.md)

---

## Compliance und Berichte

### Wie werte ich die Einhaltung der Arbeitszeitregelungen aus?

Die wichtigsten Standardansichten für HR-Administratoren sind:

- **Zeitbericht** für Arbeitszeit, Pausen, Bemerkungen und Überstunden in einem gewählten Zeitraum
- **Target-Actual Hours Comparison** für Soll- und Iststunden über einen Zeitraum
- **Overtime per Effective Date** für eine Momentaufnahme der Überstunden zu einem Datum
- **Working Time Violations**, wenn Ihr Mandant Arbeitszeitregelungen verwendet
- abwesenheitsbezogene Listen und der Abwesenheitskalender für Urlaub, Krankenstand und Zeitausgleich

Kombinieren Sie diese Ansichten je nach Fragestellung:

1. Beginnen Sie mit dem **Zeitbericht**, wenn Sie eine detaillierte Ansicht für einen Benutzer und einen Zeitraum benötigen.
2. Verwenden Sie **Target-Actual Hours Comparison**, wenn Sie Benutzer über einen Zeitraum vergleichen möchten.
3. Verwenden Sie **Overtime per Effective Date**, wenn Sie den Überstundenstand zu einem bestimmten Datum benötigen.
4. Verwenden Sie **Working Time Violations**, wenn Sie regelbasierte Arbeitszeitverstöße prüfen und die Funktion in Ihrem Mandanten eingerichtet ist.

**Siehe auch:**
- [Zeitbericht](~/doc/arbeitszeiterfassung/zeitbericht.md)
- [Arbeitszeit / Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/arbeitszeit.md)
- [Arbeitszeitregelungen](~/doc/arbeitszeiterfassung/arbeitszeitregelungen.md)

---

### Wie bereite ich Daten für die Lohnverrechnung vor?

Im Standard von time cockpit ist die Vorbereitung der Lohnverrechnung vor allem ein Prozess aus Prüfung und Export.

Prüfen Sie vor dem Export:

- die vollständigen Zeitbuchungen für den Abrechnungszeitraum
- die genehmigten Abwesenheiten für denselben Zeitraum
- Soll- und Iststunden, soweit relevant
- die Überstundenstände, wenn Ihr Lohnverrechnungsprozess sie verwendet

Typische Standardquellen sind:

- [Zeitbericht](~/doc/arbeitszeiterfassung/zeitbericht.md)
- [Zeitbuchungen](~/doc/projektzeiterfassung/zeitbuchungen.md)
- [Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md)
- [Datenexport](~/doc/datenaustausch/export.md)

Die Standarddokumentation erklärt, wie Sie Daten exportieren. Das endgültige Format für die Lohnverrechnung hängt jedoch von Ihrem nachgelagerten Lohnverrechnungssystem und einer eventuell verwendeten eigenen Integration ab.

**Siehe auch:**
- [Zeitbericht](~/doc/arbeitszeiterfassung/zeitbericht.md)
- [Zeitbuchungen](~/doc/projektzeiterfassung/zeitbuchungen.md)
- [Datenexport](~/doc/datenaustausch/export.md)
- [Entwickler-FAQ](~/doc/entwickler-faq.md)

---

## Brauchen Sie mehr Hilfe?

### Ressourcen für HR-Administratoren

**Verwandte FAQs:**
- [Anwender-FAQ](~/doc/anwender-faq.md) - Allgemeine Fragen zur Zeiterfassung
- [Abteilungsleiter-FAQ](~/doc/abteilungsleiter-faq.md) - Genehmigungsabläufe im Team
- [Mitarbeiter-FAQ](~/doc/mitarbeiter-faq.md) - Anleitungen für Mitarbeiter zur Selbstbedienung
- [Entwickler-FAQ](~/doc/entwickler-faq.md) - API und Anpassungen

**Dokumentation:**
- [Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md)
- [Arbeitszeit / Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/arbeitszeit.md)
- [Zeitbericht](~/doc/arbeitszeiterfassung/zeitbericht.md)
- [Standardberechtigungen](~/doc/arbeitszeiterfassung/standardberechtigungen.md)
- [Kontoverwaltung](~/doc/kontoverwaltung/kontoverwaltung.md)

**Support:**
- **E-Mail:** support@timecockpit.com

---

*Zuletzt aktualisiert: April 2026.*
