---
title: TCQL AST API - Abfragen programmgesteuert erstellen
description: "Erstellen Sie TCQL-Abfragen in time cockpit programmgesteuert mit der Abstract-Syntax-Tree-API: Abfragen per Code statt als Zeichenketten aufbauen."
en_page: doc/tcql/tcql-ast-api.md
---
# TCQL-Abfragen programmgesteuert mit der TCQL AST API erstellen

Mit Version 1.10 hat time cockpit eine API zum Aufbau von Abstract Syntax Trees (AST) für [TCQL](~/doc/tcql/ueberblick.md)-Abfragen eingeführt. Mit der AST API lassen sich alle Abfragen erstellen, die auch mit der TCQL-Grammatik geschrieben werden könnten. Alle Klassen, die die Knoten eines TCQL-AST darstellen, finden Sie im Namespace [TimeCockpit.Data.QueryLanguage.Syntax](/api/TimeCockpit.Data.QueryLanguage.Syntax.html). Der zentrale Einstiegspunkt zum Erzeugen von TCQL-AST-Knoten ist die Klasse [TimeCockpit.Data.QueryLanguage.Syntax.TCQLExpression](/api/TimeCockpit.Data.QueryLanguage.Syntax.TCQLExpression.html), die statische Funktionen mit Parametern für die Knoten enthält. Die Beispiele in diesem Dokument beziehen sich auf das Standarddatenmodell von time cockpit.

## Bestandteile einer Abfrage

Semantisch besteht eine Abfrage aus fünf Teilen:

- [TimeCockpit.Data.QueryLanguage.Syntax.QuerySource](/api/TimeCockpit.Data.QueryLanguage.Syntax.QuerySource.html)
- [Where](/api/TimeCockpit.Data.QueryLanguage.Syntax.Expression.html)-Bedingung (optional)
- [Order-By](~/doc/tcql/order-by-klausel.md)-Klausel (optional)
- [Select](~/doc/tcql/select-klausel.md)-Klausel
- [TimeCockpit.Data.QueryLanguage.Syntax.QueryOptions](/api/TimeCockpit.Data.QueryLanguage.Syntax.QueryOptions.html) (optional)

Die Abfragequelle beschreibt die Menge der Entitätsobjekte, die abgefragt wird. Sie kann eine [TimeCockpit.Data.QueryLanguage.Syntax.EntitySource](/api/TimeCockpit.Data.QueryLanguage.Syntax.EntitySource.html), eine [TimeCockpit.Data.QueryLanguage.Syntax.BackReferenceSource](/api/TimeCockpit.Data.QueryLanguage.Syntax.BackReferenceSource.html) (für Unterabfragen) oder eine [TimeCockpit.Data.QueryLanguage.Syntax.DeadOfSource](/api/TimeCockpit.Data.QueryLanguage.Syntax.DeadOfSource.html) (wird intern für die Synchronisierung verwendet und später möglicherweise abgekündigt) sein.

Die optionale Where-Bedingung beschreibt einen Filterausdruck, der angibt, ob eine bestimmte Entität Teil der Ergebnismenge sein soll oder nicht. [TimeCockpit.Data.QueryLanguage.Syntax.Expression](/api/TimeCockpit.Data.QueryLanguage.Syntax.Expression.html) ist die Basisklasse für alle Ausdrücke; ihr wichtigster Vertreter ist [TimeCockpit.Data.QueryLanguage.Syntax.BinaryExpression](/api/TimeCockpit.Data.QueryLanguage.Syntax.BinaryExpression.html).

> [!NOTE]
> Beachten Sie: Eine [TimeCockpit.Data.QueryLanguage.Syntax.Expression](/api/TimeCockpit.Data.QueryLanguage.Syntax.Expression.html) kann zwar einen beliebigen Ergebnistyp haben, semantisch muss ein solcher Ausdruck jedoch ein boolesches Ergebnis liefern. Das Ergebnis einer Abfrage, deren Where-Bedingung einen anderen Ergebnistyp als boolean hat, ist undefiniert.

Die Order-By-Klausel beschreibt die Sortierung des Abfrageergebnisses und wird durch eine Instanz des Klassenknotens [TimeCockpit.Data.QueryLanguage.Syntax.OrderBy](/api/TimeCockpit.Data.QueryLanguage.Syntax.OrderBy.html) dargestellt. Ein [TimeCockpit.Data.QueryLanguage.Syntax.OrderBy](/api/TimeCockpit.Data.QueryLanguage.Syntax.OrderBy.html)-Knoten besteht aus einem oder mehreren [TimeCockpit.Data.QueryLanguage.Syntax.OrderByExpression](/api/TimeCockpit.Data.QueryLanguage.Syntax.OrderByExpression.html)-Objekten, wobei jeder Ausdruck einen Verweis auf eine [TimeCockpit.Data.QueryLanguage.Syntax.Expression](/api/TimeCockpit.Data.QueryLanguage.Syntax.Expression.html) und eine Sortierrichtung ([TimeCockpit.Data.QueryLanguage.Syntax.SortDirection](/api/TimeCockpit.Data.QueryLanguage.Syntax.SortDirection.html)) enthält.

Die Select-Klausel beschreibt die Struktur der zurückgegebenen Elemente und optionale Einschränkungen. Die einfachste Form einer Select-Klausel ist der Knotentyp [TimeCockpit.Data.QueryLanguage.Syntax.SelectAlias](/api/TimeCockpit.Data.QueryLanguage.Syntax.SelectAlias.html), der die Auswahl der Entität darstellt, wie sie in einem Alias definiert ist. In der folgenden Anweisung wird der Teil `Select P` durch einen solchen [TimeCockpit.Data.QueryLanguage.Syntax.SelectAlias](/api/TimeCockpit.Data.QueryLanguage.Syntax.SelectAlias.html)-Knoten mit dem Aliaswert `P` beschrieben.

```
From P In Project Select P
```

## Einfache Beispiele

Die einfachste Abfrage wählt alle Objekte einer bestimmten Entität aus, zum Beispiel:

```
From P In Project Select P
```

Das TCQL-AST-Gegenstück lässt sich in C# mit folgendem Codeausschnitt erstellen:

```
var q = TCQLExpression.Query(TCQLExpression.From("Project"));
```

Im obigen Beispiel wird eine Abfrage erstellt, der nur eine [TimeCockpit.Data.QueryLanguage.Syntax.QuerySource](/api/TimeCockpit.Data.QueryLanguage.Syntax.QuerySource.html) übergeben wird; diese wird mit der Methode [From()](/api/TimeCockpit.Data.QueryLanguage.Syntax.TCQLExpression.html#TimeCockpit_Data_QueryLanguage_Syntax_TCQLExpression_From_System_String_TimeCockpit_Data_QueryLanguage_Syntax_EntitySourceInclude___) erzeugt.

> [!NOTE]
> Beachten Sie, dass kein Alias angegeben wurde. Wenn der Alias überflüssig ist, weil nur eine einzige Abfrage beteiligt ist, kann er weggelassen werden, indem er auf null gesetzt wird (Standardwert). Ist der Alias null, wird er automatisch aus der Abfragequelle der übergeordneten Abfrage abgeleitet, indem der erste Buchstabe der ausgewählten Entität bzw. des ausgewählten Rückverweises verwendet wird. Ist der Alias bereits von einer übergeordneten Abfrage belegt, wird eine fortlaufende Zahl angehängt.

Um die zurückgegebenen Projekte zu filtern, können Sie eine Where-Bedingung hinzufügen, wie in der folgenden TCQL-Anweisung:

```
From P In Project Where P.Code = 'time cockpit' Select P
```

```
var q = TCQLExpression.Query("Project",
            TCQLExpression.MakeBinary(
                BinaryOperator.Equals,
                TCQLExpression.Property("Code"),
                TCQLExpression.Constant("time cockpit")));
```

In diesem Beispiel wird mit der Funktion [MakeBinary()](/api/TimeCockpit.Data.QueryLanguage.Syntax.TCQLExpression.html#TimeCockpit_Data_QueryLanguage_Syntax_TCQLExpression_MakeBinary_TimeCockpit_Data_QueryLanguage_Syntax_BinaryOperator_TimeCockpit_Data_QueryLanguage_Syntax_Expression_TimeCockpit_Data_QueryLanguage_Syntax_Expression_) ein binärer Ausdruck aufgebaut. Die Funktion erwartet einen [TimeCockpit.Data.QueryLanguage.Syntax.BinaryOperator](/api/TimeCockpit.Data.QueryLanguage.Syntax.BinaryOperator.html) und zwei Teilausdrücke. In diesem Beispiel ist der linke Ausdruck ein Memberzugriff auf eine Eigenschaft, der mit der Methode [Property()](/api/TimeCockpit.Data.QueryLanguage.Syntax.TCQLExpression.html#TimeCockpit_Data_QueryLanguage_Syntax_TCQLExpression_Property_System_String_) erzeugt wird. Der zweite, rechte Operand des binären Ausdrucks ist ein konstantes Zeichenkettenliteral, das mit der Funktion [Constant()](/api/TimeCockpit.Data.QueryLanguage.Syntax.TCQLExpression.html#TimeCockpit_Data_QueryLanguage_Syntax_TCQLExpression_Constant_System_String_) erzeugt wird.

## Ausdrücke

Der Ausdrucksbaum in TCQL ist ein Baum, in dem [TimeCockpit.Data.QueryLanguage.Syntax.BinaryExpression](/api/TimeCockpit.Data.QueryLanguage.Syntax.BinaryExpression.html) die Knotenklasse für alle binären Operatoren ist, egal ob boolesch oder nicht. Der Konstruktor eines binären Ausdrucks erwartet einen der in [TimeCockpit.Data.QueryLanguage.Syntax.BinaryOperator](/api/TimeCockpit.Data.QueryLanguage.Syntax.BinaryOperator.html) definierten Enum-Werte, den linken und den rechten Ausdruck. Die Blattknoten eines TCQL-Ausdrucks können folgende Typen haben:

- Konstante (String, Boolean, Decimal, Date, DateTime, Guid, Null)
- Parameterzugriff
- Set
- NamedSetReference

Die konstanten Werte können durch Aufruf der entsprechenden Überladung von [Constant()]((xref:TimeCockpit.Data.QueryLanguage.Syntax.TCQLExpression#TimeCockpit_Data_QueryLanguage_Syntax_TCQLExpression_Constant_System_String_)) erzeugt werden. Funktionsaufrufe lassen sich mit der Funktion [FunctionCall()](/api/TimeCockpit.Data.QueryLanguage.Syntax.TCQLExpression.html#TimeCockpit_Data_QueryLanguage_Syntax_TCQLExpression_FunctionCall_System_String_TimeCockpit_Data_QueryLanguage_Syntax_Expression___) erzeugen. Betrachten Sie folgende TCQL-Anweisung:

```
From T In Timesheet Where T.BeginTime < :Now() Select T
```

Das TCQL-AST-Gegenstück zeigt der folgende Codeausschnitt:

```
var q = TCQLExpression.Query(
            TCQLExpression.From("Timesheet"),
            TCQLExpression.MakeBinary(BinaryOperator.Less,
                TCQLExpression.Property("BeginTime"),
                TCQLExpression.FunctionCall("Now")),
            TCQLExpression.SelectAlias());
```

Weitere Parameterausdrücke können der Methode [TCQLExpression.FunctionCall()]((xref:TimeCockpit.Data.QueryLanguage.Syntax.TCQLExpression#TimeCockpit_Data_QueryLanguage_Syntax_TCQLExpression_FunctionCall_System_String_TimeCockpit_Data_QueryLanguage_Syntax_Expression___) als zusätzliche Parameter übergeben werden.

## Select New With
In den vorherigen Beispielen wurde das einfache [SelectAlias()](/api/TimeCockpit.Data.QueryLanguage.Syntax.TCQLExpression.html#TimeCockpit_Data_QueryLanguage_Syntax_TCQLExpression_SelectAlias_System_String_System_Int32_) verwendet, um die Struktur der zurückgegebenen EntityObjects festzulegen. Abfragen mit TCQL Select New lassen sich folgendermaßen ausdrücken:

```
From P In Project Select New With { P.Code, .TheTitle = P.ProjectName }
```

Dies entspricht folgendem TCQL-AST-Codeausschnitt:

```
var q = TCQLExpression.Query(
            "P",
            TCQLExpression.From("Project"),
            TCQLExpression.SelectNewWith(
                TCQLExpression.Member(TCQLExpression.Property("Code")),
                TCQLExpression.Member("TheTitle", TCQLExpression.Property("ProjectName")
            )
        )
    );
```

## Include-Anweisungen

TCQL ermöglicht über sogenannte Include-Klauseln eine feingranulare Auswahl, welche Beziehungen geladen werden sollen. Die einfachste Include-Klausel ist die Klausel [IncludeAll](/api/TimeCockpit.Data.QueryLanguage.Syntax.TCQLExpression.html#TimeCockpit_Data_QueryLanguage_Syntax_TCQLExpression_IncludeAll), die den gesamten Baum der Beziehungen auswählt. Betrachten Sie als Beispiel folgende TCQL-Anweisung:

```
From P In Project.Include(*) Select P
```

Mit der TCQL API würde diese Anweisung mit folgendem Codeausschnitt aufgebaut:

```
var q = TCQLExpression.Query(TCQLExpression.From("Project", TCQLExpression.IncludeAll));
```

Das obige Beispiel erstellt eine Abfrage für eine [TimeCockpit.Data.QueryLanguage.Syntax.EntitySource](/api/TimeCockpit.Data.QueryLanguage.Syntax.EntitySource.html) mit einer einzigen IncludeAll-Klausel. Gezieltere Includes lassen sich mit der Methode [IncludeRelation()](/api/TimeCockpit.Data.QueryLanguage.Syntax.TCQLExpression.html#TimeCockpit_Data_QueryLanguage_Syntax_TCQLExpression_IncludeRelation_System_String_) aufbauen. Die folgende TCQL-Anweisung schließt eine bestimmte Beziehung ein:

```
From P In Project.Include('Customer') Select P
```

Die obige Anweisung entspricht folgendem TCQL-AST-Code:

```
var q = TCQLExpression.Query(TCQLExpression.From("Project", TCQLExpression.IncludeRelation("Customer")));
```

Eine weitere Art von Include ist das bedingte Include, das einen Rückverweis mit einer Bedingung einschließt. Ein Beispiel in time cockpit ist die Auswertung der aktuellen Wochenarbeitszeit aller Benutzer. Die Abfrage liefert eine Tabelle mit der aktuellen Wochenarbeitszeit pro Benutzer.

```
From U In UserDetail.Include(W, WeeklyHoursOfWork, ((U.W.ValidFrom <= :Now()) And (U.W.ValidUntil > :Now()))) Select New With { U.Username, U.W.SumHours }
```

Den entsprechenden TCQL-AST-Code zeigt der folgende Ausschnitt:

```
var q = TCQLExpression.Query(
            TCQLExpression.From("UserDetail",
                TCQLExpression.IncludeConditional("WeeklyHoursOfWork",
                    TCQLExpression.MakeBinary(
                        BinaryOperator.AndAlso,
                        TCQLExpression.MakeBinary(
                            BinaryOperator.LessEqual,
                            TCQLExpression.Property("W", "ValidFrom"),
                            TCQLExpression.FunctionCall("Now")),
                        TCQLExpression.MakeBinary(
                            BinaryOperator.Greater,
                            TCQLExpression.Property("W", "ValidUntil"),
                            TCQLExpression.FunctionCall("Now"))
                    ),
                    "W"
                )
                ),
                TCQLExpression.SelectNewWith(
                    TCQLExpression.Member(TCQLExpression.Property("Username")),
                    TCQLExpression.Member(TCQLExpression.Property("W", "SumHours"))
                )
);
```
