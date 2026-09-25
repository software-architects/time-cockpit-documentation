---
title: TCQL From-Klausel - Abfragequellen
description: So legen Sie in TCQL von time cockpit mit der From-Klausel die Abfragequelle fest. Mit Entitätsauswahl, Includes von Beziehungen und Beispielen.
en_page: doc/tcql/from-clause.md
---
# From-Klausel (TCQL)

Die `from`-Klausel legt die Quellentität der TCQL-Abfrage fest. Sie hat folgende Syntax:

```
<fromClause> ::=
  From <alias> In <source>

<source> ::=
  <entity_name>[.Include(<relation_path>)[.Include(<relation_path>)...]]

<relation_path> ::=
  "<relation_name>[.<relation_name>...]"
  | *
```

Name | Beschreibung
--- | ---
alias | Alias für die Quellentität. Über diesen Alias referenzieren Sie Member der Quellentität in anderen Teilen der TCQL-Abfrage.
entity_Name | Name der Quellentität. Die Quellentität muss im Metadaten-Repository von time cockpit existieren.
relation_path | Name der Beziehung, die zusammen mit der Quellentität geladen werden soll. Wenn Sie auch Unterbeziehungen einschließen möchten, geben Sie den Namen der Unterbeziehung durch Punkte getrennt an (siehe Abschnitt mit Beispielen unten). Wenn Sie alle Unterbeziehungen rekursiv einschließen möchten, können Sie `.Include(*)` angeben.

> [!WARNING]
> Das rekursive Einschließen aller Unterbeziehungen mit .Include(*) kann zu großen und komplexen Abfragen führen, die viele Ressourcen der Datenbank verbrauchen. Es wird empfohlen, nur jene Beziehungen einzuschließen, die für die jeweilige Abfrage wirklich notwendig sind.

> [!NOTE]
> Schlüsselwörter in TCQL unterscheiden zwischen Groß- und Kleinschreibung. Sie müssen daher From schreiben, nicht from. Außerdem müssen Bezeichner mit einem Großbuchstaben beginnen. Sie können daher nicht From p In Project... schreiben, sondern müssen From P In Project... schreiben. Dieses Verhalten kann sich in zukünftigen Versionen von time cockpit ändern, sodass TCQL künftig möglicherweise nicht mehr zwischen Groß- und Kleinschreibung unterscheidet.

## Beispiele

Die Beispiele auf dieser Seite gehen davon aus, dass es eine Entität `Timesheet` mit einer n:1-Beziehung namens `Project` gibt, die auf die Projekte verweist, denen jede Zeitbuchung zugeordnet werden kann. Jedes Projekt hat eine n:1-Beziehung namens `ProjectGroup` und eine n:1-Beziehung namens `Customer`. Über die Zielentitäten dieser Beziehungen können Projekte nach Projektgruppe oder Kunde gruppiert werden.

Das folgende Beispiel zeigt eine einfache `from`-Klausel ohne Includes:

```
// Return all Project entities
From P In Project Select P
```

Das folgende Beispiel zeigt eine From-Klausel, die eine verknüpfte Entität einschließt:

```
// Return all Project entities and load their project group, too
From P In Project.Include("ProjectGroup") Select P
```

Das folgende Beispiel zeigt eine From-Klausel, die mehrere verknüpfte Entitäten einschließt:

```
// Return all Project entities and load their project group and customer, too
From P In Project.Include("ProjectGroup").Include("Customer") Select P
```

Das folgende Beispiel zeigt eine From-Klausel, die eine verknüpfte Entität samt Unterbeziehung einschließt:

```
// Return all Timesheet entities and load their project plus the related customer, too
From T In Timesheet.Include("Project.Customer") Select T
```
