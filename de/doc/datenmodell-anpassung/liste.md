---
title: Listen anpassen - Eigene Datenansichten erstellen
description: "Erstellen Sie eigene Listen in time cockpit, um Daten nach Ihren Wünschen anzuzeigen: TCQL-Listen, Skriptlisten, BoundCells und spezielle Zelltypen."
en_page: doc/data-model-customization/list.md
---
# Listen anpassen

Benutzer von time cockpit können eigene Listen anlegen, um ihre Daten so anzuzeigen, wie sie sie brauchen. Um von Benutzern definierte Listen von Listen des time cockpit Teams zu unterscheiden, verwenden wir Präfixe. Listen mit dem Präfix `APP` werden mit time cockpit ausgeliefert und können vom Benutzer nicht geändert werden. Legen Benutzer eigene Listen an, erhalten diese automatisch das Präfix `USR`. Dieses Präfix stellt sicher, dass die Liste beim Upgrade von time cockpit nie verändert wird.

Benutzer müssen eigene Listen anlegen, wenn sie einer Entität zusätzliche Eigenschaften oder Beziehungen hinzufügen (siehe [Entitäten anpassen](~/doc/datenmodell-anpassung/entitaet.md)) oder unerwünschte Eigenschaften oder Beziehungen aus den mitgelieferten Listen von time cockpit entfernen möchten. Hier beschreiben wir, wie Sie eigene benutzerdefinierte Listen anlegen.

## Einfache Listen

Wie benutzerdefinierte Formulare bestehen auch benutzerdefinierte Listen aus sogenannten [TimeCockpit.Data.DataModel.View.BoundCell](/api/TimeCockpit.Data.DataModel.View.BoundCell.html)s. [TimeCockpit.Data.DataModel.View.BoundCell](/api/TimeCockpit.Data.DataModel.View.BoundCell.html)s stellen automatisch ein Standard-Steuerelement für die Eigenschaft oder Beziehung dar, die sie visualisieren. Soll eine [TimeCockpit.Data.DataModel.View.BoundCell](/api/TimeCockpit.Data.DataModel.View.BoundCell.html) eine Datumseigenschaft visualisieren, zeigt sie in der Benutzeroberfläche eine Datumsauswahl an. Soll eine [TimeCockpit.Data.DataModel.View.BoundCell](/api/TimeCockpit.Data.DataModel.View.BoundCell.html) ein boolesches Feld darstellen, zeigt sie in der Benutzeroberfläche automatisch ein Kontrollkästchen an.

```
<List AllowDelete="True" AllowEdit="True" Query="From Current In APP_Project.Include(*) Where (Current.APP_StartDate &lt;= @DueDate Or @DueDate = Null) And (Current.APP_EndDate &gt;= @DueDate Or @DueDate = Null) Order By Current.APP_Code Select Current" xmlns="clr-namespace:TimeCockpit.Data.DataModel.View;assembly=TimeCockpit.Data" xmlns:p="http://www.timecockpit.com/2009/ui/controls"> 
  <BoundCell Content="=Current.APP_Customer" /> 
  <BoundCell Content="=Current.APP_Code" /> 
  <BoundCell Content="=Current.APP_ProjectName" /> 
  <BoundCell Content="=Current.APP_StartDate" /> 
  <BoundCell Content="=Current.APP_EndDate" /> 
  <BoundCell Content="=Current.APP_Budget" /> 
  <BoundCell Content="=Current.APP_BudgetInHours" /> 
  <BoundCell Content="=Current.APP_Billable" /> 
  <BoundCell Content="=Current.APP_Closed" /> 
</List>
```

In vielen Fällen reichen BoundCells völlig aus. Wenn Benutzer jedoch mehr Kontrolle darüber haben möchten, wie eine Eigenschaft oder Beziehung in der Benutzeroberfläche dargestellt wird, müssen sie spezialisierte Zelltypen verwenden. Die spezialisierten Zelltypen bieten zusätzliche Attribute, mit denen sich das Verhalten eines UI-Elements (z. B. einer Datumsauswahl) steuern lässt. Im Folgenden behandeln wir die Spezialisierungen von BoundCell und ihre zusätzlichen Attribute:

...

```
<List AllowDelete="True" AllowEdit="True" Query="From Current In APP_Project.Include(*) Where (Current.APP_StartDate &lt;= @DueDate Or @DueDate = Null) And (Current.APP_EndDate &gt;= @DueDate Or @DueDate = Null) Order By Current.APP_Code Select Current" xmlns="clr-namespace:TimeCockpit.Data.DataModel.View;assembly=TimeCockpit.Data" xmlns:p="http://www.timecockpit.com/2009/ui/controls"> 
  <BoundCell Content="=Current.APP_Customer" /> 
  <BoundCell Content="=Current.APP_Code" /> 
  <BoundCell Content="=Current.APP_ProjectName" /> 
  <DateTimeCell Content="=Current.APP_StartDate" ShowTime="False" DateTimeFormatPattern="M"/> 
  <NumericCell Content="=Current.APP_Budget" NumberFormatPattern="G"/> 
</List>
```

## Hyperlinks in Listen

In Listen werden Beziehungen auf besondere Weise dargestellt, nämlich als Hyperlinks. Es gibt zwei Arten von Hyperlinks:

### : 1-Hyperlinks

Ausgehend von einer Liste öffnet diese Art von Hyperlink ein Formular, um genau einen Datensatz anzuzeigen oder zu bearbeiten. Der Kunden-Hyperlink in der Liste der Zeitbuchungen ist ein Beispiel für einen :1-Hyperlink.

![: 1-Hyperlink](/doc/data-model-customization/images/list-hyperlink.png ": 1-Hyperlink")

Der folgende Code zeigt, wie Sie : 1-Hyperlinks konfigurieren:

```
<BoundCell Content="=Current.Customer" > 
    <BoundCell.Hyperlink> 
        <Hyperlink Target="CustomerForm" Title="=Current.CustomerName.CustomerName"> 
            <Hyperlink.NavigateContent> 
                <p:NamedFormConfiguration EntityObjectUuid="=Current.Customer.CustomerUuid" ModelEntityName="APP_Customer" /> 
            </Hyperlink.NavigateContent> 
        </Hyperlink> 
    </BoundCell.Hyperlink> 
</BoundCell>
```

Die BoundCell im obigen Beispiel stellt den Kunden dar, für den ein Projekt durchgeführt wurde. Die Eigenschaft `Content` legt fest, welche Beziehung als Hyperlink visualisiert werden soll, in unserem Fall `=Current.Customer`. Das Schlüsselwort `Current` ist eine Referenz auf den Datensatz, der in einer Liste angezeigt wird. Im obigen Beispiel steht `Current` für eine Zeile in einer Projektliste.

Eine Beziehung kann auch nur mit einer BoundCell visualisiert werden. In diesem Fall zeigt time cockpit keinen Hyperlink an, sondern verwendet die Anzeigeeigenschaft der verknüpften Entität und stellt eine Textzelle dar. `<BoundCell Content="=Current.APP_Customer" />` ergibt also eine Zelle mit dem Firmennamen eines Kunden.

Um eine [TimeCockpit.Data.DataModel.View.BoundCell](/api/TimeCockpit.Data.DataModel.View.BoundCell.html) in einen Hyperlink umzuwandeln, verschachteln wir einen [TimeCockpit.Data.DataModel.View.Hyperlink](/api/TimeCockpit.Data.DataModel.View.Hyperlink.html) in der [TimeCockpit.Data.DataModel.View.BoundCell](/api/TimeCockpit.Data.DataModel.View.BoundCell.html). Ein Hyperlink hat einige zusätzliche Eigenschaften, die sein Verhalten steuern:

Feld | Beschreibung
--- | ---
Content | Im obigen Beispiel verwenden wir nur `Current.Customer` als Inhalt des Hyperlinks. In diesem Fall zeigt time cockpit den Wert der Anzeigeeigenschaft einer Entität an. Bei der Entität Kunde wäre das `CompanyName`. Benutzer können die Anzeigeeigenschaft einer Entität natürlich ändern. Würde ein Benutzer die Anzeigeeigenschaft beispielsweise auf `Code` ändern, würde die Spalte den Code eines Kunden als Hyperlink anzeigen.<br/><br/>![Inhalt des Hyperlinks](/doc/data-model-customization/images/hyperlink-content.png "Inhalt des Hyperlinks")
Title | Legt den Titel des Fensters fest, das geöffnet wird. Der Inhalt des Attributs Title ist üblicherweise ein TCQL-Ausdruck (siehe auch TCQL-Ausdruckssprache), z. B. =Current.Customer.CompanyName. Sie können aber auch komplexere Ausdrücke wie ='Code: ' + Current.APP_Customer.APP_CustomerCode verwenden. Diese Konfiguration ergibt den Fenstertitel Code: [Code des ausgewählten Kunden].
DockPosition | Diese Eigenschaft legt fest, wo die Darstellung eines Datensatzes (in unserem Fall eines Kunden) geöffnet werden soll. Ist keine Dock-Position festgelegt, öffnet sich ein modales Fenster, das einen einzelnen Datensatz darstellt, z. B. einen Kunden (siehe linke Abbildung unten). Wenn Sie das Fenster in einem anderen Tab (nicht modal) öffnen möchten, müssen Sie eine Dock-Position festlegen. Sie können zwischen Left, Right und Center wählen (siehe rechte Abbildung unten).<br/><br/>![Modales Formular](/doc/data-model-customization/images/modal-form.png "Modales Formular")<br/><br/>![Angedocktes Formular](/doc/data-model-customization/images/docked-form.png "Angedocktes Formular")
Target | **Die Eigenschaft Target funktioniert nur in Kombination mit einer Dock-Position.** Ist keine Dock-Position festgelegt, hat die Eigenschaft Target keine Wirkung. Haben Sie eine Dock-Position festgelegt, teilt die Eigenschaft Target time cockpit mit, ob der Hyperlink in einem neuen Tab geöffnet oder ein bestehender Tab wiederverwendet werden soll. Ist keine Eigenschaft Target gesetzt, wird der Hyperlink immer in einem neuen Tab geöffnet. Ist Target auf einen Wert gesetzt, prüft der Hyperlink, ob bereits ein Tab mit demselben Target geöffnet ist, und verwendet ihn gegebenenfalls wieder.
ModelEntityName | Teilt time cockpit mit, von welchem Typ (= welcher Entität) der Datensatz ist, der geöffnet wird.
EntityObjectUuid | Die technische ID des Datensatzes, der aus der Datenbank geladen und angezeigt wird.

### : N-Hyperlinks (Rückreferenzen)

Diese Hyperlinks stellen die umgekehrte Richtung der Beziehung dar. Ein Beispiel wäre, wenn wir alle Zeitbuchungen anzeigen möchten, die auf ein bestimmtes Projekt gebucht sind. Das Projekt ist die : 1-Seite der Beziehung, die Zeitbuchungen sind die : N-Seite. Die : N-Seite kann nicht in einem Formular dargestellt werden, das einen einzelnen Datensatz zeigt, sondern muss eine Liste mit mehreren Datensätzen sein. Die folgenden Codebeispiele zeigen, wie Sie einen : N-Hyperlink in einer Liste definieren.

```
<BoundCell Content="Time Sheets"> 
  <BoundCell.Hyperlink> 
    <Hyperlink Target="Time Sheets" Title="Time Sheets"> 
      <Hyperlink.NavigateContent> 
        <p:NamedListConfiguration ModelEntityName="APP_Timesheet"> 
          <p:NamedListConfiguration.Parameters> 
            <Parameter Name="Project" Value="=Current.ProjectUuid" /> 
          </p:NamedListConfiguration.Parameters> 
        </p:NamedListConfiguration> 
      </Hyperlink.NavigateContent> 
    </Hyperlink> 
  </BoundCell.Hyperlink> 
</BoundCell>
```

Die Definition eines : N-Hyperlinks ist der Definition eines : 1-Hyperlinks recht ähnlich. Beachten Sie, dass wir für einen : N-Hyperlink keine `NamedFormConfiguration`, sondern eine `NamedListConfiguration` verwenden. Das heißt, wenn ein : N-Hyperlink angeklickt wird, öffnet sich eine Liste von Datensätzen in einem Tab. Im obigen Beispiel versucht time cockpit, die **Standard Liste** zu ermitteln, die für die Entität Zeitbuchung konfiguriert ist, und verwendet diese Liste zur Anzeige der Zeitbuchungen. Um nach den Zeitbuchungen zu filtern, die auf ein bestimmtes Projekt gebucht sind, übergibt die obige NamedListConfiguration einen Parameter (siehe folgenden Abschnitt), nämlich die ID des Projektdatensatzes, an die Liste der Zeitbuchungen. Das Ergebnis ist eine Liste der Zeitbuchungen für ein ausgewähltes Projekt.

Die Eigenschaften Target und Title verhalten sich genau wie bei : 1-Hyperlinks.

![Named List Configuration](/doc/data-model-customization/images/named-list-config.png "Named List Configuration")

Für komplexere Szenarien bieten : N-Hyperlinks zwei zusätzliche Eigenschaften, `ListName` und `Condition`. Wenn Sie wie im folgenden Beispiel einen bestimmten Listennamen konfigurieren, können Sie eine bestimmte Liste auswählen, mit der eine Menge von Datensätzen in einem neuen Tab angezeigt wird. Wenn Sie auf die von der konfigurierten Liste zurückgegebene Ergebnismenge einen zusätzlichen Filter anwenden möchten, können Sie eine Bedingung definieren. Die Bedingung ist ein [TCQL-Ausdruck](~/doc/tcql/ausdruckssprache.md), mit dem die Datensätze gefiltert werden. Im obigen Hyperlink-Beispiel wird die `APP_DefaultTimesheetList` verwendet, die Ergebnisse auf Basis der folgenden Abfrage liefert:

```
From Current In APP_Timesheet
Where (Current.APP_BeginTime &gt;= @BeginTime Or @BeginTime = Null) And (:AddDays(Current.APP_EndTime, -1) &lt;= @EndTime Or @EndTime = Null) 
Order By Current.APP_BeginTime, :DisplayValue(Current.APP_UserDetail)
Select New With
{
        .ObjectUuid = Current.APP_TimesheetUuid,
        .UserDetailUuid = Current.APP_UserDetail.APP_UserDetailUuid,
        .UserDetailName = :DisplayValue(Current.APP_UserDetail),
        .CustomerUuid = Current.APP_Project.APP_Customer.APP_CustomerUuid,
        .CustomerName = :DisplayValue(Current.APP_Project.APP_Customer),
        .ProjectUuid = Current.APP_Project.APP_ProjectUuid,
        .ProjectName = :DisplayValue(Current.APP_Project),
        .TaskUuid = Current.APP_Task.APP_TaskUuid,
        .TaskName = :DisplayValue(Current.APP_Task),
        ...
}
```

Wenn wir nun nur die Zeitbuchungen des Projekts sehen möchten, die noch nicht verrechnet wurden, könnten wir einen Ausdruck wie Current.APP_IsBilled = False definieren. Der Ausdruck wird als zusätzliche Filterbedingung an die Abfrage übergeben und liefert so nur die nicht verrechneten Zeitbuchungen.

> [!NOTE]
> Bedingungen sollten nur verwendet werden, wenn es unbedingt notwendig ist. Besser ist es, stattdessen Parameter zu verwenden, weil Benutzer dann viel leichter erkennen, welche Filter angewendet werden.

```
From T In Timesheet Where T.APP_Project.APP_ProjectUuid = {@ProjectId} Select T
```

## Gefilterte Listen

Benutzerdefinierte Listen können mit eigenen Filterbereichen konfiguriert werden (siehe folgenden Filter). Im Grunde ist der Filterbereich einer Liste einfach ein Formular, wie es überall in time cockpit verwendet wird. Wie Sie eigene Formulare definieren, lesen Sie unter [Benutzerdefinierte Formulare](~/doc/datenmodell-anpassung/formular.md).

![Liste mit Filter](/doc/data-model-customization/images/list-with-filter.png "Liste mit Filter")

Der folgende Filter stammt aus der `APP_DefaultTimesheetList` im Standarddatenmodell von time cockpit. Wie Sie sehen, ist der Filter einfach ein Formular mit Abschnitten und Zellen. Er kann also wie jedes andere Formular konfiguriert werden.

```
<List.Filter> 
    <Form> 
        <Tab Header="=:Translate('List.General.FilterTab')"> 
            <Section> 
                <SectionColumn> 
                    <RelationCell FilterOperator="=" FilterParameterName="UserDetail" FilterPath="APP_UserDetail" DefaultValue="=Environment.CurrentUser.Me" /> 
                    <RelationCell FilterOperator="=" FilterPath="APP_Project.APP_Customer" /> 
                    <BoundCell FilterOperator="=" FilterParameterName="Project" FilterPath="APP_Project" /> 
                    <BoundCell FilterOperator="=" FilterParameterName="Task" FilterPath="APP_Task" /> 
                    <BoundCell FilterOperator="=" FilterParameterName="Invoice" FilterPath="APP_Invoice" /> 
                </SectionColumn> 
                <SectionColumn> 
                    <TextCell FilterOperator="Like" FilterPath="APP_Description" /> 
                    <DateCell FilterParameterName="BeginTime" Header="=:Translate('List.APP_DefaultTimesheetList.From')" DefaultValue="=:AddYears(:FirstOfMonth(:Today()), -1)" /> 
                    <DateCell FilterParameterName="EndTime" Header="=:Translate('List.APP_DefaultTimesheetList.To')" /> 
                    <BoundCell FilterOperator="=" FilterPath="APP_Billable" /> 
                    <BoundCell FilterOperator="=" FilterPath="APP_Billed" /> 
                </SectionColumn> 
            </Section> 
        </Tab> 
    </Form> 
</List.Filter>
```

Da Sie normale [TimeCockpit.Data.DataModel.View.BoundCell](/api/TimeCockpit.Data.DataModel.View.BoundCell.html)s wie in Listen und Formularen verwenden können, sollten Sie [TimeCockpit.Data.DataModel.View.BoundCell](/api/TimeCockpit.Data.DataModel.View.BoundCell.html)s in allen Fällen verwenden, in denen Sie kein besonderes Verhalten einer Zelle erreichen möchten. Verwenden Sie also [TimeCockpit.Data.DataModel.View.BoundCell](/api/TimeCockpit.Data.DataModel.View.BoundCell.html) so oft wie möglich, solange Sie keine speziellen Eigenschaften wie `ShowTime` ([TimeCockpit.Data.DataModel.View.DateTimeCell](/api/TimeCockpit.Data.DataModel.View.DateTimeCell.html)) oder `Condition` ([TimeCockpit.Data.DataModel.View.RelationCell](/api/TimeCockpit.Data.DataModel.View.RelationCell.html)) setzen müssen. Darüber hinaus bietet eine [TimeCockpit.Data.DataModel.View.BoundCell](/api/TimeCockpit.Data.DataModel.View.BoundCell.html) zusätzliche Eigenschaften, wenn sie im Kontext eines Listenfilters verwendet wird. Die zusätzlichen, filterbezogenen Eigenschaften sind:

### FilterPath

Ein Eigenschafts- oder Beziehungsname, der angibt, auf welche Eigenschaft oder Beziehung der Filter angewendet wird. Der folgende Ausdruck fügt der Abfrage, die die Liste mit Daten versorgt, eine zusätzliche Where-Bedingung hinzu.

```
APP_Project.APP_Customer
```

Am Beispiel der APP_DefaultTimesheetList würde time cockpit die folgende Abfrage ausführen, um die Daten für die Liste zu laden:

```
From Current In APP_Timesheet
Where ...
And Current.APP_Project.APP_Customer.APP_CustomerUuid = {4517d585-36d7-4832-9abc-c29a2c3e22d1}
...
Select New With
{
...
}
```

### FilterOperator

Die Eigenschaft FilterOperator legt fest, welcher Operator verwendet wird. Beziehungen können, wie oben beschrieben, nur auf Gleichheit geprüft werden.

- Texteigenschaften können auf Gleichheit (=), Ungleichheit (<>) und Ähnlichkeit (Like) geprüft werden.
- Numerische und Datumseigenschaften können auf Gleichheit (=) und Ungleichheit (<>) geprüft werden. Außerdem können die Operatoren <, <=, > und => verwendet werden.
- Boolesche Eigenschaften können nur auf Gleichheit (=) oder Ungleichheit (<>) geprüft werden.

> [!NOTE]
> Jede Eigenschaft und jede Beziehung kann auf Null geprüft werden, z. B. ... = Null oder ... <> Null.

### DefaultValue

Ein Standardwert kann entweder eine Konstante (z. B. True oder 9) oder ein TCQL-Ausdruck sein (siehe auch [TCQL-Ausdruckssprache](~/doc/tcql/ausdruckssprache.md)). Ein Beispiel für einen häufig verwendeten Standardwert-Ausdruck für Filter ist `:Today()`.

## Gruppierte Listen

time cockpit bietet die Möglichkeit, Standardgruppierungen für eine Liste zu konfigurieren. Listen können nach mehreren Spalten gruppiert werden. Das folgende Beispiel zeigt, wie Sie eine Liste nach dem Kunden gruppieren. Diese Gruppierungskonfiguration könnte auf eine Projektliste angewendet werden, da ein Projekt eine Beziehung zum Kunden hat.

```
<List.Groups> 
<Group AutoExpand="True" MemberPath="CustomerName" SortDirection="Ascending" /> 
</List.Groups>
```

Außerdem können Benutzer für verschiedene Eigenschaften einer Entität eine **Standard-Aggregatfunktion** festlegen. So kann es beispielsweise sinnvoll sein, zu konfigurieren, dass die Dauer in Stunden von Zeitbuchungen summiert wird, wenn eine Liste von Zeitbuchungen gruppiert wird. Dieses Verhalten konfigurieren Sie im Datenmodell von time cockpit (siehe [Eigenschaften von Entitäten](~/doc/datenmodell-anpassung/entitaet.md#eigenschaften)).

Ist eine Aggregatfunktion konfiguriert und wird eine Liste von Zeitbuchungen z. B. nach Kunde gruppiert, zeigt die Liste die Summe des Umsatzes der Zeitbuchungen pro Kunde an (siehe folgende Abbildung).

![Aggregation in einer Liste](/doc/data-model-customization/images/aggregation-in-list.png "Aggregation in einer Liste")

> [!NOTE]
> Als Aggregatfunktionen können Sie Sum, Average, Minimum und Maximum verwenden.

## Bearbeitbare Listen

Um einen Eintrag in einer normalen Liste zu bearbeiten, müssen Sie den Datensatz üblicherweise per Doppelklick öffnen. time cockpit bietet aber auch die Möglichkeit, Datensätze direkt in der Liste zu bearbeiten (siehe Abbildung). Jeder Eigenschaftstyp (Text, numerisch, boolesch) kann als direkt in der Liste bearbeitbar konfiguriert werden.

> [!NOTE]
> Beziehungen können derzeit nicht direkt in der Liste bearbeitet werden.

![Bearbeitbare Liste](/doc/data-model-customization/images/editable-list.png "Bearbeitbare Liste")

Um bearbeitbare Listen umzusetzen, müssen Sie zwei Dinge konfigurieren:

Erstens muss die Liste so konfiguriert sein, dass sie die Bearbeitung direkt in der Liste erlaubt. Dazu setzen Sie die Eigenschaft `EditMode` der Liste auf `AllRows`. Außerdem müssen Sie die Eigenschaft `IsReadOnly` für alle Spalten, die direkt in der Liste bearbeitet werden sollen, auf `False` setzen.

Schließlich müssen Sie konfigurieren, welche Aktion die geänderten Datensätze speichert. Mit der Eigenschaft `ViewAction` teilen Sie der Liste mit, welche Aktion zum Speichern verwendet wird.

```
<List.ViewActions> 
  <ViewAction Name="SavePayments" /> 
</List.ViewActions>
```

Der folgende Codeausschnitt zeigt die relevanten Teile einer bearbeitbaren Liste.

```
<List AllowDelete="True" AllowEdit="True" EditMode="AllRows" xmlns="clr-namespace:TimeCockpit.Data.DataModel.View;assembly=TimeCockpit.Data" xmlns:p="http://www.timecockpit.com/2009/ui/controls"> 
  <List.Query>
  From I In APP_Invoice.Include(*) Where I.APP_PaymentReceivedOn = Null Order By I.APP_InvoiceDate Select I
  </List.Query> 
  <List.ViewActions> 
    <ViewAction Name="SaveInvoicePayments" /> 
  </List.ViewActions> 
  <List.Filter>
    ...
  </List.Filter>
    ...
  <BoundCell Content="=Current.APP_InvoiceDate" /> 
  <BoundCell Content="=Current.APP_Description" /> 
  <BoundCell AggregateFunction="Sum" Content="=Current.APP_Revenue" /> 
  <BoundCell Content="=Current.APP_PaymentReceivedOn" IsReadOnly="False" />
  ...
</List>
```

Zweitens müssen Sie eine time cockpit Aktion bereitstellen, die die geänderten Datensätze speichert. Das bloße Speichern der geänderten Datensätze ist das häufigste Szenario. Grundsätzlich können Sie in der Aktion aber tun, was Sie möchten. Sie könnten zum Beispiel E-Mails senden, um einen Bestätigungsworkflow auszulösen, bevor Sie die geänderten Datensätze tatsächlich speichern. Das folgende einfache Beispiel durchläuft alle Datensätze der Liste und speichert jeden einzelnen.

```
clr.AddReference("System")

def actionSample(actionContext):
    for item in actionContext.InputSet:
        # ... additional business logic ...
        actionContext.DataContext.SaveObject(item)
```

> [!NOTE]
> Unter [Aktionen](/doc/scripting/actions.html) erfahren Sie, wie time cockpit Aktionen umgesetzt werden können.
