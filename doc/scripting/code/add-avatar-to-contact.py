clr.AddReference("System.Core")
from System.Linq import Enumerable
from System.Collections.Generic import List

model = Context.GetWritableModel()
contact = model.Entities.Contact

if not contact.Properties.Contains("USR_Avatar"):
	# Avatar file name
	fileNameProperty = TextProperty({ 
	        "Name": "USR_AvatarFileName", "InvariantFriendlyName":"Avatar File Name",
	        "MaxStorageSize" : 256, "IsNullable" : True, "IsDefaultDisplayProperty" : False,
	        "DefaultValueExpression" : "\"\"", "Ownership" : Ownership.User
	    })
	contact.Properties.Add(fileNameProperty)
	
	# Avatar file mime type
	mimeTypeProperty = TextProperty({
	        "Name": "USR_AvatarMimeType", "InvariantFriendlyName":"Avatar Mime Type",
	        "MaxStorageSize" : 256, "IsNullable" : True,
	        "IsDefaultDisplayProperty" : False, "DefaultValueExpression" : "\"\"",
	        "Ownership" : Ownership.User
	    })
	contact.Properties.Add(mimeTypeProperty)
	
	# Avatar file size
	fileSizeProperty = NumericProperty({
	        "Name": "USR_AvatarFileSize", "InvariantFriendlyName":"Avatar File Size",
	        "Precision" : 18, "Scale" : 0, "IsNullable" : True, "FormatPattern": "#,###",
	        "IsDefaultDisplayProperty" : False, "DefaultValueExpression" : "0",
	        "Ownership" : Ownership.User
	    })
	contact.Properties.Add(fileSizeProperty)
	
	# Avatar file property
	allowedMimeTypes = List[String]()
	allowedMimeTypes.Add("image/jpeg")
	allowedMimeTypes.Add("image/png")
	
	allowedExtensions = List[String]()
	allowedExtensions.Add(".png")
	allowedExtensions.Add(".jpeg")
	allowedExtensions.Add(".jpg")
	
	fileProperty = FileProperty({
	    "Name": "Avatar", 
	    "InvariantFriendlyName": "Avatar",
	    "FileNameColumn": "USR_AvatarFileName",
	    "FileSizeColumn": "USR_AvatarFileSize",
	    "FileMimeTypeColumn": "USR_AvatarMimeType",
	    "MaxFileSizeInKB" : 128, 
	    "IsNullable" : True,
	    "AllowedMimeTypes" : allowedMimeTypes,
	    "AllowedExtensions" : allowedExtensions,
	    "ContentProcessing": ContentProcessing.Compress,
	    "StorageType": StorageType.BlobStore 
	})
	    
	contact.Properties.Add(fileProperty)
	Context.SaveModel(model)