---
title: TCQL Order-By-Klausel - Abfragen sortieren
description: So sortieren Sie Abfrageergebnisse in TCQL von time cockpit mit der Order-By-Klausel. Aufsteigende und absteigende Sortierung mit Beispielen.
en_page: doc/tcql/order-by-clause.md
---
# Order-By-Klausel (TCQL)

Die Order-By-Klausel dient zum Sortieren des Ergebnisses. Sie hat folgende Syntax:

```
<orderByClause> ::=
  Order By <expression> [ Asc | Desc ] [, <expression> [ Asc | Desc ] ]
```

Name | Beschreibung
--- | ---
expression | Ausdruck, der die Sortierreihenfolge festlegt. Details finden Sie unter [TCQL-Ausdruckssprache](~/doc/tcql/ausdruckssprache.md).

> [!NOTE]
> Schlüsselwörter in TCQL unterscheiden zwischen Groß- und Kleinschreibung. Sie müssen daher From schreiben, nicht from. Außerdem müssen Bezeichner mit einem Großbuchstaben beginnen. Sie können daher nicht From p In Project... schreiben, sondern müssen From P In Project... schreiben. Dieses Verhalten kann sich in zukünftigen Versionen von time cockpit ändern, sodass TCQL künftig möglicherweise nicht mehr zwischen Groß- und Kleinschreibung unterscheidet.

## Beispiele

Das folgende Beispiel zeigt eine einfache Order-By-Klausel:

```
From P In Project
Order By P.ProjectUuid
Select P
```

Das folgende Beispiel zeigt eine Order-By-Klausel mit mehreren Sortierkriterien:

```
From P In Project.Include('CustomerRelation')
Order By P.ProjectName, P.CustomerRelation.CustomerName Asc
Select New With
{
        P.ProjectName,
        P.CustomerRelation.CustomerName
}
```
