---
title: Modify Data Model - Script Examples
description: Modify time cockpit's data model using IronPython scripts. Add properties, entities, relations, and calculated properties programmatically.
---
# How To: Modify the Data Model

time cockpit is based on a model that defines the data structures, user interface, logic and workflows in the system. You can modify the model using time cockpit's user interface of [IronPython](http://ironpython.net/) scripts. The basics about how to access the model have been described in chapter [Basics for time cockpit scripts](overview.md#basics-for-time-cockpit-scripts). In this chapter we will cover details about how to modify models from scripts.

## Properties

Every entity (<xref:TimeCockpit.Data.DataModel.ModelEntity>) consists of a list of properties ([ModelEntityBase.Properties](xref:TimeCockpit.Data.DataModel.ModelEntityBase#TimeCockpit_Data_DataModel_ModelEntityBase_Properties)). You can add, update and remove properties. If you save a model using [DataContext.SaveObject](xref:TimeCockpit.Data.DataContext#TimeCockpit_Data_DataContext_SaveModel_TimeCockpit_Data_DataModel_Model_). time cockpit will change the underlying database accordingly.

A property (<xref:TimeCockpit.Data.DataModel.ModelProperty>) can either be a property that is stored in the database (<xref:TimeCockpit.Data.DataModel.PersistedProperty>) or a property that is calculated on the fly (<xref:TimeCockpit.Data.DataModel.CalculatedProperty>).

The following example shows how to create a model entity with properties in a Python script. Note that in this example properties are defined using their constructor.

```cs
model = Context.GetWritableModel()

# Project 
if model.Entities.Contains("Project") == False:
  project = ModelEntity({ "Name": "Project", "InvariantFriendlyName": "Projekt" })
  project.Properties.Add(TextProperty({ "Name": "Code", "InvariantFriendlyName": "Projektcode", "MaxStorageSize": 50, "IsNullable": False }))
  project.Properties.Add(DateTimeProperty({ "Name": "StartDate", "InvariantFriendlyName": "Startdatum", "FractionalSecondsPrecision": 1, "DefaultValueExpression": "#2010-01-01#", "IsNullable": False }))
  project.Properties.Add(DateTimeProperty({ "Name": "EndDate", "InvariantFriendlyName": "Endedatum", "FractionalSecondsPrecision": 1 }))
  project.Properties.Add(NumericProperty({ "Name": "InvoicedHourlyRate", "InvariantFriendlyName": "Verrechneter Stundensatz", "Scale": 2 }))
  model.Entities.Add(project)
  Context.SaveModel(model)
```

## Relations

Entities (<xref:TimeCockpit.Data.DataModel.ModelEntity>) can have relations ([ModelEntityBase.Relations](xref:TimeCockpit.Data.DataModel.ModelEntityBase#TimeCockpit_Data_DataModel_ModelEntityBase_Relations) to other entities. You can add, update and remove relations. If you save a model using [DataContext.SaveObject](xref:TimeCockpit.Data.DataContext#TimeCockpit_Data_DataContext_SaveModel_TimeCockpit_Data_DataModel_Model_), time cockpit will change the underlying database accordingly.

> [!WARNING]
time cockpit does not support the use of hierarchical relations in the moment. You can define hierarchical relationships in the database but the user interface does not treat them correctly

The following example shows how to create a model entity with relations in a Python script.

```cs
model = Context.GetWritableModel()

# Project 
if model.Entities.Contains("Project") == False:
  project = ModelEntity({ "Name": "Project", "InvariantFriendlyName": "Projekt" })
  project.Relations.Add(Relation({ "Name": "Customer", "InvariantFriendlyName": "Kunde", "Target": model.Customer, "BackReferenceName": "Projects" }))
  project.Relations.Add(Relation({ "Name": "ProjectType", "InvariantFriendlyName": "Projekttyp", "Target": model.ProjectType, "BackReferenceName": "Projects" }))
  model.Entities.Add(project)
  Context.SaveModel(model)
```

## Validation Rules

Entities (<xref:TimeCockpit.Data.DataModel.ModelEntity>) can have rules that define whether their content is valid ([ModelEntityBase.ValidationRules](xref:TimeCockpit.Data.DataModel.ModelEntityBase#TimeCockpit_Data_DataModel_ModelEntityBase_ValidationRules)). You can add, update and remove validation rules.

Validation rules are based on time cockpit's [TCQL expression language](~/doc/tcql/overview.md).

The following example shows how to create a model entity with a validation rule in a Python script.

```
model = Context.GetWritableModel()

# Project 
if model.Entities.Contains("Project") == False:
  project = ModelEntity({ "Name": "Project", "InvariantFriendlyName": "Projekt", "ElementGuid": Guid("410b6010-5de7-4c66-93a7-dd1fc8089980") })
  project.Properties.Add(TextProperty({ "Name": "Code", "InvariantFriendlyName": "Projektcode", "MaxStorageSize": 50, "IsNullable": False }))
  project.Properties.Add(TextProperty({ "Name": "ProjectName", "InvariantFriendlyName": "Projekttitel", "MaxStorageSize": 100, "IsDefaultDisplayProperty": True, "IsNullable": False }))
  project.Properties.Add(TextProperty({ "Name": "Description", "InvariantFriendlyName": "Projektbeschreibung", "MaxStorageSize": 4000 }))
  project.Relations.Add(Relation({ "Name": "ProjectManagerInternal", "InvariantFriendlyName": "Interner Projektleiter", "Target": model.UserDetail, "BackReferenceName": "Projects" }))
  project.Properties.Add(TextProperty({ "Name": "ProjectManagerExternal", "InvariantFriendlyName": "Externer Projektleiter", "MaxStorageSize": 100 }))
  project.Properties.Add(DateTimeProperty({ "Name": "StartDate", "InvariantFriendlyName": "Startdatum", "FractionalSecondsPrecision": 1, "DefaultValueExpression": "#2010-01-01#", "IsNullable": False }))
  project.Properties.Add(DateTimeProperty({ "Name": "EndDate", "InvariantFriendlyName": "Endedatum", "FractionalSecondsPrecision": 1 }))
  project.ValidationRules.Add(ValidationRule({ "Name": "ValidateStartDateLowerEqEndDate", "Condition": "(Current.EndDate = Null Or Current.EndDate > Current.StartDate)", "Perpetrator" : "EndDate", "Message" : "Enddatum muss >= Startdatum sein" }))
  project.Properties.Add(TextProperty({ "Name": "TFSProject", "InvariantFriendlyName": "Projektname in TFS", "MaxStorageSize": 100 }))
  project.Relations.Add(Relation({ "Name": "Customer", "InvariantFriendlyName": "Kunde", "Target": model.Customer, "BackReferenceName": "Projects" }))
  project.Relations.Add(Relation({ "Name": "ProjectType", "InvariantFriendlyName": "Projekttyp", "Target": model.ProjectType, "BackReferenceName": "Projects" }))
  project.Properties.Add(NumericProperty({ "Name": "InvoicedHourlyRate", "InvariantFriendlyName": "Verrechneter Stundensatz", "Scale": 2 }))
  project.Properties.Add(NumericProperty({ "Name": "ProjectBudget", "InvariantFriendlyName": "Projektbudget", "Scale": 2 }))
  project.ValidationRules.Add(ValidationRule({ "Name": "ValidateBudget", "Condition": "(Current.ProjectType = Null Or Current.ProjectType.FixedPrice = False Or Current.ProjectBudget <> Null)", "Perpetrator" : "ProjectBudget", "Message" : "Projektbudget muss bei Fixpreisprojekten eingegeben werden." }))
  project.ValidationRules.Add(ValidationRule({ "Name": "ValidateRate", "Condition": "(Current.ProjectType = Null Or Current.ProjectType.FixedPrice = True Or Current.InvoicedHourlyRate <> Null)", "Perpetrator" : "ProjectBudget", "Message" : "Verr. Stundensatz muss bei T&M-Projekten eingegeben werden." }))
  project.Properties.Add(TextProperty({ "Name": "InvoicingRules", "InvariantFriendlyName": "Regeln für Verrechnung", "MaxStorageSize": 4000 }))
  model.Entities.Add(project)
  Context.SaveModel(model)
```
