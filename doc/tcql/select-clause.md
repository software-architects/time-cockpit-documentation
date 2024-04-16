# Select Clause (TCQL)

The `select`-clause defines the structure of the query result. It has the following syntax:

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

Name | Description
--- | ---
alias | Alias of the source entity as defined in the [from-clause](from-clause.md). The query's result will consist of instances of the type that is represented by the alias.
targetIdentifier | Name of the target entity. The target entity has to exist in time cockpit's metadata respository. The target identifier is optional. If you specify it the query's result will consist of instances of this type. If you do not specify it the result will consist of instances of a dynamically generated anonymous type.
memberAccess | Identifies a property or a relation of the source entity or of entities referenced by it.
targetColumnIdentifier | Name of the property in the dynamically generated anonymous result type.
expression | Expression that defines the result column. See [TCQL Expression Language](expression-language.md) for details.

> [!NOTE]
The `VersionInfoOnly`-attribute can be used in scripts or applications that sync data from or into time cockpit. If you specify this attribute the TCQL runtime will not read any data except version information about the corresponding rows. This versioning data can be used to identify new, changed or deleted rows that may have to be included in a sync process.

> [!NOTE]
Keywords in TCQL are case sensitive. Therefore you have to write `From`, you cannot write `from`. Additionally identifiers have to start with a capital letter. Therefore you cannot write `From p In Project...`. Instead you have to write `From P In Project...`. This behavior may change in future versions of time cockpit so that TCQL may be case insensitive in the future.

## Examples

The following example shows a simple select-clause:

```
// Return all Project entities
From P In Project Select P
```

The following example shows a select-clause resulting in a dynamically generated anonymous result type:

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
If the select-clause contains references to relations TCQL includes the referenced entities automatically. Therefore you need not explicitly add an Include element in the from-clause (see TCQL From Clause for details). However, you can add the include-clause explicitly if you want.

The following example shows a select-clause that creates a list of Project entities:

```
From C In Customer
Select New Project With {
        .ProjectName = "Project " + C.CustomerName,
        .NumberOfHours = 0
}
```
