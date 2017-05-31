clr.AddReference("System")
from System.IO import File

model = Context.GetWritableModel()

changeTimesheetAction = ModelAction()
changeTimesheetAction.Name = "CreateInvoice"
changeTimesheetAction.Conditions.Add(ModelEntityTypeCondition({ "Name": "TimesheetCondition", "ModelEntityName": "Timesheet", "ModelEntity": model.Timesheet, "MinimumInputSetSize": 1 }))

changeTimesheetAction.Binding = IronPythonBinding()
changeTimesheetAction.Binding.Name = "IronPythonBinding"
changeTimesheetAction.Binding.SourceCode = File.ReadAllText("C:\Data\Documents\Action for creating invoices.py")

model.Actions.Add(changeTimesheetAction)
Context.SaveModel(model)

print "Done"