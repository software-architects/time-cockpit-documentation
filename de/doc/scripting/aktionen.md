---
title: Aktionen - Eigene Geschäftslogik und Workflows
description: "Eigene Aktionen in time cockpit mit IronPython erstellen: Aufbau, Bedingungen, Parameter und Ausführungskontext von Aktionen für Workflows."
en_page: doc/scripting/actions.md
---
# Aktionen

Im Modell von time cockpit können Sie Aktionen definieren. Aktionen lassen sich für Workflows, zum Erstellen von Rechnungen usw. verwenden. Generell können Sie Aktionen immer dann einsetzen, wenn Sie ein bestimmtes Verhalten umsetzen möchten, das time cockpit nicht standardmäßig mitbringt.

## Aufbau von Aktionen

Aktionen werden als Instanzen der Klasse [TimeCockpit.Data.DataModel.Actions.ModelAction](/api/TimeCockpit.Data.DataModel.Actions.ModelAction.html) dargestellt. Über die Eigenschaft [ModelActions](/api/TimeCockpit.Data.DataModel.Model.html#TimeCockpit_Data_DataModel_Model_Actions) können Sie dem Modell eine Aktion hinzufügen.

Sie können Bedingungen definieren, die erfüllt sein müssen, damit eine Aktion ausgeführt werden kann. Jede Bedingung wird durch eine Instanz der Klasse [TimeCockpit.Data.DataModel.Condition](/api/TimeCockpit.Data.DataModel.Condition.html) oder einer ihrer abgeleiteten Klassen dargestellt. Die wichtigste Bedingung ist [TimeCockpit.Data.DataModel.Actions.ModelEntityTypeCondition](/api/TimeCockpit.Data.DataModel.Actions.ModelEntityTypeCondition.html). Damit legen Sie fest, dass eine bestimmte Aktion nur auf Instanzen eines bestimmten Entitätstyps angewendet werden kann.

Eine Aktion kann einen optionalen Parameter haben. Der Parameter wird durch eine Instanz der Klasse [TimeCockpit.Data.DataModel.Actions.ModelActionParameterDefinition](/api/TimeCockpit.Data.DataModel.Actions.ModelActionParameterDefinition.html) oder einer ihrer abgeleiteten Klassen dargestellt. Mit einem Parameter können Sie vom Benutzer zusätzliche Daten abfragen, die zum Ausführen der jeweiligen Aktion nötig sind.

Nicht zuletzt muss jede Aktion ein Binding haben. Das Binding legt fest, woher der Code der Aktion stammt. Derzeit unterstützt time cockpit nur Aktionen, die in Python geschrieben sind. Daher müssen Sie [TimeCockpit.Data.DataModel.Actions.IronPythonBinding](/api/TimeCockpit.Data.DataModel.Actions.IronPythonBinding.html) verwenden.

## Aktionen erstellen und aktualisieren

Das folgende Beispiel erstellt eine Aktion aus einer Python-Quelldatei:

[!code-python[Create action](code/create-action.py)]

Das folgende Beispiel aktualisiert eine Aktion aus einer Python-Quelldatei. Es fügt der Aktion eine Filterentität hinzu, die angezeigt wird, bevor die Aktion ausgeführt wird.

[!code-python[Update action](code/update-action.py)]

## Code einer Aktion

Das folgende Beispiel zeigt den Code einer Aktion. Beachten Sie, dass der Code einer Aktion ausschließlich aus Python-Methodendefinitionen bestehen darf. Die Aktion erhält einen Parameter vom Typ [TimeCockpit.Data.DataModel.Actions.ExecutionContext](/api/TimeCockpit.Data.DataModel.Actions.ExecutionContext.html).

[!code-python[Set action code](code/create-invoice-action-code.py)]

## Das InputSet verwenden

Bevor eine Aktion ausgeführt wird, lädt time cockpit die betroffenen Datenzeilen neu, bevor es sie über die Eigenschaft `InputSet` an die Aktion übergibt. Das ist nötig, damit die vollständigen Zeilen einschließlich aller abhängigen Objekte im Speicher sind. Eine Liste könnte so optimiert sein, dass sie nur einen Teil der Spalten einer Modellentität lädt. Würde time cockpit die Datenzeilen vor dem Ausführen der Aktion nicht neu laden, bekäme die Aktion unter Umständen unvollständige Daten.

> [!WARNING]
> Beachten Sie, dass das InputSet keine definierte Reihenfolge der Objekte garantiert. Je nach Anwendungsfall kann eine Sortierung nötig sein.

Zum Neuladen der Entitäten erzeugt time cockpit eine [TCQL](~/doc/tcql/ueberblick.md)-Anweisung mit folgendem Aufbau: `From C In [ModelEntityName][IncludeClause] Where C.[ModelEntityName]Uuid In {[SelectedUuids]} Select C`.

Die [TimeCockpit.Data.DataModel.ModelEntity](/api/TimeCockpit.Data.DataModel.ModelEntity.html) ergibt sich aus der Liste oder dem Formular, in dem der Benutzer die Aktion aufgerufen hat. Ruft der Benutzer eine Aktion im Zeiterfassungskalender auf, ist die zugrunde liegende [TimeCockpit.Data.DataModel.ModelEntity](/api/TimeCockpit.Data.DataModel.ModelEntity.html) immer `TimeSheet`.

Die SelectedUuids ergeben sich aus dem Formular, den ausgewählten Elementen in der Liste oder den ausgewählten Elementen im Zeiterfassungskalender.

Die `IncludeClause` (mehr zu Include-Klauseln unter [TCQL](~/doc/tcql/ueberblick.md) wird durch folgende Faktoren bestimmt:

- Die Aktion kann eine Verarbeitungsdirektive # IncludeClause enthalten, die festlegt, welche Beziehungen einbezogen werden sollen (Details siehe Kapitel [IncludeClause-Verarbeitungsdirektive](#includeclause-verarbeitungsdirektive)).

- Ist in der Aktion keine [IncludeClause-Direktive](#includeclause-verarbeitungsdirektive) angegeben, sucht time cockpit nach dem Standardformular der betroffenen [TimeCockpit.Data.DataModel.ModelEntity](/api/TimeCockpit.Data.DataModel.ModelEntity.html). Hat das Formular eine `IncludeClause` festgelegt, wird diese `IncludeClause` verwendet. Das funktioniert nicht, wenn für das Standardformular einer [TimeCockpit.Data.DataModel.ModelEntity](/api/TimeCockpit.Data.DataModel.ModelEntity.html) ein Ausdruck angegeben ist. Da von einer Aktion mehrere Entitäten betroffen sein können, kann time cockpit kein eindeutiges Standardformular ermitteln, wenn ein Ausdruck verwendet wird.

- Gibt es in der Aktion keine [IncludeClause-Direktive](#includeclause-verarbeitungsdirektive) und lässt sich kein Standardformular ermitteln, verwendet time cockpit die Include-Klausel `.Include(*)`. Das bedeutet, dass alle Beziehungen rekursiv einbezogen werden. Haben die betroffenen Entitäten viele Beziehungen, kann die TCQL-Anweisung recht groß und damit langsam werden. Um die Performance der Aktion zu verbessern, fügen Sie eine [IncludeClause-Direktive](#includeclause-verarbeitungsdirektive) hinzu, die alle Beziehungen angibt, die zum Ausführen der Aktion tatsächlich nötig sind.

## IncludeClause-Verarbeitungsdirektive

Eine Aktion kann optional eine Verarbeitungsdirektive `# IncludeClause` enthalten, die festlegt, welche Beziehungen einbezogen werden sollen. Der Code der Direktive muss in den ersten Zeilen des Codes der Aktion stehen, ohne Leerzeilen davor oder dazwischen. Die Direktive `IncludeClause` ist als Python-Kommentar umgesetzt. Sie hat folgende Syntax:

```
<includeClauseDirective> ::=
  [ # IncludeClause 
        ( NoInclude 
          | .Include(*)
          | .Include(<relation_path>)[.Include(<relation_path>)...] ) ]
  [ # SelectSettings.AutoIncludeRelations ( true | false ) ]

<relation_path> ::=
  "<relation_name>[.<relation_name>...]"
 ```

Angenommen, die folgende Aktion wird für Zeitbuchungen verwendet. Die `# IncludeClause` legt fest, dass Aufgaben, Projekte, Kunden und Rechnungen einbezogen werden sollen.

```
# IncludeClause .Include('APP_Task.APP_Project.APP_Customer').Include('Invoice')

clr.AddReference("System")
clr.AddReference("PresentationFramework")
clr.AddReference("System.Core")

...
```

Wenn Sie keine Beziehungen einbeziehen möchten, verwenden Sie folgende Verarbeitungsdirektive: `# IncludeClause NoInclude`. Beachten Sie, dass diese Direktive das Einbeziehen von Beziehungen nicht unterdrückt, die für berechnete Eigenschaften, Validierungsregeln usw. nötig sind.

Um festzulegen, dass nur die Beziehungen einbezogen werden, die Sie in der Direktive `# IncludeClause .Include(...)` ausdrücklich angeben, ohne automatisch die Beziehungen einzubeziehen, die für berechnete Eigenschaften, Validierungsregeln oder Berechtigungen nötig sind, geben Sie folgende Direktive an: `# SelectSettings.AutoIncludeRelations false`. Das ist sinnvoll, wenn Sie nur wenige Eigenschaften der ausgewählten Entitäten benötigen, zum Beispiel die Uuids der Entität.

Wenn Sie überhaupt keine Beziehungen einbeziehen möchten, müssen Sie `# SelectSettings.AutoIncludeRelations false` und `# IncludeClause NoInclude` kombinieren.

> [!NOTE]
> Verwenden Sie `# SelectSettings.AutoIncludeRelations false` niemals, wenn Sie die ausgewählten Entitäten in der Aktion speichern. Validierungsregeln und Berechtigungen funktionieren nicht wie erwartet, wenn die nötigen Beziehungen nicht geladen sind.
