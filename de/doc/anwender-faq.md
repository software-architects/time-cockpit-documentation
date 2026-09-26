---
title: Anwender-FAQ zu time cockpit - Häufige Fragen und Antworten
description: Häufige Fragen von time cockpit Anwendern zu Zeiterfassung, Projekten, Urlaub, Rechnungslegung und Kontoeinstellungen mit kurzen Anleitungen.
keywords: [zeiterfassung faq, fragen zu zeitbuchungen, time cockpit hilfe, urlaubsantrag, zeitbuchungen, abwesenheitsverwaltung, hilfe zu rechnungen, anwenderfragen]
faq: true
en_page: doc/user-faq.md
---

# Anwender-FAQ zu time cockpit

Diese FAQ beantwortet häufige Fragen von time cockpit Anwendern. Sie konzentriert sich auf die alltägliche Nutzung des Produkts und verweist auf die rollenspezifischen FAQs, wenn ein Thema von Berechtigungen abhängt.

> [!NOTE]
> Sie suchen Fragen für Entwickler zur API, zum Datenmodell oder zu Anpassungen? Lesen Sie die [Entwickler-FAQ](~/doc/entwickler-faq.md).

> [!NOTE]
> Überprüft im April 2026.

## Tägliche Zeiterfassung

### Wie lege ich eine neue Zeitbuchung an?

Im Standardkalender können Sie eine Zeitbuchung auf mehrere Arten anlegen:

- an der Stelle doppelklicken, an der der Eintrag beginnen soll
- in der Symbolleiste des Kalenders auf **+ Hinzufügen** klicken
- `STRG + I` drücken

Geben Sie anschließend die Details im Formular ein und speichern Sie den Eintrag.

**Siehe auch:**
- [Arbeiten mit Zeitbuchungen](~/doc/zeiterfassungskalender/arbeiten-mit-zeitbuchungen.md)
- [Zeiterfassungskalender](~/doc/zeiterfassungskalender/kalender.md)

---

### Wie kopiere ich Zeitbuchungen auf einen anderen Tag?

In der Wochen- oder Arbeitswochenansicht können Sie eine Zeitbuchung kopieren, indem Sie sie bei gedrückter `STRG`-Taste per Drag & Drop verschieben.

Dadurch entsteht eine Kopie des ausgewählten Eintrags zur Zielzeit.

**Siehe auch:**
- [Arbeiten mit Zeitbuchungen](~/doc/zeiterfassungskalender/arbeiten-mit-zeitbuchungen.md)
- [Zeiterfassungskalender](~/doc/zeiterfassungskalender/kalender.md)

---

### Was ist der Unterschied zwischen verrechenbarer und nicht verrechenbarer Zeit?

Das Kennzeichen „verrechenbar" steuert, ob eine Zeitbuchung für die Rechnungslegung relevant ist.

- **Verrechenbare** Einträge können in der Rechnungslegung verwendet werden.
- **Nicht verrechenbare** Einträge bleiben in der Zeiterfassung, werden aber bei der Rechnungserstellung nicht berücksichtigt.

Projekte können verrechenbar oder nicht verrechenbar sein, und auch Tätigkeiten können als nicht verrechenbar gekennzeichnet werden.

**Siehe auch:**
- [Zeitbuchungen](~/doc/projektzeiterfassung/zeitbuchungen.md)
- [Rechnungslegung](~/doc/projektzeiterfassung/rechnungslegung.md)

---

### Wie behebe ich überlappende Zeitbuchungen?

Öffnen Sie den betroffenen Tag oder die betroffene Woche im Kalender und bearbeiten Sie die überlappenden Einträge.

Sie können:

- das Formular des Eintrags öffnen und Beginn- oder Endzeit ändern
- den oberen oder unteren Rand eines Eintrags im Kalender ziehen
- einen Eintrag per Drag & Drop verschieben

**Siehe auch:**
- [Arbeiten mit Zeitbuchungen](~/doc/zeiterfassungskalender/arbeiten-mit-zeitbuchungen.md)
- [Zeiterfassungskalender](~/doc/zeiterfassungskalender/kalender.md)

---

### Kann ich time cockpit auf mobilen Geräten verwenden?

Ja. Der Web-Client läuft in modernen Browsern und hat eine responsive Oberfläche für Desktops, Laptops und Tablets.

Für einen schnellen Zugriff können Sie time cockpit außerdem aus dem Browser heraus als Progressive Web App installieren.

Der Standard-Web-Client benötigt eine Internetverbindung.

**Siehe auch:**
- [Web-Client](~/doc/erste-schritte/web-client.md)

---

### Wie verwende ich Musterbuchungen?

Im Standardablauf werden Musterbuchungen aus einer bestehenden Zeitbuchung erstellt:

1. Legen Sie eine normale Zeitbuchung an und speichern Sie sie.
2. Klicken Sie mit der rechten Maustaste darauf und wählen Sie **Als Muster speichern**.
3. Geben Sie der Musterbuchung einen Namen.

Später können Sie die Musterbuchung in den Kalender ziehen, um schneller neue Einträge anzulegen.

**Siehe auch:**
- [Musterbuchungen](~/doc/zeiterfassungskalender/musterbuchungen.md)
- [Arbeiten mit Zeitbuchungen](~/doc/zeiterfassungskalender/arbeiten-mit-zeitbuchungen.md)

---

## Projekte, Stundensätze und Budgets

### Wie lege ich einen neuen Kunden, ein Projekt und eine Tätigkeit an?

Wenn Ihre Rolle die nötigen Berechtigungen umfasst, verwenden Sie die Standardhierarchie **Kunde -> Projekt -> Tätigkeit**.

- Pflegen Sie zuerst die Kunden.
- Legen Sie Projekte unter dem Kunden an.
- Legen Sie Tätigkeiten unter dem Projekt an, wenn Sie eine detailliertere Erfassung benötigen.

**Siehe auch:**
- [Kunde / Projekt / Tätigkeit](~/doc/projektzeiterfassung/kunde-projekt-taetigkeit.md)
- [Projektleiter-FAQ](~/doc/projektleiter-faq.md)

---

### Wie verfolge ich Zeiten gegen Projektbudgets?

Wenn Sie Zugriff auf die Ansichten für das Projektmanagement haben, verwenden Sie **Budgetkontrolle für Projekte** oder **Budgetkontrolle für Tätigkeiten**.

Diese Standardlisten kombinieren Daten aus Zeitbuchungen und Rechnungen und sind die wichtigsten Ansichten im Produkt für die Budgetkontrolle.

**Siehe auch:**
- [Anwendungsfall Budgetkontrolle](~/doc/anwendungsfaelle/budgetkontrolle.md)
- [Projektleiter-FAQ](~/doc/projektleiter-faq.md)

---

### Wie sehe ich alle Zeiten, die für ein bestimmtes Projekt erfasst wurden?

Verwenden Sie die Liste [Zeitbuchungen](~/doc/projektzeiterfassung/zeitbuchungen.md) und filtern Sie sie nach dem Projekt und dem relevanten Zeitraum.

So sehen Sie die einzelnen Einträge hinter dem Projekt.

**Siehe auch:**
- [Zeitbuchungen](~/doc/projektzeiterfassung/zeitbuchungen.md)
- [Datenexport](~/doc/datenaustausch/export.md)

---

### Wie ordne ich Kunden, Projekten oder Tätigkeiten Stundensätze zu?

In der Standardhierarchie können Stundensätze bei Kunden, Projekten und Tätigkeiten gepflegt werden.

- ein Kunde kann den Standardstundensatz festlegen
- ein Projekt kann den Stundensatz des Kunden überschreiben
- eine Tätigkeit kann den Stundensatz des Projekts überschreiben

**Siehe auch:**
- [Kunde / Projekt / Tätigkeit](~/doc/projektzeiterfassung/kunde-projekt-taetigkeit.md)
- [Abrechnungs-FAQ](~/doc/abrechnungs-faq.md)

---

## Urlaub und Abwesenheit

### Wie beantrage ich Urlaub?

Verwenden Sie **Benutzer -> Urlaub**.

Sie können einen Urlaubsantrag auch aus dem **Zeiterfassungskalender** heraus anlegen. Das ist besonders praktisch, wenn Sie die Termine mit Blick auf Ihre bestehenden Einträge und die im Kalender sichtbaren Abwesenheiten wählen möchten.

1. Legen Sie einen neuen Urlaubseintrag an.
2. Geben Sie die betreffenden Termine ein.
3. Speichern Sie den Datensatz.

Ist der Genehmigungsworkflow aktiviert, prüft die eingerichtete genehmigende Person den Antrag, und Sie erhalten nach der Genehmigung oder Ablehnung eine Benachrichtigung.

**Siehe auch:**
- [Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md)
- [Mitarbeiter-FAQ](~/doc/mitarbeiter-faq.md)

---

### Was ist der Unterschied zwischen Urlaub und Krankenstand?

Im Standard von time cockpit sind das getrennte Abwesenheitsarten.

- **Urlaub** wird auf den Urlaubsanspruch angerechnet.
- **Krankenstand** wird getrennt vom Urlaub erfasst.
- **Zeitausgleich** wird als dritte, eigene Abwesenheitsart erfasst.

Alle drei Abwesenheitsarten können auch aus dem **Zeiterfassungskalender** heraus angelegt und entweder als ganztägige oder als stundenweise Abwesenheit eingetragen werden.

**Siehe auch:**
- [Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md)
- [Arbeitszeit / Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/arbeitszeit.md)

---

### Wie prüfe ich meinen Resturlaub?

Sie können Ihren Resturlaub auf zwei praktische Arten prüfen:

1. Im **Zeiterfassungskalender**.
   Wenn Ihr Kalenderlayout die Zusammenfassung in der Seitenleiste anzeigt, sehen Sie Ihre aktuellen Salden direkt dort. In Ihrem Screenshot ist das der Wert `Remaining Vacation`. Je nach Konfiguration können Sie aus dem Kalender auch weitere Details öffnen.

2. Unter **Benutzer -> Urlaub**.
   In der Standardliste für Urlaub sehen Sie Ihre Urlaubseinträge und den zugehörigen Verlauf an einer Stelle.

Wenn Sie keine der beiden Ansichten sehen, wenden Sie sich an HR oder Ihren Administrator, da die Sichtbarkeit von Berechtigungen und der Konfiguration des Mandanten abhängt.

**Siehe auch:**
- [Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md)
- [Zeiterfassungskalender](~/doc/zeiterfassungskalender/kalender.md)
- [Arbeitszeit / Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/arbeitszeit.md)
- [HR-Administrator-FAQ](~/doc/hr-administrator-faq.md)

---

### Wie lange dauert die Genehmigung eines Urlaubs?

Time Cockpit unterstützt den Genehmigungsworkflow, legt aber keine produktweite Frist für die Genehmigung fest.

Prüfen Sie in der Urlaubsliste und in Ihren Benachrichtigungen, ob der Antrag noch offen ist oder bereits bearbeitet wurde.

**Siehe auch:**
- [Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md)
- [Abteilungsleiter-FAQ](~/doc/abteilungsleiter-faq.md)

---

## Rechnungslegung und Verrechnung

### Wie erstelle ich eine Rechnung aus Zeitbuchungen?

Wenn Sie Berechtigungen für die Rechnungslegung haben, verwenden Sie **Verwaltung -> Verrechnung -> Nicht verrechnete Zeitbuchungen**.

1. Wählen Sie die relevanten, noch nicht verrechneten Zeitbuchungen aus.
2. Führen Sie im Menü **Aktionen** die Aktion **Ausgangsrechnung anlegen** aus.
3. Geben Sie die Rechnungsdetails ein.

Das ist der Standardablauf der Rechnungslegung, wie er in der Dokumentation zur Rechnungslegung beschrieben ist.

**Siehe auch:**
- [Rechnungslegung](~/doc/projektzeiterfassung/rechnungslegung.md)
- [Abrechnungs-FAQ](~/doc/abrechnungs-faq.md)

---

### Kann ich Zeitbuchungen bearbeiten, nachdem sie verrechnet wurden?

Sobald Zeitbuchungen einer Rechnungsposition oder Rechnung zugeordnet sind, sind sie schreibgeschützt.

Wenn nach der Rechnungslegung Korrekturen nötig sind, klären Sie den Ablauf mit Ihrem Abrechnungsadministrator.

**Siehe auch:**
- [Rechnungslegung](~/doc/projektzeiterfassung/rechnungslegung.md)
- [Abrechnungs-FAQ](~/doc/abrechnungs-faq.md)

---

### Wie exportiere ich Rechnungsdaten in mein Buchhaltungssystem?

Verwenden Sie die Standardexportoptionen der betreffenden Rechnung oder Listenansicht, oder nutzen Sie die Web API, wenn Sie eine eigene Integration haben.

Der genaue weitere Ablauf in der Buchhaltung hängt von Ihrem externen System ab.

**Siehe auch:**
- [Datenexport](~/doc/datenaustausch/export.md)
- [Web API: Überblick](~/doc/web-api/ueberblick.md)
- [Abrechnungs-FAQ](~/doc/abrechnungs-faq.md)

---

### Wie gehe ich mit teilweise verrechneten Projekten um?

Wenn Sie die nötigen Berechtigungen haben, verrechnen Sie nur die ausgewählte Teilmenge der noch nicht verrechneten Zeitbuchungen des Projekts.

Ein praktischer Standardweg: Filtern Sie **Nicht verrechnete Zeitbuchungen** nach Projekt, Zeitraum oder einem anderen relevanten Kriterium und erstellen Sie die Rechnung anschließend aus den ausgewählten Einträgen.

**Siehe auch:**
- [Rechnungslegung](~/doc/projektzeiterfassung/rechnungslegung.md)
- [Abrechnungs-FAQ](~/doc/abrechnungs-faq.md)

---

## Konto und Einstellungen

### Wie ändere ich mein Passwort?

Der genaue Ablauf hängt davon ab, wie Ihr Mandant konfiguriert ist.

- Wenn Sie sich über Microsoft anmelden, verwenden Sie den Ablauf Ihres Microsoft-Kontos.
- Wenn Sie ein von time cockpit verwaltetes Passwort verwenden, öffnen Sie `https://web.timecockpit.com` und klicken Sie auf **Passwort zurücksetzen**.

**Siehe auch:**
- [Kontoverwaltung](~/doc/kontoverwaltung/kontoverwaltung.md)
- [Web-Client](~/doc/erste-schritte/web-client.md)

---

### Was ist bei technischen Problemen oder wenn ich mich nicht anmelden kann?

Prüfen Sie zuerst, ob das Problem mit Ihrer Anmeldemethode, Ihrem Browser oder Ihren Berechtigungen zusammenhängt. Besteht das Problem weiterhin, wenden Sie sich an Ihren internen Administrator oder an `support@timecockpit.com`.

**Siehe auch:**
- [Web-Client](~/doc/erste-schritte/web-client.md)
- [Kontoverwaltung](~/doc/kontoverwaltung/kontoverwaltung.md)

---

## Brauchen Sie mehr Hilfe?

### Verwandte FAQs
- [Projektleiter-FAQ](~/doc/projektleiter-faq.md)
- [HR-Administrator-FAQ](~/doc/hr-administrator-faq.md)
- [Abteilungsleiter-FAQ](~/doc/abteilungsleiter-faq.md)
- [Abrechnungs-FAQ](~/doc/abrechnungs-faq.md)
- [Mitarbeiter-FAQ](~/doc/mitarbeiter-faq.md)

### Dokumentation
- [Für Anwender - Gesamte Dokumentation](~/doc/fuer-anwender.md)
- [Für Entwickler - API & Anpassung](~/doc/fuer-entwickler.md)
- [Entwickler-FAQ](~/doc/entwickler-faq.md)

### Support
- **E-Mail:** support@timecockpit.com

---

*Zuletzt aktualisiert: April 2026.*
