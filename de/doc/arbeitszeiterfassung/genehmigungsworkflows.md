---
title: Genehmigungsworkflows - Abwesenheiten und Zeitbuchungen
description: "Genehmigungsworkflows in time cockpit: Genehmigung von Urlaub, Krankenstand und Zeitausgleich, Freigabe von Zeitbuchungen, Rollen und Benachrichtigungen."
keywords: [genehmigungsworkflow, abwesenheitsgenehmigung, urlaubsgenehmigung, zeitbuchungen genehmigen, workflow-automatisierung, genehmigungsprozess, urlaubsantrag genehmigen, genehmigungsberechtigungen, workflow-benachrichtigungen, genehmigungsverwaltung]
en_page: doc/employee-time-tracking/approval-workflows.md
---

# Genehmigungsworkflows - Abwesenheiten und Zeitbuchungen

Richten Sie strukturierte Genehmigungsworkflows für Abwesenheiten, Urlaubsanträge, Krankenstände und Zeitbuchungen ein. Stellen Sie die Einhaltung von Vorgaben sicher, verbessern Sie die Planbarkeit und vereinfachen Sie Genehmigungsprozesse mit rollenbasierten Berechtigungen und automatischen Benachrichtigungen.

> [!TIP]
> **Möchten Sie die Abwesenheitsverwaltung vereinfachen?** Erfahren Sie, wie Ihnen die [Funktionen zur Arbeitszeiterfassung](https://www.timecockpit.com/features/employee-time-tracking/) von time cockpit helfen, Abwesenheiten, Überstunden und Arbeitszeitregelungen effizient zu verwalten.

## Überblick

time cockpit unterstützt Genehmigungsworkflows für zwei Hauptbereiche:

**1. Genehmigung von Abwesenheiten**
- Anträge auf Urlaub/Sonderurlaub
- Zeitausgleich
- Krankenstand (nachträgliche Genehmigung)

**2. Genehmigung von Zeitbuchungen** (individuelle Umsetzung)
- Wöchentliche/monatliche Genehmigung der Zeitbuchungen
- Genehmigung von Projektzeiten
- Prüfung verrechenbarer Stunden

Genehmigungsworkflows bieten:
- ✅ **Compliance und Nachvollziehbarkeit**: Dokumentiert, wer was wann genehmigt hat
- ✅ **Personalplanung**: Überblick über anstehende Abwesenheiten vor der Genehmigung
- ✅ **Verantwortlichkeit**: Klare Zuständigkeit für Genehmigungen nach Rolle
- ✅ **Automatische Benachrichtigungen**: Automatische Hinweise auf offene Genehmigungen und Entscheidungen
- ✅ **Transparenz im Team**: Der Abwesenheitskalender zeigt dem ganzen Team genehmigte Abwesenheiten

## Genehmigungsworkflow für Abwesenheiten

### So funktioniert die Genehmigung von Abwesenheiten

**Grundprinzip:**
Ist die Genehmigung von Abwesenheiten aktiviert, legen Mitarbeiter Abwesenheitsanträge (Urlaub, Krankenstand, Zeitausgleich) an, die in einer **Liste offener Genehmigungen** erscheinen, bis ein Abteilungsleiter oder HR-Administrator sie genehmigt oder ablehnt. Nach der Genehmigung erscheint die Abwesenheit im Abwesenheitskalender des Teams.

**Ablauf des Workflows:**
```
1. Employee creates absence request
     ↓
2. Department Lead receives notification
     ↓
3. Department Lead reviews in Absence Calendar (sees team conflicts)
     ↓
4. Department Lead approves or rejects
     ↓
5. Employee receives notification of decision
     ↓
6. Approved absence visible in team calendar
```

### Genehmigung von Abwesenheiten aktivieren

**Konfiguration in den Globalen Einstellungen:**

1. Öffnen Sie die **[Globalen Einstellungen](https://web.timecockpit.com/app/forms/entity/APP_GlobalSettings)**.
2. Aktivieren Sie die Genehmigung pro Abwesenheitsart:
   - ☑ **Enable Vacation Approval**
   - ☑ **Enable Compensatory Time Off Approval**
   - ☑ **Enable Sick Leave Approval** (nachträgliche Genehmigung)
3. Klicken Sie auf **Speichern**.

**Konfiguration pro Benutzer:**

Nicht alle Mitarbeiter benötigen unbedingt eine Genehmigung (etwa Geschäftsführung oder Führungskräfte):

1. Öffnen Sie **Benutzer** → **[Benutzerdetails](https://web.timecockpit.com/app/lists/APP_DefaultUserDetailList)**.
2. Öffnen Sie den Datensatz des Mitarbeiters.
3. Aktivieren oder deaktivieren Sie **☑ Abwesenheitsgenehmigung erforderlich**.
4. Speichern Sie.

**Ergebnis:**
- Benutzer mit erforderlicher Genehmigung: Abwesenheiten müssen genehmigt werden
- Benutzer ohne erforderliche Genehmigung: Abwesenheiten werden automatisch genehmigt

### Abgedeckte Abwesenheitsarten

**[Urlaub/Sonderurlaub](https://web.timecockpit.com/app/forms/entity/APP_Vacation)**
- Jahresurlaub, Sonderurlaub (Hochzeit, Umzug usw.)
- Häufigster Anwendungsfall für Genehmigungen
- Erfordert Planung im Voraus

**[Zeitausgleich](https://web.timecockpit.com/app/forms/entity/APP_CompensatoryTime)**
- Freizeit als Ausgleich für geleistete Überstunden
- Die Genehmigung stellt sicher, dass der Saldo stimmt
- Ähnlich wie der Genehmigungsprozess für Urlaub

**[Krankenstand](https://web.timecockpit.com/app/forms/entity/APP_SickLeave)**
- Nachträgliche Genehmigung (der Mitarbeiter ist bereits abwesend)
- Die Genehmigung dokumentiert den Abwesenheitsgrund für Lohnverrechnung/HR
- Je nach Richtlinie ist keine vorherige Genehmigung nötig

### Wer Abwesenheiten genehmigen kann

**Abteilungsleiter**
- Genehmigen Abwesenheiten der Mitarbeiter in ihrer Abteilung bzw. ihren Abteilungen
- Können Abteilungsleiter mehrerer Abteilungen sein
- Erhalten automatische Benachrichtigungen zu offenen Genehmigungen
- Sehen die Abwesenheiten des Teams, um Konflikte zu erkennen

**HR-Administratoren**
- Können Abwesenheiten im Namen der Abteilungsleiter genehmigen
- Haben Zugriff auf alle Abteilungen (über den Filter „Alle Benutzer anzeigen“)
- Übernehmen Genehmigungen, wenn Abteilungsleiter nicht verfügbar sind
- Behandeln Ausnahmen im Genehmigungsworkflow

**Normale Benutzer/Mitarbeiter**
- Können keine Abwesenheiten anderer genehmigen
- Sehen nur den Genehmigungsstatus ihrer eigenen Abwesenheiten
- Sehen die Abwesenheiten des Teams im Kalender (aus Datenschutzgründen ohne Abwesenheitsart)

### Offene Genehmigungen anzeigen

**Als Abteilungsleiter:**

1. Öffnen Sie den **[Abwesenheitskalender](https://web.timecockpit.com/app/absence-time-calendar)**.
2. Die **Liste offener Genehmigungen** erscheint über dem Kalender.
3. Sie zeigt die Abwesenheiten, die Ihre Genehmigung erfordern:
   - Name des Mitarbeiters
   - Abwesenheitsart (Urlaub, Krankenstand, Zeitausgleich)
   - Beginn- und Enddatum
   - Summe der beantragten Tage
4. Wählen Sie eine Zeile aus, um die Abwesenheit im Kalender darunter in einer Vorschau zu sehen.
5. Der Kalender springt zur besseren Einordnung automatisch zum Datum der Abwesenheit.

**Alternative: Listenansicht**

1. Öffnen Sie **Benutzer** → **[Urlaub](https://web.timecockpit.com/app/lists/APP_DefaultVacationList)** (oder Krankenstand, Zeitausgleich).
2. Filtern Sie:
   - **Abteilung:** Ihre Abteilung (gegebenenfalls automatisch)
   - **Genehmigt:** False
3. Prüfen Sie die Liste der offenen Genehmigungen.

**Als HR-Administrator:**

1. Öffnen Sie den **[Abwesenheitskalender](https://web.timecockpit.com/app/absence-time-calendar)**.
2. Aktivieren Sie das Kontrollkästchen **☑ Alle Benutzer anzeigen**.
3. Filtern Sie optional nach:
   - **Abteilung:** eine bestimmte Abteilung
   - **Benutzer:** ein bestimmter Mitarbeiter
4. Sie sehen alle offenen Genehmigungen im gesamten Unternehmen.

### Abwesenheiten genehmigen oder ablehnen

**Einzelgenehmigung (Abwesenheitskalender):**

1. Suchen Sie den Antrag in der **Liste offener Genehmigungen**.
2. Prüfen Sie den Kontext:
   - Kontrollieren Sie im Kalender darunter, ob es Konflikte im Team gibt
   - Prüfen Sie, ob der Mitarbeiter über ausreichend Resturlaub verfügt
   - Berücksichtigen Sie Projekttermine und Vertretungen
3. **Genehmigen:**
   - Klicken Sie auf die Aktionsschaltfläche **Approve** (Spalte ganz rechts)
   - Die Abwesenheit erscheint sofort im Kalender
   - Der Mitarbeiter erhält eine Benachrichtigung über die Genehmigung
4. **Ablehnen:**
   - Klicken Sie auf die Aktionsschaltfläche **Reject**
   - Geben Sie im Dialog einen **Ablehnungsgrund** an (Pflichtfeld)
   - Die Abwesenheit wird gelöscht
   - Der Mitarbeiter erhält eine Benachrichtigung über die Ablehnung mit dem Grund

**Sammelgenehmigung (mehrere Anträge):**

1. Öffnen Sie **Benutzer** → **[Urlaub](https://web.timecockpit.com/app/lists/APP_DefaultVacationList)**.
2. Filtern Sie auf offene Genehmigungen (**Genehmigt = False**).
3. Wählen Sie **mehrere Anträge** aus (STRG+Klick).
4. Führen Sie in der Symbolleiste die Aktion **Abwesenheit Genehmigen** aus.
5. Alle ausgewählten Anträge werden gleichzeitig genehmigt.

**Bearbeiten vor der Genehmigung:**

Wenn die Termine angepasst werden müssen:
1. Öffnen Sie den Abwesenheitsantrag.
2. Besprechen Sie die Änderung mit dem Mitarbeiter (über einen Kommentar in der Benachrichtigung oder auf anderem Weg).
3. Der Mitarbeiter storniert den ursprünglichen Antrag und legt einen neuen an.
4. Oder: Sie bearbeiten die Termine direkt (sofern erlaubt) und genehmigen dann.

### Sichtbarkeit im Abwesenheitskalender nach Rolle

| Rolle | Sieht | Kann genehmigen | Angezeigte offene Genehmigungen |
|------|---------|-------------|-------------------------|
| **Zeiterfassungsbenutzer** | Abwesenheiten der eigenen Abteilung (aus Datenschutzgründen ohne Abwesenheitsart) | ❌ Nein | Nur eigene |
| **Abteilungsleiter** | Eigene Abteilung + Abteilungen, deren Leiter er ist | ✅ Ja (eigene Abteilungen) | Eigene + Mitglieder der Abteilung |
| **HR-Administrator** | Alle Benutzer (mit dem Filter „Alle Benutzer anzeigen“) | ✅ Ja (im Namen der Abteilungsleiter) | Alle (bei aktiviertem Filter) |

**Schutz der Privatsphäre:**
Normale Benutzer sehen, dass Kollegen abwesend sind, aber NICHT, ob es sich um Urlaub, Krankenstand oder Zeitausgleich handelt. Das verhindert eine Stigmatisierung von Krankenständen.

### Automatische Benachrichtigungen

**Wenn eine Abwesenheit angelegt wird:**
- Die **Abteilungsleiter** der Abteilung des antragstellenden Benutzers erhalten eine Benachrichtigung
- Die Benachrichtigung erscheint unter dem **Glockensymbol** (Menü rechts oben)
- Sie enthält: Name des Mitarbeiters, Termine und Art der Abwesenheit

**Benachrichtigungen deaktivieren (pro Abteilungsleiter):**
1. Öffnen Sie die **[Stammdaten der Abteilung](https://web.timecockpit.com/app/lists/APP_DefaultDepartmentList)**.
2. Öffnen Sie den Datensatz der Abteilung.
3. Suchen Sie die Einstellungen des Abteilungsleiters.
4. Deaktivieren Sie **☑ Benachrichtigungen zur Abwesenheitsgenehmigung erhalten** für diesen Abteilungsleiter.
5. Speichern Sie.

**Wenn eine Abwesenheit genehmigt/abgelehnt wird:**
- Der **antragstellende Mitarbeiter** erhält eine Benachrichtigung
- Die Benachrichtigung enthält:
  - Entscheidung (genehmigt oder abgelehnt)
  - Name der genehmigenden Person
  - Zeitstempel
  - Ablehnungsgrund (bei Ablehnung)
- Benachrichtigungen zu genehmigten Abwesenheiten dienen als **schriftliche Bestätigung**
- Abgelehnte Abwesenheiten werden **automatisch gelöscht**

**Bereinigung der Benachrichtigungen:**
- Benachrichtigungen an Abteilungsleiter werden bei Genehmigung/Ablehnung automatisch gelöscht
- Benachrichtigungen an Mitarbeiter über Genehmigungen können für die Unterlagen aufbewahrt werden

### Typische Genehmigungsszenarien

**Szenario 1: Mehrere Teammitglieder beantragen dieselben Tage**

**Schritte:**
1. Prüfen Sie alle offenen Anträge auf Terminkonflikte.
2. Prüfen Sie die Kapazität des Teams:
   - **>70 % anwesend**: meist machbar
   - **50–70 % anwesend**: schwierig
   - **<50 % anwesend**: hohes Risiko, eine Begrenzung erwägen
3. Berücksichtigen Sie:
   - das Prinzip „Wer zuerst kommt, mahlt zuerst“
   - Projekttermine und Zusagen
   - die nötige Abdeckung von Fachkenntnissen
   - Betriebszugehörigkeit oder besondere Umstände
4. Genehmigen Sie, was das Team verkraften kann.
5. Sprechen Sie mit den Mitarbeitern, die umplanen müssen.

**Szenario 2: Kurzfristiger Urlaubsantrag**

**Zu berücksichtigende Richtlinien:**
- Legen Sie eine Vorlaufzeit fest (z. B. mindestens 2 Wochen)
- Bewerten Sie die Auswirkungen auf Team und Projekte
- Unterscheiden Sie Notfälle von mangelnder Planung

**Entscheidung:**
- ✓ Genehmigen, wenn: Vertretung verfügbar, kein kritischer Zeitraum
- ✗ Ablehnen, wenn: kritische Deadline, keine ausreichende Vertretung, Verstoß gegen Richtlinien
- 💬 Besprechen, wenn: Grenzfall, eventuell Terminanpassung nötig

**Szenario 3: Nachträgliche Genehmigung eines Krankenstands**

**Ablauf:**
- Der Mitarbeiter kehrt aus dem Krankenstand zurück
- Er legt einen Krankenstand für die vergangenen Tage an
- Der Abteilungsleiter genehmigt nachträglich (dokumentiert die Abwesenheit)
- Der Eintrag erscheint an den vergangenen Tagen im Kalender

**Zweck:**
- Dokumentation für die Compliance
- Korrekte Lohnverrechnung
- Nicht blockierend (der Mitarbeiter war bereits abwesend)

**Szenario 4: Kommunikation bei abgelehnten Anträgen**

**Bewährte Vorgehensweisen:**
1. Geben Sie einen klaren, konkreten Ablehnungsgrund an.
2. Schlagen Sie nach Möglichkeit alternative Termine vor.
3. Führen Sie ein persönliches Gespräch (bei heiklen Fällen).
4. Dokumentieren Sie die Gründe für die Entscheidung (für mögliche Streitfälle).
5. Erklären Sie den geschäftlichen Hintergrund (Projekttermine, Lücken in der Vertretung).

### Bestehende Abwesenheiten nach dem Aktivieren des Workflows

**Wichtig:** Wenn Sie den Genehmigungsworkflow zum ersten Mal aktivieren, erscheinen bestehende Abwesenheiten (auch vergangene Abwesenheiten, die vor der Aktivierung angelegt wurden) im Abwesenheitskalender als **nicht genehmigt**.

**Erforderliche Schritte:**
1. Öffnen Sie die Liste offener Genehmigungen.
2. Filtern Sie auf **vergangene** Abwesenheiten (Termine in der Vergangenheit).
3. **Genehmigen Sie nachträglich** alle berechtigten historischen Abwesenheiten.
4. Damit ist die Liste offener Genehmigungen bereinigt.

**Warum:** Das System kann nicht unterscheiden, ob Abwesenheiten vor oder nach der Aktivierung des Workflows angelegt wurden.

## Genehmigungsworkflow für Zeitbuchungen (individuelle Umsetzung)

time cockpit bietet für Zeitbuchungen keine integrierte Genehmigung wie für Abwesenheiten, Sie können aber eigene Workflows umsetzen.

### Ansätze für die Genehmigung von Zeitbuchungen

**Ansatz 1: Manueller Prüfprozess**

**Ablauf:**
1. Mitarbeiter markieren Zeitbuchungen als „Ready for Review“ (eigenes Kennzeichen)
2. Projektleiter/Abteilungsleiter prüfen die Einträge wöchentlich
3. Nach der Prüfung als „Approved“ markieren (eigenes Kennzeichen)
4. Der Abrechnungsadministrator verrechnet nur Einträge, die als „Approved“ markiert sind

**Umsetzung:**
- Fügen Sie der Entität Timesheet ein eigenes boolesches Feld „Approved“ hinzu
- Fügen Sie ein eigenes boolesches Feld „Ready for Review“ hinzu
- Schulen Sie die Benutzer im Ablauf

**Ansatz 2: Prüfung über Listen**

**Konfiguration:**
1. Legen Sie eine gespeicherte Listenansicht „Timesheets Pending Approval“ an.
2. Filtern Sie:
   - **Projekt:** Projekte des Managers
   - **Approved:** False
   - **Zeitraum:** diese Woche
3. Der Manager prüft die Liste wöchentlich.
4. Sammelgenehmigung über eine eigene Aktion oder durch manuelles Setzen des Kennzeichens.

**Ansatz 3: Genehmigung über Aktionen**

**(Fortgeschritten – erfordert Scripting)**

Legen Sie eine eigene Aktion „Submit Timesheet for Approval“ an:
- Sperrt Zeitbuchungen (verhindert das Bearbeiten)
- Benachrichtigt den Projektleiter
- Setzt den Status auf „Pending Approval“

Legen Sie eine eigene Aktion „Approve Timesheet“ an:
- Nur für Manager verfügbar
- Setzt das Kennzeichen „Approved“
- Benachrichtigt den Mitarbeiter
- Die Einträge können danach verrechnet werden

**Siehe:** [Scripting - Aktionen](/doc/scripting/actions.html), [Anpassung des Datenmodells](/doc/data-model-customization/overview.html)

### Anwendungsfälle für die Genehmigung von Zeitbuchungen

**1. Prüfung verrechenbarer Stunden**
- Der Projektleiter prüft, ob die Stunden berechtigt und verrechenbar sind
- Prüft die Beschreibungen auf kundentaugliche Inhalte
- Stellt sicher, dass die richtigen Projekte/Tätigkeiten gewählt wurden
- Verhindert zu hohe oder falsche Verrechnung

**2. Einhaltung des Budgets**
- Der Manager prüft, ob Einträge die Budgets von Tätigkeiten/Projekten überschreiten
- Markiert Budgetüberschreitungen zur Klärung
- Leitet Zeiten auf die richtigen Budgetpositionen um

**3. Korrekte Lohnverrechnung**
- Die Führungskraft prüft, ob Überstunden genehmigt sind
- Bestätigt, dass die Arbeitszeitregelungen eingehalten wurden
- Genehmigt vor dem Export für die Lohnverrechnung

**4. Freigabe durch den Kunden**
- Manche Verträge erfordern eine Freigabe der Stunden durch den Kunden
- Der Manager leitet genehmigte Zeitbuchungen an den Kunden weiter
- Der Kunde gibt die Stunden vor der Rechnungslegung frei

## Bewährte Vorgehensweisen für Genehmigungsworkflows

### 1. Klare Richtlinien festlegen

**Dokumentieren Sie Richtlinien für:**
- ✓ Vorlaufzeiten (Urlaub: 2 Wochen, Krankenstand: am selben Tag)
- ✓ Bearbeitungszeit für Genehmigungen (Führungskraft antwortet innerhalb von 24–48 Stunden)
- ✓ Einspruchsverfahren (abgelehnte Anträge können bei HR beeinsprucht werden)
- ✓ Sperrzeiten (kein Urlaub während des Geschäftsjahresabschlusses)
- ✓ Kapazitätsgrenzen (höchstens 30 % des Teams gleichzeitig abwesend)

**Kommunizieren Sie die Richtlinien über:**
- Mitarbeiterhandbuch
- Onboarding-Schulung
- Schulung der Führungskräfte
- Regelmäßige Erinnerungen

### 2. Bearbeitungszeiten für Genehmigungen festlegen

**Erwartete Reaktionszeiten:**
- **Routinemäßige Urlaubsanträge**: 1–2 Werktage
- **Dringende Anträge**: am selben Tag
- **Krankenstand (nachträglich)**: wöchentliche Sammelgenehmigung
- **Genehmigung von Zeitbuchungen**: wöchentlich (vor dem Abrechnungszyklus)

**Verfolgen Sie Kennzahlen:**
- Durchschnittliche Bearbeitungszeit
- Überfällige Genehmigungen (>3 Tage offen)
- Eskalationen an HR
- Zufriedenheit der Mitarbeiter mit dem Genehmigungsprozess

### 3. Genehmigende Personen schulen

**Die Schulung der Abteilungsleiter sollte abdecken:**
- Wie man offene Genehmigungen aufruft
- Wie man den Abwesenheitskalender auf Konflikte prüft
- Genehmigungskriterien und Richtlinien
- Häufige Ablehnungsgründe
- Wirkungsvolle Ablehnungskommentare
- Abläufe für Sammelgenehmigungen
- Umgang mit Benachrichtigungen

**Auffrischungsschulungen:**
- Jährlich
- Bei Änderungen der Richtlinien
- Für neue Abteilungsleiter

### 4. Rückstau bei Genehmigungen überwachen

**Wöchentliches Dashboard:**
- Anzahl offener Genehmigungen pro Abteilung
- Älteste offene Genehmigung (Tage)
- Genehmigende Personen mit >10 offenen Anträgen
- Genehmigungsquote pro Abteilungsleiter (% genehmigt)

**Auslöser für Eskalationen:**
- Offen >5 Tage → genehmigende Person benachrichtigen
- Offen >10 Tage → an HR eskalieren
- Genehmigende Person auf Urlaub → an Vertretung delegieren

### 5. Transparenz schaffen

**Für Mitarbeiter:**
- Statusabfrage in Selbstbedienung (genehmigt/offen/abgelehnt)
- Voraussichtliche Bearbeitungszeit
- Ablehnungsgrund (Pflichtfeld)
- Hinweise zum Einspruchsverfahren

**Für Führungskräfte:**
- Zentrales Dashboard der offenen Genehmigungen
- Abwesenheitskalender des Teams (genehmigte Abwesenheiten)
- Vorschau auf anstehende Abwesenheiten (nächste 30/90 Tage)
- Historische Genehmigungsmuster (für die Planung)

### 6. Ausnahmen souverän behandeln

**Abwesenheiten in Notfällen:**
- Krankenstand am selben Tag eintragen lassen
- Nachträgliche Genehmigung innerhalb von 24 Stunden
- Flexible Richtlinie für Notfälle (Familie, Gesundheit usw.)

**Delegieren von Genehmigungen:**
- Ist der Abteilungsleiter auf Urlaub, an eine Vertretung delegieren
- HR-Administratoren können im Namen des Abteilungsleiters genehmigen
- Delegation im System dokumentieren

**Übersteuern von Richtlinien:**
- Geschäftsführung oder HR können Ablehnungen übersteuern (mit Dokumentation)
- Nachvollziehbare Aufzeichnung aller Übersteuerungen
- Übersteuerungen vierteljährlich prüfen, um Richtlinien anzupassen

## Geschäftlicher Nutzen und ROI

### Compliance und geringeres Risiko

**Rechtliche Anforderungen:**
- Das Arbeitsrecht in der DACH-Region verlangt dokumentierte Abwesenheitsaufzeichnungen
- Die Genehmigungshistorie erfüllt Prüfanforderungen
- Vermeidet Strafen bei Verstößen (2.000–10.000 € pro Verstoß)

**ROI-Beispiel:**
Eine einzige vermiedene Strafe von 5.000 € bezahlt time cockpit für ein kleines Team für mehr als 5 Jahre.

### Personalplanung

**Vorteile:**
- Abteilungsleiter sehen anstehende Abwesenheiten, bevor sie neue Anträge genehmigen
- Verhindert Unterbesetzung
- Reduziert kurzfristig benötigte externe Kräfte

**ROI-Beispiel:**
Eine Abteilung mit 20 Personen vermeidet 3 kurzfristige Einsätze externer Kräfte pro Jahr (je 500 €/Tag) = **4.500 € Ersparnis pro Jahr**

### Schnellere Genehmigung

**Zeitersparnis:**
- Genehmigung per E-Mail: durchschnittlich 3–7 Tage
- Genehmigung in time cockpit: am selben oder nächsten Tag

**ROI-Beispiel:**
50 Mitarbeiter sparen 2–3 Stunden pro Jahr an Nachfragen zu Urlaubsanträgen = **100–150 gewonnene Stunden**

### Weniger Fehler in der Lohnverrechnung

**Verbesserung:**
- Zentrale Abwesenheitsdaten ersetzen manuelle Tabellen
- Reduziert Fehler in der Lohnverrechnung um 80–90 %

**ROI-Beispiel:**
Ein Team mit 30 Personen vermeidet 5 Unstimmigkeiten in der Lohnverrechnung pro Jahr (je 4 Stunden Aufwand in HR/Finanzen) = **20 Stunden Ersparnis pro Jahr**

### Bessere Erfahrung für Mitarbeiter

**Zufriedenheitsfaktoren:**
- Statusverfolgung in Echtzeit
- Automatische Benachrichtigungen mit Gründen für Genehmigung/Ablehnung
- Schriftliche Bestätigungen
- Transparenter, einheitlicher Prozess

**ROI-Beispiel:**
Eine bessere Urlaubsverwaltung trägt zur Mitarbeiterbindung bei. Wird die Fluktuation um 1 Mitarbeiter pro Jahr gesenkt (Wiederbesetzungskosten = 50–150 % eines Jahresgehalts), ergibt das **25.000–75.000 € Ersparnis**

### Bereitschaft für Prüfungen

**Zeitersparnis:**
- HR-Teams sparen bei jährlichen Prüfungen 30–40 Stunden
- Sofortiger Zugriff auf die Genehmigungshistorie mit Zeitstempeln, Namen der genehmigenden Personen und Gründen
- Keine manuelle Rekonstruktion von Aufzeichnungen nötig

**ROI-Beispiel:**
Bei Vollkosten von 50 €/Stunde = **1.500–2.000 € Ersparnis pro Prüfung**

## Verwandte Funktionen

### Arbeitszeiterfassung
- [Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md) - Urlaub, Krankenstand, Zeitausgleich
- [Arbeitszeitregelungen](~/doc/arbeitszeiterfassung/arbeitszeitregelungen.md) - Rahmen für die Einhaltung von Vorgaben
- [Standardberechtigungen](~/doc/arbeitszeiterfassung/standardberechtigungen.md) - Rollenbasierte Zugriffssteuerung

### Projektmanagement
- [Budgetkontrolle](~/doc/projektzeiterfassung/budgetkontrolle.md) - Projektrentabilität (die Genehmigung von Zeitbuchungen unterstützt die Budgetkontrolle)
- [Kunden, Projekte und Tätigkeiten](~/doc/projektzeiterfassung/kunde-projekt-taetigkeit.md) - Projekthierarchie

### Berichte
- [Integrierte Berichte](~/doc/berichte/integrierte-berichte.md) - Berichte zu Abwesenheiten und Zeitbuchungen
- [Eigene Berichte](~/doc/berichte/benutzerdefinierte-berichte.md) - Dashboards mit Genehmigungskennzahlen

### Fortgeschritten
- [Anpassung des Datenmodells](/doc/data-model-customization/overview.html) - Eigene Felder für die Genehmigung von Zeitbuchungen
- [Scripting - Aktionen](/doc/scripting/actions.html) - Eigene Genehmigungsaktionen und Automatisierung
- [Scripting - Trigger](/doc/scripting/triggers.html) - Automatische Benachrichtigungen zu Genehmigungen

## Siehe auch

**FAQs:**
- [Abteilungsleiter-FAQ](/doc/department-lead-faq.html) - Rollenspezifische Fragen zu Genehmigungen
- [HR-Administrator-FAQ](/doc/hr-administrator-faq.html) - Fragen zu Genehmigungen und Richtlinien aus HR-Sicht
- [Mitarbeiter-FAQ](~/doc/mitarbeiter-faq.md) - Fragen zu Urlaubsanträgen

**API und Automatisierung:**
- [Web API – Überblick](/doc/web-api/overview.html) - Genehmigungsworkflows per Programm
- [Scripting – Überblick](/doc/scripting/overview.html) - Automatisierung von Workflows

---

*Unterstützung zu Genehmigungsworkflows erhalten Sie unter [support@timecockpit.com](mailto:support@timecockpit.com) sowie in der [Abteilungsleiter-FAQ](/doc/department-lead-faq.html) und der [HR-Administrator-FAQ](/doc/hr-administrator-faq.html).*
