# Customize Entities

This chapter gives an overview of what can be customized in time cockpit and how.

## A Metadata-driven Approch

time cockpit is driven by metadata. That is, as much information about customer-specific customizations as possible (entities, properties, relations, validation rules etc.) is configured in the data model. In most of the cases customizations of the data model influence how the user interface looks and behaves.

Example: The standard data model featues a validation rule ```APP_ValidateCustomerSet``` which ensures that every project is assigned to a customer. By adding this validation rule to the data model, the user interface shows a validation error if the validation rule is not satisfied that is, no customer is set. Further, if a project is created via script ([Modifying the Model](~/doc/scripting/modify-data-model.md)) or the ([Web API](~/doc/web-api/overview.md)) without a customer, the validation error will also prevent saving the invalid project. Other examples of information in the data model that drives the user interface are formatting options of date/time or numeric fields.

## Editing Entities

In the ```Customization``` module, a tree of all the entities, lists, forms, actions, modules, and sets contained in the data model are displayed. These can only be edited on the ```Server``` in order to avoid synchronization conflicts at data model level.

> [!NOTE]
Each entity in the time cockpit data model corresponds to a table in the underlying database.

![Edit Entity](images/edit-entity.png "Edit Entity")

In the editor you can add and modify the properties of the entity, relationships to other entities, validation rules, permissions, and interfaces provided by the entity. Basically, each of the different elements can be added with the ```New item``` button in the Ribbon. The ```New item``` button is context-dependent, ie a new element of the selected type is created depending on which subgroup is selected on elements (properties, relationships, etc.).

> [!NOTE]
The deletion of properties and relations, as well as the insertion of properties where no null values are allowed, represent operations which should be handled with particular care. If several users or devices have already been set up and an entity for which data already exists is edited, conflicts can occur during synchronization.

![Edit Project](images/edit-project.png "Edit Project")

## System Properties of an Entity

* **Invariant friendly name:** The invariant friendly name represents the name of an entity in a user-friendly form. Each entity has two names. On the one hand, a unique technical name (e.g. ```APP_Project```) is assigned when an entity is created. This name is used as a table name in the database and appears only in the administration area. The invariant friendly name is shown in the user interface.

* **Default display property**: The default display property indicates which property is displayed by default (e.g., in a combo box) when an instance of an entity is displayed in the user interface. For example, in the case of customers, the default display property is ```CompanyName```.

![Default Display Property](images/default-display-property.png "Default Display Property")

* **Default list:** Users can create custom lists for entities (see [Custom Lists](~/doc/scripting/customizing-lists.md)) These custom lists can be set as a default list for an entity. If, for example, a list "MyProjectList" is defined for a project and set as a default list, MyProjectList is used in the user interface whenever a list of projects needs to be displayed. If no default list is selected, time cockpit automatically generates a list of all properties and relations of an entity on the fly.

* **Default list for relations:** Users can create a custom list for an entity and set it as default list for relations. Example: If the entity ```APP_Project``` has a custom list for relations "CustomProjectRelationList", the list is used in the user interface whenever a list of projects needs to be displayed in a combo box.

* **Default form:** The default form property behaves similar to the default list property. The only difference is that a default form is used by the user interface whenever a single instance of a record (e.g., a project) is to be displayed. If no default form is stored, time cockpit generates a form with all properties and relations of the entity.

## Properties

Properties can be managed in the editing mode of an entity. To create a property, select the ```Properties``` subgroup so that the ```New item``` button creates a new property. Time cockpit provides various predefined types of properties. Each of these different types has its own representation in the user interface.

> [!NOTE]
Each property in the time cockpit data model corresponds to a column in a table in the underlying database

* **Text properties:** Text properties are used to store text. ```Maximum length``` allows users to define how long (in characters) the text may be. Text properties with a length of less than 100 characters are represented in the user interface with a single line input field. Texts with a maximum length of more than 100 lines are represented with multi-line input fields (this behavior can be changed in the respective form).

* **Date properties:** Date properties are used to store date values without time. With ```date format```, users can define in which format a date value is displayed in the user interface. For possible values for date formats, see [Format Strings](http://msdn.microsoft.com/en-us/library/zdtaw1bw.aspx).

* **DateTime properties:** DateTime properties are used to store date values with time. As with date properties, users can specify with ```date format``` in which format a date and time property is displayed in the user interface. Possible values for date formats can be found at [Format Strings](http://msdn.microsoft.com/en-us/library/zdtaw1bw.aspx).

* **Numeric property:** Numeric properties are used to store numeric values. For numeric properties, different parameters can be defined:
  * Maximum number of digits: Sets the maximum number of digits before and after the number's comma.
  * Number of decimal places: Specifies the number of digits after the comma. That is, the number of decimal places for a number 3 is configured, the numeric value for the number property is rounded to 3 decimal places.
  * Number format: Similar to date properties, the format can also be defined for number properties. For possible values, see [Format Strings](https://msdn.microsoft.com/en-us/library/fzeeb5cd.aspx).
  * Aggregation function: The aggregation function defines the behavior of a numeric property in the case of a grouping in a list. For example, if a project list is grouped by customer, and the budget property is stored as an aggregation function ```Sum```, the values of budget per customer are added up and a total sum is displayed.
* **Boolean property:** Boolean properties are used to store true / false values.
* **Calculated property:** Calculated properties are used to calculate values using [TCQL expressions](~/doc/tcql/expression-language.md). With calculated properties, non-concrete values are stored in the database, but only the formulas that lead to a value. For example, an example of a calculated property on the entity ```APP_Project``` is ```FullName```. The formula for determining the full name of a project is ```:Iif(Current.Customer = Null, '(n/a).', Current.Customer.Code + '.') + Current.Code```. As can be seen from the formula, the calculated property accesses other properties of the project entity and determines a project name for a project.
  
  
  
