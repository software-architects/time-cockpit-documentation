---
title: Entwickler-FAQ - Häufige Fragen
description: Häufige Fragen von Entwicklern zu Datenmodell, Abfragen, Web API, Berichten und Automatisierung in time cockpit.
faq: true
en_page: doc/developer-faq.md
---

# Entwickler-FAQ

Diese Seite beantwortet häufige technische Fragen zur Anpassung und Integration von time cockpit.

> [!NOTE]
> Die Beispiele und Verweise in dieser FAQ sind als Ausgangspunkt gedacht. Prüfen Sie eigene Skripte, Abfragen und Integrationen immer in einer Entwicklungsumgebung, bevor Sie sie produktiv einsetzen.

## Datenmodell und Listen

### Wo beginne ich, wenn ich das Standarddatenmodell verstehen möchte?

Beginnen Sie mit diesen Seiten:

- [Beziehungen zwischen Entitäten](~/doc/datenmodell/entitaetsbeziehungen.md)
- [Referenz der Standardentitäten](~/doc/datenmodell/standardentitaeten.md)
- [Anpassung des Datenmodells: Überblick](~/doc/datenmodell-anpassung/ueberblick.md)

### Wie lege ich eigene Felder, Entitäten, Listen oder Formulare an?

Verwenden Sie die Dokumentation zur Anpassung des Datenmodells:

- [Entitäten](~/doc/datenmodell-anpassung/entitaet.md)
- [Listen](~/doc/datenmodell-anpassung/liste.md)
- [Formulare](~/doc/datenmodell-anpassung/formular.md)
- [Navigation](~/doc/datenmodell-anpassung/navigation.md)
- [Berechtigungen](~/doc/datenmodell-anpassung/berechtigung.md)

## Abfragen und Berechnungen

### Wie frage ich Daten aus time cockpit ab?

Verwenden Sie TCQL für Abfragen innerhalb von time cockpit und den Query-Endpunkt, wenn Sie TCQL über die Web API ausführen möchten.

Beginnen Sie hier:

- [TCQL: Überblick](~/doc/tcql/ueberblick.md)
- [From-Klausel](~/doc/tcql/from-klausel.md)
- [Where-Klausel](~/doc/tcql/where-klausel.md)
- [Select-Klausel](~/doc/tcql/select-klausel.md)
- [Ausdruckssprache](~/doc/tcql/ausdruckssprache.md)

### Wie arbeite ich mit Berechnungen für Überstunden, Arbeitszeit oder Feiertage?

Verwenden Sie die integrierten Arbeitszeitfunktionen und die vorhandenen Entitäten der Anwesenheitszeiterfassung als Referenz.

Siehe:

- [Funktionen für Arbeitszeit und Feiertage](~/doc/tcql/funktionen-fuer-arbeitszeit-und-feiertage.md)
- [Arbeitszeit](~/doc/arbeitszeiterfassung/arbeitszeit.md)
- [Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md)

### Wie werte ich Projektbudgets oder Rentabilität aus?

Verwenden Sie die Standardimplementierung der Budgetkontrolle und die zugehörigen Entitäten als Ausgangspunkt.

Siehe:

- [Implementierung der Budgetkontrolle](~/doc/anwendungsfaelle/budgetkontrolle.md)
- [Kunde / Projekt / Tätigkeit](~/doc/projektzeiterfassung/kunde-projekt-taetigkeit.md)
- [Rechnungslegung](~/doc/projektzeiterfassung/rechnungslegung.md)

## Web API und Integrationen

### Wie greife ich aus externen Anwendungen auf time cockpit zu?

Verwenden Sie die Web API.

Beginnen Sie mit:

- [Web API: Überblick](~/doc/web-api/ueberblick.md)
- [Authentifizierung](~/doc/web-api/authentifizierung.md)
- [OData-Endpunkt](~/doc/web-api/odata-endpunkt.md)
- [Query-Endpunkt](~/doc/web-api/query-endpunkt.md)
- [ExecuteAction-Endpunkt](~/doc/web-api/executeaction-endpunkt.md)

### Soll ich OData oder den Query-Endpunkt verwenden?

Verwenden Sie:

- `OData` für den Standardzugriff auf Entitäten im CRUD-Stil
- `Query`, wenn Sie TCQL, Aggregationen oder komplexere Projektionen benötigen

### Wie exportiere ich Daten für externe Systeme oder Berichtswerkzeuge?

Je nach Szenario verwenden Sie:

- [Datenexport](~/doc/datenaustausch/export.md)
- [OData-Endpunkt](~/doc/web-api/odata-endpunkt.md)
- [Query-Endpunkt](~/doc/web-api/query-endpunkt.md)

## Automatisierung und Scripting

### Wie automatisiere ich Abläufe in time cockpit?

Die Standardoptionen sind:

- [Aktionen](~/doc/scripting/aktionen.md) für Logik, die ein Benutzer auslöst
- [Trigger](~/doc/scripting/trigger.md) für Logik beim Speichern
- [Skripte automatisieren](~/doc/scripting/skripte-automatisieren.md) für geplante oder wiederholte Ausführung

### Wie setze ich Genehmigungs- oder Benachrichtigungsabläufe um?

Genehmigungsworkflows werden in der Regel mit einer Kombination aus folgenden Bausteinen umgesetzt:

- Entitätsfelder für Status und Angaben zur genehmigenden Person
- Trigger für Automatisierung und Benachrichtigungen
- Aktionen für die Schritte Genehmigen und Ablehnen
- Berechtigungen, die steuern, wer den Ablauf sehen oder ausführen darf

Siehe:

- [Trigger](~/doc/scripting/trigger.md)
- [Aktionen](~/doc/scripting/aktionen.md)
- [Genehmigungsworkflows](~/doc/arbeitszeiterfassung/genehmigungsworkflows.md)
- [Berechtigungen](~/doc/datenmodell-anpassung/berechtigung.md)

## Berichte

### Wie funktionieren eigene Berichte in time cockpit?

Eigene Berichte basieren auf SSRS und setzen in der Regel auf einer Liste in time cockpit auf.

Siehe:

- [Berichte: Überblick](~/doc/berichte/ueberblick.md)
- [Eigene Berichte](~/doc/berichte/benutzerdefinierte-berichte.md)
- [Standard-Druckansicht](~/doc/berichte/standard-druckansicht.md)

### Kann ich mehrere Quellen in einem Bericht kombinieren?

Im Standardablauf für Berichte nicht direkt. Ein üblicher Ansatz ist, die Daten zuerst in einer eigenen Liste aufzubereiten und den Bericht auf dieser Liste aufzubauen.

## Sicherheit und Berechtigungen

### Wie schränke ich den Zugriff auf Daten nach Rolle oder Abteilung ein?

Verwenden Sie Entitätsberechtigungen, Rollenzuordnungen und bei Bedarf Named Sets oder ähnliche Muster auf Zeilenebene im Datenmodell.

Siehe:

- [Leitfaden zu Berechtigungen und Sicherheit](~/doc/datenmodell/berechtigungen-und-sicherheit.md)
- [Standardberechtigungen](~/doc/arbeitszeiterfassung/standardberechtigungen.md)
- [Navigation, Zugriffsrechte und Menüstruktur](~/doc/navigation-und-zugriffsrechte.md)

### Wie migriere ich auf das neuere Modell der Standardberechtigungen?

Siehe:

- [Migrationsleitfaden Standardberechtigungen](~/doc/migrationsleitfaeden/standardberechtigungen.md)
- [Standardberechtigungen](~/doc/arbeitszeiterfassung/standardberechtigungen.md)

## Beispiele und weiterführende Informationen

### Wo finde ich praktische Beispiele?

Nützliche Ausgangspunkte:

- [Implementierung der Budgetkontrolle](~/doc/anwendungsfaelle/budgetkontrolle.md)
- [Scripting: Überblick](~/doc/scripting/ueberblick.md)
- [Mit C# auf die time cockpit API zugreifen](~/doc/scripting/mit-csharp-auf-die-api-zugreifen.md)
- [Daten aus CSV importieren](~/doc/scripting/daten-aus-csv-importieren.md)
- [Daten nach Microsoft Excel exportieren](~/doc/scripting/daten-nach-excel-exportieren.md)

## Brauchen Sie mehr Hilfe?

Wenn Sie Abläufe für Anwender statt technischer Anpassungen suchen, lesen Sie weiter unter [Für Anwender](~/doc/fuer-anwender.md).
