model = Context.GetWritableModel()

# Add model entity Contact
if model.Entities.Contains("Contact") == False:
  contact = ModelEntity({ "Name": "Contact", "InvariantFriendlyName": "Contact" })
  contact.Properties.Add(TextProperty({ "Name": "Firstname", "InvariantFriendlyName": "Firstname", "MaxStorageSize": 50, "IsNullable": False }))
  contact.Properties.Add(TextProperty({ "Name": "Lastname", "InvariantFriendlyName": "Lastname", "MaxStorageSize": 50, "IsNullable": False }))
  model.Entities.Add(contact)
  Context.SaveModel(model)