---
title: Stundensätze verwalten und Preise konfigurieren
description: "Stundensätze für die Rechnungslegung in time cockpit konfigurieren: Satzhierarchie, kundenspezifische Preise, rollenbasierte Sätze und Satzänderungen."
keywords: [stundensätze, verrechnungssätze, projektpreise, stundensatzverwaltung, kundensätze, rollenbasierte preise, stundensatzhierarchie, preiskonfiguration, verrechenbare stundensätze, stundensatzänderungen, preisstrategie]
en_page: doc/project-time-tracking/hourly-rates.md
---

# Stundensätze verwalten und Preise konfigurieren

Konfigurieren und verwalten Sie Stundensätze für eine korrekte Verrechnung, die Verfolgung der Rentabilität und die Rechnungslegung an Kunden. Lernen Sie Satzhierarchien, Strategien für Satzänderungen und Abläufe der Preisgestaltung kennen.

> [!TIP]
> **Sie möchten Ihre Preisstrategie optimieren?** Erfahren Sie, wie Sie durch ein effektives Management der Stundensätze [den Projektumsatz maximieren](https://www.timecockpit.com/blog/project-time-tracking-revenue/). Entdecken Sie unsere [Funktionen für die Projektverrechnung](https://www.timecockpit.com/features/project-invoicing/).

## Überblick

Stundensätze erfüllen in time cockpit zwei wichtige Zwecke:

**1. Verrechnung an Kunden (verrechenbare Sätze)**
- Was Sie Kunden für erbrachte Arbeit verrechnen
- Erscheinen auf Rechnungen
- Bestimmen den Projektumsatz

**2. Interne Kostenrechnung (Kostensätze)**
- Was jede Stunde Ihr Unternehmen kostet (Gehalt, Gemeinkosten)
- Werden für Rentabilitätsanalysen verwendet
- Erscheinen nicht auf Kundenrechnungen

**Grundprinzip:**
```
Profit = Billable Rate - Cost Rate
Margin % = (Profit / Billable Rate) × 100
```

## Satzhierarchie und Priorität

time cockpit verwendet ein kaskadierendes System von Stundensätzen mit einer klaren Prioritätsreihenfolge:

### Priorität der Sätze (von der höchsten zur niedrigsten)

**1. Aufgabenspezifischer Satz** (höchste Priorität)
- Wird bei einzelnen Aufgaben festgelegt
- Feinste Steuerungsmöglichkeit
- Überschreibt alle anderen Sätze

**2. Standardsatz des Projekts**
- Wird bei Projekten festgelegt
- Gilt für alle Aufgaben bzw. Einträge dieses Projekts (sofern kein Aufgabensatz angegeben ist)
- Häufigste Vorgehensweise

**3. Satz des Mitarbeiters bzw. Benutzers**
- Wird im Datensatz des Mitarbeiters festgelegt
- Wird typischerweise für den internen Kostensatz verwendet (nicht für den verrechenbaren Satz)
- Rückfallwert, wenn es keinen Projekt- oder Aufgabensatz gibt

**4. Standardsatz des Unternehmens** (niedrigste Priorität, Rückfallwert)
- Globaler Standardsatz (in den Einstellungen konfiguriert)
- Wird verwendet, wenn keine anderen Sätze festgelegt sind
- Sicherheitsnetz gegen Einträge mit einem Satz von null

### So funktioniert die Auswahl des Satzes

Beim Anlegen einer Zeitbuchung ermittelt time cockpit den Satz, indem es in dieser Reihenfolge prüft:

```
Entry for Task A on Project B by Employee C:

1. Does Task A have an hourly rate? → Use it ✓
2. If not, does Project B have a default rate? → Use it
3. If not, does Employee C have a default rate? → Use it
4. If not, use company default rate → Last resort
```

**Beispiel:**
- Mitarbeiter: John (Standardsatz: 125 $/Stunde interne Kosten)
- Projekt: Client Website (Standardsatz: 150 $/Stunde)
- Aufgabe: "Senior Development" (eigener Satz: 200 $/Stunde)
- Aufgabe: "Junior Development" (kein eigener Satz)

**Ergebnis:**
- Johns Zeit auf "Senior Development" → verrechnet mit 200 $/Stunde (Aufgabensatz)
- Johns Zeit auf "Junior Development" → verrechnet mit 150 $/Stunde (Projektsatz)

## Stundensätze festlegen

### Sätze auf Projektebene

Am besten geeignet für: einheitliche Sätze für das gesamte Projekt

**Konfiguration:**
1. Navigieren Sie zu **Verwaltung** → **[Projekte](https://web.timecockpit.com/app/lists/APP_DefaultProjectList)**
2. Öffnen Sie das Projekt
3. Setzen Sie **Default Hourly Rate:** (z. B. 150 $)
4. Klicken Sie auf **Speichern**

**Auswirkung:**
- Alle Zeitbuchungen dieses Projekts verwenden 150 $ (sofern kein Aufgabensatz ihn überschreibt)
- Einfache, einheitliche Preisgestaltung
- Leicht zu verwalten

**Anwendungsfälle:**
- Fixer Satz für den Kunden (unabhängig davon, wer arbeitet)
- Mischsatz über das ganze Team
- Einfache Verrechnung nach Aufwand

### Sätze auf Aufgabenebene (feine Steuerung)

Am besten geeignet für: unterschiedliche Sätze für unterschiedliche Arten von Arbeit

**Konfiguration:**
1. Navigieren Sie zu **Verwaltung** → **[Aufgaben](https://web.timecockpit.com/app/lists/APP_DefaultTaskList)**
2. Öffnen Sie die Aufgabe
3. Setzen Sie **Hourly Rate:** (z. B. 200 $)
4. Klicken Sie auf **Speichern**

**Anwendungsfälle:**
- **Rollenbasierte Preise:**
  - Arbeit Senior Developer: 200 $/Stunde
  - Arbeit Mid-Level Developer: 150 $/Stunde
  - Arbeit Junior Developer: 100 $/Stunde
  - QA/Testing: 80 $/Stunde
  - Projektmanagement: 150 $/Stunde

- **Leistungsbasierte Preise:**
  - Beratung: 250 $/Stunde
  - Implementierung: 150 $/Stunde
  - Support: 100 $/Stunde  
  - Schulung: 120 $/Stunde

- **Komplexitätsbasierte Preise:**
  - Architektur und Design: 200 $/Stunde
  - Standardentwicklung: 150 $/Stunde
  - Fehlerbehebung: 100 $/Stunde

### Sätze für Mitarbeiter bzw. Benutzer (interne Kosten)

Am besten geeignet für: Verfolgung der Rentabilität und Kostenanalyse

**Konfiguration:**
1. Navigieren Sie zu **Benutzer** → **[Benutzerdetails](https://web.timecockpit.com/app/lists/APP_DefaultUserDetailList)**
2. Öffnen Sie den Datensatz des Mitarbeiters  
3. Setzen Sie **Default Hourly Rate:** (z. B. 75 $/Stunde interne Kosten)
4. Klicken Sie auf **Speichern**

**Wichtig:**
- Das ist typischerweise der **interne Kostensatz** (nicht der verrechenbare Satz)
- Entspricht Gehalt + Nebenleistungen + Gemeinkosten pro Stunde des Mitarbeiters
- Wird zur Berechnung der Projektrentabilität verwendet
- Erscheint NICHT auf Kundenrechnungen

**Berechnung des internen Kostensatzes:**
```
Annual Salary + Benefits + Overhead / Billable Hours per Year

Example:
$120,000 salary + $30,000 benefits/overhead = $150,000
$150,000 / 2,000 billable hours/year = $75/hour internal cost
```

**Siehe:** [Budgetkontrolle](~/doc/projektzeiterfassung/budgetkontrolle.md#kosten-und-verrechenbare-beträge-verfolgen) für die Rentabilitätsanalyse

## Sätze während eines laufenden Projekts ändern

### Szenario: Satzerhöhung während des Projekts

**Herausforderung:** Der Projektsatz soll von 150 $ auf 175 $/Stunde steigen

**Schritte:**
1. Navigieren Sie zu **Verwaltung** → **[Projekte](https://web.timecockpit.com/app/lists/APP_DefaultProjectList)**
2. Öffnen Sie das Projekt
3. Ändern Sie **Default Hourly Rate:** von 150 $ auf 175 $
4. Klicken Sie auf **Speichern**

**Auswirkung:**
- ✅ **Künftige Zeitbuchungen:** verwenden den neuen Satz (175 $)
- ℹ️ **Vergangene, noch nicht verrechnete Einträge:** zeigen weiterhin den ursprünglichen Satz (150 $)
- 🔒 **Verrechnete Einträge:** sind auf den verrechneten Satz festgeschrieben (keine Änderung möglich)

### Noch nicht verrechnete Einträge rückwirkend anpassen

Wenn vergangene Einträge den neuen Satz verwenden sollen:

**Schritte:**
1. Navigieren Sie zu **Zeiterfassung** → **[Zeitbuchungen](https://web.timecockpit.com/app/lists/APP_DefaultTimesheetList)**
2. Wenden Sie Filter an:
   - **Projekt:** Wählen Sie Ihr Projekt aus
   - **Date Range** Setzen Sie den betroffenen Zeitraum
   - **Billed:** = False (nur noch nicht verrechnete Einträge)
3. **Wählen Sie mehrere Einträge aus** (STRG+Klick oder alle auswählen)
4. **Massenänderung** (falls unterstützt) oder einzeln bearbeiten:
   - Setzen Sie **Hourly Rate Actual:** 175 $
5. Klicken Sie auf **Speichern**

**Warnung:** Bei bereits verrechneten Einträgen können Sie die Sätze nicht ändern (sie sind für den Prüfpfad gesperrt)

### Kommunikation von Satzänderungen

**Ablauf zur Benachrichtigung des Kunden:**
1. **Vertragsänderung:** Aktualisieren Sie die Leistungsbeschreibung (SOW) mit dem neuen Satz
2. **Vorankündigung:** Informieren Sie den Kunden 30 bis 60 Tage vor dem Stichtag
3. **Dokumentation:** Halten Sie den Stichtag in den Projektnotizen fest
4. **Aktualisierung im System:** Ändern Sie den Projektsatz zum Stichtag
5. **Klarheit auf der Rechnung:** Weisen Sie auf der ersten Rechnung mit dem neuen Satz auf die Änderung hin

**Interne Nachverfolgung:**
- Halten Sie das Datum der Satzänderung in der Projektbeschreibung fest
- Verwenden Sie eigene Projektfelder für den Verlauf der Sätze (falls konfiguriert)
- Erstellen Sie einen Bericht über die Stunden vor und nach der Satzänderung

## Kundenspezifische Preisstrategien

### Ansatz 1: Sätze auf Projektebene (einfach)

Ein Projekt = ein Satz

**Einrichtung:**
- Kunde A, Projekt 1: Satz 150 $
- Kunde A, Projekt 2: Satz 150 $
- Kunde B, Projekt 1: Satz 200 $
- Kunde B, Projekt 2: Satz 200 $

**Vorteile:**
- ✅ Einfach zu verwalten
- ✅ Keine Anpassung nötig
- ✅ Klare Preise pro Projekt

**Nachteile:**
- ❌ Wiederholend bei vielen Projekten pro Kunde
- ❌ Bei Satzänderungen muss jedes Projekt einzeln aktualisiert werden

### Ansatz 2: Satztabellen pro Kunde (fortgeschritten)

Voraussetzung: eigene Entität und Scripting

**Konzept:**
Legen Sie eine eigene Entität "Rate Card" an:
- Kunde (Beziehung)
- Leistungsart (Entwicklung, Beratung, Support usw.)
- Stundensatz

**Suchlogik:**
Beim Anlegen einer Zeitbuchung sucht ein Skript den Satz in der Rate Card anhand folgender Kriterien:
- Aktueller Kunde
- Aktuelle Aufgabe bzw. Leistungsart
- Stichtag (für historische Sätze)

**Vorteile:**
- ✅ Zentrale Verwaltung der Sätze
- ✅ Nachverfolgung historischer Sätze
- ✅ Unterstützt komplexe Preismodelle

**Nachteile:**
- ❌ Erfordert Entwicklung (Scripting)
- ❌ Aufwendiger in der Wartung
- ❌ Erfordert Know-how in der Anpassung

**Siehe:** [Anpassung des Datenmodells](/doc/data-model-customization/overview.html), [Scripting: Aktionen](/doc/scripting/actions.html)

## Preismodelle

### Mischsatzmodell

**Konzept:** Ein Satz für alle Teammitglieder im Projekt

**Einrichtung:**
- Projekt: "Client Website Design"
- Satz: 150 $/Stunde (Mischsatz)
- Alle Teammitglieder werden unabhängig von ihrer Erfahrung mit 150 $ verrechnet

**Wann einsetzen:**
- Der Kunde bevorzugt einfache, planbare Preise
- Die Zusammensetzung des Teams kann schwanken
- Junior- und Senior-Mitarbeiter gleichen sich aus
- Verringert den Aufwand bei Satzverhandlungen

**Beispiel:**
```
Team:
- Senior Developer (internal cost: $100/hour)
- Mid Developer (internal cost: $75/hour)
- Junior Developer (internal cost: $50/hour)

Blended billable rate: $150/hour (all three)

Customer pays same rate regardless of who works
Internal profit margin varies (50%, 100%, 200%)
```

### Rollenbasiertes Satzmodell

**Konzept:** Unterschiedliche Sätze je nach Erfahrung bzw. Rolle des Mitarbeiters

**Einrichtung:**
Legen Sie Aufgaben nach Rolle an:
- Aufgabe: "Senior Development" → Satz: 200 $/Stunde
- Aufgabe: "Mid-Level Development" → Satz: 150 $/Stunde
- Aufgabe: "Junior Development" → Satz: 100 $/Stunde
- Aufgabe: "QA/Testing" → Satz: 80 $/Stunde

Die Mitarbeiter wählen bei der Zeiterfassung die passende Aufgabe aus.

**Wann einsetzen:**
- Der Kunde möchte die Kosten steuern (setzt Junior-Mitarbeiter für einfache Arbeiten ein)
- Transparenz darüber, wer arbeitet
- Branchenstandard (z. B. Recht, Beratung)
- Komplexe Projekte mit unterschiedlichen Qualifikationsanforderungen

**Beispiel:**
```
Project: Enterprise System Integration

Tasks with rates:
- Architecture & Planning: $250/hour (senior architects)
- Backend Development: $150/hour (mid-level engineers)
- Frontend Development: $120/hour (junior/mid developers)
- Testing: $80/hour (QA team)
- Project Management: $175/hour (PM)

Customer gets itemized invoice showing hours by role
Optimizes cost (right person for right job)
```

### Leistungsbasiertes Satzmodell

**Konzept:** Unterschiedliche Sätze für unterschiedliche Leistungen bzw. Ergebnisse

**Einrichtung:**
Aufgaben nach Leistungsart gegliedert:
- Aufgabe: "Consulting & Advisory" → Satz: 250 $/Stunde
- Aufgabe: "Development & Implementation" → Satz: 150 $/Stunde
- Aufgabe: "Support & Maintenance" → Satz: 100 $/Stunde
- Aufgabe: "Training & Documentation" → Satz: 120 $/Stunde

**Wann einsetzen:**
- Vielfältiges Leistungsangebot
- Wertbasierte Preisgestaltung (Strategie = höherer Satz)
- Gemischte Vertragsarten (Support-Pauschale + Projektentwicklung)

## Besondere Preisszenarien

### Rabattierte Sätze

**Szenario:** Der Kunde erhält 10 % Rabatt

**Option 1: Projektsatz anpassen**
- Regulärer Satz: 150 $/Stunde
- Rabattierter Satz: 135 $/Stunde (150 $ × 0,90)
- Setzen Sie den Projektsatz direkt auf 135 $

**Vorteile:** Zeitbuchungen zeigen sofort den rabattierten Satz
**Nachteile:** Der ursprüngliche Satz ist nicht ersichtlich (für Auswertungen)

**Option 2: Rabatt auf Rechnungsebene**
- Erstellen Sie die Rechnung mit den regulären Sätzen (150 $/Stunde)
- Fügen Sie eine manuelle Rechnungsposition hinzu: "10 % Rabatt: -1.500 $"
- Die Rechnungssumme berücksichtigt den Rabatt

**Vorteile:** Der Standardsatz bleibt in den Zeitbuchungen erhalten, der Rabatt wird separat ausgewiesen
**Nachteile:** Manuelle Anpassung pro Rechnung erforderlich

**Option 3: Nachverfolgung über ein eigenes Feld**
- Setzen Sie den Projektsatz auf den rabattierten Betrag (135 $)
- Fügen Sie ein eigenes Feld "Standard Rate" = 150 $ hinzu
- Verwenden Sie es für interne Berichte

### Preise in mehreren Währungen

**Herausforderung:** time cockpit speichert Beträge ohne Währungssymbol

**Strategien:**

**Ansatz 1: Getrennte Projekte pro Währung**
- Kunde ABC - USD-Projekte (Sätze in USD)
- Kunde ABC - EUR-Projekte (Sätze in EUR)
- Getrennt erfassen, getrennt verrechnen

**Ansatz 2: Eigene Felder**
- Fügen Sie der Entität Projekt ein eigenes Feld "Currency" hinzu
- Halten Sie die Währung des Satzes in den Projektnotizen fest
- Vermerken Sie die Währung in den Rechnungshinweisen: "Alle Beträge in USD"

**Ansatz 3: Integration mit der Buchhaltungssoftware**
- Exportieren Sie Zeitbuchungen in die Buchhaltungssoftware
- Führen Sie die Währungsumrechnung in der Buchhaltungssoftware durch
- Halten Sie die Daten in time cockpit in einer einzigen Währung

**Siehe:** [Datenaustausch](/doc/data-exchange/export.html), [Web API](/doc/web-api/overview.html)

### Festpreisprojekte (keine Verrechnung nach Stundensatz)

Auch bei Festpreisprojekten sind Stundensätze für die interne Nachverfolgung wichtig:

**Einrichtung:**
- Setzen Sie den Projektsatz auf 0 (oder auf den internen Kostensatz für die Rentabilitätsanalyse)
- Erfassen Sie Zeiten wie gewohnt
- Markieren Sie Zeitbuchungen als verrechenbar (zur Nachverfolgung)
- Erstellen Sie die Rechnung manuell mit dem Festbetrag (nicht aus Zeitbuchungen)

**Zweck:** Tatsächlich geleistete Stunden mit dem Festpreis vergleichen, um:
- den effektiven Stundensatz zu berechnen: `Fixed Price / Total Hours`
- die Rentabilität zu ermitteln: `Fixed Price - (Hours × Internal Cost)`
- künftige Schätzungen zu verbessern

**Siehe:** [Budgetkontrolle](~/doc/projektzeiterfassung/budgetkontrolle.md), [Abrechnungsadministrator-FAQ](/doc/billing-admin-faq.html#how-do-i-handle-retainer-and-fixed-price-contracts)

## Best Practices für die Verwaltung von Stundensätzen

### 1. Annahmen zu Sätzen dokumentieren

**Dokumentieren Sie in den Projektnotizen:**
- ✓ Aktuellen Satz und Stichtag
- ✓ Verlauf der Satzänderungen
- ✓ Währung (bei mehreren Währungen)
- ✓ Gewährten Rabatt (falls vorhanden)
- ✓ Besondere Preiskonditionen

**Beispiel für eine Projektbeschreibung:**
```
Rate: $150/hour (effective 2026-01-01)
Previous rate: $135/hour (2025-01-01 to 2025-12-31)
Currency: USD
Discount: 10% volume discount applied
```

### 2. Regelmäßige Überprüfung der Sätze

**Checkliste für die quartalsweise Überprüfung:**
- □ Sätze mit Marktpreisen vergleichen (Wettbewerbsanalyse)
- □ Rentabilität nach Projekt bzw. Kunde prüfen
- □ Unrentable Sätze erkennen (Marge zu niedrig)
- □ Satzerhöhungen für die nächsten Vertragsverlängerungen planen
- □ Kostensätze der Mitarbeiter aktualisieren (Gehaltsänderungen)

### 3. Rentabilitätsorientierte Preisgestaltung

**Berechnen Sie vor dem Festlegen eines Satzes:**
```
Target Margin: 40%
Internal Cost: $75/hour
Required Billable Rate = $75 / (1 - 0.40) = $125/hour minimum
```

**Margenziele nach Branche:**
- Software/IT-Dienstleistungen: 35-50 %
- Beratung: 40-60 %
- Professionelle Dienstleistungen: 30-45 %

### 4. Detaillierung oder Einfachheit

**Zu einfach:** Ein einziger unternehmensweiter Satz
- ❌ Nicht wettbewerbsfähig (manche Leistungen zu teuer, manche zu billig)
- ❌ Niedrige Marge bei komplexer Arbeit
- ❌ Kunden vergleichen womöglich Angebote

**Zu komplex:** Ein eigener Satz für jeden Mitarbeiter und jede Leistung
- ❌ Nicht verwaltbar
- ❌ Verwirrend für Kunden
- ❌ Hoher Verwaltungsaufwand

**Optimal:** 3 bis 5 Satzstufen
- Senior/Spezialisiert: 200-250 $/Stunde
- Mittleres Niveau/Standard: 125-175 $/Stunde
- Junior/Support: 75-100 $/Stunde

### 5. Transparenz gegenüber Kunden

**Kommunikation der Sätze:**
- ✅ Sätze klar in Verträgen bzw. Leistungsbeschreibungen angeben
- ✅ Satzstufen erklären (bei rollenbasierten Sätzen)
- ✅ Satzübersicht vorab bereitstellen
- ✅ Satzerhöhungen rechtzeitig ankündigen
- ✅ Schriftlich dokumentieren (keine Überraschungen)

## Satzbezogene Felder in Zeitbuchungen

### Hourly Rate Actual

**Zweck:** Verrechenbarer Satz, der für die Umsatzberechnung verwendet wird

**Gesetzt durch:**
- Automatische Befüllung anhand der Satzhierarchie (Aufgabe → Projekt → Benutzer)
- Kann pro Eintrag manuell überschrieben werden (sofern die Berechtigungen es zulassen)

**Verwendet für:**
- Beträge der Rechnungspositionen
- Umsatzberechnung: `Duration × Hourly Rate Actual = Revenue`
- Analyse des effektiven Satzes

### Hourly Rate Billed

**Zweck:** Schreibt den Satz fest, wenn der Eintrag verrechnet wird

**Gesetzt durch:**
- Wird beim Erstellen der Rechnung automatisch gesetzt
- Wird zum Zeitpunkt der Verrechnung aus "Hourly Rate Actual" kopiert

**Verwendet für:**
- Prüfpfad (verhindert Satzänderungen nach der Verrechnung)
- Nachverfolgung historischer Sätze
- Stellt die Richtigkeit der Rechnung sicher

**Wichtig:** Sobald `Hourly Rate Billed` gesetzt ist (der Eintrag also verrechnet ist), kann der Satz nicht mehr geändert werden.

### Interner Kostensatz (UserDetail.DefaultHourlyRate)

**Zweck:** Mitarbeiterkosten für die Rentabilitätsberechnung

**Verwendet für:**
- Rentabilitätsanalyse: `Revenue - (Duration × Cost Rate) = Profit`
- Entscheidungen über den Ressourceneinsatz
- Preisstrategie (sicherstellen, dass die Sätze Kosten und Marge decken)

**Nicht sichtbar auf:** Kundenrechnungen

## Automatisierung und Integration

### Automatische Zuweisung von Sätzen

**Trigger und Aktionen können das Setzen von Sätzen automatisieren:**

**Beispiel: "Keine Einträge mit einem Satz von null"**

```python
# Trigger on Timesheet Save
if timesheet.HourlyRateActual == 0:
    if timesheet.Task and timesheet.Task.HourlyRate:
        timesheet.HourlyRateActual = timesheet.Task.HourlyRate
    elif timesheet.Project and timesheet.Project.DefaultHourlyRate:
        timesheet.HourlyRateActual = timesheet.Project.DefaultHourlyRate
    else:
        timesheet.HourlyRateActual = GetCompanyDefaultRate()
```

**Siehe:** [Scripting: Trigger](/doc/scripting/triggers.html), [Scripting: Aktionen](/doc/scripting/actions.html)

### Import und Export von Sätzen

**Massenänderung von Sätzen:**
1. Exportieren Sie Projekte bzw. Aufgaben über den [Datenexport](/doc/data-exchange/export.html) nach Excel
2. Aktualisieren Sie die Sätze in Excel
3. Importieren Sie sie über den [Datenimport](/doc/data-exchange/import.html) wieder

**API-Zugriff:**
- Sätze programmgesteuert über die [Web API](/doc/web-api/overview.html) aktualisieren
- Sätze aus einem externen Preissystem synchronisieren
- Satzerhöhungen auf Basis des Verbraucherpreisindex oder von Verträgen automatisieren

## Berichte und Auswertung

### Berichte zur Auswertung von Sätzen

**Zu beantwortende Fragen:**
- Wie hoch ist unser effektiver Stundensatz pro Projekt? (Umsatz / Stunden)
- Welche Projekte haben die höchsten bzw. niedrigsten Sätze?
- Wie hoch ist unser durchschnittlicher verrechenbarer Satz pro Kunde?
- Wenden wir die richtigen Sätze an (im Vergleich zu den vertraglich vereinbarten Sätzen)?

**Integrierte Berichte:**
- Navigieren Sie zu **Berichte** → **[Integrierte Berichte](https://web.timecockpit.com/app/lists/APP_DefaultReportsList)**
- Umsatzberichte zeigen die Sätze implizit (Umsatz / Stunden = effektiver Satz)

**Eigene Berichte:**
- Erstellen Sie SSRS-Berichte mit Auswertungen der Sätze
- Exportieren Sie nach Excel für Pivot-Auswertungen

**Siehe:** [Integrierte Berichte](/doc/reporting/built-in-reports.html), [Eigene Berichte](/doc/reporting/custom-reports.html)

### Prüfung der Einhaltung von Sätzen

**Prüfen, ob die richtigen Sätze verwendet werden:**
1. Exportieren Sie die noch nicht verrechneten Zeitbuchungen
2. Vergleichen Sie `Hourly Rate Actual` mit den vertraglich vereinbarten Sätzen (aus den Verträgen)
3. Erkennen Sie Abweichungen (zu hoch oder zu niedrig)
4. Korrigieren Sie sie vor der Verrechnung

**Häufige Probleme:**
- ❌ Mitarbeiter hat die falsche Aufgabe gewählt (falscher Satz angewendet)
- ❌ Projektsatz nach Vertragsänderung nicht aktualisiert
- ❌ Manuelle Überschreibung falsch angewendet
- ❌ Fehlender Satz (Einträge mit einem Satz von null)

## Verwandte Funktionen

### Projektmanagement
- [Budgetkontrolle](~/doc/projektzeiterfassung/budgetkontrolle.md) - Rentabilitätsanalyse mithilfe von Sätzen
- [Kunden, Projekte und Aufgaben](~/doc/projektzeiterfassung/kunde-projekt-aufgabe.md) - Projekthierarchie einrichten

### Rechnungslegung
- [Rechnungserstellung und Ablauf der Rechnungslegung](~/doc/projektzeiterfassung/rechnungslegung.md) - Wie Sätze in Rechnungen einfließen
- [Rechnungsdatenfelder](~/doc/projektzeiterfassung/rechnungsdatenfelder.md) - Rechnungsbeträge verstehen

### Berichte
- [Integrierte Berichte](/doc/reporting/built-in-reports.html) - Berichte zu Sätzen und Umsatz
- [Eigene Berichte](/doc/reporting/custom-reports.html) - Berichte zur Auswertung von Sätzen erstellen

### Fortgeschritten
- [Anpassung des Datenmodells](/doc/data-model-customization/overview.html) - Eigene Satztabellen aufbauen
- [Scripting: Aktionen](/doc/scripting/actions.html) - Logik für Sätze automatisieren
- [Scripting: Trigger](/doc/scripting/triggers.html) - Regeln für Sätze durchsetzen

## Siehe auch

**FAQs:**
- [Abrechnungsadministrator-FAQ](/doc/billing-admin-faq.html) - Fragen zur Verwaltung von Sätzen
- [Projektleiter-FAQ](/doc/project-manager-faq.html) - Fragen zur Rentabilität

**API und Integration:**
- [Web API im Überblick](/doc/web-api/overview.html) - Sätze programmgesteuert aktualisieren
- [Datenaustausch: Export](/doc/data-exchange/export.html) - Massenänderung von Sätzen

---

*Unterstützung bei der Konfiguration von Sätzen erhalten Sie unter [support@timecockpit.com](mailto:support@timecockpit.com) oder in der [Abrechnungsadministrator-FAQ](/doc/billing-admin-faq.html).*
