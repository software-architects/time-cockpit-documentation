---
title: Use XML in Scripts - Form Definitions
description: Use XML and .NET XML classes in IronPython scripts for time cockpit. Build form definitions and UI elements programmatically.
---
# How To: Use XML in Scripts

[IronPython](http://ironpython.net/) supports using .NET Framework classes from within scripts. Therefore it is possible to use all the XML-related classes of .NET in IronPython scripts. This is especially important for time cockpit because certain user interface elements (e.g. forms) can be defined using XML.

## Build Form With XML

The following sample shows how to build the XML of a time cockpit form.

> [!NOTE]
While forms are stored in time cockpit's <xref:TimeCockpit.Data.DataModel.EntityView> entity, they should only be modified via the Model class interface.

```
model = Context.GetWritableModel()

if model.ModelEntityViews.Contains("USR_CompanyForm"):
  view = model.ModelEntityViews.USR_CompanyForm
 else:
  view = EntityView()
  view.Name = "USR_CompanyForm"
  view.TypeName = "TimeCockpit.Data.DataModel.View.Form"
  view.TargetEntity = model.USR_Company
  model.ModelEntityViews.Add(view)

 view.ConfigurationMarkup = '''
 <Form ModelEntityName="USR_Company" xmlns="clr-namespace:TimeCockpit.Data.DataModel.View;assembly=TimeCockpit.Data">
  <Tab Header="Unternehmen">
   <Section Header="Allgemein">
    <SectionColumn>
     <BoundCell Content="=Current.USR_AccountingArea" />  
     <BoundCell Content="=Current.USR_CompanyName" ColSpan="2"/>
     <BoundCell Content="=Current.USR_City"  ColSpan="2"/>
     <BoundCell Content="=Current.USR_Country" ColSpan="2"/>
     <BoundCell Content="=Current.USR_Currency" ColSpan="2"/>
     <BoundCell Content="=Current.USR_CompanyLanguage" ColSpan="2"/>
     <BoundCell Content="=Current.USR_IsActive" ColSpan="2"/>
    </SectionColumn>
    <SectionColumn>
     <BoundCell Content="=Current.USR_SapTenant" />
    </SectionColumn>
   </Section>
  </Tab>
  <BackReferenceTab BackReference="Timesheets" />
  <BackReferenceTab BackReference="Employees" />
 </Form>'''

 Context.SaveModel(model)
 ```