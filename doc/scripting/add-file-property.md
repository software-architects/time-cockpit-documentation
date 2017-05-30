# How To: Add a File Property

time cockpit supports file attachments to database rows. To store the file's content and metadata you have to extend your model (see also [How To: Modify the Data Model](modify-data-model.md)). In this chapter we will cover details about how to add a file property to your model and how to use it from within lists and forms.

## Adding the Property

<xref:TimeCockpit.Data.DataModel.FileProperty> implements the property holding the file's content. In order to work properly in the user interface you have to create additional properties that store the file's name ([FileNameColumn](xref:TimeCockpit.Data.DataModel.FileProperty?q=fileprop#TimeCockpit_Data_DataModel_FileProperty_FileNameColumn)), the MIME type ([FileMimeTypeColumn](xref:TimeCockpit.Data.DataModel.FileProperty?q=fileprop#TimeCockpit_Data_DataModel_FileProperty_FileMimeTypeColumn)) and the file's size ([FileSizeColumn](xref:TimeCockpit.Data.DataModel.FileProperty?q=fileprop#TimeCockpit_Data_DataModel_FileProperty_FileSizeColumn)).

The following example shows how to add a file property to the entity `Contact`:

...

## Using the Property

You can use the TimeCockpit.Data.DataModel.FileProperty just like you use any other property type. You can add a TimeCockpit.Data.DataModel.View.BoundCell to your list and/or form and time cockpit will automatically discover that your property represents a file and will display it appropriately (e.g. if it is an image it will display the image in the list). If you want more control over how the file property is displayed in your list or form use TimeCockpit.Data.DataModel.View.FileCell instead of TimeCockpit.Data.DataModel.View.BoundCell.

The following example uses a TimeCockpit.Data.DataModel.View.BoundCell to display the file property `USR_Avatar`.

...