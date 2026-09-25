---
title: TCQL Select-Klausel - Abfrageergebnisse
description: So legen Sie in TCQL von time cockpit die Struktur des Abfrageergebnisses fest. Select-Klausel, anonyme Typen und Versionsinfos für die Synchronisierung.
en_page: doc/tcql/select-clause.md
---
# Select-Klausel (TCQL)

Die `select`-Klausel legt die Struktur des Abfrageergebnisses fest. Sie hat folgende Syntax:

```
<selectClause> ::=
  Select <alias> [With(VersionInfoOnly)]
  | Select New [<targetIdentifier>] With { <memberDeclarator> [, <memberDeclarator>...] }

<memberDeclarator> ::=
  <memberAccess>
  | .<targetColumnIdentifier> = <expression>

<memberAccess> ::=
  <identifier>.<identifier>[.<identifier>...]
```

Name | Beschreibung
--- | ---
alias | Alias der Quellentität, wie er in der [From-Klausel](~/doc/tcql/from-klausel.md) definiert ist. Das Ergebnis der Abfrage besteht aus Instanzen des Typs, für den der Alias steht.
targetIdentifier | Name der Zielentität. Die Zielentität muss im Metadaten-Repository von time cockpit existieren. Der Zielbezeichner ist optional. Wenn Sie ihn angeben, besteht das Ergebnis der Abfrage aus Instanzen dieses Typs. Wenn Sie ihn nicht angeben, besteht das Ergebnis aus Instanzen eines dynamisch erzeugten anonymen Typs.
memberAccess | Bezeichnet eine Eigenschaft oder eine Beziehung der Quellentität oder von Entitäten, die sie referenziert.
targetColumnIdentifier | Name der Eigenschaft im dynamisch erzeugten anonymen Ergebnistyp.
expression | Ausdruck, der die Ergebnisspalte festlegt. Details finden Sie unter [TCQL-Ausdruckssprache](~/doc/tcql/ausdruckssprache.md).

> [!NOTE]
> Das Attribut `VersionInfoOnly` können Sie in Skripten oder Anwendungen verwenden, die Daten aus time cockpit oder nach time cockpit synchronisieren. Wenn Sie dieses Attribut angeben, liest die TCQL-Laufzeitumgebung außer den Versionsinformationen der betroffenen Zeilen keine Daten. Anhand dieser Versionsdaten lassen sich neue, geänderte oder gelöschte Zeilen erkennen, die in einen Synchronisierungsvorgang einbezogen werden müssen.

> [!NOTE]
> Schlüsselwörter in TCQL unterscheiden zwischen Groß- und Kleinschreibung. Sie müssen daher `From` schreiben, nicht `from`. Außerdem müssen Bezeichner mit einem Großbuchstaben beginnen. Sie können daher nicht `From p In Project...` schreiben, sondern müssen `From P In Project...` schreiben. Dieses Verhalten kann sich in zukünftigen Versionen von time cockpit ändern, sodass TCQL künftig möglicherweise nicht mehr zwischen Groß- und Kleinschreibung unterscheidet.

## Beispiele

Das folgende Beispiel zeigt eine einfache Select-Klausel:

```
// Return all Project entities
From P In Project Select P
```

Das folgende Beispiel zeigt eine Select-Klausel, die einen dynamisch erzeugten anonymen Ergebnistyp liefert:

```
From P In Project.Include('CustomerRelation')
Order By P.ProjectName, P.CustomerRelation.CustomerName Asc
Select New With
{
        P.ProjectName,
        P.CustomerRelation.CustomerName
}
```

> [!NOTE]
> Wenn die Select-Klausel Verweise auf Beziehungen enthält, schließt TCQL die referenzierten Entitäten automatisch ein. Sie müssen daher kein Include-Element explizit in der From-Klausel hinzufügen (Details siehe TCQL From-Klausel). Sie können die Include-Klausel aber explizit hinzufügen, wenn Sie möchten.

Das folgende Beispiel zeigt eine Select-Klausel, die eine Liste von Project-Entitäten erzeugt:

```
From C In Customer
Select New Project With {
        .ProjectName = "Project " + C.CustomerName,
        .NumberOfHours = 0
}
```
