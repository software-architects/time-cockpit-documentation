---
title: Scripting - Automatisierung mit IronPython
description: "Mit IronPython-Skripten time cockpit automatisieren: Datenmodell ändern, Schnittstellen bauen, UI anpassen, Batch-Prozesse im Skripteditor ausführen."
en_page: doc/scripting/overview.md
---
# Scripting

time cockpit unterstützt [IronPython](http://ironpython.net/), um bestimmte Aufgaben im System zu automatisieren. Beispiele für solche Aufgaben sind

- Änderungen am Datenmodell,
- das Implementieren von Schnittstellen (d. h. das Hinzufügen, Aktualisieren und Löschen von Elementen in der Datenbank),
- Änderungen an der Benutzeroberfläche (z. B. Listen, Formulare),
- das Ausführen von Batch-Prozessen (z. B. der Verrechnungsprozess am Monatsende),

In diesem Kapitel beschreiben wir, wie Sie IronPython-Skripte im System time cockpit schreiben, erstellen und ausführen.

> [!NOTE]
> Wenn Sie ein eigenständiges Programm schreiben möchten (z. B. eine Schnittstelle, die Daten aus einem anderen System importiert), das nicht innerhalb von time cockpit laufen soll, können Sie auch Ihre bevorzugte .NET-Programmiersprache (z. B. C#) verwenden. Details finden Sie im Kapitel [Anleitung: Mit C# auf die time cockpit API zugreifen](https://help.timecockpit.com/?topic=html/ff51bcbb-0ed3-425f-83aa-5094f5899a98.htm).

## Der integrierte Skripteditor

Um ein Skript für time cockpit zu erstellen, können Sie den integrierten Skripteditor oder jeden anderen Editor Ihrer Wahl (z. B. Microsoft Visual Studio) verwenden. Den integrierten Skripteditor finden Sie im Modul Administration. Mit der Schaltfläche New im Menüband legen Sie ein neues Skript an. Skripte können Sie in Skriptdateien speichern. IronPython-Skriptdateien haben die Endung `.py`.

![Python-Editor](/doc/scripting/images/python-editor.png "Python-Editor")

Skripte führen Sie mit der Schaltfläche Execute im Menüband oder mit der Taste F5 aus. Wenn Sie einen Teil des Skripts markieren, wird nur der markierte Teil ausgeführt. Im unteren Bereich des Skripteditors sehen Sie die Ausgabe des Skripts. Erzeugt Ihr Skript ein tabellarisches Ergebnis, können Sie es der Python-Variable result zuweisen. Ist result ein [IEnumerable](http://msdn.microsoft.com/en-us/library/9eekhta0(VS.100).aspx)<[TimeCockpit.Data.EntityObject](/api/TimeCockpit.Data.EntityObject.html)>, erscheint ein Ergebnis-Tab, in dem der Inhalt der Tabelle angezeigt wird.

## Grundlagen für time cockpit-Skripte

Sie können alle Sprachkonstrukte von Python verwenden, die IronPython unterstützt. Wenn Sie mehr über die Sprache Python erfahren möchten, empfehlen wir die [Dokumentationswebsite von IronPython](http://ironpython.net/documentation/).

Wenn Sie aus Ihrem Skript heraus mit der Datenzugriffsschicht von time cockpit arbeiten möchten, verwenden Sie die Klasse [TimeCockpit.Data.DataContext](/api/TimeCockpit.Data.DataContext.html). Die Skriptlaufzeitumgebung von time cockpit erzeugt eine Instanz dieser Klasse für Sie und weist sie der Variable `Context` zu. Das folgende Beispielskript zeigt, wie Sie eine [TCQL-Anweisung](~/doc/tcql/ueberblick.md) ausführen und das Ergebnis ausgeben:

```python
for proj in Context.Select("From P In Project Select P"):
  print proj.Code

print "Done!"
```

Das vorige Beispiel verwendet die Methode [Select(String)](/api/TimeCockpit.Data.DataContext.html#TimeCockpit_Data_DataContext_Select_System_String_TimeCockpit_Data_Database_SelectCache_), um die Abfrage auszuführen. Benötigt die Abfrage Parameter, sollten Sie stattdessen die Methode [Select(String, IEnumerable<QueryParameter>)](/api/TimeCockpit.Data.DataContext.html#TimeCockpit_Data_DataContext_Select_TimeCockpit_Data_QueryLanguage_Syntax_Query_System_Collections_Generic_IEnumerable_TimeCockpit_Data_QueryLanguage_QueryParameter__TimeCockpit_Data_Database_SelectCache_) verwenden. In Skripten greifen Sie auf diese Methode über den Alias [SelectWithParams](/api/TimeCockpit.Data.DataContext.html#TimeCockpit_Data_DataContext_SelectWithParameters_System_Collections_Generic_IEnumerable_System_Collections_Generic_KeyValuePair_System_Object_System_Object___) zu. Sie müssen [SelectWithParams](/api/TimeCockpit.Data.DataContext.html#TimeCockpit_Data_DataContext_SelectWithParameters_System_Collections_Generic_IEnumerable_System_Collections_Generic_KeyValuePair_System_Object_System_Object___) ein Dictionary als einzigen Parameter übergeben. Das Dictionary muss einen Eintrag mit dem Namen `Query` enthalten, dessen Wert die TCQL-Abfrage ist. Fügen Sie dem Dictionary für jeden Parameter, der in der TCQL-Abfrage verwendet wird, einen weiteren Eintrag hinzu. Das folgende Beispiel zeigt, wie die Methode verwendet werden kann:

```python
for proj in Context.SelectWithParams({
  "Query": "From P In Project Where P.Code Like @ProjectCode Select P",
  "@ProjectCode": "%test%" }):
  print proj.Code

print "Done!"
```

Wenn Sie eine einzelne Zeile aus der Datenbank abfragen möchten, verwenden Sie die Methoden [SelectSingle(String)](/api/TimeCockpit.Data.DataContext.html#TimeCockpit_Data_DataContext_SelectSingleAsync_System_String_TimeCockpit_Data_Database_SelectCache_) oder [SelectSingleWithParameters(String, IEnumerable<KeyValuePair<Object, Object>>)](/api/TimeCockpit.Data.DataContext.html#TimeCockpit_Data_DataContext_SelectSingleWithParameters_System_Collections_Generic_IEnumerable_System_Collections_Generic_KeyValuePair_System_Object_System_Object___).

```python
# Usage of SelectSingle without parameters 
print Context.SelectSingle("From P In Project Where P.Code = 'Test neu' Select P").Code

# Usage of SelectSingle with parameters 
print Context.SelectSingleWithParams({
  "Query": "From P In Project Where P.Code = @ProjectCode Select P",
  "@ProjectCode": "Test neu"}).Code

print "Done!"
```

## Datenmodell lesen und ändern

Das Datenmodell Ihrer time cockpit-Installation können Sie nach Bedarf ändern. Sie können das Datenmodell entweder in der Benutzeroberfläche oder in Skripten ändern. Um in einem Skript auf das Modell zuzugreifen, verwenden Sie die Eigenschaft [Model](/api/TimeCockpit.Data.DataContext.html#TimeCockpit_Data_DataContext_Model).

Das folgende Beispielskript gibt die Namen aller Entitäten aus, die im aktuellen Modell definiert sind:

```python
for entity in Context.Model.Entities:
  print entity.Name

print "Done!"
```

Das von [Model](/api/TimeCockpit.Data.DataContext.html#TimeCockpit_Data_DataContext_Model) zurückgegebene Modell darf nicht geändert werden. Wenn Sie in diesem Modell etwas ändern, können Sie Ihre Änderungen nicht in der zugrunde liegenden Datenbank speichern. Wenn Sie ein beschreibbares Modell benötigen, das gespeichert werden kann, rufen Sie das Modell mit [GetWritableModel](/api/TimeCockpit.Data.DataContext.html#TimeCockpit_Data_DataContext_GetWritableModel) ab.

> [!NOTE]
> [GetWritableModel](/api/TimeCockpit.Data.DataContext.html#TimeCockpit_Data_DataContext_GetWritableModel) kann nur in einem Skript aufgerufen werden, das in einem Server-Kontext läuft, weil das Modell in einem Client-Kontext nie geändert werden kann!

Das folgende Beispielskript fügt dem zugrunde liegenden Modell eine neue Entität hinzu. Beachten Sie, dass das zu ändernde Modell mit [GetWritableModel](/api/TimeCockpit.Data.DataContext.html#TimeCockpit_Data_DataContext_GetWritableModel) abgerufen wird. Die Änderung wird mit der Methode [SaveModel](/api/TimeCockpit.Data.DataContext.html#TimeCockpit_Data_DataContext_SaveModel_TimeCockpit_Data_DataModel_Model_) gespeichert.

```python
model = Context.GetWritableModel()

if not model.Entities.Contains("MyNewEntity"):
  newEntity = ModelEntity()
  newEntity.Name = "MyNewEntity"
  model.Entities.Add(newEntity)
  Context.SaveModel(model)

print "Done!"
```

## Bestehende Elemente ändern

Instanzen der Entitäten, die im Modell Ihres time cockpit definiert sind, sind immer Instanzen des Typs [TimeCockpit.Data.EntityObject](/api/TimeCockpit.Data.EntityObject.html). Auch die zuvor erwähnten Methoden `Select(...)` geben [IEnumerable](http://msdn.microsoft.com/en-us/library/9eekhta0(VS.100).aspx)<[TimeCockpit.Data.EntityObject](/api/TimeCockpit.Data.EntityObject.html)> zurück. In Ihren Skripten greifen Sie auf die Member der [TimeCockpit.Data.EntityObject](/api/TimeCockpit.Data.EntityObject.html)-Instanz über deren Namen zu.

Das folgende Skript zeigt, wie Sie ein bestimmtes [TimeCockpit.Data.EntityObject](/api/TimeCockpit.Data.EntityObject.html) aus der Datenbank lesen, seinen Inhalt ändern und es wieder in der Datenbank speichern:

```python
myObj = Context.SelectSingle("From P In Project Where P.Code = 'Test neu' Select P")
print "Alter Wert: " + myObj.Description
if myObj <> None:
  myObj.Description = myObj.Description + " extended"
  Context.SaveObject(myObj)

myObj = Context.SelectSingle("From P In Project Where P.Code = 'Test neu' Select P")
print "Neuer Wert: " + myObj.Description

print "Done!"
```

## Neue Elemente anlegen

Wenn Sie eine neue Instanz einer bestehenden Entität anlegen möchten, verwenden Sie die Methode [CreateEntityObject](/api/TimeCockpit.Data.DataModel.ModelEntityBase.html#TimeCockpit_Data_DataModel_ModelEntityBase_CreateEntityObject__1):

```python
# Create and save a new project
myNewObj = Context.Model.Project.CreateEntityObject()
myNewObj.Code = "NewObject"
myNewObj.ProjectName = "New Object"
Context.SaveObject(myNewObj)

# Get the newly created project from the db
myObj = Context.SelectSingle("From P In Project Where P.Code = 'NewObject' Select P")
print myObj.ProjectName

# Delete the project.
Context.DeleteObject(myObj)

print "Done!"
```

