---
title: XML in Skripten verwenden - Formulardefinitionen
description: XML und die XML-Klassen von .NET in IronPython-Skripten für time cockpit verwenden, um Formulardefinitionen und UI-Elemente per Code zu erstellen.
en_page: doc/scripting/use-xml-in-scripts.md
---
# Anleitung: XML in Skripten verwenden

[IronPython](http://ironpython.net/) unterstützt die Verwendung von .NET-Framework-Klassen in Skripten. Daher können Sie alle XML-bezogenen Klassen von .NET in IronPython-Skripten verwenden. Das ist für time cockpit besonders wichtig, weil bestimmte Elemente der Benutzeroberfläche (z. B. Formulare) mit XML definiert werden können.

## Formular mit XML erstellen

Das folgende Beispiel zeigt, wie Sie das XML eines Formulars in time cockpit erstellen.

> [!NOTE]
> Formulare werden zwar in der Entität [TimeCockpit.Data.DataModel.EntityView](/api/TimeCockpit.Data.DataModel.EntityView.html) von time cockpit gespeichert, sie sollten aber nur über die Schnittstelle der Klasse Model geändert werden.

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
