---
uid: tcql
name: TCQL
title: TCQL - Leitfaden zur Abfragesprache
description: "TCQL, die LINQ-ähnliche Abfragesprache von time cockpit: Daten abfragen, Aggregatfunktionen und Unterabfragen nutzen, in IronPython und .NET einsetzen."
en_page: doc/tcql/overview.md
---

# Time Cockpit Query Language (TCQL)

Für Abfragen bietet time cockpit eine eigene Abfragesprache (time cockpit query language (TCQL)). Die Grammatik von TCQL ist [LINQ in Visual Basic](http://msdn.microsoft.com/en-us/library/bb385100.aspx) sehr ähnlich. Es gibt jedoch einige Unterschiede, die sich aus der domänenspezifischen Logik von time cockpit oder aus technischen Einschränkungen ergeben. In diesem Kapitel wird der grundlegende Aufbau von TCQL beschrieben.

## Grundlagen von TCQL

Jede TCQL-Anweisung hat folgenden Aufbau:

```
<statement> ::=
  <fromClause> 
  [<whereClause>] 
  [<orderByClause>] 
  <selectClause>
```

Die `fromClause` legt die Quelle der Abfrage fest. Mit der whereClause können Sie Bedingungen hinzufügen, die die Daten aus der Quelle erfüllen müssen, um in das Ergebnis der Abfrage aufgenommen zu werden. Die orderByClause dient zum Sortieren des Ergebnisses. Die selectClause legt die Struktur des Abfrageergebnisses fest.

> [!NOTE]
> Schlüsselwörter in TCQL unterscheiden zwischen Groß- und Kleinschreibung. Sie müssen daher From schreiben, nicht from. Außerdem müssen Bezeichner mit einem Großbuchstaben beginnen. Sie können daher nicht From p In Project... schreiben, sondern müssen From P In Project... schreiben. Dieses Verhalten kann sich in zukünftigen Versionen von time cockpit ändern, sodass TCQL künftig möglicherweise nicht mehr zwischen Groß- und Kleinschreibung unterscheidet.

Hier einige einfache Beispiele für TCQL-Abfragen:

```
// Return all Project entities                                        
From P In Project Select P

// Return all billable timesheet entities
From T In Timesheet Where T.Billable=True Select T

// Look for two project entities
From P In Project Where P.ProjectName="ProjectName9" Or P.ProjectName="ProjectName8" Select P

// Return all projects that have a specified number of hours
From P In Project Where P.NumberOfHours=(6 + 4)*4 Select P

// Return all projects that start on a specified date
From P In Project Where P.StartDate=#2010-01-01# Select P

// Return all projects for which number of hours is set
From P In Project Where P.NumberOfHours <> Null Select P
```

In TCQL müssen Sie sich nicht um das Verknüpfen von Tabellen (Joins) kümmern. Die Beziehungen, die im Datenmodell von time cockpit definiert sind, stehen in TCQL automatisch zur Verfügung:

```
// Return all projects of a certain customer
From P In Project Where P.Customer = "ABC" Select P
```

Wie bereits erwähnt, können Sie mit der `orderByClause` das Ergebnis von TCQL-Abfragen sortieren:

```
From P In Project
Order By P.ProjectName
Select P
```

> [!WARNING]
> time cockpit unterstützt beim Abfragen des lokalen Datenspeichers keine Sortierung nach aggregierten Werten.

TCQL unterstützt eine Reihe von Funktionen, die Sie in Ausdrücken verwenden können. Funktionen beginnen immer mit einem Doppelpunkt, gefolgt vom Funktionsnamen. Parameter werden durch Kommas getrennt.

```
// Use :Iif in where clause
From P In Project 
Where :Iif(P.ProjectName="Software Architects' time cockpit", "Hello World", "Nevermind") = "Hello World" 
Select P

// Find all projects whose name starts with "ti"
From P In Project 
Where :Substring(P.ProjectName, 1, 2) = "ti" 
Select P
```

Mit der `selectClause` können Sie die Struktur des Abfrageergebnisses ändern. Sie können einerseits spontan eine neue anonyme Entität erzeugen und andererseits Instanzen von Entitätstypen erzeugen, die bereits im Datenmodell von time cockpit existieren:

```
// Generate an anonymous entity
From T In Timesheet 
Select New With {
  .BeginTime = T.BeginTime,
  .Duration = T.EndTime - T.BeginTime,
  T.Description,
  .Project = T.Project,
  T.Project.CustomerRelation
}

// Generate Project entities
From P In Project
Select New Project With {
  .CustomerRelation = P.CustomerRelation
}
```

TCQL unterstützt Aggregatfunktionen.

> [!NOTE]
> TCQL hat keine Group-By-Klausel. Das System erzeugt Gruppierungsausdrücke für alle Ausdrücke, die nicht innerhalb einer Aggregatfunktion verwendet werden.

```
From T In Timesheet 
Where T.BeginTime >= #2009-04-30 08:00:00# And T.BeginTime <= #2009-04-30 12:00:00#
Select New With { 
  .ProjectName = T.Project.ProjectName,
  T.Project.StartDate,
  .TotalHours = Sum(T.DurationInHours) 
}
```

## Unterabfragen

TCQL unterstützt Unterabfragen in der `select`- und in der `where`-Klausel. Sie können Entitäten über die Namen der Rückverweise (Back References) der Beziehungen referenzieren.

Das folgende Beispiel zeigt eine Unterabfrage in der `select`-Klausel:

```
From P In Project
Order By P.ProjectName
Select New With {
        P.ProjectName,
        .TotalHours = ( From T In P.Timesheets Select New With { .TotalHours = Sum(T.DurationInHours) } )
}
```

Weitere Informationen zu [Unterabfragen](~/doc/tcql/ausdruckssprache.md#unterabfragen).

## TCQL verwenden

Sie können TCQL-Anweisungen auf verschiedene Arten verwenden:

- TCQL-Abfragen in der Skriptkonsole von time cockpit ausführen.
- TCQL-Abfragen in IronPython-Skripten verwenden. Solche Skripte können Sie in der IronPython-Umgebung oder in der Skriptkonsole von time cockpit ausführen.
- TCQL-Abfragen in .NET-Anwendungen (z. B. aus C#) verwenden. Um eine Verbindung zur Datenbank der Anwendung herzustellen, benötigen Sie das SDK von time cockpit.
