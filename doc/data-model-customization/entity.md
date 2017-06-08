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

In the editor you can add and modify the properties of the entity, relationships to other entities, validation rules, permissions, and interfaces provided by the entity. Basically, each of the different elements can be added with the ```New``` button in the Ribbon. The ```New``` button is context-dependent, ie a new element of the selected type is created depending on which subgroup is selected on elements (properties, relationships, etc.).
