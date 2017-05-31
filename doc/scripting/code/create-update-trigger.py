name = "MyTrigger"
guid = Guid("17758F80-C592-4AC7-85FA-CC2035257737")
entity = model.Timesheet

if not entity.Triggers.Contains(name):
    trigger = Trigger()
    trigger.Name = name
    trigger.ElementGuid = guid
    trigger.InvariantFriendlyName = name
    trigger.Ownership = Ownership.User
    trigger.TriggerType = TriggerType.BeforeSave
    trigger.ExecutionMode = TriggerExecutionMode.OnEverySave
    trigger.ExecutionTime = TriggerExecutionTime.OnInsert | TriggerExecutionTime.OnDelete | TriggerExecutionTime.OnUpdate
    trigger.Binding = IronPythonBinding()
    trigger.Binding.Name = name
    trigger.Binding.SourceCode = File.ReadAllText("C:\Data\Documents\MyTrigger.py")

    entity.Triggers.Add(trigger)
else:
    trigger = entity.Triggers[name]
    trigger.TriggerType = TriggerType.BeforeSave
    trigger.ExecutionMode = TriggerExecutionMode.OnEverySave
    trigger.ExecutionTime = TriggerExecutionTime.OnInsert | TriggerExecutionTime.OnDelete | TriggerExecutionTime.OnUpdate
    trigger.Binding.SourceCode = File.ReadAllText("C:\Data\Documents\MyTrigger.py")

Context.SaveModel(model)

print "Done"