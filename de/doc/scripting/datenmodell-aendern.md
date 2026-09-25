---
title: Datenmodell ändern - Skriptbeispiele
description: "Das Datenmodell von time cockpit mit IronPython-Skripten ändern: Entitäten, Eigenschaften, Beziehungen und berechnete Eigenschaften per Code anlegen."
en_page: doc/scripting/modify-data-model.md
---
# Anleitung: Das Datenmodell ändern

time cockpit basiert auf einem Modell, das die Datenstrukturen, die Benutzeroberfläche, die Logik und die Workflows im System festlegt. Sie können das Modell über die Benutzeroberfläche von time cockpit oder mit [IronPython](http://ironpython.net/)-Skripten ändern. Die Grundlagen des Zugriffs auf das Modell wurden im Kapitel [Grundlagen für time cockpit-Skripte](~/doc/scripting/ueberblick.md#grundlagen-für-time-cockpit-skripte) beschrieben. In diesem Kapitel beschreiben wir im Detail, wie Sie Modelle aus Skripten heraus ändern.

## Eigenschaften

Jede Entität ([TimeCockpit.Data.DataModel.ModelEntity](/api/TimeCockpit.Data.DataModel.ModelEntity.html)) besteht aus einer Liste von Eigenschaften ([ModelEntityBase.Properties](/api/TimeCockpit.Data.DataModel.ModelEntityBase.html#TimeCockpit_Data_DataModel_ModelEntityBase_Properties)). Sie können Eigenschaften hinzufügen, aktualisieren und entfernen. Wenn Sie ein Modell mit [DataContext.SaveObject](/api/TimeCockpit.Data.DataContext.html#TimeCockpit_Data_DataContext_SaveModel_TimeCockpit_Data_DataModel_Model_) speichern, ändert time cockpit die zugrunde liegende Datenbank entsprechend.

Eine Eigenschaft ([TimeCockpit.Data.DataModel.ModelProperty](/api/TimeCockpit.Data.DataModel.ModelProperty.html)) kann entweder eine Eigenschaft sein, die in der Datenbank gespeichert wird ([TimeCockpit.Data.DataModel.PersistedProperty](/api/TimeCockpit.Data.DataModel.PersistedProperty.html)), oder eine Eigenschaft, die zur Laufzeit berechnet wird ([TimeCockpit.Data.DataModel.CalculatedProperty](/api/TimeCockpit.Data.DataModel.CalculatedProperty.html)).

Das folgende Beispiel zeigt, wie Sie in einem Python-Skript eine Modellentität mit Eigenschaften anlegen. Beachten Sie, dass die Eigenschaften in diesem Beispiel über ihren Konstruktor definiert werden.

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

## Beziehungen

Entitäten ([TimeCockpit.Data.DataModel.ModelEntity](/api/TimeCockpit.Data.DataModel.ModelEntity.html)) können Beziehungen ([ModelEntityBase.Relations](/api/TimeCockpit.Data.DataModel.ModelEntityBase.html#TimeCockpit_Data_DataModel_ModelEntityBase_Relations) zu anderen Entitäten haben. Sie können Beziehungen hinzufügen, aktualisieren und entfernen. Wenn Sie ein Modell mit [DataContext.SaveObject](/api/TimeCockpit.Data.DataContext.html#TimeCockpit_Data_DataContext_SaveModel_TimeCockpit_Data_DataModel_Model_) speichern, ändert time cockpit die zugrunde liegende Datenbank entsprechend.

> [!WARNING]
> time cockpit unterstützt derzeit keine hierarchischen Beziehungen. Sie können hierarchische Beziehungen in der Datenbank definieren, die Benutzeroberfläche behandelt sie aber nicht korrekt

Das folgende Beispiel zeigt, wie Sie in einem Python-Skript eine Modellentität mit Beziehungen anlegen.

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

## Validierungsregeln

Entitäten ([TimeCockpit.Data.DataModel.ModelEntity](/api/TimeCockpit.Data.DataModel.ModelEntity.html)) können Regeln haben, die festlegen, ob ihr Inhalt gültig ist ([ModelEntityBase.ValidationRules](/api/TimeCockpit.Data.DataModel.ModelEntityBase.html#TimeCockpit_Data_DataModel_ModelEntityBase_ValidationRules)). Sie können Validierungsregeln hinzufügen, aktualisieren und entfernen.

Validierungsregeln basieren auf der [TCQL-Ausdruckssprache](~/doc/tcql/ueberblick.md) von time cockpit.

Das folgende Beispiel zeigt, wie Sie in einem Python-Skript eine Modellentität mit einer Validierungsregel anlegen.

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
