---
title: Changed Files Signal Tracker
description: Track file writes on your computer with time cockpit's changed files signal tracker. Monitor file activity to identify projects and customers.
---
# Signal Tracker for Changed Files	

The signal tracker for changed files tracks files writes on your computer. The name of the files and folders may often help you to identify the customer and project you are working on.

## Collected Data

The signal tracker for changed files trackes file writes on your computer. Usually the amount of file writes is rather large, therefore you can restrict the tracked files by specifying which folders should be tracked and by exclude patterns.

If you exit or pause the signal tracker, it will not track your file writes.

> [!NOTE]
If you plan to execute an operation that writes a lot of files in the tracked folders (e.g. extract .zip file), it is recommended to exit or pause the signal tracker for file writes. Otherwise the signal tracker will produce a large amount of signals that may decrease the performance of time cockpit. If you already have a large amount of file signals, you can delete them in the Ribbon menu of the time sheet calendar.

## Configuration Parameters for the Signal Tracker

Parameter Name | Data Type | Description
--- | --- | ---
Selected folders (`Paths`) | XML | List of folders that should be tracked. For each folder you can specify if sub-folders should be tracked recursively.<br/>By default time cockpit tracks your Documents folder.<br/><br/>The signal tracker for file writes only supports local drives. Network drives are not supported at the moment. Moreover it is not possible to track drives that are not writable.
Ignore patterns (`ExcludePatterns`) | XML	| List of patterns, that should be ignored. Use * as placeholder. Example for ignore patterns:<br/><br/>`*.tmp` = all files that end with .tmp<br/>`*\iTunes\*` = all files, whose path contains iTunes<br/><br/>Time cockpit ignores all file writes in the following folders, no matter if they are included in the selected folders (please find additional information to this special folders at MSDN):<br/><br/>`Environment.SpecialFolder.Windows`<br/>`Environment.SpecialFolder.ProgramFiles`<br/>`Environment.SpecialFolder.ProgramFilesX86`

> [!NOTE]
Often you will need some time to find good settings for the signal tracker for file writes. We recommend to start with the default settings and adjust them over time. When you find files in the analysis that are not helpful exclude the folder or specify an exclude pattern for the file.