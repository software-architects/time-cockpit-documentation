---
title: KI-Assistenten - Dashboards und Visualisierungen
description: "Prompts für HTML-, Excel- und Markdown-Dashboards aus time cockpit Daten mit KI-Assistenten: Projektportfolio, Controlling, Auslastung, Abwesenheiten."
en_page: doc/ai-assistants/dashboards.md
---
# Dashboards und Visualisierungen

Der MCP-Server liefert Daten, keine Grafiken. Das Dashboard erstellt der KI-Client (Claude, Codex, Copilot) aus den Abfrageergebnissen: als eigenständige HTML-Datei mit eingebetteten Diagrammen, als Excel-Arbeitsmappe mit Diagrammen, als Markdown-Bericht oder – mit Claude – als wiederverwendbares Artefakt.

Bewährte Regeln:

- Aggregieren Sie auf dem Server mit TCQL (Summen, Gruppierungen), statt Rohdaten in den Client zu laden.
- Schreiben Sie Datenstand, Zeitraum und Filter immer sichtbar in das Dashboard.
- Zeigen Sie die Hinweise des Servers auf abgeschnittene Ergebnisse als Warnungen an.
- Dashboards sind Momentaufnahmen. Führen Sie den Prompt für aktuelle Daten erneut aus oder richten Sie ihn in Ihrem Assistenten als geplante Aufgabe ein.

Ersetzen Sie die Platzhalter in geschweiften Klammern durch Ihre Werte.

## Dashboard für das Projektportfolio (HTML)

*Verwendete Daten:* Projekte, Zeitbuchungen, Liste Budgetary Control of Projects, TCQL → HTML-Datei

> Erstelle ein Projektportfolio-Dashboard für alle offenen Projekte als einzelne HTML-Datei. Lade die Daten über den MCP-Server von time cockpit: pro Projekt die Budgetstunden, die gebuchten Stunden im Zeitraum {FROM} bis {TO}, die verrechenbaren Stunden und das Restbudget, aggregiert mit TCQL. Zeige oben KPI-Kacheln (Anzahl der Projekte, Gesamtbudget, gesamt gebucht, Anzahl der Projekte mit mehr als 80 % Verbrauch), darunter ein horizontales Balkendiagramm des Budgetverbrauchs pro Projekt in Ampelfarben (grün < 80 %, gelb 80–100 %, rot > 100 %) und eine sortierbare Tabelle. Schreibe Datenstand, Zeitraum und Filter in die Kopfzeile. Verwende nur Standardentitäten und weise im Dashboard auf abgeschnittene Ergebnisse hin.

## Controlling-Dashboard als Excel mit Diagrammen

*Verwendete Daten:* Zeitbuchungen, Kunden, Projekte, Rechnungen, TCQL → Excel

> Erstelle eine Excel-Arbeitsmappe als Controlling-Dashboard für {MONTH}. Blatt „Übersicht“: KPI-Zellen (gebuchte Stunden, verrechenbare Stunden, Umsatz, nicht verrechnete Stunden, Anzahl der Rechnungen), ein Säulendiagramm des Umsatzes pro Kunde und ein Kreisdiagramm verrechenbar vs. nicht verrechenbar. Blatt „Daten“: die aggregierten Werte pro Kunde und Projekt, auf die sich die Diagramme beziehen. Blatt „Quelle“: Zeitraum, Filter, verwendete Entitäten und Abfragen, Datenstand. Hole die Daten aggregiert mit TCQL vom MCP-Server von time cockpit; erkläre, dass die Umsätze berechnete Werte der Zeitbuchungen sind und keine verrechneten Beträge.

## Heatmap der Teamauslastung

*Verwendete Daten:* Zeitbuchungen, Benutzer, Arbeitszeitgrenzen, Urlaub, Krankenstände, TCQL → HTML

> Erstelle eine Heatmap der Auslastung meiner Abteilung von {FROM} bis {TO}: Zeilen = Mitarbeiter, Spalten = Kalenderwochen, Zellfarbe = gebuchte Stunden im Verhältnis zur geplanten Wochenarbeitszeit (unter 70 % blau, 70–110 % grün, über 110 % rot). Markiere Wochen mit genehmigtem Urlaub oder Krankenstand grau. Liefere das Ergebnis als HTML-Datei mit Legende, einem Tooltip pro Zelle (Stunden, Soll, Abwesenheiten) und einer Zusammenfassung der drei höchsten und niedrigsten Auslastungen. Aggregiere pro Mitarbeiter und Woche auf dem Server mit TCQL.

## Persönliches Wochen-Dashboard

*Verwendete Daten:* aktueller Benutzer, Zeitbuchungen, Projekte, Aufgaben → Markdown oder HTML

> Erstelle mein persönliches Dashboard für die Kalenderwoche {WEEK}: tägliche Balken der gebuchten Stunden im Vergleich zu meinem Tagessoll, Verteilung der Stunden nach Projekt als Ringdiagramm, Anteil der verrechenbaren Stunden, eine Liste der Tage mit Lücken oder unter dem Soll und die fünf größten Einträge. Verwende nur meine eigenen Zeitbuchungen, keine anderer Personen. Gib das Dashboard als HTML-Datei aus, dazu eine dreizeilige Textzusammenfassung, die ich im Team-Chat posten kann.

## Budgetampel als wiederkehrender Bericht

*Verwendete Daten:* Liste Budgetary Control of Projects, Liste Budgetary Control of Tasks → Markdown, geplante Aufgabe

> Erstelle eine Budgetampel für alle offenen Projekte und Aufgaben: eine Tabelle mit Projekt, Aufgabe, Budget, gebucht, Verbrauch in Prozent und Ampelstatus, absteigend nach Verbrauch sortiert, darüber die Anzahl der grünen, gelben und roten Einträge. Verwende bevorzugt die Standardlisten. Formuliere den Bericht so, dass er unverändert als wöchentliche geplante Aufgabe wiederholt werden kann: Nenne den Datenstand, hebe Änderungen gegenüber dem vorherigen Lauf hervor, wenn ich den letzten Bericht anhänge, und nimm keine Änderungen an Daten vor.

## Abwesenheitskalender der Abteilung

*Verwendete Daten:* Urlaub, Krankenstände, Zeitausgleich, Benutzer, Abteilungen → HTML

> Erstelle einen Abwesenheitskalender meiner Abteilung für {MONTH} als HTML-Datei: Zeilen = Mitarbeiter, Spalten = Kalendertage, farbige Blöcke für Urlaub, Krankenstand und Zeitausgleich, offene Anträge schraffiert oder umrandet. Zeige darunter die Tage mit den meisten gleichzeitigen Abwesenheiten und eine Liste der noch nicht genehmigten Anträge. Verwende nur Mitarbeiter meiner Abteilung und ändere keine Daten.

## Kundencockpit

*Verwendete Daten:* Kunden, Projekte, Zeitbuchungen, Rechnungen, TCQL → HTML

> Erstelle ein Kundencockpit für den Kunden {CUSTOMER_CODE} als HTML-Datei für die letzten zwölf Monate: monatliche Stunden und Umsatz als Kombinationsdiagramm (Säulen für Stunden, Linie für Umsatz), Verteilung auf Projekte, Anteil der verrechenbaren Stunden, offene und bezahlte Rechnungen und die fünf aktivsten Mitarbeiter für diesen Kunden. Aggregiere pro Monat mit TCQL, markiere unvollständige Monate und schreibe Datenstand und Filter in die Kopfzeile. Nur Standardentitäten.

## Interaktives Dashboard als Claude-Artefakt

*Verwendete Daten:* TCQL-Aggregate → Claude-Artefakt (HTML mit eingebetteten Daten)

> Erstelle aus den time cockpit Daten von {FROM} bis {TO} ein interaktives Dashboard als Artefakt: Filter nach Kunde und Projekt, ein Umschalter zwischen Stunden und Umsatz, Diagramme und Tabelle, die auf die Filter reagieren. Bette die aggregierten Daten (pro Kunde, Projekt, Monat) direkt in die Seite ein, damit sie ohne Serververbindung funktioniert, und zeige den Datenstand gut sichtbar an. Hole die Daten mit möglichst wenigen TCQL-Abfragen und melde, wenn der Server Ergebnisse abgeschnitten hat.

## Verwandte Seiten

- [KI-Assistenten: Überblick](~/doc/ki-assistenten/ueberblick.md)
- [Anwendungsfälle und Prompts](~/doc/ki-assistenten/anwendungsfaelle-und-prompts.md)
- [Berichte: Überblick](~/doc/berichte/ueberblick.md) – integrierte Berichte ohne KI-Assistent
