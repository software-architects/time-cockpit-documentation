---
title: Für Entwickler
description: Technische Dokumentation zum Anpassen von time cockpit, zum Erstellen von Integrationen und zum Automatisieren von Abläufen.
en_page: doc/for-developers.md
---

# Für Entwickler

Willkommen in der Entwicklerdokumentation von time cockpit! Dieser Bereich enthält alles, was Sie brauchen, um das Datenmodell anzupassen, Integrationen zu erstellen, Abläufe zu automatisieren und die Funktionalität von time cockpit zu erweitern.

## 🚀 Schnellstart

### Neu in der Entwicklung mit time cockpit?

1. **[Entwickler-FAQ](/doc/developer-faq.html)** - Häufige Fragen und kurze Antworten
2. **[Datenmodell: Überblick](/doc/data-model/entity-relationships.html)** - Die Struktur der Entitäten verstehen
3. **[Web API: Überblick](/doc/web-api/overview.html)** - Programmgesteuert auf time cockpit zugreifen
4. **[TCQL: Überblick](/doc/tcql/overview.html)** - Die Abfragesprache lernen

### Beliebte Anwendungsfälle

- [Budgetkontrolle umsetzen](/doc/use-cases/budgetary-control.html)
- [Projektbudgets überwachen](/doc/developer-faq.html#how-can-i-analyze-project-budget-or-profitability-data)
- [JIRA-Integration](/doc/developer-faq.html#how-do-i-access-time-cockpit-from-external-applications)
- [Eigene Workflows automatisieren](/doc/developer-faq.html#how-do-i-implement-approval-or-notification-workflows)

## 📊 Datenmodell

Verstehen Sie die Datenstruktur und die Beziehungen in time cockpit.

### Grundkonzepte
- **[Entitätsbeziehungen](/doc/data-model/entity-relationships.html)** - Visuelle ER-Diagramme für alle Bereiche
  - Bereich Projekte & Rechnungslegung
  - Bereich Zeit & Anwesenheit  
  - Sicherheit & Benutzerverwaltung
  - Stammdaten & Konfiguration

- **[Referenz der Standardentitäten](/doc/data-model/standard-entities.html)** - Vollständige Dokumentation der Entitäten
  - APP_Timesheet, APP_Project, APP_Task
  - Eigenschaften, Beziehungen, Berechtigungen
  - Beispiele für TCQL und Web API

- **[Leitfaden zu Berechtigungen & Sicherheit](/doc/data-model/permissions-guide.html)** - Sicherheitsarchitektur
  - Rollenbasierte Zugriffskontrolle (RBAC)
  - Muster für Sicherheit auf Zeilenebene
  - Named Sets
  - Häufige Berechtigungsszenarien

### Anpassung
- **[Anpassung des Datenmodells: Überblick](/doc/data-model-customization/overview.html)**
- **[Eigene Entitäten anlegen](/doc/data-model-customization/entity.html)**
- **[Eigene Listen](/doc/data-model-customization/list.html)**
- **[Eigene Formulare](/doc/data-model-customization/form.html)**
- **[Berechtigungen konfigurieren](/doc/data-model-customization/permission.html)**
- **[Navigation anpassen](/doc/data-model-customization/navigation.html)**
- **[Dashboards](/doc/data-model-customization/dashboard.html)**
- **[Feature Flags](/doc/data-model-customization/feature-flags.html)**

## 🔍 TCQL - Time Cockpit Query Language

TCQL ist die ausdrucksbasierte Abfragesprache, mit der Sie auf Daten in time cockpit zugreifen und sie bearbeiten.

### Grundlegende Syntax
- **[Überblick](/doc/tcql/overview.html)** - Einführung in TCQL
- **[From-Klausel](/doc/tcql/from-clause.html)** - Auswahl der Datenquelle
- **[Where-Klausel](/doc/tcql/where-clause.html)** - Daten filtern
- **[Select-Klausel](/doc/tcql/select-clause.html)** - Projektionen und Aggregationen
- **[Order-By-Klausel](/doc/tcql/order-by-clause.html)** - Ergebnisse sortieren
- **[Ausdruckssprache](/doc/tcql/expression-language.html)** - Operatoren und Funktionen

### Spezielle Funktionen
- **[Funktionen für Arbeitszeit & Feiertage](/doc/tcql/functions-for-working-time-and-holidays.html)**
  - `:GetWorkTime()` - Arbeitsstunden berechnen
  - `:GetWeeklyHoursOfWork()` - Sollstunden
  - `:BookingCompletionDateOfUser()` - Buchungsabschlussdatum
  - `:FirstOfMonth()`, `:LastOfMonth()` - Datumshilfen

### Fortgeschrittene Themen
- **[TCQL AST API](/doc/tcql/tcql-ast-api.html)** - Abfragen programmgesteuert aufbauen

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

Weitere Beispiele → [Entwickler-FAQ](/doc/developer-faq.html)

## 🔌 Web API

Greifen Sie über die REST/OData-API auf Daten in time cockpit zu.

### API-Dokumentation
- **[Überblick](/doc/web-api/overview.html)** - API-Architektur
- **[Authentifizierung](/doc/web-api/authentication.html)** - OAuth, Bearer-Tokens
- **[OData-Endpunkt](/doc/web-api/odata.html)** - REST-CRUD-Operationen
- **[Query-Endpunkt](/doc/web-api/query.html)** - TCQL über HTTP ausführen
- **[ExecuteList-Endpunkt](/doc/web-api/executelist.html)** - Vordefinierte Listen ausführen
- **[ExecuteAction-Endpunkt](/doc/web-api/executeaction.html)** - Aktionen auslösen
- **[Reporting-Endpunkt](/doc/web-api/reporting.html)** - Berichte erzeugen
- **[Beispielimplementierung](/doc/web-api/timecockpit-client.html)** - Client-Bibliothek

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

Weitere Beispiele → [Web-API-Dokumentation](/doc/web-api/overview.html)

## ⚙️ Scripting & Automatisierung

Automatisieren Sie Abläufe und erweitern Sie die Funktionalität mit Python (IronPython).

### Grundkonzepte
- **[Scripting: Überblick](/doc/scripting/overview.html)** - Einführung in das Scripting
- **[Aktionen](/doc/scripting/actions.html)** - Vom Benutzer ausgelöste Operationen
- **[Trigger](/doc/scripting/triggers.html)** - Ereignisgesteuerte Automatisierung
- **[Skripte automatisieren](/doc/scripting/automating-scripts.html)** - Zeitgesteuerte Ausführung

### Häufige Szenarien

**Anleitungen:**
- [Eine Dateieigenschaft hinzufügen](/doc/scripting/add-file-property.html)
- [Feiertage per Skript hinzufügen](/doc/scripting/add-holidays.html)
- [Daten nach Excel exportieren](/doc/scripting/export-data-to-excel.html)
- [Daten aus CSV importieren](/doc/scripting/import-data-from-csv.html)
- [Aus SQL Server importieren](/doc/scripting/import-data-from-sql-server.html)
- [Das Datenmodell ändern](/doc/scripting/modify-data-model.html)
- [E-Mails bei Budgetüberschreitung senden](/doc/scripting/send-mail-when-over-budget.html)
- [.NET-Framework-Klassen verwenden](/doc/scripting/use-dot-net-classes-in-scripts.html)
- [Mit C# auf die API zugreifen](/doc/scripting/use-c-sharp-to-access-time-cockpit-api.html)
- [XML in Skripten verwenden](/doc/scripting/use-xml-in-scripts.html)

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

Weitere Beispiele → [Scripting-Anleitungen](/doc/scripting/overview.html)

## 📈 Berichte

Erstellen Sie eigene Berichte und Datenvisualisierungen.

- **[Überblick](/doc/reporting/overview.html)** - Architektur der Berichte
- **[Standard-Druckansicht](/doc/reporting/standard-print-view.html)** - Integrierte Vorlagen
- **[Eigene Berichte](/doc/reporting/custom-reports.html)** - Selbst erstellen
- **[Integrierte Berichte](/doc/reporting/built-in-reports.html)** - Verfügbare Berichte

## 💡 Anwendungsfälle & Beispiele

Umsetzungsbeispiele aus der Praxis:

- **[Budgetkontrolle](/doc/use-cases/budgetary-control.html)** - Überwachung von Projektbudgets mit berechneten Kennzahlen
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
→ [Beispiel für eine JIRA-Integration](/doc/developer-faq.html#how-do-i-access-time-cockpit-from-external-applications)

**2. Buchhaltungssysteme (DATEV, SAP)**
- Rechnungen und verrechenbare Stunden exportieren
- Stammdaten zu Kunden/Projekten importieren
→ [Datenexport](/doc/data-exchange/export.html)

**3. HR-Systeme**
- Mitarbeiterstammdaten synchronisieren
- Arbeitszeit für die Lohnverrechnung exportieren
→ [Datenimport/-export](/doc/data-exchange/import.html)

**4. Eigene Dashboards (Power BI, Tableau)**
- Zeitbuchungsdaten über OData abfragen
- Echtzeit-Dashboards erstellen
→ [OData-Endpunkt](/doc/web-api/odata.html)

## 🔐 Sicherheit für Entwickler

- **[Leitfaden zu Berechtigungen](/doc/data-model/permissions-guide.html)** - Eigene Sicherheitslogik umsetzen
- **[Migration der Standardberechtigungen](/doc/migration-guides/default-permissions.html)** - Das neue Sicherheitsmodell aktivieren
- **[AAD-Integration](/doc/enterprise/aad.html)** - Authentifizierung für Unternehmen

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
- **[Entwickler-FAQ](/doc/developer-faq.html)** - Kurze Antworten auf häufige Fragen
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
