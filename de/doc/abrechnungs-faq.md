---
title: Abrechnungs-FAQ - Rechnungslegung und Umsatzverwaltung
description: Häufige Fragen von Abrechnungsadministratoren zu Rechnungen, Stundensätzen, Abrechnungsberichten und der Verrechnung an Kunden in time cockpit.
keywords: [abrechnungsadministrator, rechnungserstellung, stundensätze, abrechnungs faq, umsatzverfolgung, kundenrechnungen, rechnungsverwaltung, abrechnungsberichte, nicht verrechnete zeitbuchungen]
faq: true
en_page: doc/billing-admin-faq.md
---

# Abrechnungs-FAQ

Diese FAQ beantwortet häufige Fragen von Abrechnungsadministratoren, die in time cockpit Rechnungen erstellen, Abrechnungsdaten prüfen und die Verrechnung an Kunden verwalten.

> [!NOTE]
> Allgemeine Fragen zur Zeiterfassung beantwortet die [Anwender-FAQ](~/doc/anwender-faq.md). Fragen zur Budgetkontrolle von Projekten beantwortet die [Projektleiter-FAQ](~/doc/projektleiter-faq.md).

> [!NOTE]
> Überprüft im April 2026.

## Rechnungserstellung

### Wie erstelle ich eine Rechnung aus nicht verrechneten Zeitbuchungen?

Verwenden Sie **Verwaltung -> Verrechnung -> Nicht verrechnete Zeitbuchungen**.

Der Standardablauf:

1. Öffnen Sie **Nicht verrechnete Zeitbuchungen**.
2. Wählen Sie die Zeitbuchungen aus, die Sie verrechnen möchten.
3. Führen Sie im Menü **Aktionen** die Aktion **Ausgangsrechnung anlegen** aus.
4. Geben Sie die Rechnungsdetails ein.

Laut Standarddokumentation führt die Aktion dann Folgendes aus:

- sie ordnet die ausgewählten Zeitbuchungen Rechnungspositionen zu
- sie erstellt Rechnungspositionen aus den ausgewählten projektbezogenen Zeitbuchungen
- sie erstellt reisebezogene Rechnungspositionen, wenn Kilometerdaten vorhanden sind
- sie kopiert den konkret gültigen Stundensatz in `Hourly Rate Billed`

Nach der Zuordnung zu einer Rechnung sind die zugehörigen Zeitbuchungen schreibgeschützt.

**Siehe auch:**
- [Rechnungslegung](~/doc/projektzeiterfassung/rechnungslegung.md)
- [Rechnungsdatenfelder](~/doc/projektzeiterfassung/rechnungsdatenfelder.md)
- [Zeitbuchungen](~/doc/projektzeiterfassung/zeitbuchungen.md)

---

### Kann ich eine Rechnung nach der Erstellung bearbeiten oder korrigieren?

Öffnen Sie die Rechnung unter **Verwaltung -> Verrechnung -> Ausgangsrechnungen**.

Die Standarddokumentation beschreibt Rechnungen als Kombination aus Rechnungsdaten und Rechnungspositionen. Sie erklärt außerdem, dass automatisch zugeordnete Zeitbuchungen nach der Verrechnung schreibgeschützt sind.

In der Praxis bedeutet das:

- prüfen Sie Rechnungsdaten wie Rechnungsnummer, Rechnungsdatum, Leistungszeitraum, Rechnungsadresse und die Einstellungen für das Rechnungsdokument im Rechnungsdatensatz
- prüfen Sie die erzeugten Rechnungspositionen sorgfältig, bevor Sie das Rechnungsdokument versenden
- verwenden Sie manuelle Rechnungspositionen oder manuelle Rechnungen, wenn die automatische Standarderstellung nicht zu Ihrem Abrechnungsfall passt

Die Standarddokumentation beschreibt keinen eigenen Ablauf zum Rückgängigmachen einer Rechnung. Prüfen Sie Korrekturen deshalb sorgfältig im Hinblick auf Ihren Buchhaltungsprozess.

**Siehe auch:**
- [Rechnungslegung](~/doc/projektzeiterfassung/rechnungslegung.md)
- [Rechnungsdatenfelder](~/doc/projektzeiterfassung/rechnungsdatenfelder.md)

---

### Wie gehe ich mit Pauschal- und Festpreisverträgen um?

Für Abrechnungsfälle, die nicht in den automatischen Ablauf von Zeitbuchung zu Rechnung passen, verwenden Sie manuelle Rechnungen oder eigene Rechnungspositionen.

Die Standarddokumentation beschreibt ausdrücklich:

- die automatische Rechnungserstellung aus ausgewählten, noch nicht verrechneten Zeitbuchungen
- manuelle Rechnungen für Fälle außerhalb dieses automatischen Ablaufs
- eigene Rechnungspositionen und Artikel für besondere Abrechnungsanforderungen

Ein praxistauglicher Standardansatz:

- verwenden Sie die automatische Rechnungserstellung für die Verrechnung nach Aufwand
- verwenden Sie manuelle Rechnungen, wenn Sie einen Fixbetrag verrechnen, der nicht direkt aus ausgewählten Zeitbuchungen erzeugt wird
- verwenden Sie eigene Rechnungspositionen oder Artikel, wenn Sie zusätzliche Rechnungspositionen benötigen, die nicht auf Zeitbuchungen beruhen

Wenn Sie bei Festpreis- oder Pauschalaufträgen weiterhin Zeiten für interne Auswertungen erfassen, behalten Sie die Zeitbuchungen für Berichte und die Prüfung der Rentabilität, richten Sie den eigentlichen Rechnungsablauf aber am Vertragsmodell aus.

**Siehe auch:**
- [Rechnungslegung](~/doc/projektzeiterfassung/rechnungslegung.md)
- [Rechnungsdatenfelder](~/doc/projektzeiterfassung/rechnungsdatenfelder.md)
- [Projektleiter-FAQ](~/doc/projektleiter-faq.md)

---

## Stundensätze und Verrechnungslogik

### Wie lege ich Stundensätze für die Verrechnung fest und aktualisiere sie?

In der Standardhierarchie können Stundensätze bei Kunden, Projekten und Tätigkeiten gepflegt werden.

Die Standarddokumentation beschreibt folgende Vererbung:

- ein Kunde kann einen Standardstundensatz haben
- ein Projekt kann den Stundensatz des Kunden überschreiben
- eine Tätigkeit kann den Stundensatz des Projekts überschreiben

Wenn Sie eine Rechnung aus Zeitbuchungen erstellen, kopiert time cockpit den konkret gültigen verrechneten Stundensatz in die Zeitbuchung. Deshalb ändern spätere Änderungen des Stundensatzes die bereits verrechneten Einträge nicht rückwirkend.

**Siehe auch:**
- [Kunden, Projekte und Tätigkeiten](~/doc/projektzeiterfassung/kunde-projekt-taetigkeit.md)
- [Rechnungslegung](~/doc/projektzeiterfassung/rechnungslegung.md)
- [Rechnungsdatenfelder](~/doc/projektzeiterfassung/rechnungsdatenfelder.md)

---

### Wie unterscheide ich für die Abrechnungsprüfung verrechenbare und nicht verrechenbare Zeiten?

Verwenden Sie je nach Fragestellung die passende Liste:

- **Zeitbuchungen** für die Prüfung einzelner Einträge
- **Nicht verrechnete Zeitbuchungen** für verrechenbare Einträge, die noch nicht verrechnet sind
- **Budgetkontrolle für Projekte**, wenn Sie eine finanzielle Übersicht auf Projektebene benötigen

Die Standarddokumentation weist außerdem darauf hin:

- Projekte können als verrechenbar oder nicht verrechenbar gekennzeichnet werden
- Tätigkeiten können als nicht verrechenbar gekennzeichnet werden
- Zeitbuchungen enthalten Informationen zur Verrechenbarkeit für die Prüfung vor der Rechnungslegung

Das reicht in der Regel aus, um verrechenbare Arbeit vor der Rechnungserstellung von interner oder ausgeschlossener Arbeit zu trennen.

**Siehe auch:**
- [Zeitbuchungen](~/doc/projektzeiterfassung/zeitbuchungen.md)
- [Kunden, Projekte und Tätigkeiten](~/doc/projektzeiterfassung/kunde-projekt-taetigkeit.md)
- [Rechnungslegung](~/doc/projektzeiterfassung/rechnungslegung.md)

---

## Umsatz und Berichte

### Welche Abrechnungsansichten sollte ich regelmäßig prüfen?

Die nützlichsten Standardansichten für Abrechnungsadministratoren sind:

- **Nicht verrechnete Zeitbuchungen** für Zeitbuchungen, die zur Prüfung für die Rechnungslegung bereitstehen
- **Ausgangsrechnungen** für erstellte Rechnungen und deren Nachverfolgung
- **Budgetkontrolle für Projekte** für Budget und Verrechnung im Kontext des Projekts
- **Zeitbuchungen**, wenn Sie die einzelnen Einträge hinter einer Abrechnungsfrage prüfen müssen

Wie oft Sie diese Ansichten prüfen, hängt von Ihrem Abrechnungszyklus ab. In der Produktdokumentation entsprechen sie vor allem der Vorbereitung von Rechnungen, der Prüfung von Rechnungen und der Abrechnungskontrolle auf Projektebene.

**Siehe auch:**
- [Rechnungslegung](~/doc/projektzeiterfassung/rechnungslegung.md)
- [Anwendungsfall Budgetkontrolle](~/doc/anwendungsfaelle/budgetkontrolle.md)
- [Datenexport](~/doc/datenaustausch/export.md)

---

## Kunden- und Rechnungsdaten

### Wie verwalte ich Rechnungsadresse und Rechnungsdetails?

Die Standardfelder einer Rechnung sind unter [Rechnungsdatenfelder](~/doc/projektzeiterfassung/rechnungsdatenfelder.md) beschrieben.

Wichtige Standardfelder sind:

- **Rechnungsdatum**
- **Ausgangsrechnungsnummer**
- **Rechnungsadresse**
- **Leistungszeit Beginn**
- **Leistungszeit Ende**
- Einstellungen für **Skonto [%]**
- **Bezahlt am**
- **Inkl. Zeitnachweis am Rechnungsdokument**

Die Rechnungsadresse wird standardmäßig vom Kunden übernommen, kann aber pro Rechnung überschrieben werden.

**Siehe auch:**
- [Rechnungsdatenfelder](~/doc/projektzeiterfassung/rechnungsdatenfelder.md)
- [Rechnungslegung](~/doc/projektzeiterfassung/rechnungslegung.md)

---

### Wie gehe ich mit mehreren Rechnungsempfängern für einen Kunden um?

Die Standarddokumentation beschreibt die Rechnungsadresse auf Kundenebene und weist darauf hin, dass sie pro Rechnung überschrieben werden kann.

Wenn ein Kunde mehrere Rechnungsempfänger oder Rechnungsadressen hat, sind die sicheren Standardoptionen:

- pflegen Sie die Standardrechnungsadresse beim Kunden
- überschreiben Sie die Rechnungsadresse bei Bedarf auf einzelnen Rechnungen
- verwenden Sie eine Konvention auf Projekt- oder Prozessebene, wenn verschiedene Projekte desselben Kunden unterschiedlich verrechnet werden müssen

Wenn Sie in time cockpit eine strukturiertere Verrechnung mit mehreren Ansprechpartnern benötigen, prüfen Sie das gesondert als Thema für eine Anpassung.

**Siehe auch:**
- [Rechnungsdatenfelder](~/doc/projektzeiterfassung/rechnungsdatenfelder.md)
- [Kunden, Projekte und Tätigkeiten](~/doc/projektzeiterfassung/kunde-projekt-taetigkeit.md)

---

## Brauchen Sie mehr Hilfe?

### Ressourcen für Abrechnungsadministratoren

**Verwandte FAQs:**
- [Anwender-FAQ](~/doc/anwender-faq.md) - Allgemeine Zeiterfassung
- [Projektleiter-FAQ](~/doc/projektleiter-faq.md) - Budget- und Projektverfolgung
- [HR-Administrator-FAQ](~/doc/hr-administrator-faq.md) - Mitarbeiterdaten für die Lohnverrechnung
- [Entwickler-FAQ](~/doc/entwickler-faq.md) - API und Anpassungen für Abrechnungsintegrationen

**Dokumentation:**
- [Rechnungslegung](~/doc/projektzeiterfassung/rechnungslegung.md)
- [Rechnungsdatenfelder](~/doc/projektzeiterfassung/rechnungsdatenfelder.md)
- [Zeitbuchungen](~/doc/projektzeiterfassung/zeitbuchungen.md)
- [Kunden, Projekte und Tätigkeiten](~/doc/projektzeiterfassung/kunde-projekt-taetigkeit.md)
- [Datenexport](~/doc/datenaustausch/export.md)
- [Web API: Überblick](/doc/web-api/overview.html)

**Support:**
- **E-Mail:** support@timecockpit.com

---

*Zuletzt aktualisiert: April 2026.*
