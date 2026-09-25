---
title: TCQL-Ausdruckssprache - Abfrageausdrücke
description: Die TCQL-Ausdruckssprache von time cockpit für Abfragen, berechnete Eigenschaften und Validierungsregeln, mit Operatoren, Funktionen und Beispielen.
en_page: doc/tcql/expression-language.md
---
# Ausdruckssprache (TCQL)

time cockpit enthält eine Ausdruckssprache, die Sie in TCQL-Abfragen sowie an verschiedenen anderen Stellen im Produkt verwenden können (z. B. werden berechnete Eigenschaften im Metadaten-Repository von time cockpit mit der TCQL-Ausdruckssprache definiert).

```
<expression> ::=
  ( <expression> )
  | <expression> [ Or | And ] <expression>
  | <expression> [ = | <> | < | <= | > | >= ] <expression>
  | <expression> In ( <expression> [, <expression>...] )
  | <expression> In Set( "<expressionName>" [, "<propertyName>" ] )
  | <expression> In <parameterAccess>
  | <expression> [Not] Like <expression>
  | <expression> [ + | - | * | / | % ] <expression>
  | Not <expression>
  | <functionCall>
  | <aggregationFunctionCall>
  | <memberAccess>
  | <literal>
  | <parameterAccess>
  | <nestedStatement>
  | <EnvironmentVariable>

<functionCall> ::=
  :<functionNameIdentifier>( [ <expression> [, <expression>...] ] )

<aggregationFunctionCall> ::=
  Sum( <expression> )
  | Min( <expression> )
  | Max( <expression> )
  | Avg( <expression> )
  | Count()

<memberAccess> ::=
  <identifier>.<identifier>[.<identifier>...]

<literal> ::=
  Null
  | <guidLiteral>
  | <stringLiteral>
  | True
  | False
  | <numericLiteral>
  | <dateTimeLiteral>
  | <dateLiteral>
  | <timeLiteral>

<parameterAccess> ::=
  @<paramterNameIdentifier>

<nestedStatement> ::=
  ( <fromClause> [<whereClause>] <selectClause> )

<EnvironmentVariable> ::=
  Environment.CurrentUser.<propertyOfUserDetailEntity>
```

Name | Beschreibung
--- | ---
functionNameIdentifier | Name der aufzurufenden Funktion. Anzahl und Typen der Parameter hängen von der aufgerufenen Funktion ab.
guidLiteral | Literal für einen global eindeutigen Bezeichner (GUID). TCQL verwendet für GUID-Literale das Registry-Format von Windows (z. B. `{3F860049-3A74-4d54-9ACA-80B2BC0152FC}`).
stringLiteral | Zeichenkettenkonstanten; Sie können für Zeichenketten einfache oder doppelte Anführungszeichen verwenden (z. B. `'Hello World'` oder `"Hello World"`).
dateTimeLiteral, dateLiteral und timeLiteral | Literale für Datums- und Zeitwerte müssen in Rautenzeichen eingeschlossen werden (#; z. B. #2010-01-01#). TCQL unterstützt nur das Format `YYYY-MM-DD` für Datumswerte, `HH:MM:SS` für Uhrzeiten (24-Stunden-Format) und `YYYY-MM-DD HH:MM:SS` für Literale mit Datum und Uhrzeit.
parameterNameIdentifier | Name eines Parameters, der vom aufrufenden Skript oder Programm an die TCQL-Abfrage übergeben wurde.
propertyOfUserDetailEntity | Name einer Eigenschaft der Entität `APP_UserDetail`. Auf die interne Identifikations-GUID eines Benutzers greifen Sie über `UserDetailUuid` zu.

> [!NOTE]
> Schlüsselwörter in TCQL unterscheiden zwischen Groß- und Kleinschreibung. Sie müssen daher `From` schreiben, nicht `from`. Außerdem müssen Bezeichner mit einem Großbuchstaben beginnen. Sie können daher nicht `From p In Project...` schreiben, sondern müssen `From P In Project...` schreiben. Dieses Verhalten kann sich in zukünftigen Versionen von time cockpit ändern, sodass TCQL künftig möglicherweise nicht mehr zwischen Groß- und Kleinschreibung unterscheidet.

## Einfache Ausdrücke

Das folgende Beispiel zeigt einen Ausdruck, der den Wert einer Eigenschaft zurückgibt (d. h. eine memberAccess-Klausel):

```
Current.CustomerCode
```

Das folgende Beispiel zeigt einen Ausdruck, der das Ergebnis zweier Vergleichsoperationen kombiniert:

```
C.CustomerCode="Test" And C.CustomerName="Test"
```

Das folgende Beispiel zeigt einen Ausdruck mit arithmetischen Operationen:

```
Current.ProcessName = 'calc' And (Current.EndTime - Current.BeginTime) * 24 * 60 < 0.25
```

> [!NOTE]
> In TCQL können Sie den Subtraktionsoperator (-) mit Werten aus Datum und Uhrzeit verwenden. Wenn Sie zwei solche Werte voneinander subtrahieren, erhalten Sie die Anzahl der Tage zwischen den beiden Werten. TCQL verhält sich dabei genau wie Microsoft Office Excel (z. B. ergibt `#2010-01-02# - #2010-01-01#` den Wert `1.0, #2010-01-01 14:00:00# - #2010-01-01 12:00:00#` ergibt `2 / 24 = 0.083333...`).

Das folgende Beispiel zeigt, wie Sie mit dem Additionsoperator Zeichenketten verketten können:

```
Current.ProjectName + ': ' + Current.NumberOfHours
```

Das folgende Beispiel zeigt die Verwendung des In-Operators:

```
From P In Project 
Where :Iif(P.NumberOfHours=0, 1, P.NumberOfHours) In ( 1, 2 ) 
Select P
```

Das folgende Beispiel zeigt die Verwendung des Like-Operators:

```
From T In Timesheet 
Where T.Description Like '%time%' 
Select T
```

> [!NOTE]
> Wie in SQL unterstützt der Like-Operator von TCQL zwei Platzhalterzeichen: % steht für 0..n Zeichen, _ steht für genau ein Zeichen.

## Funktionen

TCQL enthält eine Reihe von Funktionen, die Sie in Ausdrücken verwenden können. time cockpit unterstützt derzeit die folgenden Funktionen:

Funktion | Beschreibung
--- | ---
`:AddDays(date-time-expression, number-of-days-to-add)` | 
`:AddHours(date-time-expression, number-of-hours-to-add)` | 
`:AddMinutes(date-time-expression, number-of-minutes-to-add)` | 
`:AddMonths(date-time-expression, number-of-months-to-add)` | 
`:AddSeconds(date-time-expression, number-of-seconds-to-add)` | 
`:AddYears(date-time-expression, number-of-years-to-add)` | 
`:BackreferenceFriendlyName(string-expression)` | gibt den Anzeigenamen des Rückverweises der übergebenen Beziehung zurück
`:Date(date-time-expression)` | 
`:Day(date-time-expression)` | 
`:DayOfWeek(date-time-expression)` | gibt den Index des Wochentags für einen Datums-/Zeitwert zurück: 0=Sonntag, 1-6=Montag-Samstag
`:DefaultDisplayPropertyFriendlyName(string-expression)` | gibt den Anzeigenamen der Standard-Anzeigeeigenschaft der Entität zurück
`:DisplayValue(alias)` | gibt den Wert der Standard-Anzeigeeigenschaft zurück)
`:FirstOfMonth(date-time-expression)` | 
`:FormatDate(date-expression, format-string)` | siehe [MSDN Library mit Details zu Formatzeichenfolgen](http://msdn.microsoft.com/en-us/library/az4se3k1.aspx)
`:FormatDateAsPeriod(date-expression)` | gibt YYYY/MM zurück<br/>`(#2010-10-07#)        // returns "2010/10"`<br/>`:FormatDateAsPeriod(#2010-10-07 23:59:59#)        // returns "2010/10"`
`:FormatDateCanonical(date-expression[, boolean-expression])` | siehe [MSDN Library zum kanonischen Datumsformat von SQL Server](http://msdn.microsoft.com/en-us/library/ms187928.aspx)<br/>`:FormatDateCanonical(#2010-10-07#)        // returns "2010-10-07"`<br/>`:FormatDateCanonical(#2010-10-07#, True)        // returns "2010-10-07 00:00:00"`
`:FormatNumber(numeric-expression, format-string)` | siehe [MSDN Library mit Details zu Formatzeichenfolgen](http://msdn.microsoft.com/en-us/library/dwhawy9k.aspx)
`:FriendlyName(string-expression)` | gibt den Anzeigenamen einer Eigenschaft zurück, die in der Modellpfad-Syntax angegeben ist, z. B. Timesheet.Description
`:GetDataContextType()` | gibt eine Zeichenkette zurück, die den Verbindungstyp bezeichnet
`:GetIsInSystemMode()` | gibt true zurück, wenn sich der Kontext im Systemmodus befindet
<code>:HasPermission(alias, ('Read' &#124; 'Insert' &#124; 'Update' &#124; 'Delete' &#124; 'Write'))</code> | prüft, ob der Benutzer Berechtigungen für die referenzierte Entität hat
`:Iif(condition, true-value, false-value)` | 
`:IsNullOrEmpty(string-expression)` | 
`:IsoWeek(date-time-expression)` | gibt die Kalenderwoche des date-time-expression gemäß der Definition der ersten Woche des Jahres nach ISO 8601 zurück; beachten Sie, dass diese Funktion in TCQL-Abfragen gegen SQL Compact Edition nicht unterstützt wird, sie kann nur im Speicher (z. B. in einem Formular oder einer Liste) oder gegen die Serverdatenbank ausgeführt werden
<code>:LastOfInterval(date-time-expression, ('Day' &#124; 'Month' &#124; 'Quarter' &#124; 'Year'))</code> | gibt den letzten Datums-/Zeitwert des übergebenen date-time-expression zurück
`:LastOfMonth(date-time-expression)` |
`:Len(string-expression)` | 
`:Month(date-time-expression)` | 
`:NewDate(year, month, day)` | 
`:Now()` | 
`:ObjectUuid(alias)` | gibt die eindeutige Kennung eines Datensatzes zurück<br/>`From T In Timesheet Where T.Description = 'Projectmanagement' Select New With { .Id = :ObjectUuid(T) }`
`:Quarter(date-time-expression)` | 
`:Replace(string-expression, string-to-find, replacing-string)` | 
`:Round(numeric-expression, number-of-fractional-digits)` | 
`:RoundDateTime(date-time-expression, minutes-decimal)` | rundet den übergebenen Datums-/Zeitwert auf die übergebenen Minuten
`:Soundex(string-expresssion)` | der Soundex-Code des Zeichenkettenarguments; derzeit unterstützt time cockpit Soundex nur im Server-DataContext (SQL Server), siehe [MSDN Library, Soundex T-SQL](http://msdn.microsoft.com/de-de/library/ms187384.aspx)
`:Substring(string-expression, start-index, length)` | start-index beginnt bei 1
`:Today()` | 
`:Translate(string-expression genericKey, string-expression fallback)` | gibt die lokalisierte Zeichenkette zum übergebenen generischen Schlüssel zurück, oder den Fallback, wenn der generische Schlüssel nicht gefunden wird
`:Year(date-time-expression)` | 

## Aggregatfunktionen

> [!NOTE]
> Anders als in SQL müssen Sie in TCQL keine Group-By-Klausel schreiben. Die TCQL-Laufzeitumgebung gruppiert automatisch nach jedem Ausdruck, der nicht innerhalb einer Aggregatfunktion verwendet wird.

Das folgende Beispiel zeigt zwei Abfragen mit Ausdrücken, die Aggregatfunktionen verwenden:

```
From T In Timesheet 
Select New With { 
        .TotalHours = Sum(T.DurationInHours) 
}

From T In Timesheet 
Select New With { 
        T.Project,
        .NumberOfBookings = Count() 
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

Das folgende Beispiel zeigt eine Unterabfrage in der `select`-Klausel. Beachten Sie, dass die Rückverweise der Beziehungen über mehrere Ebenen hinweg verwendet werden:

```
From Cg In CustomerGroup
Order By Cg.CustomerGroupCode
Select New With {
        Cg.CustomerGroupCode,
        .TotalHours = ( From T In Cg.Customers.Projects.Timesheets Select New With { .TotalHours = Sum(T.DurationInHours) } )
}
```

Das folgende Beispiel zeigt Unterabfragen sowohl in der `select`- als auch in der `where`-Klausel:

```
From C In Customer
Order By C.CustomerName
Select New With {
        C.CustomerName,
        .MaxProjectName = ( 
                From P In C.Projects 
                Where ( From T In P.Timesheets Select New With { .TotalDuration = Sum(T.DurationInHours) } ) > 5
                Select New With { .ProjectName = Max(P.ProjectName) } )
}
```

Das folgende Beispiel zeigt eine Unterabfrage in der `where`-Klausel:

```
From P In Project
Where ( From T In P.Timesheets 
        Select New With { .TotalHours = Sum(T.DurationInHours) } ) > 5
Select P
```

> [!NOTE]
> Derzeit unterstützt time cockpit Unterabfragen nur in TCQL-Abfragen, nicht jedoch in Elementen des Metadaten-Repositorys (z. B. berechnete Eigenschaften, Validierungsregeln).

## Ausdrücke mit Sets

Das folgende Beispiel zeigt eine Abfrage, die mit `In Set` eine Ergebnismenge anhand des Inhalts eines Sets filtert:

```
From C In CostCenter
Where C.Code In Set("MyCostCenters", "Code")
Select C
```

Das folgende Beispiel verwendet eine `In Set`-Klausel, um in der `Select`-Klausel einer Abfrage eine berechnete Spalte zu erzeugen:

```
From C In CostCenter
Select New With
{
        C.Code,
        C.Description,
        .IsOneOfMyCostCenters = :Iif(C.Code In Set("MyCostCenters"), True, False)
}
```

## Ausdrücke mit Environment

Das folgende Beispiel zeigt eine Abfrage, die mit `Environment.CurrentUser` eine Ergebnismenge anhand des aktuellen Benutzers filtert:

```
From U In UserDetail 
Where U.UserDetailUuid = Environment.CurrentUser.UserDetailUuid
Select U
```

Das folgende Beispiel könnte in einer Berechtigungsdefinition vorkommen. Damit ließe sich festlegen, dass nur der Benutzer mit dem Benutzernamen my.user@trash-mail.com in eine bestimmte Entität oder ein bestimmtes Feld schreiben darf.

```
Environment.CurrentUser.Username = 'my.user@trash-mail.com'
```
