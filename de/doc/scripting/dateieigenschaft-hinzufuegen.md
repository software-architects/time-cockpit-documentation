---
title: Dateieigenschaft hinzufügen - Dateianhänge
description: "Dateieigenschaften für Entitäten in time cockpit hinzufügen: Dateiinhalt und Metadaten speichern und Dateien in Listen und Formularen anzeigen."
en_page: doc/scripting/add-file-property.md
---
# Anleitung: Eine Dateieigenschaft hinzufügen

time cockpit unterstützt Dateianhänge an Datenbankzeilen. Um den Inhalt und die Metadaten der Datei zu speichern, müssen Sie Ihr Modell erweitern (siehe auch [Anleitung: Das Datenmodell ändern](~/doc/scripting/datenmodell-aendern.md)). In diesem Kapitel beschreiben wir im Detail, wie Sie Ihrem Modell eine Dateieigenschaft hinzufügen und sie in Listen und Formularen verwenden.

## Die Eigenschaft hinzufügen

[TimeCockpit.Data.DataModel.FileProperty](/api/TimeCockpit.Data.DataModel.FileProperty.html) implementiert die Eigenschaft, die den Inhalt der Datei enthält. Damit sie in der Benutzeroberfläche richtig funktioniert, müssen Sie zusätzliche Eigenschaften anlegen, die den Dateinamen ([FileNameColumn](/api/TimeCockpit.Data.DataModel.FileProperty.html#TimeCockpit_Data_DataModel_FileProperty_FileNameColumn)), den MIME-Typ ([FileMimeTypeColumn](/api/TimeCockpit.Data.DataModel.FileProperty.html#TimeCockpit_Data_DataModel_FileProperty_FileMimeTypeColumn)) und die Dateigröße ([FileSizeColumn](/api/TimeCockpit.Data.DataModel.FileProperty.html#TimeCockpit_Data_DataModel_FileProperty_FileSizeColumn)) speichern.

Das folgende Beispiel zeigt, wie Sie der Entität `Contact` eine Dateieigenschaft hinzufügen:

[!code-python[Create file property](code/add-avatar-to-contact.py)]

## Die Eigenschaft verwenden

Sie können die [TimeCockpit.Data.DataModel.FileProperty](/api/TimeCockpit.Data.DataModel.FileProperty.html) wie jeden anderen Eigenschaftstyp verwenden. Sie können Ihrer Liste und Ihrem Formular eine [TimeCockpit.Data.DataModel.View.BoundCell](/api/TimeCockpit.Data.DataModel.View.BoundCell.html) hinzufügen. time cockpit erkennt dann automatisch, dass Ihre Eigenschaft eine Datei darstellt, und zeigt sie passend an (ist es z. B. ein Bild, wird das Bild in der Liste angezeigt). Wenn Sie genauer steuern möchten, wie die Dateieigenschaft in Ihrer Liste oder Ihrem Formular angezeigt wird, verwenden Sie [TimeCockpit.Data.DataModel.View.FileCell](/api/TimeCockpit.Data.DataModel.View.FileCell.html) statt [TimeCockpit.Data.DataModel.View.BoundCell](/api/TimeCockpit.Data.DataModel.View.BoundCell.html).

Das folgende Beispiel verwendet eine [TimeCockpit.Data.DataModel.View.BoundCell](/api/TimeCockpit.Data.DataModel.View.BoundCell.html), um die Dateieigenschaft `USR_Avatar` anzuzeigen.

```
<List AllowDelete="True" AllowEdit="True" Query="From I In USR_Contact.Include(*) Select I" 
    xmlns="clr-namespace:TimeCockpit.Data.DataModel.View;assembly=TimeCockpit.Data"> 
    <BoundCell Content="=Current.USR_Avatar" /> 
    <BoundCell Content="=Current.USR_FirstName" /> 
    <BoundCell Content="=Current.USR_LastName" /> 
</List>
```
