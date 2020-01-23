# Expression Language (TCQL)

time cockpit contains an expression language that you can use in TCQL queries as well as in various other places inside the product (e.g. calculated properties in time cockpit's metadata repository are defined using the TCQL expression language.

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

Name | Description
--- | ---
functionNameIdentifier | Name of the function that has to be called. The number and types of the parameters depend on the function that is called.
guidLiteral | Literal that represents a globally unique identifier. TCQL uses Windows' registry format for guid literals (e.g. `{3F860049-3A74-4d54-9ACA-80B2BC0152FC}`).
stringLiteral | String constants; you can use single quotes or double quotes for string (e.g. `'Hello World'` or `"Hello World"`).
dateTimeLiteral, dateLiteral and timeLiteral | Literals for date and time values have to be enclosed in hashes (#; e.g. #2010-01-01#). TCQL only supports the format `YYYY-MM-DD` for dates, `HH:MM:SS` for time (24-hour format) and `YYYY-MM-DD HH:MM:SS` for date + time literals.
parameterNameIdentifier | Name of a parameter that has been passed to the TCQL query from the calling script or program.
propertyOfUserDetailEntity | Name of a property in the entity `APP_UserDetail`. You have access to a user's internal identification GUID using `UserDetailUuid`.

> [!NOTE]
Keywords in TCQL are case sensitive. Therefore you have to write `From`, you cannot write `from`. Additionally identifiers have to start with a capital letter. Therefore you cannot write `From p In Project...`. Instead you have to write `From P In Project...`. This behavior may change in future versions of time cockpit so that TCQL may be case insensitive in the future.

## Simple Expressions

The following example shows an expression that returns the value of a property (i.e.memberAccess-clause):

```
Current.CustomerCode
```

The following example shows an expression that combines the result of two comparision operations:

```
C.CustomerCode="Test" And C.CustomerName="Test"
```

The following example shows an expression with arithmethic operations:

```
Current.ProcessName = 'calc' And (Current.EndTime - Current.BeginTime) * 24 * 60 < 0.25
```

> [!NOTE]
In TCQL you can use the subtract-operator (-) with date + time values. If you subtract two date + time values you will get the number of days between the two values. TCQL behaves just like Microsoft Office Excel (e.g. `#2010-01-02# - #2010-01-01#` will result in `1.0, #2010-01-01 14:00:00# - #2010-01-01 12:00:00#` will result in `2 / 24 = 0.083333...`).

The following example demonstrates how you can use the add operator to concat strings:

```
Current.ProjectName + ': ' + Current.NumberOfHours
```

The following example shows the use of the In-operator:

```
From P In Project 
Where :Iif(P.NumberOfHours=0, 1, P.NumberOfHours) In ( 1, 2 ) 
Select P
```

The following example shows the use of the Like-operator:

```
From T In Timesheet 
Where T.Description Like '%time%' 
Select T
```

> [!NOTE]
Just like in SQL TCQL's Like operator supports two wildcard characters: % is the wildcard for 0..n characters, _ stands for exactly one character.

## Functions

TCQL contains a number of functions that you can use in expressions. time cockpit currently supports the following functions:

Function | Description
--- | ---
`:AddDays(date-time-expression, number-of-days-to-add)` | 
`:AddHours(date-time-expression, number-of-hours-to-add)` | 
`:AddMinutes(date-time-expression, number-of-minutes-to-add)` | 
`:AddMonths(date-time-expression, number-of-months-to-add)` | 
`:AddSeconds(date-time-expression, number-of-seconds-to-add)` | 
`:AddYears(date-time-expression, number-of-years-to-add)` | 
`:BackreferenceFriendlyName(string-expression)` | returns the friendly name of the backreference of the relation passed
`:Date(date-time-expression)` | 
`:Day(date-time-expression)` | 
`:DayOfWeek(date-time-expression)` | returns the weekday index for a given datetime: 0=Sunday, 1-6=Monday-Saturday
`:DefaultDisplayPropertyFriendlyName(string-expression)` | returns the friendly name of the default display property of the entity
`:DisplayValue(alias)` | returns the value of the default display property)
`:FirstOfMonth(date-time-expression)` | 
`:FormatDate(date-expression, format-string)` | see [MSDN Library for details about format strings](http://msdn.microsoft.com/en-us/library/az4se3k1.aspx)
`:FormatDateAsPeriod(date-expression)` | returns YYYY/MM<br/>`(#2010-10-07#)        // returns "2010/10"`<br/>`:FormatDateAsPeriod(#2010-10-07 23:59:59#)        // returns "2010/10"`
`:FormatDateCanonical(date-expression[, boolean-expression])` | see [MSDN Library for SQL Server's canonical date format](http://msdn.microsoft.com/en-us/library/ms187928.aspx)<br/>`:FormatDateCanonical(#2010-10-07#)        // returns "2010-10-07"`<br/>`:FormatDateCanonical(#2010-10-07#, True)        // returns "2010-10-07 00:00:00"`
`:FormatNumber(numeric-expression, format-string)` | see [MSDN Library for details about format strings](http://msdn.microsoft.com/en-us/library/dwhawy9k.aspx)
`:FriendlyName(string-expression)` | returns the friendly name of a property specified in the model path syntax, e.g. Timesheet.Description
`:GetDataContextType()` | returns a string identifying the type of connection
`:GetIsInSystemMode()` | returns true if the context is in system mode
<code>:HasPermission(alias, ('Read' &#124; 'Insert' &#124; 'Update' &#124; 'Delete' &#124; 'Write'))</code> | checks whether the user has permissions concerning the referenced entity
`:Iif(condition, true-value, false-value)` | 
`:IsNullOrEmpty(string-expression)` | 
`:IsoWeek(date-time-expression)` | returns the calendar week number of the date-time-expression based on the ISO 8601 definition for the first week of the year; note that this function is not supported in TCQL queries executed against SQL Compact Edition, it can only be executed in memory (e.g. in a form or list) or against the server database
<code>:LastOfInterval(date-time-expression, ('Day' &#124; 'Month' &#124; 'Quarter' &#124; 'Year'))</code> | returns the last date time value of the passed in date-time expression
`:LastOfMonth(date-time-expression)` |
`:Len(string-expression)` | 
`:Month(date-time-expression)` | 
`:NewDate(year, month, day)` | 
`:Now()` | 
`:ObjectUuid(alias)` | returns the unique identifier of a record<br/>`From T In Timesheet Where T.Description = 'Projectmanagement' Select New With { .Id = :ObjectUuid(T) }`
`:Quarter(date-time-expression)` | 
`:Replace(string-expression, string-to-find, replacing-string)` | 
`:Round(numeric-expression, number-of-fractional-digits)` | 
`:RoundDateTime(date-time-expression, minutes-decimal)` | rounds the passed date time value to the minutes passed
`:Soundex(string-expresssion)` | the Soundex code of the string argument, currently ime cockpit only supports Soundex on the Server DataContext (SQL Server), see [MSDN Library, Soundex T-SQL](http://msdn.microsoft.com/de-de/library/ms187384.aspx)
`:Substring(string-expression, start-index, length)` | 
`:Today()` | 
`:Translate(string-expression genericKey, string-expression fallback)` | returns the localized string of the generic key passed in, or the fallback if the generic is not found
`:Year(date-time-expression)` | 

## Aggregation Functions

> [!NOTE]
In contrast to SQL you do not have to write a group by clause in TCQL. The TCQL runtime will include a grouping for every expression that is not used inside an aggregation function.

The following example shows two queries that include expressions using aggregation functions:

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

## Sub-Queries

TCQL supports the use of sub-queries in the `select` and the `where`-clause. You can reference entities using the relations' back reference names.

The following example shows the use of a subquery in the `select`-clause:

```
From P In Project
Order By P.ProjectName
Select New With {
        P.ProjectName,
        .TotalHours = ( From T In P.Timesheets Select New With { .TotalHours = Sum(T.DurationInHours) } )
}
```

The following example shows the use of a sub-query in the `select`-clause. Note that the relations' back references are used over multiple levels:

```
From Cg In CustomerGroup
Order By Cg.CustomerGroupCode
Select New With {
        Cg.CustomerGroupCode,
        .TotalHours = ( From T In Cg.Customers.Projects.Timesheets Select New With { .TotalHours = Sum(T.DurationInHours) } )
}
```

The following example shows the use of a sub-queries both in the `select` and the `where`-clause:

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

The following example shows the use of a sub-query in the `where`-clause:

```
From P In Project
Where ( From T In P.Timesheets 
        Select New With { .TotalHours = Sum(T.DurationInHours) } ) > 5
Select P
```

> [!NOTE]
By now time cockpit only supports sub-queries in TCQL queries but not in elements of the metadata repository (e.g. calculated properties, validation rules).

## Expressions Using Sets

The following example shows a query that uses `In Set` to filter a result set based on the content of a set:

```
From C In CostCenter
Where C.Code In Set("MyCostCenters", "Code")
Select C
```

The following example uses a `In Set` clause to create a calculated column in the `Select` clause of a query:

```
From C In CostCenter
Select New With
{
        C.Code,
        C.Description,
        .IsOneOfMyCostCenters = :Iif(C.Code In Set("MyCostCenters"), True, False)
}
```

## Expressions Using Environment

The following example shows a query that uses `Environment.CurrentUser` to filter a result set based on the current user:

```
From U In UserDetail 
Where U.UserDetailUuid = Environment.CurrentUser.UserDetailUuid
Select U
```

The following example could appear in a permission definition. It could be used to define that only the user with the user name my.user@trash-mail.com is allowed to write to a specific entity or field.

```
Environment.CurrentUser.Username = 'my.user@trash-mail.com'
```
