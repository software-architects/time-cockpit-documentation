---
title: Signal Tracker für TFS - Changesets und Work Items
description: Zeichnen Sie Changesets und Work-Item-Änderungen aus Microsoft Team Foundation Server in time cockpit auf und verfolgen Sie Code-Commits.
en_page: doc/signal-tracker/team-foundation-server.md
---
# Signal Tracker für Team Foundation Server	

Der Signal Tracker für Microsoft Team Foundation Server kann Changesets und Work-Item-Änderungen aufzeichnen. Entwickler, die Microsoft TFS verwenden und Zeitbuchungen pro Work Item (User Story, Task, Bug) anlegen möchten, können so leicht nachvollziehen, wann sie an welchem Work Item gearbeitet haben.

## Gesammelte Daten

Der Signal Tracker für Microsoft TFS prüft regelmäßig, ob es für den angegebenen Benutzer neue Changesets oder Work-Item-Änderungen gibt.

Für Changesets werden die folgenden Informationen importiert:

- Id
- EventTime
- ChangeSetComment (160 Zeichen)
- Committer
- Owner
- Changes (geänderte Dateien, 600 Zeichen)
- WorkItems (160 Zeichen)
- ArtifactUri

Für Work Items werden die folgenden Informationen importiert:

- Id
- Uri
- CreatedDate
- EventTime
- Description (160 Zeichen)
- Reason (160 Zeichen)
- History (160 Zeichen)
- Title
- WorkItemState
- Revision
- AssignedTo
- Project
- Type
- AreaPath
- IterationPath
- NodeName
- CreatedBy

Wenn Sie den Signal Tracker für Microsoft TFS beenden oder pausieren, zeichnet er Ihre Changesets und Work-Item-Änderungen nicht auf.

## Konfigurationsparameter des Signal Trackers

Parametername | Datentyp | Beschreibung
--- | --- | ---
Polling Intervall (`Interval`) | Zeitspanne | Intervall, in dem der Signal Tracker nach neuen Changesets und Work-Item-Änderungen sucht. Die Einstellung `00:15:00` legt fest, dass der Tracker alle 15 Minuten nach Änderungen suchen soll. Kleinere Werte können die Performance Ihres Computers verringern, größere Werte führen zu ungenaueren Werten.
TFS Server URI (`ServerUri`) | Text | URI des Microsoft Team Foundation Server (z. B. http://mytfs:8080/tfs). Wenn Sie [Team Foundation Service](http://tfs.visualstudio.com/) verwenden, müssen Sie die Team Project Collection angeben, z. B. https://fabrikamfiber.visualstudio.com/DefaultCollection
Project to Track (`Project`) | Text | Wenn Sie ein Projekt angeben, zeichnet time cockpit nur Changesets und Work-Item-Änderungen im angegebenen Projekt auf. Wenn Sie diesen Parameter leer lassen, zeichnet time cockpit alle Projekte in Microsoft TFS für Ihren Benutzer auf.
Folder to Track (`Path`) | Text | Sie können einen Ordner in Microsoft TFS angeben, der aufgezeichnet werden soll. Wenn Sie diesen Parameter leer lassen, zeichnet time cockpit Änderungen in allen Ordnern für Ihren Benutzer auf.

## Voraussetzungen

Dieser Signal Tracker setzt eine installierte Version des Microsoft Team Foundation Client voraus. Diese Abhängigkeit lässt sich entweder über Visual Studio oder über Team Explorer erfüllen. Die folgenden Versionen werden unterstützt:

- 2010 (10.0.0.0)
- 2012 (11.0.0.0)
- 2013 (12.0.0.0)

Für einen fehlerfreien Betrieb sind mindestens die folgenden Assemblies erforderlich (abhängig von der Visual-Studio-Version):

- Microsoft.TeamFoundation.Client.dll
- Microsoft.TeamFoundation.VersionControl.Client.dll
- Microsoft.TeamFoundation.WorkItemTracking.Client.dll

Die typischen Installationsorte sind (abhängig von der Visual-Studio-Version):

- C:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\IDE\ReferenceAssemblies\v2.0
- C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\IDE\ReferenceAssemblies\v2.0
- C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\ReferenceAssemblies\v2.0
