---
title: Budgetkontrolle und Rentabilitätsanalyse für Projekte
description: "Projektbudgets in time cockpit überwachen: Kosten und Umsatz vergleichen, Rentabilität analysieren und den Projektabschluss prognostizieren."
keywords: [budgetkontrolle, budgetüberwachung, kostenverfolgung, rentabilitätsanalyse, budgetprognose, projektkosten, verrechenbar und nicht verrechenbar, budgetabweichung, projektmarge, budgetsteuerung]
en_page: doc/project-time-tracking/budget-tracking.md
---

# Budgetkontrolle und Rentabilitätsanalyse für Projekte

Überwachen Sie Projektbudgets in Echtzeit, vergleichen Sie tatsächliche Kosten mit verrechenbaren Beträgen und prognostizieren Sie den Projektabschluss, um die Rentabilität zu sichern und Budgetüberschreitungen zu vermeiden.

> [!TIP]
> **Sie möchten die Rentabilität Ihrer Projekte maximieren?** Erfahren Sie, wie time cockpit Ihnen hilft, [die Projektrentabilität zu steigern](https://www.timecockpit.com/blog/benefits-of-project-time-tracking/) und [die wichtigsten Projekt-KPIs](https://www.timecockpit.com/blog/project-timetracking-kpis/) zu verfolgen. Entdecken Sie unsere [Funktionen für die projektbezogene Zeiterfassung](https://www.timecockpit.com/features/project-time-tracking/).

## Überblick

Eine wirksame Budgetkontrolle für Projekte erfordert die Überwachung mehrerer Dimensionen:
- **Stundenbasierte Budgets**: Verbrauchte Stunden mit geplanten Stunden vergleichen
- **Kostenbasierte Budgets**: Tatsächliche Kosten mit dem geplanten Umsatz vergleichen
- **Rentabilität in Echtzeit**: Verrechenbare Beträge mit internen Kosten vergleichen
- **Abschlussprognose**: Überschreitungen erkennen, bevor sie eintreten

time cockpit bietet integrierte Listen zur **Budgetkontrolle**, die Daten aus Zeitbuchungen und Rechnungen für eine umfassende Budgetanalyse zusammenführen.

## Projektbudgets einrichten

### Stundenbasierte Budgets

Projektbudgets in Stunden verfolgen:

1. Navigieren Sie zu **Verwaltung** → **[Projekte](https://web.timecockpit.com/app/lists/APP_DefaultProjectList)**
2. Öffnen Sie Ihr Projekt (oder legen Sie ein neues an)
3. Setzen Sie die Budgetfelder:
   - **Planned Duration (Hours):** Gesamtzahl der budgetierten Stunden (z. B. 100 Stunden)
   - **Budget Type:** Hour-based
4. Klicken Sie auf **Speichern**

**Wann stundenbasierte Budgets sinnvoll sind:**
- Projekte nach Aufwand
- Interne Projekte (keine Verrechnung an Kunden)
- Wenn Sie die Kapazitätszuteilung im Team verfolgen

### Kostenbasierte Budgets

Projektbudgets in Geldbeträgen verfolgen:

1. Setzen Sie im Projektdatensatz:
   - **Planned Revenue:** Gesamtbudget (z. B. 50.000 $)
   - **Budget Type:** Amount-based
2. Stellen Sie sicher, dass Stundensätze für eine genaue Kostenverfolgung konfiguriert sind
3. Klicken Sie auf **Speichern**

**Wann kostenbasierte Budgets sinnvoll sind:**
- Festpreisprojekte
- Wenn für den Kunden die Gesamtkosten zählen und nicht die Stunden
- Projekte mit unterschiedlichen Verrechnungssätzen

### Budgets auf Tätigkeitsebene (feine Steuerung)

Für eine detaillierte Aufteilung des Budgets:

1. Navigieren Sie zu **Verwaltung** → **[Tätigkeiten](https://web.timecockpit.com/app/lists/APP_DefaultTaskList)**
2. Setzen Sie für jede Tätigkeit:
   - **Planned Duration:** Stunden, die dieser Tätigkeit zugeteilt sind
   - **Planned Revenue:** Zugeteilter Betrag (optional)
3. Speichern Sie jede Tätigkeit

**Vorteile von Budgets auf Tätigkeitsebene:**
- Erkennen, welche Phasen das meiste Budget verbrauchen
- Fortschritt im Detail verfolgen
- Das Team warnen, wenn einzelne Tätigkeiten ihre Grenzen erreichen
- Künftige Schätzungen verbessern

## Budgetverbrauch überwachen

### Listen zur Budgetkontrolle

time cockpit bietet zwei leistungsfähige integrierte Ansichten:

**[Budgetkontrolle für Projekte](https://web.timecockpit.com/app/lists/APP_BudgetaryControlOfProjectsList)**

Navigieren Sie zu **Verwaltung** → **Projekte** → wählen Sie die Listenansicht **Budgetkontrolle**

**Wichtige Spalten:**
- **Planned vs. Actual**: Budgetierte und erfasste Stunden bzw. Kosten im Vergleich
- **Remaining**: Noch verfügbare Stunden bzw. noch verfügbares Budget
- **% Consumed**: Fortschrittsanzeige (ProgressPercent, ProgressBillablePercent)
- **Forecast**: Voraussichtliche Gesamtstunden bzw. -kosten auf Basis des aktuellen Trends
- **Umsatz**: Gesamter verrechenbarer Betrag aus den Zeitbuchungen
- **Costs**: Interne Kosten auf Basis der Stundensätze der Mitarbeiter
- **Margin**: Umsatz - Costs (Rentabilität)

**[Budgetkontrolle für Tätigkeiten](https://web.timecockpit.com/app/lists/APP_BudgetaryControlOfTasksList)**

Ähnlich wie die Ansicht auf Projektebene, zeigt aber Details auf Tätigkeitsebene für eine feine Überwachung.

### Visuelle Kennzeichnung

Der Status des Budgetverbrauchs wird typischerweise so gekennzeichnet:
- **🟢 Grün**: Im Plan, unter Budget (< 80 % verbraucht)
- **🟡 Gelb**: Nähert sich der Grenze (80-100 % verbraucht)
- **🔴 Rot**: Über Budget oder voraussichtliche Überschreitung (> 100 %)

### Wichtige Kennzahlen erklärt

#### Stunden
```python
Total hours logged across all timesheets, regardless of billability
```

#### Verrechenbare Stunden
```python
Only counts hours that are:
- Marked as billable (APP_Billable = True)
- Have an actual hourly rate > 0
```

**Warum das wichtig ist**: Auch bei verrechenbaren Projekten können Zeitbuchungen selbst nicht verrechenbar sein (interne Besprechungen, Einrichtungszeit usw.)

#### Budget in Stunden
Wenn `BudgetInHours` nicht direkt gesetzt ist, wird es so berechnet:
```
Budget / HourlyRate = BudgetInHours
```

#### Fortschritt in Prozent
Zwei wichtige Kennzahlen:
- **ProgressBillablePercent**: `Billable Hours / Budget Hours × 100`
- **ProgressPercent**: `Total Hours / Budget Hours × 100`

**Beispiel:**
- Budget: 100 Stunden
- Erfasste Stunden gesamt: 80 Stunden → 80 % Fortschritt
- Verrechenbare Stunden: 70 Stunden → 70 % verrechenbarer Fortschritt
- **Erkenntnis**: 10 Stunden waren nicht verrechenbarer Mehraufwand

#### Umsatz
```python
Sum of all timesheet revenue
Each timesheet: Revenue = Duration × HourlyRateActual
```

#### Noch nicht verrechneter Umsatz
```python
Revenue from timesheets that are:
- Billable (APP_Billable = True)
- Not yet billed (APP_Billed = False)
```

**Geschäftliche Bedeutung**: Das ist Geld, das Sie verdient, aber noch nicht in Rechnung gestellt haben – es bildet die Pipeline Ihrer künftigen Forderungen.

#### Kosten
```python
Internal cost = Sum(Duration × Employee's Internal Hourly Rate)
```

Zeigt Ihre tatsächlichen Personalkosten (was Sie Ihren Mitarbeitern zahlen), nicht das, was Sie Kunden verrechnen.

#### Effektiver Stundensatz
```python
Average revenue per hour = Total Revenue / Total Hours
```

**Anwendungsfall**: Mit dem geplanten Stundensatz des Projekts vergleichen.

**Beispiel:**
- Geplanter Satz: 100 €/Stunde
- Effektiver Satz: 85 €/Stunde
- **Erkenntnis**: Einige Stunden waren nicht verrechenbar oder rabattiert

## Kosten und verrechenbare Beträge verfolgen

Um die Rentabilität eines Projekts zu verstehen, müssen Sie sowohl die internen Kosten als auch die Verrechnung an den Kunden verfolgen:

### Zwei Arten von Sätzen

**Kostensatz des Mitarbeiters bzw. Benutzers (intern):**
1. Navigieren Sie zu **Benutzer** → **[Benutzerdetails](https://web.timecockpit.com/app/lists/APP_DefaultUserDetailList)**
2. Öffnen Sie den Datensatz des Mitarbeiters
3. Setzen Sie **Default Hourly Rate:** auf seinen internen Kostensatz (z. B. 75 $/Stunde)
4. Speichern Sie

**Verrechenbarer Satz von Projekt bzw. Tätigkeit (für den Kunden):**
1. Navigieren Sie zu **Verwaltung** → **[Projekte](https://web.timecockpit.com/app/lists/APP_DefaultProjectList)** oder **[Tätigkeiten](https://web.timecockpit.com/app/lists/APP_DefaultTaskList)**
2. Setzen Sie **Hourly Rate:** auf den Verrechnungssatz für den Kunden (z. B. 150 $/Stunde)
3. Speichern Sie

### Berechnung der Rentabilität

**Formel:**
```
Margin = Total Billable Amount - Total Internal Cost
Margin % = (Margin / Total Billable Amount) × 100
```

**Beispiel:**
```
Project: Website Development
- 100 hours tracked
- Internal cost rate: $75/hour → Total Cost: $7,500
- Billable rate: $150/hour → Total Revenue: $15,000
- Margin: $15,000 - $7,500 = $7,500
- Margin %: ($7,500 / $15,000) × 100 = 50%
```

### Methoden der Rentabilitätsanalyse

**Option 1: Ansicht Budgetkontrolle**
Die integrierte Liste zeigt automatisch:
- **Umsatz**: Was Sie Kunden verrechnen
- **Costs**: Was Sie Mitarbeitern zahlen
- **Margin**: Die berechnete Differenz

**Option 2: Eigener Bericht**
Erstellen Sie einen Bericht, der Folgendes zusammenfasst:
- `Sum(Duration × HourlyRateActual)` = gesamte interne Kosten
- `Sum(Duration × HourlyRateBilled)` = Gesamtumsatz
- Differenz = Projektgewinn

**Option 3: Manuelle Auswertung**
Exportieren Sie die Daten der Zeitbuchungen nach Excel und erstellen Sie Pivot-Tabellen, die die Rentabilität zeigen nach:
- Projekt
- Kunde
- Tätigkeitstyp
- Teammitglied
- Zeitraum

### Auswirkungen auf das Geschäft

**Rentable und unrentable Projekte erkennen:**
- Vertriebsaktivitäten auf Projektarten mit hoher Marge konzentrieren
- Angebote mit niedriger Marge reduzieren oder einstellen

**Ressourceneinsatz optimieren:**
- Junior-Mitarbeiter Projekten mit hoher Marge zuteilen (erhöht die Marge weiter)
- Senior-Mitarbeiter nur dort einsetzen, wo ihre Expertise notwendig ist

**Preise für künftige Projekte anpassen:**
- Historische Margendaten für Angebote nutzen
- Angemessene Gewinnmargen einplanen

**Ausweitung des Projektumfangs erkennen:**
- Budgetabweichungen deuten auf einen wachsenden Projektumfang hin
- Mit dem Kunden nachverhandeln oder den Leistungsumfang reduzieren

## Projektabschluss prognostizieren

Sagen Sie Fertigstellungstermine und Budgetüberschreitungen mit einer geschwindigkeitsbasierten Prognose voraus, bevor sie eintreten.

### Prognose der Budgetkontrolle verwenden

1. Navigieren Sie zu **Verwaltung** → **Projekte** → Ansicht **Budgetkontrolle**
2. Prüfen Sie die Prognosespalten:
   - **Forecast Hours**: Voraussichtliche Gesamtstunden beim aktuellen Tempo
   - **Budget Variance**: Differenz zwischen Plan und Prognose

### Berechnungsmethode der Prognose

time cockpit berechnet Prognosen anhand von Geschwindigkeitsmustern:

**Methode 1: Fertigstellungsgrad in Prozent**
```
Forecast = Actual Hours / % Project Complete
```

**Beispiel:**
- Geplantes Budget: 100 Stunden
- 50 % fertiggestellt
- Tatsächliche Stunden: 60 Stunden
- Prognose: 60 / 0,5 = **120 Stunden** (20 Stunden über Budget)

**Methode 2: Zeitbasierte Geschwindigkeit**
```
Forecast = (Actual Hours / Days Elapsed) × Total Project Days
```

**Beispiel:**
- Geplant: 100 Stunden über 10 Wochen
- Nach 5 Wochen: 60 Stunden erfasst
- Geschwindigkeit: 60 / 5 = 12 Stunden/Woche
- Prognose: 12 × 10 = **120 Stunden**

### Manuelle Berechnung der Geschwindigkeit

1. Stunden pro Woche berechnen: `Total Actual Hours / Weeks Elapsed`
2. Verbleibende Wochen berechnen: `Remaining Hours / Hours per Week`
3. Voraussichtliche Fertigstellung: `Current Date + Remaining Weeks`

### Frühwarnzeichen

**🚨 Indikatoren für Budgetrisiken:**
- **Prognose > geplantes Budget**: Das Budget wird beim aktuellen Tempo überschritten
- **Sinkende Geschwindigkeit**: Das Team wird langsamer (Komplexität, Blockaden, Ermüdung)
- **Steigender nicht verrechenbarer Anteil**: Mehraufwand wächst, Effizienz sinkt
- **Effektiver Satz < geplanter Satz**: Rabatte oder nicht verrechenbare Arbeit schleichen sich ein

### Korrekturmaßnahmen

Wenn Prognosen Überschreitungen vorhersagen:

**1. Umfang reduzieren**
- Nicht wesentliche Funktionen streichen
- Wünschenswertes in Phase 2 verschieben
- Leistungsumfang mit dem Kunden nachverhandeln

**2. Effizienz steigern**
- Blockaden und Engpässe beseitigen
- Prozesse und Abläufe verbessern
- Besprechungsaufwand reduzieren
- Wiederkehrende Aufgaben automatisieren

**3. Ressourcen aufstocken** (sofern das Budget es zulässt)
- Zusätzliche Teammitglieder einbinden
- **Warnung**: Kann die Effizienz vorübergehend senken (Einarbeitungszeit)

**4. Budget nachverhandeln**
- Dem Kunden datengestützte Argumente vorlegen
- Ist-Werte und Plan mit Begründung zeigen
- Budgeterhöhung oder Terminverlängerung beantragen

### Regelmäßiger Überprüfungsrhythmus

**Wöchentliche Überprüfung** (für kurze Projekte < 3 Monate):
- Prognose mit Plan vergleichen
- Blockaden erkennen
- Zuteilung anpassen

**Zweiwöchentliche Überprüfung** (für mittlere Projekte von 3-6 Monaten):
- Trendanalyse
- Meilensteine verfolgen
- Stakeholder informieren

**Monatliche Überprüfung** (für lange Projekte ab 6 Monaten):
- Strategische Anpassungen
- Ressourcen neu verteilen
- Vertragsänderungen bei Bedarf

## Budgetüberschreitungen vermeiden

### Ansatz 1: Transparenz und Überwachung (empfohlen)

**Budgets auf Tätigkeitsebene festlegen:**
1. Konfigurieren Sie Budgets unter [Verwaltung → Tätigkeiten](https://web.timecockpit.com/app/lists/APP_DefaultTaskList)
2. Teilen Sie die Budgets den Teammitgliedern mit
3. Machen Sie die Budgets in den Tätigkeitsbeschreibungen sichtbar

**Regelmäßig überwachen:**
- Wöchentliche Besprechungen zur Budgetüberprüfung
- Berichte zur Budgetkontrolle mit dem Team teilen
- Tätigkeiten kennzeichnen, die sich ihrer Grenze nähern (ab 80 %)

### Ansatz 2: Proaktive Benachrichtigungen

Richten Sie Warnungen ein, wenn Tätigkeiten ihre Budgetgrenzen erreichen:
- **Schwelle 80 %**: Warnung an die zuständige Person
- **Schwelle 90 %**: Eskalation an den Projektleiter
- **Schwelle 100 %**: Genehmigung durch die Führungskraft für zusätzliche Zeit erforderlich

**Umsetzung**: Erfordert Anpassungen über Scripting oder Workflows

### Ansatz 3: Berechtigungsbasierte Kontrollen (fortgeschritten)

Schränken Sie mit Berechtigungen die Zeiterfassung ein, wenn Budgets überschritten sind:
- Validierungsregeln für Zeitbuchungen anlegen
- Speichern blockieren, wenn das Tätigkeitsbudget überschritten ist
- Freigabe durch die Führungskraft bei berechtigten Überschreitungen verlangen

**Umsetzung**: Erfordert eine [Anpassung des Datenmodells](/doc/data-model-customization/entity.html)

### Bewährter Ablauf

**Planungsphase:**
1. Realistische Tätigkeitsbudgets auf Basis historischer Daten festlegen
2. Budgets den zuständigen Personen mitteilen
3. Die Gründe für Budgetgrenzen erklären (Rentabilität, Erwartungen des Kunden usw.)

**Umsetzungsphase:**
1. Tägliches Standup: Das Team meldet verbrauchte und verbleibende Stunden
2. Zwischenprüfung bei etwa 50 % verbrauchtem Budget
3. Visuelle Dashboards zum Budgetverbrauch
4. Vorzeitige Fertigstellung unter Budget feiern

**Umgang mit Abweichungen:**
1. Beim Erreichen der Grenze: Verbleibende Arbeit realistisch einschätzen
2. Bei Bedarf eine Budgeterhöhung beantragen (mit datengestützter Begründung)
3. Oder den Umfang der Tätigkeit an das Budget anpassen
4. Erkenntnisse für künftige Schätzungen dokumentieren

### Kultureller Ansatz

Fördern Sie Budgetbewusstsein statt starrer Kontrollen:
- ✅ Budgets sichtbar und transparent machen
- ✅ Teams würdigen, die unter Budget liefern
- ✅ Budgetabweichungen in Retrospektiven besprechen (Lernen statt Schuldzuweisung)
- ✅ Budgets als Planungswerkzeug verstehen, nicht als Strafinstrument
- ✅ Frühe Eskalation von Budgetbedenken fördern

## Abgleich mit Rechnungsdaten

Die Listen zur Budgetkontrolle fragen Rechnungsdaten zusätzlich separat ab, um den Umsatz gegenzuprüfen:

### Warum separate Abfragen auf Rechnungen?

**Umsatz aus Zeitbuchungen** ≠ **Umsatz aus Rechnungen**, weil:
- Rechnungen Festpreispositionen, Spesen oder Artikel enthalten können (nicht aus Zeitbuchungen)
- auf Rechnungen Rabatte oder Korrekturen angewendet sein können
- möglicherweise noch nicht alle Zeitbuchungen verrechnet sind
- bei internationalen Rechnungen Wechselkursdifferenzen auftreten

### Verrechneter Umsatz aus Rechnungen

```python
Sum of invoice total amounts for project
Represents actual invoiced amount (what customer was billed)
```

### Verrechnete Stunden aus Rechnungen

```python
Sum of invoice detail quantities where unit = "hour"
Only counts time-based invoice items, not lump-sum entries
```

### Nicht verrechnete Stunden aus Rechnungen

```python
Unbilled Hours = Budget Hours - Billed Hours from Invoices
```

**Warnung**: Der Wert kann negativ sein, wenn Sie mehr verrechnet als budgetiert haben (häufig bei Überschreitungen in Projekten nach Aufwand)

### Beide Kennzahlen nutzen

**Vergleichen Sie:**
- **Noch nicht verrechneter Umsatz** (aus Zeitbuchungen): Erledigte, aber noch nicht verrechnete Arbeit
- **Verrechneter Umsatz** (aus Rechnungen): Was dem Kunden in Rechnung gestellt wurde
- **Bezahlter Umsatz** (aus der Zahlungsverfolgung): Was Sie tatsächlich eingenommen haben

**Vollständiger Umsatzzyklus:**
```
Work Done → Timesheet (Unbilled Revenue)
  ↓
Invoice Sent → Invoice (Billed Revenue)
  ↓
Payment Received → Paid Revenue (Cash)
```

## Hinweise zur Performance

Die Listen zur Budgetkontrolle können bei großen Datenmengen langsam sein, weil sie:
1. alle Zeitbuchungen abfragen (möglicherweise Tausende Datensätze)
2. alle Rechnungen separat abfragen
3. Gruppierungen und Berechnungen in Python-Skripten durchführen
4. Ergebnisobjekte im Arbeitsspeicher aufbauen

### Tipps zur Optimierung

**Verwenden Sie immer Filter:**
- Filtern Sie nach Kunde, Projekt oder Zeitraum, um die Datenmenge zu begrenzen
- Schließen Sie abgeschlossene Projekte (sie werden standardmäßig herausgefiltert)
- Schließen Sie nicht verrechenbare Projekte aus, wenn sie nicht relevant sind

**Für sehr große Tenants:**
- Erwägen Sie, Summenwerte in nächtlichen Batch-Jobs vorab zu berechnen
- Legen Sie materialisierte Views an oder speichern Sie Ergebnisse zwischen
- Verwenden Sie eigene Berichte mit Aggregation auf Datenbankebene statt Python

## Berechtigungen

Die Listen zur Budgetkontrolle berücksichtigen rollenbasierte Berechtigungen:

**Der Zugriff ist beschränkt auf:**
- **Rolle Billing Admin**: sieht alle Projekte
- **Rolle Project Controller**: sieht alle Projekte
- **Rolle Project Manager**: sieht nur Projekte, in denen die Person als Manager1 oder Manager2 eingetragen ist

Normale Benutzer (Mitarbeiter) sehen diese Listen nicht in der Navigation.

Siehe: [Leitfaden zu Berechtigungen](/doc/data-model/permissions-guide.html)

## Verwandte Funktionen

### Projektmanagement
- [Kunden, Projekte und Tätigkeiten](~/doc/projektzeiterfassung/kunde-projekt-taetigkeit.md) - Projekthierarchie einrichten
- [Stundensätze](~/doc/projektzeiterfassung/stundensaetze.md) - Verrechnungs- und Kostensätze konfigurieren
- [Zeitbuchungen für Projekte](~/doc/projektzeiterfassung/zeitbuchungen.md) - Zeiten auf Projekte erfassen

### Rechnungslegung
- [Rechnungserstellung und Ablauf der Rechnungslegung](~/doc/projektzeiterfassung/rechnungslegung.md) - Rechnungen aus Zeitbuchungen erstellen
- [Rechnungsdatenfelder](~/doc/projektzeiterfassung/rechnungsdatenfelder.md) - Rechnungsfelder verstehen

### Berichte
- [Integrierte Berichte](/doc/reporting/built-in-reports.html) - Standardberichte für Projekte
- [Eigene Berichte](/doc/reporting/custom-reports.html) - Maßgeschneiderte Budgetberichte erstellen

### Fortgeschritten
- [Anwendungsfall Budgetkontrolle](/doc/use-cases/budgetary-control.html) - Technischer Einblick in die Berechnungslogik
- [Anpassung des Datenmodells](/doc/data-model-customization/overview.html) - Eigene Budgetkontrollen aufbauen
- [Scripting im Überblick](/doc/scripting/overview.html) - Budgetbenachrichtigungen automatisieren

## Siehe auch

**FAQs:**
- [Projektleiter-FAQ](/doc/project-manager-faq.html) - Rollenspezifische Fragen zur Budgetkontrolle
- [Abrechnungsadministrator-FAQ](/doc/billing-admin-faq.html) - Fragen zu Umsatz und Rechnungslegung

**API und Integration:**
- [Web API im Überblick](/doc/web-api/overview.html) - Programmgesteuert auf Budgetdaten zugreifen
- [TCQL-Abfragesprache](/doc/tcql/overview.html) - Budgetdaten abfragen

---

*Unterstützung bei der Budgetkontrolle erhalten Sie unter [support@timecockpit.com](mailto:support@timecockpit.com) oder in der [Projektleiter-FAQ](/doc/project-manager-faq.html).*
