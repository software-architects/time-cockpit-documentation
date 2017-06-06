# Signal Tracker for Team Foundation Server	

The signal tracker for Microsoft Team Foundation Server is able to track change sets and work item changes. Developers who are using Microsoft TFS and want to book time sheet entries per work item (user story, task, bug) can easily track when the have been working on which item.

## Collected Data

The signal tracker for Microsoft TFS regularly checks if there are new change sets or work item changes for the specified user.

For change sets the following information is imported:

- Id
- EventTime
- ChangeSetComment (160 charachters)
- Committer
- Owner
- Changes (changed files, 600 charachters)
- WorkItems (160 charachters)
- ArtifactUri

For work items the following information is imported:

- Id
- Uri
- CreatedDate
- EventTime
- Description (160 charachters)
- Reason (160 charachters)
- History (160 charachters)
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

If you exit or pause the signal tracker for Microsoft TFS, it will not track your change sets and work item changes.

## Configuration Parameters for the Signal Tracker

Parameter Name | Data Type | Description
--- | --- | ---
Polling Intervall (`Interval`) | Timespan | Interval within which the signal tracker looks for new change sets and work item changes. The setting `00:15:00` specifies that the tracker should look for changes every 15 minutes. Smaller values may decrease the performance of your computer, larger values lead to more inaccurate values.
TFS Server URI (`ServerUri`) | Text | URI of the Microsoft Team Foundation Server (e.g. http://mytfs:8080/tfs). If you are using [Team Foundation Service](http://tfs.visualstudio.com/) you have to include the team project collection. e.g. https://fabrikamfiber.visualstudio.com/DefaultCollection
Project to Track (`Project`) | Text | If you specify a project, time cockpit will only track change sets in work item changes in the specified project. If you leave this parameter empty, time cockpit will track all projects in Microsoft TFS for your user.
Folder to Track (`Path`) | Text | You can specify a folder that should be tracked in Microsoft TFS. If you leave this parameter empty, time cockpit will track changes in all folders for your user.

## Prerequisites

This signal tracker requires an installed version of the Microsoft Team Foundation Client. This dependency can either be handled through Visual Studio or Team Explorer. The following versions are supported:

- 2010 (10.0.0.0)
- 2012 (11.0.0.0)
- 2013 (12.0.0.0)

The assemblies required for proper operation are at least (depending on visual studio version):

- Microsoft.TeamFoundation.Client.dll
- Microsoft.TeamFoundation.VersionControl.Client.dll
- Microsoft.TeamFoundation.WorkItemTracking.Client.dll

The typical installation locations are (depending on visual studio version):

- C:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\IDE\ReferenceAssemblies\v2.0
- C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\IDE\ReferenceAssemblies\v2.0
- C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\ReferenceAssemblies\v2.0