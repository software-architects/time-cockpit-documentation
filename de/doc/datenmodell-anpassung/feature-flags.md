---
title: Feature Flags - Kompatibilität und Anpassung
description: Wie time cockpit mit Feature Flags und Namespaces die Kompatibilität zwischen Standardfunktionen und kundenspezifischen Anpassungen sicherstellt.
en_page: doc/data-model-customization/feature-flags.md
---
# Feature Flags

## Kompatibilität in time cockpit sicherstellen

time cockpit ist in hohem Maß anpassbar, sodass Kunden die Anwendung an ihre eigenen Strukturen und Abläufe anpassen können. Diese Anpassungen reichen von einfachen Änderungen an Benutzeroberfläche oder Datenmodell (z. B. zusätzliche Tabellen) bis zu fortgeschrittenen Themen wie der Konfiguration von Berechtigungen.

Um Standardfunktionen von kundenspezifischen Anpassungen zu trennen, verwendet time cockpit mehrere Mechanismen:

### Namespaces

Elemente wie Tabellen, Formulare, Listen, Berechtigungen usw. werden über bestimmte Präfixe gekennzeichnet:

- `APP_`: Wird für alle Standardtabellen, -formulare, -listen, -berechtigungen, -validierungsregeln und mehr verwendet. Diese Elemente sind Teil des Standarddatenmodells.
- `USR_`: Wird für kundenspezifische Erweiterungen verwendet. Diese Elemente sind eigene Ergänzungen von Kunden, die die Funktionalität von time cockpit erweitern.

Diese Präfixe können überall angegeben werden, wo Tabellen, Listen oder Formulare verwendet oder abgefragt werden. Dieser Mechanismus deckt bereits einen Großteil der Anforderungen ab, wenn in einem Standard-Tenant von time cockpit auf kundenspezifische Erweiterungen zugegriffen wird.

## Wenn Namespaces nicht ausreichen

Der Namespace-Mechanismus deckt die meisten Anpassungsanforderungen ab, es gibt jedoch Szenarien, in denen er nicht ausreicht, insbesondere bei Berechtigungen. Das Berechtigungsmodell von time cockpit wertet Zugriffsrechte mit einer **"ODER"-Logik** aus. Das heißt, wenn einem Benutzer mehrere Berechtigungen zugewiesen sind, sei es über Rollen, Gruppenmitgliedschaften oder direkte Zuweisungen, verlangt das System nicht, dass *alle* diese Berechtigungen erfüllt sind, um den Zugriff zu gewähren. Stattdessen prüft es nur, ob *irgendeine* dieser Berechtigungen die angeforderte Operation erlaubt.

### Beispielszenario

Angenommen, es gibt eine Entität `ProjectData`, und für einen Benutzer sind folgende Berechtigungen konfiguriert:

1. **USR_ReadProjects** — Erlaubt das Lesen aller Projektdaten.
2. **USR_ReadSensitiveProjects** — Erlaubt das Lesen einer bestimmten Teilmenge sensibler Projekte.

Rollt time cockpit eine neue Standardberechtigung aus, etwa `APP_ReadArchivedProjects`, die Lesezugriff auf archivierte Projekte gewährt, und wird diese Berechtigung aktiviert, erhält der Benutzer automatisch zusätzlichen Lesezugriff.


Hat ein Kunde ein speziell angepasstes Berechtigungsmodell, muss es trotzdem möglich sein, Updates des Standarddatenmodells auszurollen, ohne die bestehende Berechtigungskonfiguration des Kunden zu beeinflussen. Kunden sollen immer ohne Beeinträchtigung Zugriff auf das neueste Datenmodell haben.

Dafür bietet time cockpit das **Feature-Flag-System**.

## Feature-Flag-System

Mit dem Feature-Flag-System lässt sich das neueste Datenmodell in bestehende Konten ausrollen, während Teile davon gezielt deaktiviert werden. So wurden beispielsweise im Mai 2025 Standardberechtigungen ausgerollt (siehe [hier](~/doc/datenmodell-anpassung/feature-flags.md)). Diese Standardberechtigungen dürfen bestehende Kundenkonfigurationen nicht überschreiben. Deshalb sind sie für bestehende Kunden über Feature Flags weitgehend deaktiviert. Dadurch werden sie bei der Auswertung der Berechtigungen nicht berücksichtigt.

### isDisabledExpression

Um dieses gezielte Verhalten zu unterstützen, wurde für Elemente, die das Verhalten von time cockpit steuern (z. B. Berechtigungen, Validierungsregeln, Aktionen), ein neues Attribut `isDisabledExpression` eingeführt. Die `isDisabledExpression` ist ein TCQL-Ausdruck, der festlegt, ob eine Berechtigung, Validierungsregel oder Aktion verfügbar bzw. wirksam sein soll.

Feature Flags sind nicht auf `isDisabledExpression` beschränkt. Sie können in jedem Kontext ausgewertet werden, in dem TCQL-Ausdrücke verwendet werden können. Dazu gehören TCQL-Abfragen, Formulare, Listen und mehr. Diese Flexibilität ermöglicht eine feingranulare Steuerung, bis hin zum Ausblenden einzelner Felder und Spalten in Formularen und Listen auf Basis von Feature Flags.

Ein Beispiel für die Abfrage eines Feature Flags in einer Berechtigung:

```tcql
:IsFeatureFlagEnabled('APP_DefaultPermissions')
```

Der folgende Screenshot zeigt die Standardberechtigungen für `APP_Timesheet`:

![Standardberechtigungen](/doc/data-model-customization/images/default-permissions-app-timesheet.png "Standardberechtigungen")

### Auswertung von `isDisabledExpression`

Die `isDisabledExpression` wird ausgewertet, wenn das Datenmodell erstmals geladen wird. Ob ein Feature Flag aktiv ist oder nicht, wird also **pro Konto** und nicht pro Benutzer bestimmt. Es ist nicht möglich, Feature Flags für verschiedene Benutzer innerhalb desselben Kontos einzeln zu aktivieren oder zu deaktivieren.

Beachten Sie, dass es im Datenmodell außerdem ein bestehendes boolesches Feld `isDisabled` gibt. Das System verknüpft die `isDisabledExpression` und das Feld `isDisabled` mit **ODER**. Das heißt, wenn entweder die `isDisabledExpression` `true` ergibt oder das Feld `isDisabled` auf `true` gesetzt ist, wird die entsprechende Berechtigung, Validierungsregel oder Aktion deaktiviert.


## Anwendungsfälle für Feature Flags

### Mandantenfähige Installationen

Feature Flags sind besonders nützlich in großen mandantenfähigen Installationen, in denen sich verschiedene Abteilungen dieselbe time cockpit Instanz teilen, aber unterschiedliche Funktionen benötigen. Mit Feature Flags lassen sich ganze Funktionen für bestimmte Abteilungen deaktivieren, ohne andere zu beeinträchtigen. Das vereinfacht die Verwaltung des Quellcodes, die Build-Pipelines und die Wartung.

### Kompatibilitäts-Flags

In Fällen wie dem Beispiel der *Standardberechtigungen* dienen Feature Flags als Kompatibilitäts-Flags. Sie ermöglichen es time cockpit, die Kompatibilität mit Kundenumgebungen zu wahren und gleichzeitig sicherzustellen, dass alle Kunden immer das neueste Datenmodell verwenden, auch wenn sie die neuen Funktionen nicht aktiv nutzen. Dieser Ansatz vereinfacht außerdem die Verwaltung des Quellcodes und sorgt für ein reibungsloses Ausrollen von Updates.
