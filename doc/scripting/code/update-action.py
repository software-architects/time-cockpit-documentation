clr.AddReference("System")
from System.IO import File

model = Context.GetWritableModel()

filterEntity = ModelEntity()
filterEntity.Name = "FilterEntityForCreateInvoice"

filterEntity.Properties.Add(TextProperty({ "Name": "InvoiceText", "MaxStorageSize": 200, "InvariantFriendlyName": "Rechnungstext" }))
filterEntity.Properties.Add(DateTimeProperty({ "Name": "InvoiceDate", "FractionalSecondsPrecision": 0, "IsNullable": True, "InvariantFriendlyName":"Rechnungsdatum" }))
filterEntity.Relations.Add(Relation({ "Name": "Customer", "InvariantFriendlyName": "Kunde", "Target": model.Customer }))

model.Actions.CreateInvoice.Parameter = PredefinedAnonymousParameter()
model.Actions.CreateInvoice.Parameter.ModelEntity = filterEntity
model.Actions.CreateInvoice.Binding.SourceCode = File.ReadAllText("C:\Data\Documents\Action for creating invoices.py")
Context.SaveModel(model)

print "Done"