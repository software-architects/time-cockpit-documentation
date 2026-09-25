---
title: Projektleiter-FAQ - Budgets, Projektzeiten und Rechnungen
description: "Projektleiter-FAQ zu time cockpit: Projekte und Aufgaben pflegen, Projektzeiten prüfen, Budgets überwachen und die Rechnungslegung vorbereiten."
keywords: [projektleiter, projektbudget, projektzeiten, budgetkontrolle, verrechenbare stunden, aufgaben, projekte, rechnungslegung]
faq: true
en_page: doc/project-manager-faq.md
---

# Projektleiter-FAQ

Diese FAQ beantwortet häufige Fragen von Projektleitern, die in time cockpit Projekte und Aufgaben pflegen, projektbezogene Zeitbuchungen prüfen und Projektbudgets überwachen.

> [!NOTE]
> Allgemeine Fragen zur Zeiterfassung beantwortet die [Anwender-FAQ](~/doc/anwender-faq.md). Fragen zu Entwicklung und API beantwortet die [Entwickler-FAQ](~/doc/entwickler-faq.md).

> [!NOTE]
> Überprüft im April 2026.

## Budgetkontrolle und Planung

### Wie richte ich Projektbudgets ein, um Stunden und Kosten zu verfolgen?

Im Standard pflegen Projektleiter Projekte und Aufgaben und prüfen das Ergebnis in den Listen für die Budgetkontrolle.

Eine typische Einrichtung:

1. Pflegen Sie das Projekt unter **Verwaltung -> Projekte**.
2. Pflegen Sie Aufgaben unter **Verwaltung -> Aufgaben**, wenn Sie eine detailliertere Aufschlüsselung wünschen.
3. Prüfen Sie das Projekt unter **Verwaltung -> Budgetary Control of Projects**.
4. Prüfen Sie einzelne Aufgaben unter **Verwaltung -> Budgetary Control of Tasks**, wenn Sie mehr Details benötigen.

Die Listen für die Budgetkontrolle kombinieren Daten aus Zeitbuchungen und Rechnungen und zeigen die Budgetkontrolle auf Projekt- und Aufgabenebene an einer Stelle.

**Siehe auch:**
- [Kunden, Projekte und Aufgaben](~/doc/projektzeiterfassung/kunde-projekt-aufgabe.md)
- [Anwendungsfall Budgetkontrolle](~/doc/anwendungsfaelle/budgetkontrolle.md)
- [Zeitbuchungen](~/doc/projektzeiterfassung/zeitbuchungen.md)

---

### Wie sehe ich, welche Teammitglieder Zeiten auf meine Projekte buchen?

Verwenden Sie die Liste [Zeitbuchungen](~/doc/projektzeiterfassung/zeitbuchungen.md) und filtern Sie sie nach dem betreffenden Projekt und Zeitraum.

So können Sie prüfen,

- welche Benutzer Zeiten erfasst haben,
- welche Aufgaben verwendet wurden,
- wie viele Stunden eingetragen wurden und
- ob Einträge verrechenbar oder bereits verrechnet sind.

Je nach Konfiguration Ihrer Ansicht können Sie das gefilterte Ergebnis auch sortieren, gruppieren oder exportieren.

**Siehe auch:**
- [Zeitbuchungen](~/doc/projektzeiterfassung/zeitbuchungen.md)
- [Kunden, Projekte und Aufgaben](~/doc/projektzeiterfassung/kunde-projekt-aufgabe.md)

---

### Wie vergleiche ich tatsächliche Kosten mit verrechenbaren Beträgen?

Verwenden Sie für diesen Vergleich die Listen für die Budgetkontrolle.

Laut Standarddokumentation kombinieren diese Listen:

- Stunden aus den Zeitbuchungen
- interne Kosten auf Basis der Stundensätze der Mitarbeiter
- Umsatz und rechnungsbezogene Werte aus den Daten der Rechnungslegung

Beginnen Sie im Alltag mit **Budgetary Control of Projects** und wechseln Sie zu **Budgetary Control of Tasks**, wenn Sie eine detailliertere Aufschlüsselung benötigen.

**Siehe auch:**
- [Anwendungsfall Budgetkontrolle](~/doc/anwendungsfaelle/budgetkontrolle.md)
- [Zeitbuchungen](~/doc/projektzeiterfassung/zeitbuchungen.md)
- [Rechnungslegung](~/doc/projektzeiterfassung/rechnungslegung.md)

---

### Wie kann ich den Projektabschluss auf Basis des aktuellen Fortschritts prognostizieren?

Verwenden Sie **Budgetary Control of Projects** als wichtigste Standardansicht für die laufende Projektprüfung.

Damit vergleichen Sie die aktuell erfassten Stunden mit dem eingestellten Budget und den zugehörigen Daten der Rechnungslegung. Für eine feinere Aufschlüsselung verwenden Sie **Budgetary Control of Tasks**.

Die Standarddokumentation konzentriert sich auf die berechneten Kennzahlen in diesen Listen, nicht auf einen eigenen Ablauf für die Projektplanung. In der Praxis eignen sich die Listen vor allem dazu, Projekte oder Aufgaben zu erkennen, die mehr Stunden verbrauchen als erwartet.

**Siehe auch:**
- [Anwendungsfall Budgetkontrolle](~/doc/anwendungsfaelle/budgetkontrolle.md)
- [Kunden, Projekte und Aufgaben](~/doc/projektzeiterfassung/kunde-projekt-aufgabe.md)

---

### Wie verhindere ich, dass Teammitglieder Aufgabenbudgets überschreiten?

Im Standard von time cockpit ist der sichere Weg Transparenz und regelmäßige Prüfung, nicht automatisches Sperren.

Ein praxistauglicher Standardablauf:

1. Pflegen Sie die betreffende Aufgabenstruktur unter **Verwaltung -> Aufgaben**.
2. Prüfen Sie regelmäßig **Budgetary Control of Tasks**.
3. Reagieren Sie, wenn sich eine Aufgabe ihrem Budget nähert oder es überschreitet.

Wenn Sie harte Grenzen oder automatische Warnungen benötigen, sobald Benutzer auf eine Aufgabe buchen, erfordert das in der Regel eine Anpassung.

**Siehe auch:**
- [Anwendungsfall Budgetkontrolle](~/doc/anwendungsfaelle/budgetkontrolle.md)
- [Kunden, Projekte und Aufgaben](~/doc/projektzeiterfassung/kunde-projekt-aufgabe.md)
- [Entwickler-FAQ](~/doc/entwickler-faq.md)

---

## Zeitmanagement im Team

### Wie sehe ich eine tägliche oder wöchentliche Zeitübersicht meines Teams?

Verwenden Sie die Liste [Zeitbuchungen](~/doc/projektzeiterfassung/zeitbuchungen.md) mit einem Projektfilter und dem betreffenden Zeitraum.

Für eine schnelle Übersicht:

1. Filtern Sie nach dem Projekt.
2. Stellen Sie den Zeitraum auf den Tag oder die Woche ein, die Sie prüfen möchten.
3. Prüfen Sie die Einträge direkt in der Liste.
4. Gruppieren oder exportieren Sie das Ergebnis, wenn Sie eine verdichtete Übergabe oder eine weiterführende Analyse benötigen.

So bleibt die Auswertung projektbezogen, statt auf mitarbeiterbezogene Arbeitszeitberichte zu wechseln.

**Siehe auch:**
- [Zeitbuchungen](~/doc/projektzeiterfassung/zeitbuchungen.md)
- [Datenexport](~/doc/datenaustausch/export.md)

---

### Kann ich sehen, ob Teammitglieder genügend Stunden pro Projekt erfassen?

Ja. Die direkteste Standardansicht ist die nach Projekt gefilterte Liste [Zeitbuchungen](~/doc/projektzeiterfassung/zeitbuchungen.md).

Verwenden Sie sie zusammen mit **Budgetary Control of Projects** oder **Budgetary Control of Tasks**:

- die Liste der Zeitbuchungen zeigt die einzelnen Einträge
- die Listen für die Budgetkontrolle zeigen die aufsummierten Werte pro Projekt oder Aufgabe

Diese Kombination reicht in der Regel aus, um zu erkennen, ob ein Projekt die erwartete Aktivität aufweist und ob eine Aufgabe oder eine beteiligte Person genauer betrachtet werden sollte.

**Siehe auch:**
- [Zeitbuchungen](~/doc/projektzeiterfassung/zeitbuchungen.md)
- [Anwendungsfall Budgetkontrolle](~/doc/anwendungsfaelle/budgetkontrolle.md)

---

### Wie gehe ich mit Teammitgliedern um, die vergessen, Zeiten zu erfassen?

Aus Sicht der Projektleitung ist der zuverlässigste Standardweg, projektbezogene Zeitbuchungen regelmäßig zu prüfen und Lücken nachzugehen.

Ein einfacher Ablauf:

1. Filtern Sie die [Zeitbuchungen](~/doc/projektzeiterfassung/zeitbuchungen.md) nach dem Projekt und dem betreffenden Zeitraum.
2. Prüfen Sie, ob die erwarteten Beteiligten Einträge für diesen Zeitraum haben.
3. Wenden Sie sich an die betroffenen Benutzer, wenn Einträge fehlen.
4. Prüfen Sie die Liste erneut, nachdem die fehlenden Zeiten nachgetragen wurden.

Die Produktdokumentation unterstützt die Prüfung projektbezogener Zeitbuchungen, definiert aber keinen integrierten Eskalationsablauf für fehlende Buchungen.

**Siehe auch:**
- [Zeitbuchungen](~/doc/projektzeiterfassung/zeitbuchungen.md)
- [Arbeiten mit Zeitbuchungen](~/doc/zeiterfassungskalender/arbeiten-mit-zeitbuchungen.md)

---

## Rechnungslegung und Verrechnung

### Wie stelle ich sicher, dass alle verrechenbaren Stunden verrechnet werden?

Im Standardberechtigungsmodell übernehmen in der Regel Benutzer mit der Rolle **BillingAdmin** die Rechnungslegung. Als Projektleiter tragen Sie im Standard dazu bei, indem Sie die projektbezogenen Zeitbuchungen vor der Verrechnung prüfen.

Die relevanten Prüfungen sind üblicherweise:

- verrechenbare und nicht verrechenbare Einträge in der Liste der Zeitbuchungen
- verrechneter und nicht verrechneter Status, soweit in der aktuellen Ansicht sichtbar
- die Werte der Budgetkontrolle für die Projektprüfung

Wenn Sie auch Berechtigungen für die Rechnungslegung haben, verwenden Sie den unter [Rechnungslegung](~/doc/projektzeiterfassung/rechnungslegung.md) beschriebenen Ablauf, insbesondere die Liste **Unbilled Time Sheets**.

**Siehe auch:**
- [Rechnungslegung](~/doc/projektzeiterfassung/rechnungslegung.md)
- [Zeitbuchungen](~/doc/projektzeiterfassung/zeitbuchungen.md)
- [Abrechnungs-FAQ](~/doc/abrechnungs-faq.md)

---

### Wie erstelle ich Rechnungen für mehrere Projekte gleichzeitig?

Im Standard ist das in der Regel eine Aufgabe für **BillingAdmin**, nicht für die reine Projektleitung.

Wenn Sie die nötigen Berechtigungen für die Rechnungslegung haben, beginnen Sie mit **Verwaltung -> Billing -> Unbilled Time Sheets** und filtern Sie die betreffenden Zeitbuchungen, bevor Sie die Rechnung erstellen.

Die Standarddokumentation beschreibt den Ablauf der Rechnungserstellung und wie die erzeugten Rechnungspositionen aus den ausgewählten Zeitbuchungen gebildet werden. Da Abrechnungsstrukturen unterschiedlich sein können, prüfen Sie die erzeugte Rechnung sorgfältig, bevor Sie sie abschließen.

**Siehe auch:**
- [Rechnungslegung](~/doc/projektzeiterfassung/rechnungslegung.md)
- [Abrechnungs-FAQ](~/doc/abrechnungs-faq.md)

---

### Welche Berichte sollte ich als Projektleiter regelmäßig prüfen?

Die nützlichsten Standardansichten für Projektleiter sind:

- [Zeitbuchungen](~/doc/projektzeiterfassung/zeitbuchungen.md) für die einzelnen projektbezogenen Zeitbuchungen
- [Anwendungsfall Budgetkontrolle](~/doc/anwendungsfaelle/budgetkontrolle.md) für die Budgetprüfung auf Projekt- und Aufgabenebene
- [Kunden, Projekte und Aufgaben](~/doc/projektzeiterfassung/kunde-projekt-aufgabe.md) für die Pflege der Projektstruktur
- [Rechnungslegung](~/doc/projektzeiterfassung/rechnungslegung.md), wenn Sie auch an der Prüfung der Verrechnung beteiligt sind

Wie oft Sie diese Ansichten prüfen, hängt von Ihrem internen Prozess ab. In der Produktdokumentation entsprechen sie vor allem der Projektpflege, der Budgetprüfung, der Prüfung der Projektzeiten und der Übergabe an die Rechnungslegung.

**Siehe auch:**
- [Zeitbuchungen](~/doc/projektzeiterfassung/zeitbuchungen.md)
- [Anwendungsfall Budgetkontrolle](~/doc/anwendungsfaelle/budgetkontrolle.md)
- [Abrechnungs-FAQ](~/doc/abrechnungs-faq.md)

---

## Projekteinrichtung und Organisation

### Wie strukturiere ich Projekte und Aufgaben für eine optimale Erfassung?

Verwenden Sie die Standardstruktur **Kunde -> Projekt -> Aufgabe** und richten Sie sie danach aus, wie Sie Zeiten erfassen und Budgets prüfen möchten.

Eine praktische Faustregel:

- legen Sie getrennte Projekte an, wenn Sie eine eigene Erfassung oder einen eigenen Verrechnungskontext auf Projektebene benötigen
- verwenden Sie Aufgaben, wenn Sie innerhalb eines Projekts eine detailliertere Aufschlüsselung benötigen
- wählen Sie Aufgabennamen so konkret, dass sie für Auswertungen aussagekräftig sind

Wenn Sie Budgets pro Jahr verfolgen möchten, ist es in der Regel besser, für jedes Jahr ein eigenes Projekt anzulegen und in jedem dieser Projekte ein eigenes Budget zu pflegen.

Die Standarddokumentation weist außerdem darauf hin, dass Aufgaben als nicht verrechenbar gekennzeichnet werden können. Das hilft, wenn die Aufgabenstruktur sowohl verrechenbare als auch nicht verrechenbare Arbeit abbilden soll.

**Siehe auch:**
- [Kunden, Projekte und Aufgaben](~/doc/projektzeiterfassung/kunde-projekt-aufgabe.md)
- [Anwendungsfall Budgetkontrolle](~/doc/anwendungsfaelle/budgetkontrolle.md)
- [Zeitbuchungen](~/doc/projektzeiterfassung/zeitbuchungen.md)

---

## Brauchen Sie mehr Hilfe?

### Ressourcen für Projektleiter

**Verwandte FAQs:**
- [Anwender-FAQ](~/doc/anwender-faq.md) - Allgemeine Fragen zur Zeiterfassung
- [Abrechnungs-FAQ](~/doc/abrechnungs-faq.md) - Rechnungsdetails und Abläufe der Rechnungslegung
- [Entwickler-FAQ](~/doc/entwickler-faq.md) - API und Anpassungen für erweiterte Abläufe

**Dokumentation:**
- [Projektbezogene Zeiterfassung](~/doc/projektzeiterfassung/kunde-projekt-aufgabe.md)
- [Budgetkontrolle im Detail](~/doc/anwendungsfaelle/budgetkontrolle.md)
- [Leitfaden zur Rechnungslegung](~/doc/projektzeiterfassung/rechnungslegung.md)
- [Zeitbuchungen](~/doc/projektzeiterfassung/zeitbuchungen.md)

**Support:**
- **E-Mail:** support@timecockpit.com

---

*Zuletzt aktualisiert: April 2026.*
