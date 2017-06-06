# From Clause (TCQL)

The `from`-clause defines the source entity for the TCQL query. It has the following syntax:

```
<fromClause> ::=
  From <alias> In <source>

<source> ::=
  <entity_name>[.Include(<relation_path>)[.Include(<relation_path>)...]]

<relation_path> ::=
  "<relation_name>[.<relation_name>...]"
  | *
```

Name | Description
--- | ---
alias | Alias for the source entity. You have to use this alias to reference members of the source entity in other parts of the TCQL query.
entity_Name | Name of the source entity. The source entity has to exist in time cockpit's metadata respository.
relation_path | Name of the relation that should be loaded together with the source entity. If you want to include subrelations, too, you have to include the name of the subrelation separated with dots (see example section below). If you want to include all subrelations recursively you can specify `.Include(*)`.

> [!WARNING]
Recursively including all subrelations with .Include(*) can result in large and complex queries that consume a lot of resources on the database. It is recommended to include only those relations that are really necessary to implement the corresponding query.

> [!NOTE]
Keywords in TCQL are case sensitive. Therefore you have to write From, you cannot write from. Additionally identifiers have to start with a capital letter. Therefore you cannot write From p In Project.... Instead you have to write From P In Project... . This behavior may change in future versions of time cockpit so that TCQL may be case insensitive in the future.

## Examples

The examples shown here assume that there is a `Timesheet` entity with a n:1 relation named `Project` that points to the projects that each timesheet record can be assigned to. Each project has a n:1 relation named `ProjectGroup` a n:1 relation named `Customer`. The target entities of these relations can be used to group projects by project group or customer.

The following example shows a simple `from`-clause without includes:

```
// Return all Project entities
From P In Project Select P
```

The following example shows a from-clause that includes a related entity:

```
// Return all Project entities and load their project group, too
From P In Project.Include("ProjectGroup") Select P
```

The following example shows a from-clause that includes multiple related entities:

```
// Return all Project entities and load their project group and customer, too
From P In Project.Include("ProjectGroup").Include("Customer") Select P
```

The following example shows a from-clause that includes a related entity with a subrelation:

```
// Return all Timesheet entities and load their project plus the related customer, too
From T In Timesheet.Include("Project.Customer") Select T
```