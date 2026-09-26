---
title: Für Entwickler
description: Technische Dokumentation zum Anpassen von time cockpit, zum Erstellen von Integrationen und zum Automatisieren von Abläufen.
en_page: doc/for-developers.md
---

# Für Entwickler

Willkommen in der Entwicklerdokumentation von time cockpit! Dieser Bereich enthält alles, was Sie brauchen, um das Datenmodell anzupassen, Integrationen zu erstellen, Abläufe zu automatisieren und die Funktionalität von time cockpit zu erweitern.

## 🚀 Schnellstart

### Neu in der Entwicklung mit time cockpit?

1. **[Entwickler-FAQ](~/doc/entwickler-faq.md)** - Häufige Fragen und kurze Antworten
2. **[Datenmodell: Überblick](~/doc/datenmodell/entitaetsbeziehungen.md)** - Die Struktur der Entitäten verstehen
3. **[Web API: Überblick](~/doc/web-api/ueberblick.md)** - Programmgesteuert auf time cockpit zugreifen
4. **[TCQL: Überblick](~/doc/tcql/ueberblick.md)** - Die Abfragesprache lernen

### Beliebte Anwendungsfälle

- [Budgetkontrolle umsetzen](~/doc/anwendungsfaelle/budgetkontrolle.md)
- [Projektbudgets überwachen](~/doc/entwickler-faq.md#wie-werte-ich-projektbudgets-oder-rentabilität-aus)
- [JIRA-Integration](~/doc/entwickler-faq.md#wie-greife-ich-aus-externen-anwendungen-auf-time-cockpit-zu)
- [Eigene Workflows automatisieren](~/doc/entwickler-faq.md#wie-setze-ich-genehmigungs--oder-benachrichtigungsabläufe-um)

## 📊 Datenmodell

Verstehen Sie die Datenstruktur und die Beziehungen in time cockpit.

### Grundkonzepte
- **[Entitätsbeziehungen](~/doc/datenmodell/entitaetsbeziehungen.md)** - Visuelle ER-Diagramme für alle Bereiche
  - Bereich Projekte & Rechnungslegung
  - Bereich Zeit & Anwesenheit  
  - Sicherheit & Benutzerverwaltung
  - Stammdaten & Konfiguration

- **[Referenz der Standardentitäten](~/doc/datenmodell/standardentitaeten.md)** - Vollständige Dokumentation der Entitäten
  - APP_Timesheet, APP_Project, APP_Task
  - Eigenschaften, Beziehungen, Berechtigungen
  - Beispiele für TCQL und Web API

- **[Leitfaden zu Berechtigungen & Sicherheit](~/doc/datenmodell/berechtigungen-und-sicherheit.md)** - Sicherheitsarchitektur
  - Rollenbasierte Zugriffskontrolle (RBAC)
  - Muster für Sicherheit auf Zeilenebene
  - Named Sets
  - Häufige Berechtigungsszenarien

### Anpassung
- **[Anpassung des Datenmodells: Überblick](~/doc/datenmodell-anpassung/ueberblick.md)**
- **[Eigene Entitäten anlegen](~/doc/datenmodell-anpassung/entitaet.md)**
- **[Eigene Listen](~/doc/datenmodell-anpassung/liste.md)**
- **[Eigene Formulare](~/doc/datenmodell-anpassung/formular.md)**
- **[Berechtigungen konfigurieren](~/doc/datenmodell-anpassung/berechtigung.md)**
- **[Navigation anpassen](~/doc/datenmodell-anpassung/navigation.md)**
- **[Dashboards](~/doc/datenmodell-anpassung/dashboard.md)**
- **[Feature Flags](~/doc/datenmodell-anpassung/feature-flags.md)**

## 🔍 TCQL - Time Cockpit Query Language

TCQL ist die ausdrucksbasierte Abfragesprache, mit der Sie auf Daten in time cockpit zugreifen und sie bearbeiten.

### Grundlegende Syntax
- **[Überblick](~/doc/tcql/ueberblick.md)** - Einführung in TCQL
- **[From-Klausel](~/doc/tcql/from-klausel.md)** - Auswahl der Datenquelle
- **[Where-Klausel](~/doc/tcql/where-klausel.md)** - Daten filtern
- **[Select-Klausel](~/doc/tcql/select-klausel.md)** - Projektionen und Aggregationen
- **[Order-By-Klausel](~/doc/tcql/order-by-klausel.md)** - Ergebnisse sortieren
- **[Ausdruckssprache](~/doc/tcql/ausdruckssprache.md)** - Operatoren und Funktionen

### Spezielle Funktionen
- **[Funktionen für Arbeitszeit & Feiertage](~/doc/tcql/funktionen-fuer-arbeitszeit-und-feiertage.md)**
  - `:GetWorkTime()` - Arbeitsstunden berechnen
  - `:GetWeeklyHoursOfWork()` - Sollstunden
  - `:BookingCompletionDateOfUser()` - Buchungsabschlussdatum
  - `:FirstOfMonth()`, `:LastOfMonth()` - Datumshilfen

### Fortgeschrittene Themen
- **[TCQL AST API](~/doc/tcql/tcql-ast-api.md)** - Abfragen programmgesteuert aufbauen

### Beispielabfragen

**Nicht verrechnete Stunden pro Projekt ermitteln:**
```tcql
From T In APP_Timesheet
Where T.APP_Billable = True And T.APP_Billed = False
Select New With {
    .ProjectCode = T.APP_Project.APP_Code,
    .TotalHours = Sum(T.APP_DurationInHours),
    .Revenue = Sum(T.APP_Revenue)
}
```

**Zeitbuchungen in der falschen Abteilung finden:**
```tcql
From T In APP_Timesheet
Where 
    T.APP_Project <> Null And
    T.APP_UserDetail.APP_Department <> T.APP_Project.APP_Customer.APP_Department
Select T
```

Weitere Beispiele → [Entwickler-FAQ](~/doc/entwickler-faq.md)

## 🔌 Web API

Greifen Sie über die REST/OData-API auf Daten in time cockpit zu.

### API-Dokumentation
- **[Überblick](~/doc/web-api/ueberblick.md)** - API-Architektur
- **[Authentifizierung](~/doc/web-api/authentifizierung.md)** - OAuth, Bearer-Tokens
- **[OData-Endpunkt](~/doc/web-api/odata-endpunkt.md)** - REST-CRUD-Operationen
- **[Query-Endpunkt](~/doc/web-api/query-endpunkt.md)** - TCQL über HTTP ausführen
- **[ExecuteList-Endpunkt](~/doc/web-api/executelist-endpunkt.md)** - Vordefinierte Listen ausführen
- **[ExecuteAction-Endpunkt](~/doc/web-api/executeaction-endpunkt.md)** - Aktionen auslösen
- **[Reporting-Endpunkt](~/doc/web-api/reporting-endpunkt.md)** - Berichte erzeugen
- **[Beispielimplementierung](~/doc/web-api/timecockpit-client.md)** - Client-Bibliothek

### Kurze Beispiele

**Zeitbuchungen des aktuellen Benutzers abrufen:**
```http
GET https://api.timecockpit.com/odata/APP_Timesheet
  ?$filter=APP_UserDetailUuid eq current-user-uuid
  &$expand=APP_Project,APP_Task
  &$orderby=APP_BeginTime desc
  &$top=50
```

**Eine Zeitbuchung anlegen:**
```http
POST https://api.timecockpit.com/odata/APP_Timesheet
Content-Type: application/json

{
  "APP_BeginTime": "2026-02-09T09:00:00Z",
  "APP_EndTime": "2026-02-09T12:30:00Z",
  "APP_Description": "Development work",
  "APP_ProjectUuid": "...",
  "APP_UserDetailUuid": "..."
}
```

**TCQL-Abfrage ausführen:**
```http
POST https://api.timecockpit.com/query
Content-Type: application/json

{
  "query": "From T In APP_Timesheet Where T.APP_BeginTime >= @StartDate Select T",
  "parameters": {
    "@StartDate": "2026-02-01T00:00:00Z"
  }
}
```

Weitere Beispiele → [Web-API-Dokumentation](~/doc/web-api/ueberblick.md)

## ⚙️ Scripting & Automatisierung

Automatisieren Sie Abläufe und erweitern Sie die Funktionalität mit Python (IronPython).

### Grundkonzepte
- **[Scripting: Überblick](~/doc/scripting/ueberblick.md)** - Einführung in das Scripting
- **[Aktionen](~/doc/scripting/aktionen.md)** - Vom Benutzer ausgelöste Operationen
- **[Trigger](~/doc/scripting/trigger.md)** - Ereignisgesteuerte Automatisierung
- **[Skripte automatisieren](~/doc/scripting/skripte-automatisieren.md)** - Zeitgesteuerte Ausführung

### Häufige Szenarien

**Anleitungen:**
- [Eine Dateieigenschaft hinzufügen](~/doc/scripting/dateieigenschaft-hinzufuegen.md)
- [Feiertage per Skript hinzufügen](~/doc/scripting/feiertage-per-skript-hinzufuegen.md)
- [Daten nach Excel exportieren](~/doc/scripting/daten-nach-excel-exportieren.md)
- [Daten aus CSV importieren](~/doc/scripting/daten-aus-csv-importieren.md)
- [Aus SQL Server importieren](~/doc/scripting/daten-aus-sql-server-importieren.md)
- [Das Datenmodell ändern](~/doc/scripting/datenmodell-aendern.md)
- [E-Mails bei Budgetüberschreitung senden](~/doc/scripting/e-mail-bei-budgetueberschreitung-senden.md)
- [.NET-Framework-Klassen verwenden](~/doc/scripting/dotnet-framework-klassen-in-skripten-verwenden.md)
- [Mit C# auf die API zugreifen](~/doc/scripting/mit-csharp-auf-die-api-zugreifen.md)
- [XML in Skripten verwenden](~/doc/scripting/xml-in-skripten-verwenden.md)

### Beispiel: Urlaub automatisch genehmigen

```python
def approveVacationTrigger(actionContext):
    dc = actionContext.DataContext
    vacation = actionContext.InputSet.First()
    
    # Auto-approve if less than 1 day
    if vacation.APP_BeginTime == vacation.APP_EndTime:
        vacation.APP_ApprovedTimestampUtc = DateTime.UtcNow
        vacation.APP_Approver = dc.Environment.CurrentUser
        dc.SaveObject(vacation)
```

Weitere Beispiele → [Scripting-Anleitungen](~/doc/scripting/ueberblick.md)

## 📈 Berichte

Erstellen Sie eigene Berichte und Datenvisualisierungen.

- **[Überblick](~/doc/berichte/ueberblick.md)** - Architektur der Berichte
- **[Standard-Druckansicht](~/doc/berichte/standard-druckansicht.md)** - Integrierte Vorlagen
- **[Eigene Berichte](~/doc/berichte/benutzerdefinierte-berichte.md)** - Selbst erstellen
- **[Integrierte Berichte](~/doc/berichte/integrierte-berichte.md)** - Verfügbare Berichte

## 💡 Anwendungsfälle & Beispiele

Umsetzungsbeispiele aus der Praxis:

- **[Budgetkontrolle](~/doc/anwendungsfaelle/budgetkontrolle.md)** - Überwachung von Projektbudgets mit berechneten Kennzahlen
  - Gebuchte vs. budgetierte Stunden
  - Analyse von Umsatz vs. Kosten
  - Effektive Stundensätze
  - Listenimplementierung auf Python-Basis

Weitere Anwendungsfälle folgen in Kürze!

## 📦 Integrationsmuster

### Häufige Integrationsszenarien

**1. Externes Projektmanagement (JIRA, Azure DevOps)**
- Projekte/Tätigkeiten nach time cockpit synchronisieren
- Zeitbuchungen an das externe System zurückspielen
→ [Beispiel für eine JIRA-Integration](~/doc/entwickler-faq.md#wie-greife-ich-aus-externen-anwendungen-auf-time-cockpit-zu)

**2. Buchhaltungssysteme (DATEV, SAP)**
- Rechnungen und verrechenbare Stunden exportieren
- Stammdaten zu Kunden/Projekten importieren
→ [Datenexport](~/doc/datenaustausch/export.md)

**3. HR-Systeme**
- Mitarbeiterstammdaten synchronisieren
- Arbeitszeit für die Lohnverrechnung exportieren
→ [Datenimport/-export](~/doc/datenaustausch/import.md)

**4. Eigene Dashboards (Power BI, Tableau)**
- Zeitbuchungsdaten über OData abfragen
- Echtzeit-Dashboards erstellen
→ [OData-Endpunkt](~/doc/web-api/odata-endpunkt.md)

## 🔐 Sicherheit für Entwickler

- **[Leitfaden zu Berechtigungen](~/doc/datenmodell/berechtigungen-und-sicherheit.md)** - Eigene Sicherheitslogik umsetzen
- **[Migration der Standardberechtigungen](~/doc/migrationsleitfaeden/standardberechtigungen.md)** - Das neue Sicherheitsmodell aktivieren
- **[AAD-Integration](~/doc/enterprise/azure-active-directory.md)** - Authentifizierung für Unternehmen

## 🛠️ Entwicklungswerkzeuge

### Änderungen testen

**TCQL-Konsole**: Abfragen interaktiv im Web-Client testen
**Skript-Debugger**: Im Vollclient für die Skriptentwicklung verfügbar
**API-Tests**: Postman oder ähnliche Werkzeuge mit Bearer-Authentifizierung verwenden

### Best Practices

1. **Berechtigungen immer testen** - Prüfen Sie, dass Benutzer nicht auf Daten ohne Berechtigung zugreifen können
2. **Transaktionen verwenden** - Fassen Sie mehrstufige Operationen in `BeginTransaction()/CommitTransaction()` ein
3. **Fehler sauber behandeln** - Verwenden Sie try/catch-Blöcke in Skripten
4. **Eigenen Code dokumentieren** - Erklären Sie die Geschäftslogik in Kommentaren
5. **Versionsverwaltung** - Exportieren Sie Änderungen am Datenmodell regelmäßig

## 📞 Hilfe erhalten

### Ressourcen
- **[Entwickler-FAQ](~/doc/entwickler-faq.md)** - Kurze Antworten auf häufige Fragen
- **Release Notes** - Bleiben Sie über Änderungen an der API auf dem Laufenden
- **Support** - Wenden Sie sich für technische Unterstützung an den time cockpit Support

### Community
- Eigene Skripte und Lösungen teilen
- Von den Umsetzungen anderer lernen
- Anwendungsfälle und Beispiele beitragen

---

## Suchen Sie die Anwenderdokumentation?

Wenn Sie Informationen suchen, wie Sie time cockpit als Anwender verwenden:
→ **[Für Anwender](~/doc/fuer-anwender.md)**
