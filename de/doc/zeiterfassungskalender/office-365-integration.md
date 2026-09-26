---
title: Office-365-Integration - Kalender und E-Mails abgleichen
description: "Verbinden Sie time cockpit mit Office 365: Outlook-Termine und gesendete E-Mails im Zeiterfassungskalender für eine lückenlose Zeiterfassung."
keywords: [office 365 integration, outlook integration, kalendersynchronisierung, e-mail-synchronisierung, office 365 kalender, outlook-termine, terminsynchronisierung, e-mail-tracking, microsoft 365, kalenderintegration]
en_page: doc/timesheet-calendar/office365.md
---

# Office-365-Integration

Verbinden Sie time cockpit mit Ihrem Office-365-Konto, um Outlook-Termine und gesendete E-Mails direkt in Ihrem Zeiterfassungskalender anzuzeigen und so einen vollständigen Überblick über Ihren Arbeitstag zu erhalten.

> [!TIP]
> **Möchten Sie Ihre Zeiterfassung vereinfachen?** Die Office-365-Integration hilft Ihnen, Zeiten genauer zu erfassen, indem sie Ihren Kalender und Ihre E-Mails einbindet. Mehr über [Integrationen für die Zeiterfassung](https://www.timecockpit.com/features/integration/).

## Überblick

Die Office-365-Integration bringt Ihre Microsoft-365-Daten in time cockpit:

**Kalendertermine:**
- Outlook-Termine neben Zeitbuchungen anzeigen
- Termine mit einem Klick in verrechenbare Zeitbuchungen umwandeln
- Besprechungen während der Zeiterfassung im Blick behalten

**Gesendete E-Mails:**
- Gesendete E-Mails aus Outlook in Ihrem Kalender anzeigen
- Kommunikation und Aktivitäten mit Kunden erkennen
- Beim Anlegen von Zeitbuchungen auf E-Mail-Verläufe zurückgreifen

**Vorteile:**
- ✅ Weniger manuelle Zeiterfassung (Termine in Zeitbuchungen umwandeln)
- ✅ Höhere Genauigkeit (sehen, was Sie im Laufe des Tages tatsächlich getan haben)
- ✅ Alle Aktivitäten erfassen (Besprechungen, E-Mails, konzentrierte Arbeit)
- ✅ Kontext für die nachträgliche Zeiterfassung

## Unterstützte Office-365-Dienste

**Microsoft Outlook Online (webbasiert)**
- ✅ Kalendertermine
- ✅ Gesendete E-Mails
- ✅ OAuth-Authentifizierung

**Microsoft Outlook Desktop** (über die Office-365-Synchronisierung)
- ✅ Kalendersynchronisierung über Office 365 online
- ✅ E-Mail-Synchronisierung über Office 365 online

**Voraussetzungen:**
- Aktives Office-365- bzw. Microsoft-365-Abonnement
- Zugriff auf time cockpit im Webbrowser ([web.timecockpit.com](https://web.timecockpit.com))
- Anmeldedaten für Ihr Office-365-Konto

> [!NOTE]
> Die Integration verbindet sich mit den **Office-365-Clouddiensten**. Wenn Sie eine eigenständige Outlook-Installation ohne Office 365 verwenden, steht diese Integration nicht zur Verfügung.

## Office-365-Integration konfigurieren

### Schritt 1: Office-365-Funktionen aktivieren

1. Öffnen Sie in time cockpit den **[Zeiterfassungskalender](https://web.timecockpit.com/app/calendar)**
2. Klicken Sie auf **Einstellungen** (Zahnradsymbol oder Einstellungsschaltfläche)
3. Aktivieren Sie die folgenden Optionen:
   - ☑ **Office 365 Kalendereinträge anzeigen**
   - ☑ **Office 365 gesendete E-Mails anzeigen**
4. Klicken Sie auf **Speichern** oder **Anwenden**

![Office-365-Einstellungen aktivieren](/doc/timesheet-calendar/images/wc-enable-office365.png "Office 365 in den Einstellungen aktivieren")

### Schritt 2: Bei Office 365 anmelden

1. Klicken Sie in der Symbolleiste von time cockpit auf **Sign In** (Anmeldeschaltfläche für Office 365)
2. **Das Office-365-Anmeldefenster öffnet sich** (eventuell im Hintergrund – mit Alt+Tab finden Sie es)
3. Geben Sie Ihre **Office-365-E-Mail-Adresse** ein
4. Geben Sie Ihr **Office-365-Passwort** ein
5. Bestätigen Sie die **Berechtigungsanfrage**:
   - time cockpit fordert Lesezugriff an auf:
     - Ihren Kalender
     - Ihre gesendeten E-Mails
   - Klicken Sie auf **Akzeptieren** bzw. **Zulassen**
6. Nach erfolgreicher Anmeldung schließt sich das Anmeldefenster automatisch

![Office-365-Anmeldung](/doc/timesheet-calendar/images/wc-office365-login.png "Office-365-Anmeldeaufforderung")

> [!NOTE]
> Die OAuth-Anmeldung kann sich in einem Tab oder Fenster im Hintergrund öffnen. Wenn Sie die Anmeldeaufforderung nicht sofort sehen, prüfen Sie Ihre geöffneten Fenster (Alt+Tab unter Windows, Cmd+Tab auf dem Mac).

### Schritt 3: Daten aktualisieren

1. Klicken Sie in der Symbolleiste von time cockpit auf **Aktualisieren**
2. Warten Sie, bis die Daten geladen sind (je nach Kalendergröße 10–30 Sekunden)
3. **Outlook-Termine und E-Mails** erscheinen jetzt in Ihrem Kalender

![Office-365-Daten geladen](/doc/timesheet-calendar/images/wc-office365-enabled.png "Office-365-Daten im Kalender")

## Office-365-Daten in der Zeiterfassung nutzen

### Termine im Kalender ansehen

**Termine erscheinen im Kalender:**
- Sie werden neben den Zeitbuchungen angezeigt
- In einem anderen Darstellungsstil (eventuell leicht transparent oder in einer anderen Farbe)
- Mit Uhrzeit, Titel und Ort des Termins
- Sie **können** in time cockpit **nicht bearbeitet werden** (schreibgeschützt)

**Kalenderansichten:**
- **Tagesansicht**: Stundenplan mit Terminen
- **Wochenansicht**: Überblick über die Besprechungen der Woche
- **Monatsansicht**: Grober Überblick über die Verteilung der Termine

### Termine in Zeitbuchungen umwandeln

So machen Sie aus einem Outlook-Termin eine verrechenbare Zeitbuchung:

**Schnelle Umwandlung:**
1. **Doppelklicken** Sie im Kalender auf den Termin
2. time cockpit legt eine **neue Zeitbuchung** an mit:
   - ✓ Beginnzeit (aus dem Termin)
   - ✓ Endzeit (aus dem Termin)
   - ✓ Beschreibung (aus dem Titel des Termins)
   - ✓ Ort (falls im Termin angegeben)
3. **Vervollständigen Sie den Eintrag**, indem Sie Folgendes ergänzen:
   - Projekt/Tätigkeit (für die Verrechnung erforderlich)
   - Zusätzliche Notizen oder Details
   - Kennzeichnung als verrechenbar (falls zutreffend)
4. Klicken Sie auf **Speichern**

**Anwendungsfälle:**
- Kundenbesprechungen in verrechenbare Zeit umwandeln
- Interne Besprechungen auf die richtigen Projekte buchen
- Reisezeiten aus Kalenderterminen erfassen
- Telefonkonferenzen und Webinare erfassen

![Termin in Eintrag umwandeln](/doc/timesheet-calendar/images/wc-transform-appointments.png "Termin per Doppelklick umwandeln")

### Gesendete E-Mails ansehen

**Gesendete E-Mails erscheinen im Kalender:**
- Die Zeitleiste zeigt, wann E-Mails gesendet wurden
- Der Betreff der E-Mail wird angezeigt
- Hilft Ihnen zu rekonstruieren, woran Sie gearbeitet haben

**E-Mail-Daten für die Zeiterfassung nutzen:**
- **Anhaltspunkt**: "Ich habe dem Kunden um 14 Uhr eine E-Mail geschickt, also habe ich von 13 bis 15 Uhr an seinem Projekt gearbeitet"
- **Aktivitätsindikator**: Viele E-Mails in kurzer Zeit = aktive Arbeit an einem Thema
- **Kundenkommunikation**: Bei manchen Kunden als verrechenbare Zeit erfassen
- **Nachträgliche Erfassung**: Lücken füllen, indem Sie Ihre E-Mail-Aktivität durchsehen

**Einträge aus E-Mails anlegen:**
1. Suchen Sie die gesendete E-Mail im Kalender (z. B. "Angebot an Acme Corp gesendet")
2. Klicken Sie, um für diesen Zeitraum eine neue Zeitbuchung anzulegen
3. Projekt: Acme Corp
4. Beschreibung: "Projektangebot erstellt und versendet"
5. Speichern

## Sicherheit und Datenschutz

### Angeforderte Berechtigungen

time cockpit fordert **ausschließlich Lesezugriff** an:
- ✓ Kalendertermine lesen
- ✓ Gesendete E-Mails lesen
- ✗ Kann keine E-Mails in Ihrem Namen senden
- ✗ Kann keine Termine ändern oder löschen
- ✗ Kann nicht auf E-Mail-Inhalte zugreifen (nur auf Metadaten: Betreff, Zeitpunkt, Empfänger)

### Datenspeicherung

- **Kalender- und E-Mail-Daten** werden **nicht** auf den Servern von time cockpit **gespeichert**
- Die Daten werden beim Aktualisieren **bei Bedarf abgerufen**
- Nur die **Zeitbuchungen, die Sie anlegen**, werden in time cockpit gespeichert
- Termine und E-Mails bleiben in Office 365

### Zugriff widerrufen

So trennen Sie time cockpit von Office 365:

1. Öffnen Sie die [Office-365-Kontoeinstellungen](https://account.microsoft.com/privacy/app-access)
2. Suchen Sie "Time Cockpit" in der Liste der verbundenen Apps
3. Klicken Sie auf **Entfernen** bzw. **Zugriff widerrufen**
4. Bestätigen Sie das Entfernen

time cockpit zeigt danach keine Termine und E-Mails mehr an.

## Problembehebung

### Termine werden nicht angezeigt

**Problem**: Office 365 ist aktiviert, aber es werden keine Termine angezeigt

**Lösungen:**
1. **Anmeldung prüfen**: Prüfen Sie, ob Sie angemeldet sind (Office-365-Symbol bzw. -Status)
2. **Auf Aktualisieren klicken**: Aktualisieren Sie manuell, um die neuesten Daten abzurufen
3. **Datumsbereich prüfen**: Stellen Sie sicher, dass der Kalender Tage mit Terminen anzeigt
4. **Prüfen, ob der Kalender Termine enthält**: Melden Sie sich bei Office 365 im Web an ([outlook.office.com](https://outlook.office.com)) und prüfen Sie, ob die Termine vorhanden sind
5. **Erneut authentifizieren**: Melden Sie sich in time cockpit von Office 365 ab und wieder an

### Anmeldefenster erscheint nicht

**Problem**: Sie haben auf "Sign In" geklickt, aber es erscheint kein Anmeldefenster

**Lösungen:**
1. **Fenster im Hintergrund prüfen**: Drücken Sie Alt+Tab (Windows) oder Cmd+Tab (Mac), um das Pop-up zu finden
2. **Pop-up-Blocker des Browsers prüfen**: Erlauben Sie Pop-ups für [web.timecockpit.com](https://web.timecockpit.com)
3. **Anderen Browser verwenden**: Manche Browser blockieren OAuth-Pop-ups
4. **Browser-Cache leeren**: Leeren Sie Cache und Cookies und versuchen Sie es erneut

### E-Mails werden nicht angezeigt

**Problem**: Termine werden angezeigt, E-Mails aber nicht

**Lösungen:**
1. **Prüfen Sie, ob "Office 365 gesendete E-Mails anzeigen" aktiviert ist** (in den Einstellungen)
2. **Datumsbereich prüfen**: E-Mails werden nur für die angezeigten Tage dargestellt
3. **Prüfen, ob E-Mails gesendet wurden**: Melden Sie sich bei Outlook im Web an und prüfen Sie, ob es in diesem Zeitraum gesendete E-Mails gibt
4. **Berechtigungsproblem**: Authentifizieren Sie sich erneut bei Office 365, damit die Leseberechtigung für E-Mails erteilt wird

### Leistung/Langsames Laden

**Problem**: Der Kalender lädt nach dem Aktivieren von Office 365 langsam

**Lösungen:**
1. **Großer Kalender**: Bei Tausenden von Terminen dauert das erste Laden länger
2. **Netzwerkgeschwindigkeit**: Langsames Internet = langsamer Abruf der Office-365-Daten
3. **Bei Bedarf deaktivieren**: Schalten Sie die Office-365-Integration aus, wenn Sie sie gerade nicht benötigen
4. **Tagesansicht verwenden**: Die Tagesansicht lädt weniger Daten als die Wochen- oder Monatsansicht

## Vergleich: Office 365 und lokales Outlook

| Funktion | Office-365-Integration | Lokales Outlook (nur Desktop) |
|---------|------------------------|------------------------------|
| **Kalendersynchronisierung** | ✅ Ja (über die Office-365-Cloud) | ⚠️ Eingeschränkt (nur Desktop-Client) |
| **E-Mail-Synchronisierung** | ✅ Ja (gesendete E-Mails) | ⚠️ Eingeschränkt |
| **Authentifizierung** | OAuth (sicher, ohne Passwort) | nicht zutreffend |
| **Funktioniert im Web-Client** | ✅ Ja | ❌ Nein (nur Desktop) |
| **Funktioniert mobil** | ✅ Ja | ❌ Nein |
| **Abonnement erforderlich** | Ja (Office 365/M365) | Nein (aber nur Desktop-Client) |

**Empfehlung:** Verwenden Sie die Office-365-Integration für das beste Ergebnis, besonders wenn Sie den Web-Client oder mobile Geräte nutzen.

## Verwandte Funktionen

### Zeiterfassung
- [Zeiterfassungskalender](~/doc/zeiterfassungskalender/kalender.md) - Die zentrale Kalenderoberfläche
- [Arbeiten mit Zeitbuchungen](~/doc/zeiterfassungskalender/arbeiten-mit-zeitbuchungen.md) - Einträge anlegen und bearbeiten
- [Musterbuchungen](~/doc/zeiterfassungskalender/musterbuchungen.md) - Wiederkehrende Einträge automatisieren

### Weitere Integrationen
- [Web API im Überblick](~/doc/web-api/ueberblick.md) - Eigene Integrationen entwickeln
- [Datenimport](~/doc/datenaustausch/import.md) - Aus anderen Systemen importieren
- [Datenexport](~/doc/datenaustausch/export.md) - In andere Werkzeuge exportieren

### Mobil und Zugriff
- [Mobile Nutzung](~/doc/erste-schritte/mobile-zeiterfassung.md) - time cockpit auf Smartphones und Tablets verwenden
- [Web-Client](~/doc/erste-schritte/web-client.md) - Zugriff über den Browser

## Siehe auch

**FAQs:**
- [Anwender-FAQ](~/doc/anwender-faq.md) - Allgemeine Fragen zur Zeiterfassung
- [Mitarbeiter-FAQ](~/doc/mitarbeiter-faq.md) - Fragen zur täglichen Zeiterfassung

**Ressourcen auf der Website:**
- [Integrationsfunktionen](https://www.timecockpit.com/features/integration/) - Überblick über die Integrationen von time cockpit

---

*Unterstützung zur Office-365-Integration erhalten Sie unter [support@timecockpit.com](mailto:support@timecockpit.com) oder in der [Anwender-FAQ](~/doc/anwender-faq.md).*
