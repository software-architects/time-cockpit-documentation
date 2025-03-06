# Where Clause (TCQL)

The `where`-clause can be used to add conditions that the data from the source has to fulfill in order to be included in the query's result. It has the following syntax:

```
<whereClause> ::=
  Where <searchCondition>
```

Name | Description
--- | ---
searchCondition | Expression that defines the condition. See [TCQL Expression Language](expression-language.md) for details.

> [!NOTE]
Keywords in TCQL are case sensitive. Therefore you have to write From, you cannot write from. Additionally identifiers have to start with a capital letter. Therefore you cannot write From p In Project.... Instead you have to write From P In Project... . This behavior may change in future versions of time cockpit so that TCQL may be case insensitive in the future.

## Examples

The following example shows a simple where-clause:

```
// Return all billable timesheets
From T In Timesheet Where T.Billable=True Select T
```

The following example shows a where-clause using a TCQL function:

```
// Return all timesheets of projects whose name starts with "Software"
From P In Project Where :Substring(P.ProjectName, 1, 8) = "Software" Select P
```

The following example shows a where-clause using a more complex condition with inline Iif.

```
// Filter using Iif-function
From P In Project Where :Iif(P.ProjectName="Software Architects' TimeCockpit", "Hello World", "Nevermind") = "Hello World" Select P
```

The following example shows a where-clause that references a relation.

> [!NOTE]
If the `where-clause` contains references to relations TCQL includes the referenced entities automatically. Therefore you need not explicitly add an Include element in the from-clause (see [TCQL From Clause](from-clause.md) for details).

```
// Return all projects that have a relation to customer "software architects"
From P In Project Where P.CustomerRelation.CustomerCode = "software architects" Select P
```