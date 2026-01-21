---
title: Triggers - Automated Record Processing
description: Create triggers in time cockpit to automatically execute code when records are inserted, updated, or deleted. Advanced automation concept.
---
# Triggers

In time cockpit you can define so called Triggers. Similar to database trigges, triggers in time cockpit are little pieces of code that are executed automatically whenever a record of a given entity is either inserted, updated or deleted. Common scenarios of triggers in time cockpit are:

- Automatically generate unique codes for records that are to be inserted
- Extended validation of a records (e.g. does the budget of tasks exceed the budget of a project)
- Maintain the integrity of information in the database
Triggers are an advanced concept in time cockpit. Thus, they cannot be defined via the administration UI, but need to be scripted.

## Structure of Triggers

Triggers are represented as instances of the TimeCockpit.Data.DataModel.Triggers.Trigger class. In contrast to actions, triggers are always created for a given entity.

You have various possibilities to influence the behavior of a trigger.

### TriggerType

- `TriggerType.AfterSave`: Indicates that the trigger is executed after the actual record has been saved.
- `TriggerType.BeforeSave`: Indicates that the trigger is executed before the actual record has been saved.

### TriggerExecutionMode

This parameter has only an effect if you are using time cockpit's ChangeTracker. If perform a single save operation this parameter does not lead to different behavior.

- `TriggerExecutionMode.Once`: Indicates that the trigger is executed once for all records of a given entity in a change tracker.
- `TriggerExecutionMode.OnEverySave`: Indicates that the trigger is executed for each record of a given entity in a change tracker.

### TriggerExecutionTime

- `TriggerExecutionTime.OnInsert`: Indicates that the trigger is executed when a record is inserted for the first time.
- `TriggerExecutionTime.OnUpdate`: Indicates that the trigger is executed when a record already existed in the database and is updated.
- `TriggerExecutionTime.OnDelete`: Indicates that the trigger is executed when a record already existed in the database and is deleted.

> [!NOTE]
Note that TriggerExecutionTime is a Flag Enum property. That is, you can combine OnInsert, OnUpdate and OnDelete via the | operator.

As with triggers in a database, you can access the affected records that are inserted/updated/deleted in the trigger. For that purpose, the trigger offers two collections:

### Inserted

- Insert operation: The Inserted collection contains the records that are to be inserted.
- Update operation: The Inserted collection contains the records that are to be updated with their new values.
- Delete operation: The Inserted collection is empty.

### Deleted

- Insert operation: The Inserted collection is empty.
- Update operation: The Inserted collection contains the records that are to be updated with their old values.
- Delete operation: The Inserted collection contains the records that are to be deleted.

## Create and Update Triggers

The following example creates or updates a trigger from a Python source file:

[!code-python[Create or update trigger](code/create-update-trigger.py)]

## Trigger Code

The following example shows the code for a trigger. Note that the trigger code must only consist of one IronPython method definition.

[!code-python[Set trigger code](code/note-trigger-code.py)]

## IncludeClause Processing Directive

To get the old values a trigger that is configured to run on updates needs to fetch the old values of a record from the database. By default, the trigger generates a TCQL query and includes all the relations that it thinks necessary. With big data models that can lead to a negative performance impact.

Thus, a trigger can optionally contain a processing directive `# IncludeClause` that specifies which relations should be included. The directive code has to be in the first lines of the triggers's code with no emplty lines before in between. The `IncludeClause` directive is implemented as a IronPython comment. It has the following syntax:

```
<includeClauseDirective> ::=
  [ # IncludeClause 
        ( NoInclude 
          | .Include(*)
          | .Include(<relation_path>)[.Include(<relation_path>)...] ) ]
  [ # SelectSettings.AutoIncludeRelations ( true | false ) ]

<relation_path> ::=
  "<relation_name>[.<relation_name>...]"
 ```

Let's assume the following trigger is used for time sheet entries. The `# IncludeClause` specifies that Tasks, Projects, Customers and Invoices should be included.

```
# IncludeClause .Include('APP_Task.APP_Project.APP_Customer').Include('Invoice')

clr.AddReference("System")
clr.AddReference("PresentationFramework")
clr.AddReference("System.Core")

...
```

If you do not want to include relations, use the following include processing directive: `# IncludeClause NoInclude`. Note that this directive does not suppress including relations that are necessary for calculated properties, validation rules, etc.

To specify that you want to include only the relations that you explicitly mention in the `# IncludeClause .Include(...)` directive without automatically including relations that are necessary for calculated properties, validation rules or permissions, specify the following directive: `# SelectSettings.AutoIncludeRelations` false. This is useful if you just need few properties of the selected entities like for example the Uuids of the entity.

If you do not want to include any relations, you have to combine `# SelectSettings.AutoIncludeRelations false` and `# IncludeClause NoInclude`.

> [!NOTE]
Be careful to use `# SelectSettings.AutoIncludeRelations false` if you will save the selected entities in the trigger. Validation rules and permissions will not work as expected if the necessary relations are not loaded.