---
title: Trigger - Automatische Verarbeitung von Datensätzen
description: Trigger in time cockpit erstellen, die beim Einfügen, Aktualisieren oder Löschen von Datensätzen automatisch Code ausführen. Fortgeschrittenes Konzept.
en_page: doc/scripting/triggers.md
---
# Trigger

In time cockpit können Sie sogenannte Trigger definieren. Ähnlich wie Datenbanktrigger sind Trigger in time cockpit kleine Codestücke, die automatisch ausgeführt werden, sobald ein Datensatz einer bestimmten Entität eingefügt, aktualisiert oder gelöscht wird. Typische Szenarien für Trigger in time cockpit sind:

- Automatisch eindeutige Codes für Datensätze erzeugen, die eingefügt werden sollen
- Erweiterte Validierung von Datensätzen (z. B. ob das Budget der Aufgaben das Budget eines Projekts überschreitet)
- Die Integrität der Informationen in der Datenbank sicherstellen
Trigger sind ein fortgeschrittenes Konzept in time cockpit. Daher können sie nicht über die Administrationsoberfläche definiert werden, sondern müssen per Skript erstellt werden.

## Aufbau von Triggern

Trigger werden als Instanzen der Klasse TimeCockpit.Data.DataModel.Triggers.Trigger dargestellt. Im Gegensatz zu Aktionen werden Trigger immer für eine bestimmte Entität erstellt.

Sie haben verschiedene Möglichkeiten, das Verhalten eines Triggers zu beeinflussen.

### TriggerType

- `TriggerType.AfterSave`: Gibt an, dass der Trigger ausgeführt wird, nachdem der eigentliche Datensatz gespeichert wurde.
- `TriggerType.BeforeSave`: Gibt an, dass der Trigger ausgeführt wird, bevor der eigentliche Datensatz gespeichert wird.

### TriggerExecutionMode

Dieser Parameter wirkt sich nur aus, wenn Sie den ChangeTracker von time cockpit verwenden. Bei einem einzelnen Speichervorgang führt dieser Parameter zu keinem unterschiedlichen Verhalten.

- `TriggerExecutionMode.Once`: Gibt an, dass der Trigger einmal für alle Datensätze einer bestimmten Entität in einem ChangeTracker ausgeführt wird.
- `TriggerExecutionMode.OnEverySave`: Gibt an, dass der Trigger für jeden Datensatz einer bestimmten Entität in einem ChangeTracker ausgeführt wird.

### TriggerExecutionTime

- `TriggerExecutionTime.OnInsert`: Gibt an, dass der Trigger ausgeführt wird, wenn ein Datensatz zum ersten Mal eingefügt wird.
- `TriggerExecutionTime.OnUpdate`: Gibt an, dass der Trigger ausgeführt wird, wenn ein Datensatz bereits in der Datenbank vorhanden war und aktualisiert wird.
- `TriggerExecutionTime.OnDelete`: Gibt an, dass der Trigger ausgeführt wird, wenn ein Datensatz bereits in der Datenbank vorhanden war und gelöscht wird.

> [!NOTE]
> Beachten Sie, dass TriggerExecutionTime eine Flag-Enum-Eigenschaft ist. Das heißt, Sie können OnInsert, OnUpdate und OnDelete mit dem Operator | kombinieren.

Wie bei Triggern in einer Datenbank können Sie im Trigger auf die betroffenen Datensätze zugreifen, die eingefügt, aktualisiert oder gelöscht werden. Dafür bietet der Trigger zwei Collections:

### Inserted

- Einfügevorgang: Die Collection Inserted enthält die Datensätze, die eingefügt werden sollen.
- Aktualisierungsvorgang: Die Collection Inserted enthält die Datensätze, die aktualisiert werden sollen, mit ihren neuen Werten.
- Löschvorgang: Die Collection Inserted ist leer.

### Deleted

- Einfügevorgang: Die Collection Inserted ist leer.
- Aktualisierungsvorgang: Die Collection Inserted enthält die Datensätze, die aktualisiert werden sollen, mit ihren alten Werten.
- Löschvorgang: Die Collection Inserted enthält die Datensätze, die gelöscht werden sollen.

## Trigger erstellen und aktualisieren

Das folgende Beispiel erstellt oder aktualisiert einen Trigger aus einer Python-Quelldatei:

[!code-python[Create or update trigger](code/create-update-trigger.py)]

## Code eines Triggers

Das folgende Beispiel zeigt den Code eines Triggers. Beachten Sie, dass der Code eines Triggers ausschließlich aus einer einzigen IronPython-Methodendefinition bestehen darf.

[!code-python[Set trigger code](code/note-trigger-code.py)]

## IncludeClause-Verarbeitungsdirektive

Um die alten Werte zu erhalten, muss ein Trigger, der für Aktualisierungen konfiguriert ist, die alten Werte eines Datensatzes aus der Datenbank abrufen. Standardmäßig erzeugt der Trigger eine TCQL-Abfrage und bezieht alle Beziehungen ein, die er für nötig hält. Bei großen Datenmodellen kann das die Performance beeinträchtigen.

Daher kann ein Trigger optional eine Verarbeitungsdirektive `# IncludeClause` enthalten, die festlegt, welche Beziehungen einbezogen werden sollen. Der Code der Direktive muss in den ersten Zeilen des Codes des Triggers stehen, ohne Leerzeilen davor oder dazwischen. Die Direktive `IncludeClause` ist als IronPython-Kommentar umgesetzt. Sie hat folgende Syntax:

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

Angenommen, der folgende Trigger wird für Zeitbuchungen verwendet. Die `# IncludeClause` legt fest, dass Aufgaben, Projekte, Kunden und Rechnungen einbezogen werden sollen.

```
# IncludeClause .Include('APP_Task.APP_Project.APP_Customer').Include('Invoice')

clr.AddReference("System")
clr.AddReference("PresentationFramework")
clr.AddReference("System.Core")

...
```

Wenn Sie keine Beziehungen einbeziehen möchten, verwenden Sie folgende Verarbeitungsdirektive: `# IncludeClause NoInclude`. Beachten Sie, dass diese Direktive das Einbeziehen von Beziehungen nicht unterdrückt, die für berechnete Eigenschaften, Validierungsregeln usw. nötig sind.

Um festzulegen, dass nur die Beziehungen einbezogen werden, die Sie in der Direktive `# IncludeClause .Include(...)` ausdrücklich angeben, ohne automatisch die Beziehungen einzubeziehen, die für berechnete Eigenschaften, Validierungsregeln oder Berechtigungen nötig sind, geben Sie folgende Direktive an: `# SelectSettings.AutoIncludeRelations` false. Das ist sinnvoll, wenn Sie nur wenige Eigenschaften der ausgewählten Entitäten benötigen, zum Beispiel die Uuids der Entität.

Wenn Sie überhaupt keine Beziehungen einbeziehen möchten, müssen Sie `# SelectSettings.AutoIncludeRelations false` und `# IncludeClause NoInclude` kombinieren.

> [!NOTE]
> Seien Sie vorsichtig mit `# SelectSettings.AutoIncludeRelations false`, wenn Sie die ausgewählten Entitäten im Trigger speichern. Validierungsregeln und Berechtigungen funktionieren nicht wie erwartet, wenn die nötigen Beziehungen nicht geladen sind.
