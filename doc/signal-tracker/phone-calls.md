# Signal Tracker for Phone Calls	

The signal tracker for phone calls allows you to import the call history of your mobile phone. This information is especially helpful for users who often call customers or partners and want to bill or analyze their calls. From the name of your contact you can usually derive the customer or project you are working on.

## Collected Data

The signal tracker for phone calls does not track data without user input. You can use third-party tools to export the call history from your phone to a text file. The signal tracker is able to monitor a folder on your computer. If you drop the text file with the call history in the folder, time cockpit will import your phone calls.

If you exit or pause the signal tracker, it will not monitor the specified folder.

## Supported File Formats

The signal tracker for phone calls supports the formats from several popular tools that can export call histories from Android, iPhone, Microsoft Windows Mobile and Nokia (Symbian) phones.

For **Android** smartphones you can use the tool [Call Logs Back Up & Restore](https://play.google.com/store/apps/details?id=com.riteshsahu.CallLogBackupRestore). You have to activate, that names of your contacts are exported, in the settings of the app. Afterwards you can back up your data. A XML file with the name `calls-*.xml` will be created.

The tool [Macroplant iExplorer](http://www.macroplant.com/iexplorer/) allows to export call logs from **iPhones** or **iPhone backups**. The resulting files have to be named `*.txt` or `*.csv`.

For **Microsoft Windows Mobile** you can use the tool [CallHistory export](http://www.accosto.com/?page_id=8). It generates a text file `callhistory.tsv` that contains the following information:

```
O        +436608480000        Muster, Max        Hdy        2010.02.08 18:27.16        0        Local        busy/no answer        Ended        CID_Available
O        +4366488540000        Mueller, Franz        Hdy        2010.02.08 16:51.48        0        Local        busy/no answer        Ended        CID_Available
O        +43 699 171 00 000        Huber, Karl        Hdy        2010.02.08 13:52.03        54        Local        Connected        Ended        CID_Available
O        +43660840000        Maier, Uwe        Hdy        2010.02.08 13:43.29        428        Local        Connected        Ended        CID_Available
```

For **Nokia (Symbian)** Smartphones you can use the tool [LogExport](http://tinyhack.com/freewarelist/s603rd/2007/03/02/logexport/). It generates a test file `log-*.csv` that contains the following information:

```
Date,"Time","Type","RemoteParty","Direction","DurationType","Duration","Status","Subject","Number","SentData","RecvData","MsgType","MsgTotalPart","MsgTotalSent","MsgTotalDelivered","MsgTotalFailed","MsgTotalReceived",
02/02/2009,"21:15","Voice call","Max Muster","Outgoing","1","58","","6","+436644300000",
02/02/2009,"21:12","Voice call","Max Muster","Missed call","1","0","","6","+436644300000",
01/30/2009,"17:31","Short message","Huber Karl","Outgoing","-1","0","Sent","Mozartstrasse, 4020 linz","+436644200000",
01/30/2009,"10:43","Voice call","Maier Uwe","Incoming","1","45","","6","+43650700000",
```

If you are using another phone, you can use any tool to export your call history. You just have to transform the exported data to one of the described formats. We would be glad if you tell us which phone you would like to be supported.

## Configuration Parameters for the Signal Tracker

Parameter Name | Data Type | Description
--- | --- | ---
Delete imported files (`DeleteImportedFiles`) | Boolean (true / false) | Specifies if the file should be deleted after import.
Points in time are in local time zone (`IsLocalTime`) | Boolean (true / false) | If the parameter is set to true, all points in time in the import file are considered as points in time in your local time zone. Otherwise time cockpit assumes that points in time are specified in UTC time.
Query interval (`Interval`) | Timespan | Interval within which the signal tracker looks for files to import. The setting `00:05:00` specifies that the tracker should look for new files every 5 minutes. Smaller values may decrease the performance of your computer, larger values lead to more inaccurate values.
Path (`Path`) | Text | Path in which time cockpit should look for files to import.