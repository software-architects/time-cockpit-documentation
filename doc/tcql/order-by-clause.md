# Order By Clause (TCQL)

The order by-clause is used to sort the result. It has the following syntax:

```
<orderByClause> ::=
  Order By <expression> [ Asc | Desc ] [, <expression> [ Asc | Desc ] ]
```

Name | Description
--- | ---
expression | Expression that defines the sort order. See [TCQL Expression Language](expression-language.md) for details.

> [!NOTE]
Keywords in TCQL are case sensitive. Therefore you have to write From, you cannot write from. Additionally identifiers have to start with a capital letter. Therefore you cannot write From p In Project.... Instead you have to write From P In Project... . This behavior may change in future versions of time cockpit so that TCQL may be case insensitive in the future.

## Examples

The following example shows a simple order by-clause:

```
From P In Project
Order By P.ProjectUuid
Select P
```

The following example shows a order by-clause with nested sort criteria:

```
From P In Project.Include('CustomerRelation')
Order By P.ProjectName, P.CustomerRelation.CustomerName Asc
Select New With
{
        P.ProjectName,
        P.CustomerRelation.CustomerName
}
```