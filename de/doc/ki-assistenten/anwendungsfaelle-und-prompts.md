---
title: KI-Assistenten - Anwendungsfälle und Prompts nach Rolle
description: "Fertige Prompts für Projektleiter, Controller, HR-Administratoren, Zeiterfassungsbenutzer und Abteilungsleiter, die time cockpit mit KI nutzen."
en_page: doc/ai-assistants/use-cases-and-prompts.md
---
# Anwendungsfälle und Prompts nach Rolle

Alle Beispiele verwenden ausschließlich Standardentitäten, Standardfelder und Standard-Tools des MCP-Servers. Ersetzen Sie die Platzhalter in geschweiften Klammern (`{FROM}`, `{TO}`, `{PROJECT_CODE}`, …) durch Ihre Werte.

Die Prompts sind so formuliert, dass sie unverändert in jedem konfigurierten Assistenten funktionieren (Claude Code, Claude App, Codex, VS Code, Copilot). Sie halten sich an die Leitplanken des Servers: zuerst die verfügbaren Felder prüfen, auf abgeschnittene Ergebnisse hinweisen und schreibende Aktionen erst nach Ihrer ausdrücklichen Bestätigung ausführen.

Die Zeile *Verwendete Daten* nennt die Entitäten, Listen oder Tools von time cockpit, auf die der Assistent typischerweise zugreift; Sie müssen sie im Prompt nicht erwähnen.

## Projektleiter

### Projektbudget im Vergleich zu den Ist-Stunden

*Verwendete Daten:* Projekte, Zeitbuchungen, Liste Budgetary Control of Projects, TCQL

> Vergleiche das Budget mit den tatsächlich gebuchten Stunden aller meiner Projekte im Zeitraum {FROM} bis {TO}. Gruppiere nach Projekt und zeige Projektcode, Projektname, Budgetstunden, gebuchte Stunden, Restbudget und Verbrauch in Prozent. Verwende nur Standardentitäten und prüfe zuerst die verfügbaren Felder. Weise auf abgeschnittene Ergebnisse oder fehlende Budgets hin.

### Projektstatus und offene Aufgaben

*Verwendete Daten:* Projekte, Aufgaben, Standardlisten für Projekte und Aufgaben

> Analysiere meine Projekte und zeige offene und abgeschlossene Aufgaben pro Projekt. Gib Projektcode, Projektname, Aufgabencode, Aufgabenbeschreibung, Aufgabenbudget und Status aus. Sortiere zuerst nach Projekt, dann nach Aufgabenstatus. Verwende nur Standardfelder.

### Projektstunden pro Mitarbeiter

*Verwendete Daten:* Zeitbuchungen, Benutzer, Projekte, TCQL

> Erstelle eine Übersicht der gebuchten Stunden pro Mitarbeiter für das Projekt {PROJECT_CODE} im Zeitraum {FROM} bis {TO}. Zeige Mitarbeiter, Anzahl der Einträge, gebuchte Stunden und verrechenbare Stunden. Verwende die Dauer in Stunden und weise darauf hin, wenn das Ergebnis unvollständig ist.

### Projekte mit kritischem Budgetverbrauch

*Verwendete Daten:* Projekte, Zeitbuchungen, Liste Budgetary Control of Projects

> Finde alle offenen Projekte, deren gebuchte Stunden mindestens 80 Prozent des Projektbudgets erreichen oder es überschreiten. Zeige Projektcode, Projektname, Budget, gebuchte Stunden, Verbrauch in Prozent und Restbudget. Sortiere nach dem höchsten Verbrauch.

### Ein Projekt kontrolliert abschließen

*Verwendete Daten:* Projekte, Tool zum Aktualisieren

> Suche das Projekt {PROJECT_CODE} und zeige mir zuerst den aktuellen Status, das Enddatum und die wichtigsten Projektdaten. Schlage vor, das Projekt abzuschließen, indem es auf abgeschlossen gesetzt und optional das Enddatum auf {END_DATE} gesetzt wird. Ändere noch nichts und bitte mich ausdrücklich um Bestätigung, bevor du die Änderung vornimmst.

## Projektcontroller

### Nicht verrechnete Zeitbuchungen

*Verwendete Daten:* Liste Unbilled Timesheets, Zeitbuchungen

> Ermittle alle nicht verrechneten Zeitbuchungen von {FROM} bis {TO}. Gruppiere sie nach Kunde und Projekt und zeige Mitarbeiter, Datum, Aufgabe, Stunden, Verrechenbarkeit und Rechnungsstatus. Verwende bevorzugt die vorhandene Standardliste und gib an, welche Datenquelle du verwendet hast.

### Budgetkontrolle für Projekte und Aufgaben

*Verwendete Daten:* Liste Budgetary Control of Projects, Liste Budgetary Control of Tasks

> Erstelle eine Budgetkontrolle für alle offenen Projekte und Aufgaben. Zeige Budgetstunden, gebuchte Stunden, Restbudget und Verbrauch in Prozent. Hebe Überschreitungen deutlich hervor und unterscheide zwischen Projektbudget und Aufgabenbudget.

### Umsatz nach Kunde und Projekt

*Verwendete Daten:* Zeitbuchungen, Kunden, Projekte

> Ermittle die verrechenbaren Stunden und den berechneten Umsatz pro Kunde und Projekt von {FROM} bis {TO}. Zeige auch die Anzahl der Einträge. Verwende das Kennzeichen „verrechenbar“, die Dauer in Stunden und das Umsatzfeld, und erkläre, dass es sich um berechnete Werte der Zeitbuchungen handelt, nicht unbedingt um verrechnete Beträge.

### Zeitbuchungen ohne Rechnungszuordnung

*Verwendete Daten:* Zeitbuchungen, Rechnungen

> Finde alle verrechenbaren Zeitbuchungen im Zeitraum {FROM} bis {TO}, die noch keiner Rechnung zugeordnet sind. Zeige Eintrags-ID, Mitarbeiter, Projekt, Aufgabe, Datum, Stunden und Umsatz. Stelle keinen Eintrag als vollständig dar, wenn das Ergebnis abgeschnitten wurde.

### Monatlicher Controlling-Bericht

*Verwendete Daten:* Zeitbuchungen, Projekte, Rechnungen, TCQL

> Erstelle einen monatlichen Controlling-Bericht für {MONTH} mit gebuchten Stunden, verrechenbaren Stunden, Umsatz, Budgetverbrauch, nicht verrechneter Zeit, Anzahl der Rechnungen und offenen Zahlungen. Gruppiere nach Kunde und Projekt. Gib am Ende Summen aus und nenne Zeitraum, Filter, Datenquelle und mögliche Einschränkungen.

## HR-Administrator

### Resturlaub pro Mitarbeiter

*Verwendete Daten:* Urlaubsansprüche, Urlaub, Benutzer, `:RemainingVacationWeeks`

> Ermittle den aktuellen Resturlaub aller aktiven Mitarbeiter. Zeige Mitarbeiter, Urlaubsansprüche, verbrauchte Urlaubstage oder -stunden und den verbleibenden Anspruch. Verwende die time cockpit Funktion :RemainingVacationWeeks(...) und weise darauf hin, dass das Ergebnis in Wochen geliefert wird.

### Offene Urlaubsanträge

*Verwendete Daten:* Urlaub, Benutzer

> Zeige alle noch nicht genehmigten Urlaubseinträge im Zeitraum {FROM} bis {TO}. Gib Mitarbeiter, Beginn, Ende, Dauer, Beschreibung und Genehmigungsstatus aus. Unterscheide offene, genehmigte und abgelehnte Einträge und ändere keine Daten.

### Urlaubsansprüche prüfen

*Verwendete Daten:* Urlaubsansprüche

> Prüfe die Urlaubsansprüche aller aktiven Mitarbeiter für das Jahr {YEAR}. Zeige Stichtag, Anzahl der Anspruchswochen, Mitarbeiter und Beschreibung. Markiere fehlende oder ungewöhnliche Anspruchseinträge, ändere aber nichts automatisch.

### Krankenstand und Zeitausgleich

*Verwendete Daten:* Krankenstände, Zeitausgleich, Benutzer

> Erstelle eine Abwesenheitsübersicht mit Krankenständen und Zeitausgleich von {FROM} bis {TO}. Zeige Mitarbeiter, Beginn, Ende, Dauer, Beschreibung und Genehmigungsstatus. Führe die Kategorien getrennt auf und gib pro Kategorie eine Summe aus.

### Sollzeit, Istzeit und Überstunden

*Verwendete Daten:* Benutzer, Arbeitszeitgrenzen, Arbeitszeitgewichtungen, TCQL

> Vergleiche Soll-Arbeitszeit, tatsächlich gebuchte Arbeitszeit und Überstunden aller aktiven Mitarbeiter von {FROM} bis {TO}. Zeige die Abweichungen pro Mitarbeiter und sortiere nach der größten positiven oder negativen Differenz. Berücksichtige die konfigurierten Arbeitszeitregelungen.

## Zeiterfassungsbenutzer

### Meine Arbeitszeitverstöße

*Verwendete Daten:* Liste Working Time Violations, Zeitbuchungen

> Prüfe meine eigenen Arbeitszeitverstöße im Zeitraum {FROM} bis {TO}. Zeige Datum, betroffene Einträge, Art des Verstoßes und die relevanten Zeitwerte. Verwende bevorzugt die Standardliste und meine Zeitbuchungen nur ergänzend. Nimm keine Korrekturen automatisch vor.

### Ungewöhnliche Lücken und Überschneidungen

*Verwendete Daten:* aktueller Benutzer, Zeitbuchungen

> Analysiere meine Zeitbuchungen im Zeitraum {FROM} bis {TO} auf ungewöhnlich lange Lücken, Überschneidungen und mögliche Duplikate. Ignoriere reine Dauerbuchungen bei der Prüfung auf Lücken. Zeige zu jedem Befund Datum, Beginn, Ende, Dauer und die IDs der betroffenen Einträge. Schlage keine Einträge automatisch vor.

### Meine Stunden pro Projekt

*Verwendete Daten:* Zeitbuchungen, Projekte, Aufgaben

> Fasse meine Zeitbuchungen von {FROM} bis {TO} nach Projekt und Aufgabe zusammen. Zeige Anzahl der Einträge, gebuchte Stunden, verrechenbare Stunden und nicht verrechenbare Stunden. Gib am Ende eine Gesamtsumme aus und nenne den genauen Datenzeitraum.

### Urlaub anlegen

*Verwendete Daten:* Urlaub, Tool zum Anlegen

> Ich möchte Urlaub von {START} bis {END} eintragen. Prüfe zuerst, ob für diesen Zeitraum bereits eine Abwesenheit existiert. Zeige mir dann den geplanten Datensatz mit Beginn, Ende, Kennzeichen „ganztägig“ und Beschreibung. Ändere noch nichts und bitte mich ausdrücklich um Bestätigung, bevor du ihn anlegst.

### Fehlende tägliche Einträge

*Verwendete Daten:* Zeitbuchungen, Urlaub, Krankenstände

> Prüfe meine Arbeitstage im Zeitraum {FROM} bis {TO} auf fehlende Zeitbuchungen. Berücksichtige Urlaub, Krankenstände und Wochenenden. Zeige nur mögliche Lücken an Arbeitstagen und nenne zu jeder Lücke das Datum, die vorhandenen Einträge und die fehlende Zeitspanne.

## Abteilungsleiter

### Abwesenheiten in meiner Abteilung

*Verwendete Daten:* Benutzer, Abteilungen, Urlaub

> Zeige die Abwesenheiten meiner Abteilung von {FROM} bis {TO}. Gruppiere nach Mitarbeiter und Art der Abwesenheit. Gib Beginn, Ende, Dauer und Genehmigungsstatus aus. Verwende nur Mitarbeiter, die meiner Abteilung zugeordnet sind.

### Teamstunden pro Woche

*Verwendete Daten:* Zeitbuchungen, Benutzer, TCQL

> Erstelle eine Wochenübersicht der gebuchten Stunden meiner Abteilung im Zeitraum {FROM} bis {TO}. Zeige pro Mitarbeiter Anzahl der Einträge, Stunden und Abweichung von der Wochenarbeitszeit. Weise auf fehlende oder abgeschnittene Daten hin.

### Fehlende Einträge im Team

*Verwendete Daten:* Zeitbuchungen, Urlaub, Krankenstände

> Prüfe die Mitarbeiter meiner Abteilung auf mögliche fehlende Einträge im Zeitraum {FROM} bis {TO}. Berücksichtige genehmigten Urlaub, Krankenstände, Wochenenden und Feiertage. Gib nur Befunde aus und ändere keine Einträge.

### Offene Urlaubsanträge

*Verwendete Daten:* Urlaub, Benutzer

> Zeige alle offenen oder noch nicht genehmigten Urlaubsanträge meiner Abteilung. Gib Mitarbeiter, Zeitraum, Dauer, Beschreibung und Antragsstatus aus. Sortiere nach Beginndatum und fasse die Anzahl der offenen Anträge zusammen.

### Auslastung des Teams

*Verwendete Daten:* Zeitbuchungen, Benutzer, Arbeitszeitgrenzen

> Analysiere die Auslastung meiner Abteilung im Zeitraum {FROM} bis {TO}. Vergleiche Soll-Arbeitszeit, gebuchte Stunden, verrechenbare Stunden und Abwesenheiten pro Mitarbeiter. Markiere deutliche Über- oder Unterauslastung.

## Weiterer Anwendungsfall: Zeitbuchungen aus ChatGPT- oder Claude-Chats ableiten

*Verwendete Daten:* Chat-Export, Projekte, Aufgaben, Zeitbuchungen, TCQL

> Ich hänge einen Export meiner ChatGPT- oder Claude-Chats an. Ermittle daraus mögliche Arbeitstätigkeiten, Zeitangaben, Projekte und Aufgaben. Ordne die ermittelten Tätigkeiten nach Möglichkeit meinen Projekten und Aufgaben zu. Vergleiche sie mit meinen vorhandenen Zeitbuchungen im Zeitraum {FROM} bis {TO}. Zeige bereits gebuchte Tätigkeiten, mögliche fehlende Einträge und unsichere Zuordnungen getrennt an. Erstelle nur Vorschläge und lege keine Zeitbuchungen ohne meine ausdrückliche Bestätigung an.
>
> Betrachte die Zeitstempel der Chats nur als Anhaltspunkt. Lässt sich aus dem Chat keine verlässliche Dauer ableiten, markiere die Tätigkeit als unsicher und frage nach, statt eine Dauer zu erfinden.

## Verwandte Seiten

- [KI-Assistenten: Überblick](~/doc/ki-assistenten/ueberblick.md)
- [Dashboards und Visualisierungen](~/doc/ki-assistenten/dashboards.md)
- FAQs nach Rolle: [Projektleiter](~/doc/projektleiter-faq.md), [Abrechnungsadministrator](~/doc/abrechnungs-faq.md), [HR-Administrator](~/doc/hr-administrator-faq.md), [Mitarbeiter](~/doc/mitarbeiter-faq.md), [Abteilungsleiter](~/doc/abteilungsleiter-faq.md)
