# Actions

In time cockpit's model you can define Actions. Actions can be used for workflows, creating invoices, etc. In general you can use actions whenever you want to build a certain behavior that is not built in time cockpit out of the box.

## Structure of Actions

Actions are represented as instances of the <xref:TimeCockpit.Data.DataModel.Actions.ModelAction> class. You can add an action to the model using the [ModelActions](xref:TimeCockpit.Data.DataModel.Model#TimeCockpit_Data_DataModel_Model_Actions) property.

You can define conditions that have to be fulfilled in order to be able to execute an action. Every condition is represented by an instance of the <xref:TimeCockpit.Data.DataModel.Condition> class or one of it's descendant classes. The most important condition is the <xref:TimeCockpit.Data.DataModel.Actions.ModelEntityTypeCondition>. It can be used to specify that a certain action can only be used on instances of a certain entity type.

An action can have an optional parameter. The parameter is represented by an instance of the <xref:TimeCockpit.Data.DataModel.Actions.ModelActionParameterDefinition> class or one of it's descendant classes. A parameter can be used to ask a user for additional data that is necessary to perform the corresponding action.

Last but not least every action must have a binding. The binding defines where the code for the action comes from. Currently time cockpit only supports actions written in Python. Therefore you have to use <xref:TimeCockpit.Data.DataModel.Actions.IronPythonBinding>.

## Create and Update Actions

The following example creates an action from a Python source file:

[!code-python[Create action](code/create-action.py)]

The following example updates an action from a Python source file. It adds a filter entity to the action which is shown before the action is executed.

[!code-python[Update action](code/update-action.py)]

## Action Code

The following example shows the code for an action. Note that the action code must only consist of Python method definitions. The action receives one parameter of type <xref:TimeCockpit.Data.DataModel.Actions.ExecutionContext>.

[!code-python[Set action code](code/create-invoice-action-code.py)]

## Using the InputSet

Before an action is executed, time cockpit reloads the corresponding data rows before it passes them to the action via the `InputSet` property. This is necessary to make sure that the entire rows including all dependent objects are in memory. A list could have been optimized to load only a subset of the columns of a model entity. If time cockpit would not reload the data rows before executing the action, the action would possibly get incomplete data.

> [!WARNING]
Be aware that the input set does not guarantee a defined object order. Sorting may be required depending on the use-case.

For reloading the entities, time cockpit generates a [TCQL statement](~/doc/tcql/overview.md) with the following structure: `From C In [ModelEntityName][IncludeClause] Where C.[ModelEntityName]Uuid In {[SelectedUuids]} Select C`.

The <xref:TimeCockpit.Data.DataModel.ModelEntity> is determined by the list or form in which the user has called the action. If the user calls an action in the time sheet calendar, the underlying <xref:TimeCockpit.Data.DataModel.ModelEntity> is always `TimeSheet`.

The SelectedUuids are determined by the form, the selected items in the list, or the selected items in the time sheet calendar.

The `IncludeClause` (more about include clauses in [TCQL](~/doc/tcql/overview.md)) is determined by the following factors:

- The action can contain a processing directive # IncludeClause that specifies which relations should be included (details see chapter [IncludeClause Processing Directive](#includeclause-processing-directive)).

- If no [IncludeClause directive](#includeclause-processing-directive) is specified in the action, time cockpit looks for the default form of the affected <xref:TimeCockpit.Data.DataModel.ModelEntity>. If the form has specified an `IncludeClause`, this `IncludeClause` is used. This does not work if an expression is specified for the default form of a <xref:TimeCockpit.Data.DataModel.ModelEntity>. As multiple entities may be affected by an action, time cockpit cannot determine one default form if an expression is used.

- If there is no [IncludeClause directive](#includeclause-processing-directive) in the action and no default form can be determined, time cockpit uses the include clause `.Include(*)`. This means that all relations are recursively included. If the affected entities have lots of relations, the TCQL statement can become quite large and therefore slow. To improve the performance of the action, add an [IncludeClause directive](#includeclause-processing-directive) that specifies all relations that are really necessary to run the action.

## IncludeClause Processing Directive

An action can optionally contain a processing directive `# IncludeClause` that specifies which relations should be included. The directive code has to be in the first lines of the action's code with no empty lines before or in between. The `IncludeClause` directive is implemented as a Python comment. It has the following syntax:

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

Let's assume the following action is used for time sheet entries. The `# IncludeClause` specifies that Tasks, Projects, Customers and Invoices should be included.

```
# IncludeClause .Include('APP_Task.APP_Project.APP_Customer').Include('Invoice')

clr.AddReference("System")
clr.AddReference("PresentationFramework")
clr.AddReference("System.Core")

...
```

If you do not want to include relations, use the following include processing directive: `# IncludeClause NoInclude`. Note that this directive does not suppress including relations that are necessary for calculated properties, validation rules, etc.

To specify that you want to include only the relations that you explicitly mention in the `# IncludeClause .Include(...)` directive without automatically including relations that are necessary for calculated properties, validation rules or permissions, specify the following directive: `# SelectSettings.AutoIncludeRelations false`. This is useful if you just need few properties of the selected entities like for example the Uuids of the entity.

If you do not want to include any relations, you have to combine `# SelectSettings.AutoIncludeRelations false` and `# IncludeClause NoInclude`.

> [!NOTE]
Never use `# SelectSettings.AutoIncludeRelations false` if you will save the selected entities in the action. Validation rules and permissions will not work as expected if the necessary relations are not loaded.
