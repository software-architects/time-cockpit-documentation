# Customize Entities

This chapter gives an overview of what can be customized in time cockpit and how.

## A Metadata-driven Approch

time cockpit is driven by metadata. That is, as much information about customer-specific customizations as possible (entities, properties, relations, validation rules etc.) is configured in the data model. In most of the cases customizations of the data model influence how the user interface looks and behaves.

Example: The standard data model featues a validation rule ```APP_ValidateCustomerSet``` which ensures that every project is assigned to a customer. By adding this validation rule to the data model, the user interface shows a validation error if the validation rule is not satisfied that is, no customer is set. Further, if a project is created via script ([Modifying the Model](~/doc/scripting/modify-data-model.md)) or the ([Web API](~/doc/web-api/overview.md)) without a customer, the validation error will also prevent saving the invalid project. Other examples of information in the data model that drives the user interface are formatting options of date/time or numeric fields.

## Editing Entities



![Multi select in grid](images/2017-04/multi-select.png "Multi select in grid")
