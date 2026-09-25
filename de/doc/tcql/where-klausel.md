---
title: TCQL Where-Klausel - Abfragen filtern
description: So filtern Sie Daten mit der Where-Klausel in der Abfragesprache TCQL von time cockpit. Mit Beispielen und Einsatz der Ausdruckssprache.
en_page: doc/tcql/where-clause.md
---
# Where-Klausel (TCQL)

Mit der `where`-Klausel können Sie Bedingungen hinzufügen, die die Daten aus der Quelle erfüllen müssen, um in das Ergebnis der Abfrage aufgenommen zu werden. Sie hat folgende Syntax:

```
<whereClause> ::=
  Where <searchCondition>
```

Name | Beschreibung
--- | ---
searchCondition | Ausdruck, der die Bedingung festlegt. Details finden Sie unter [TCQL-Ausdruckssprache](~/doc/tcql/ausdruckssprache.md).

> [!NOTE]
> Schlüsselwörter in TCQL unterscheiden zwischen Groß- und Kleinschreibung. Sie müssen daher From schreiben, nicht from. Außerdem müssen Bezeichner mit einem Großbuchstaben beginnen. Sie können daher nicht From p In Project... schreiben, sondern müssen From P In Project... schreiben. Dieses Verhalten kann sich in zukünftigen Versionen von time cockpit ändern, sodass TCQL künftig möglicherweise nicht mehr zwischen Groß- und Kleinschreibung unterscheidet.

## Beispiele

Das folgende Beispiel zeigt eine einfache Where-Klausel:

```
// Return all billable timesheets
From T In Timesheet Where T.Billable=True Select T
```

Das folgende Beispiel zeigt eine Where-Klausel mit einer TCQL-Funktion:

```
// Return all timesheets of projects whose name starts with "Software"
From P In Project Where :Substring(P.ProjectName, 1, 8) = "Software" Select P
```

Das folgende Beispiel zeigt eine Where-Klausel mit einer komplexeren Bedingung und einem eingebetteten Iif.

```
// Filter using Iif-function
From P In Project Where :Iif(P.ProjectName="Software Architects' TimeCockpit", "Hello World", "Nevermind") = "Hello World" Select P
```

Das folgende Beispiel zeigt eine Where-Klausel, die eine Beziehung referenziert.

> [!NOTE]
> Wenn die `where-clause` Verweise auf Beziehungen enthält, schließt TCQL die referenzierten Entitäten automatisch ein. Sie müssen daher kein Include-Element explizit in der From-Klausel hinzufügen (Details siehe [TCQL From-Klausel](~/doc/tcql/from-klausel.md)).

```
// Return all projects that have a relation to customer "software architects"
From P In Project Where P.CustomerRelation.CustomerCode = "software architects" Select P
```
