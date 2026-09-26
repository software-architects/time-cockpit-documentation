---
title: Entitäten anpassen - Anpassung des Datenmodells
description: "Entitäten im Datenmodell von time cockpit anpassen: Eigenschaften, Beziehungen, Validierungsregeln, Berechtigungen und Systemeigenschaften hinzufügen."
en_page: doc/data-model-customization/entity.md
---
# Entitäten anpassen

Dieses Kapitel gibt einen Überblick darüber, was in time cockpit angepasst werden kann und wie.

## Ein metadatengesteuerter Ansatz

time cockpit wird durch Metadaten gesteuert. Das heißt, möglichst viele Informationen über kundenspezifische Anpassungen (Entitäten, Eigenschaften, Beziehungen, Validierungsregeln usw.) werden im Datenmodell konfiguriert. In den meisten Fällen beeinflussen Anpassungen des Datenmodells, wie die Benutzeroberfläche aussieht und sich verhält.

Beispiel: Das Standarddatenmodell enthält eine Validierungsregel ```APP_ValidateCustomerSet```, die sicherstellt, dass jedes Projekt einem Kunden zugeordnet ist. Da diese Validierungsregel im Datenmodell hinterlegt ist, zeigt die Benutzeroberfläche einen Validierungsfehler an, wenn die Validierungsregel nicht erfüllt ist, also kein Kunde gesetzt ist. Wird ein Projekt ohne Kunde per Skript ([Das Datenmodell ändern](~/doc/scripting/datenmodell-aendern.md)) oder über die ([Web API](~/doc/web-api/ueberblick.md)) angelegt, verhindert der Validierungsfehler ebenfalls, dass das ungültige Projekt gespeichert wird. Weitere Beispiele für Informationen im Datenmodell, die die Benutzeroberfläche steuern, sind Formatierungsoptionen für Datums-/Uhrzeit- oder numerische Felder.

## Entitäten bearbeiten

Im Modul ```Anpassungen``` wird ein Baum aller Entitäten, Listen, Formulare, Aktionen, Module und Sets angezeigt, die im Datenmodell enthalten sind. Diese können nur auf dem ```Server``` bearbeitet werden, um Synchronisierungskonflikte auf Ebene des Datenmodells zu vermeiden.

> [!NOTE]
> Jede Entität im Datenmodell von time cockpit entspricht einer Tabelle in der zugrunde liegenden Datenbank.

![Entität bearbeiten](/doc/data-model-customization/images/edit-entity.png "Entität bearbeiten")

Im Editor können Sie die Eigenschaften der Entität, Beziehungen zu anderen Entitäten, Validierungsregeln, Berechtigungen und die von der Entität bereitgestellten Schnittstellen hinzufügen und ändern. Grundsätzlich lässt sich jedes dieser Elemente mit der Schaltfläche ```Neu``` im Menüband hinzufügen. Die Schaltfläche ```Neu``` ist kontextabhängig, d. h. es wird ein neues Element des ausgewählten Typs angelegt, je nachdem, welche Untergruppe der Elemente (Eigenschaften, Beziehungen usw.) ausgewählt ist.

> [!NOTE]
> Das Löschen von Eigenschaften und Beziehungen sowie das Einfügen von Eigenschaften, bei denen keine Null-Werte erlaubt sind, sind Operationen, die mit besonderer Sorgfalt durchgeführt werden sollten. Wenn bereits mehrere Benutzer oder Geräte eingerichtet sind und eine Entität bearbeitet wird, für die bereits Daten vorhanden sind, kann es bei der Synchronisierung zu Konflikten kommen.

![Projekt bearbeiten](/doc/data-model-customization/images/edit-project.png "Projekt bearbeiten")

## Systemeigenschaften einer Entität

* **Anzeigename:** Der Anzeigename ist der Name einer Entität in benutzerfreundlicher Form. Jede Entität hat zwei Namen. Einerseits wird beim Anlegen einer Entität ein eindeutiger technischer Name (z. B. ```APP_Project```) vergeben. Dieser Name wird als Tabellenname in der Datenbank verwendet und erscheint nur im Administrationsbereich. Der Anzeigename wird in der Benutzeroberfläche angezeigt.

* **Anzeigeeigenschaft**: Die Anzeigeeigenschaft legt fest, welche Eigenschaft standardmäßig angezeigt wird (z. B. in einem Kombinationsfeld), wenn eine Instanz einer Entität in der Benutzeroberfläche dargestellt wird. Bei Kunden ist die Anzeigeeigenschaft beispielsweise ```CompanyName```.

![Anzeigeeigenschaft](/doc/data-model-customization/images/default-display-property.png "Anzeigeeigenschaft")

* **Standard Liste:** Benutzer können eigene Listen für Entitäten anlegen (siehe [Eigene Listen](~/doc/datenmodell-anpassung/liste.md)). Diese eigenen Listen können als Standardliste einer Entität festgelegt werden. Wird für ein Projekt beispielsweise eine Liste "MyProjectList" definiert und als Standardliste festgelegt, verwendet die Benutzeroberfläche MyProjectList immer dann, wenn eine Liste von Projekten angezeigt werden muss. Ist keine Standardliste ausgewählt, erzeugt time cockpit automatisch zur Laufzeit eine Liste mit allen Eigenschaften und Beziehungen einer Entität.

* **Standard Liste für Relationen:** Benutzer können eine eigene Liste für eine Entität anlegen und sie als Standardliste für Beziehungen festlegen. Beispiel: Hat die Entität ```APP_Project``` eine eigene Liste für Beziehungen "CustomProjectRelationList", wird diese Liste in der Benutzeroberfläche immer dann verwendet, wenn eine Liste von Projekten in einem Kombinationsfeld angezeigt werden muss.

* **Standard Form:** Die Eigenschaft Standard Form verhält sich ähnlich wie die Eigenschaft Standard Liste. Der einzige Unterschied ist, dass ein Standardformular von der Benutzeroberfläche immer dann verwendet wird, wenn eine einzelne Instanz eines Datensatzes (z. B. ein Projekt) angezeigt werden soll. Ist kein Standardformular hinterlegt, erzeugt time cockpit ein Formular mit allen Eigenschaften und Beziehungen der Entität.

## Eigenschaften

Eigenschaften werden im Bearbeitungsmodus einer Entität verwaltet. Um eine Eigenschaft anzulegen, wählen Sie die Untergruppe ```Eigenschaften``` aus, damit die Schaltfläche ```Neu``` eine neue Eigenschaft anlegt. time cockpit bietet verschiedene vordefinierte Typen von Eigenschaften. Jeder dieser Typen hat eine eigene Darstellung in der Benutzeroberfläche.

> [!NOTE]
> Jede Eigenschaft im Datenmodell von time cockpit entspricht einer Spalte in einer Tabelle der zugrunde liegenden Datenbank.

* **Texteigenschaften:** Texteigenschaften dienen zum Speichern von Text. Mit ```Maximum length``` legen Benutzer fest, wie lang (in Zeichen) der Text sein darf. Texteigenschaften mit einer Länge unter 100 Zeichen werden in der Benutzeroberfläche als einzeiliges Eingabefeld dargestellt. Texte mit einer maximalen Länge von mehr als 100 Zeilen werden als mehrzeilige Eingabefelder dargestellt (dieses Verhalten kann im jeweiligen Formular geändert werden).

* **Datumseigenschaften:** Datumseigenschaften dienen zum Speichern von Datumswerten ohne Uhrzeit. Mit ```date format``` legen Benutzer fest, in welchem Format ein Datumswert in der Benutzeroberfläche angezeigt wird. Mögliche Werte für Datumsformate finden Sie unter [Format Strings](http://msdn.microsoft.com/en-us/library/zdtaw1bw.aspx).

* **DateTime-Eigenschaften:** DateTime-Eigenschaften dienen zum Speichern von Datumswerten mit Uhrzeit. Wie bei Datumseigenschaften legen Benutzer mit ```date format``` fest, in welchem Format eine Datums- und Uhrzeiteigenschaft in der Benutzeroberfläche angezeigt wird. Mögliche Werte für Datumsformate finden Sie unter [Format Strings](http://msdn.microsoft.com/en-us/library/zdtaw1bw.aspx).

* **Numerische Eigenschaft:** Numerische Eigenschaften dienen zum Speichern numerischer Werte. Für numerische Eigenschaften können verschiedene Parameter festgelegt werden:
  * Maximale Anzahl an Stellen: Legt die maximale Anzahl an Stellen vor und nach dem Komma fest.
  * Anzahl der Nachkommastellen: Legt die Anzahl der Stellen nach dem Komma fest. Ist also die Anzahl der Nachkommastellen mit 3 konfiguriert, wird der numerische Wert der Eigenschaft auf 3 Nachkommastellen gerundet.
  * Zahlenformat: Wie bei Datumseigenschaften kann auch für numerische Eigenschaften das Format festgelegt werden. Mögliche Werte finden Sie unter [Format Strings](https://msdn.microsoft.com/en-us/library/fzeeb5cd.aspx).
  * Aggregatfunktion: Die Aggregatfunktion legt das Verhalten einer numerischen Eigenschaft bei einer Gruppierung in einer Liste fest. Wird beispielsweise eine Projektliste nach Kunde gruppiert und ist für die Eigenschaft Budget die Aggregatfunktion ```Sum``` hinterlegt, werden die Budgetwerte pro Kunde addiert und eine Gesamtsumme angezeigt.
* **Boolesche Eigenschaft:** Boolesche Eigenschaften dienen zum Speichern von Wahr/Falsch-Werten.
* **Berechnete Eigenschaft:** Berechnete Eigenschaften dienen zum Berechnen von Werten mithilfe von [TCQL-Ausdrücken](~/doc/tcql/ausdruckssprache.md). Bei berechneten Eigenschaften werden keine konkreten Werte in der Datenbank gespeichert, sondern nur die Formeln, die zu einem Wert führen. Ein Beispiel für eine berechnete Eigenschaft der Entität ```APP_Project``` ist ```FullName```. Die Formel zur Ermittlung des vollständigen Namens eines Projekts lautet ```:Iif(Current.Customer = Null, '(n/a).', Current.Customer.Code + '.') + Current.Code```. Wie die Formel zeigt, greift die berechnete Eigenschaft auf andere Eigenschaften der Projektentität zu und ermittelt daraus einen Projektnamen.
  
## Beziehungen
 
Entitäten können Beziehungen zu anderen Entitäten haben. Diese Beziehungen entsprechen sogenannten n:1-Beziehungen. Ein Beispiel für eine Beziehung ist die Beziehung zwischen einem Projekt und seinem Kunden. Diese Beziehung ordnet einem Projekt einen Kunden zu. Beziehungen werden in Formularen als Kombinationsfelder und in Listen als [Hyperlinks](~/doc/datenmodell-anpassung/liste.md) dargestellt. So wie man in TCQL auf Eigenschaften einer Entität zugreifen kann, kann man auch auf Beziehungen zugreifen (z. B. ```Current.Customer``` ausgehend von der Projektentität).  

> [!NOTE]
> Jede Beziehung im Datenmodell von time cockpit entspricht einer Fremdschlüsselbeziehung in der zugrunde liegenden Datenbank.

Beim Anlegen einer neuen Beziehung können folgende Eigenschaften festgelegt werden:

* Legt die andere Entität fest, mit der die Quellentität in Beziehung steht.
* Name der Rückreferenz: Aus Sicht der Datenbank hat eine Beziehung zwei Richtungen. Die Beziehung Kunde auf der Projektentität hat beispielsweise die Richtung ```Project -> Customer``` und andererseits ```Customer -> Project```. ```Project -> Customer``` ordnet genau ein Projekt einem Kunden zu. ```Customer -> Project``` bedeutet alle Projekte, die einem Kunden zugeordnet sind. Die zweite Richtung wird in time cockpit mit einer benannten Rückreferenz abgebildet. Rückreferenzen können mit [TCQL-Unterabfragen](~/doc/tcql/ausdruckssprache.md) navigiert werden. Außerdem wird der Name der Rückreferenz verwendet, um sogenannte Rückreferenz-Tabs zu erzeugen (siehe auch [:N-Hyperlinks](~/doc/datenmodell-anpassung/liste.md)).

> [!NOTE]
> Best Practice für die Benennung von Rückreferenzen am Beispiel der Beziehung ```Project -> Customer```: Da die Rückreferenz die umgekehrte Richtung der Beziehung ```Project -> Customer``` darstellt, ist der Name der Rückreferenz der Name der Quellentität im Plural, also ```Projects```.

> [!WARNING]
> Auf Rückreferenzen kann in TCQL nicht zugegriffen werden. Der Ausdruck ```Current.Projects``` kann beispielsweise nicht in Berechtigungen, berechneten Eigenschaften und Validierungsregeln verwendet werden. Im letztgenannten Beispiel würde ```Current``` die Projektentität darstellen, und Projects würde die Beziehung ```Project -> Customer``` zurückweisen.

## M:N-Beziehungen (Mehrfachzuordnungen)

M:N-Beziehungen lassen sich in time cockpit mit Entitäten umsetzen. Ein Anwendungsfall für eine Mehrfachzuordnung wäre beispielsweise die Zuordnung eines Projekts zu mehreren Kunden. Dieses Szenario lässt sich mit einer Zuordnungsentität umsetzen. Eine Zuordnungsentität besteht mindestens aus zwei Beziehungen zu den Entitäten, die in einer Mehrfachzuordnung zugeordnet werden sollen. Bei einer Mehrfachzuordnung von Projekt zu Kunde hätte die Zuordnungsentität ```CustomerProjectMapping``` also eine Beziehung zu ```Project``` und zu ```Customer```.

![Zuordnung von Kunden zu Projekten](/doc/data-model-customization/images/customer-project-mapping.png "Zuordnung von Kunden zu Projekten")

Die Pflege von Mehrfachzuordnungen von ```Project``` zu ```Customer``` lässt sich in Listen und Eingabeformularen mithilfe von :N-Hyperlinks (Rückreferenzen) umsetzen. Wie oben beschrieben, gibt es eine implizite Rückreferenz von der Entität ```Project``` auf ```CustomerProjectMapping```. Diese Rückreferenz lässt sich mit einer sogenannten `NamedListConfiguration` in benutzerdefinierten Listen oder mit Rückreferenz-Tabs in Formularen umsetzen (siehe [Rückreferenz-Tabs](~/doc/datenmodell-anpassung/liste.md)).

![Liste der Zuordnungen von Kunden zu Projekten](/doc/data-model-customization/images/customer-project-mapping-list.png "Liste der Zuordnungen von Kunden zu Projekten")

* Hyperlink für zugeordnete Kunden in der Projektliste

```
<BoundCell Content="Customer Project Mapping"> 
   <BoundCell.Hyperlink> 
     <Hyperlink Target="MappedCustomer" Title="= 'Customers of Project ' + Current.Me"> 
       <Hyperlink.NavigateContent> 
         <p:NamedListConfiguration ModelEntityName="USR_CustomerProjectMapping"> 
           <p:NamedListConfiguration.Parameters> 
             <Parameter Name="ProjectUuid" Value="=Current.ProjectUuid" /> 
           </p:NamedListConfiguration.Parameters> 
         </p:NamedListConfiguration> 
       </Hyperlink.NavigateContent> 
     </Hyperlink> 
   </BoundCell.Hyperlink> 
 </BoundCell>
}
``` 

* Rückreferenz-Tab für zugeordnete Kunden im Eingabeformular des Projekts

```
<BackReferenceTab BackReference="CustomerProjectMappings" />
``` 

## Validierungsregeln

Auf Entitäten können Validierungsregeln definiert werden, um sicherzustellen, dass eine Instanz einer Entität, z. B. ein Datensatz in der Projekttabelle, bestimmte Kriterien erfüllt. Diese Kriterien ergeben sich aus den Geschäftsregeln eines Unternehmens. Ist eine Validierungsregel nicht erfüllt, kann der Datensatz nicht gespeichert werden. Das gilt für das Speichern eines Datensatzes in der Benutzeroberfläche ebenso wie per [Scripting](~/doc/scripting/ueberblick.md) und über die [Web API](~/doc/web-api/ueberblick.md).

![Validierungsregeln](/doc/data-model-customization/images/validation-rules.png "Validierungsregeln")

Eine Validierungsregel besteht aus folgenden Eigenschaften:

* **Name:** Eine Validierungsregel muss innerhalb der Validierungsregeln einen eindeutigen Namen haben.
* **Validierungsregel:** Ein TCQL-Ausdruck, der festlegt, unter welchen Bedingungen ein Datensatz gültig ist. Ein Datensatz ist gültig, wenn der Ausdruck **true** ergibt.

```
(Current.EndDate = Null Or Current.StartDate = Null Or Current.EndDate >= Current.StartDate)
``` 
Im obigen Beispiel steht ```Current``` für eine Instanz von ```APP_Project```. ```Current``` ist immer eine Referenz auf die Instanz einer Entität, die gerade verarbeitet wird. Mit der Punktnotation greifen Sie in TCQL auf Beziehungen oder Eigenschaften eines Datensatzes zu. So können in einer Validierungsregel verschiedene Eigenschaften oder Beziehungen auf bestimmte Werte geprüft werden. Mit TCQL können Sie jedoch nicht nur auf Eigenschaften des aktuellen Datensatzes zugreifen, sondern auch auf Eigenschaften verknüpfter Datensätze anderer Entitäten, z. B.: ```Current.Customer.Code = 'My Client'```.

* **Fehlermeldung:** Die Fehlermeldung wird in der Benutzeroberfläche als Hinweis angezeigt, wenn eine Validierungsregel nicht erfüllt ist. Diese Fehlermeldung wird auch als Ausnahmetext verwendet, wenn ein Skript die Validierungsregel verletzt.

Validierungsregeln können aktiviert oder deaktiviert werden. Ist eine Validierungsregel deaktiviert, prüft time cockpit nicht, ob ihre Kriterien erfüllt sind.

> [!NOTE]
> Bei Bedarf können Sie auch Validierungsregeln deaktivieren, die mit dem Standarddatenmodell ausgeliefert werden.
