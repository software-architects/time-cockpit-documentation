# Reporting

In versions greater than 1.22, time cockpit supports to view your data in the form of printable reports. For reporting purposes, time cockpit uses [Reporting Services (SSRS)](http://msdn.microsoft.com/de-de/library/ms159106.aspx).

## FAQ

1. **Do we need our own Microsoft Reporting Services Server for this functionality?**<br/>
No, you don't. time cockpit uses an embedded version of Microsoft Reporting Services.

1. **I am not familiar with Microsoft Reporting Services. How can I learn it?**<br/>
We recommend the book [Professional Microsoft SQL Server 2012 Reporting Services](http://www.amazon.de/gp/product/1118101111/).

1. **Will this new reporting feature be charged separately?**<br/>
No, it will not. Please note that your time cockpit subscription does not cover the licenses you need for Microsoft's tools for editing *Reporting Services Definition (RDL)* files (see also next question).

1. **How can we edit the RDL files that time cockpit creates?**<br/>
You can choose between Microsoft Visual Studio 2012 together with [Microsoft's SQL Server Data Tools BI for Visual Studio 2012](http://www.microsoft.com/en-us/download/details.aspx?id=36843) and [Microsoft SQL Server 2008 R2 Report Builder 3.0](http://www.microsoft.com/en-us/download/details.aspx?id=6116). Visual Studio is perfect for you if you are a developer who uses Visual Studio for your daily work. Use Report Builder if you are do not have a background in software development and you do not know Visual Studio.<br/><br/>
You can download [Microsoft SQL Server 2008 R2 Report Builder 3.0](http://www.microsoft.com/en-us/download/details.aspx?id=6116) from Microsoft's website. It is free of charge if you have a valid license for an SQL Server. You can find the details about the terms and conditions for Report Builder in its installation wizard.

1. **Can only time cockpit administrators benefit from this new functionality?**<br/>
Currently only time cockpit administrators can create and view custom reports. In the April 2014 release we will add the possibility to upload custom reports into your time cockpit database. Uploaded reports will be available for other users, too (full client and web client). However, creating custom reports will always be a restricted to time cockpit administrators.

1. **Do the custom reports access time cockpit's database directly?**<br/>
No, they don't. Reports get their data through the time cockpit business layer. Therefore things like permissions, business logic (e.g. calculated properties), etc. apply and are available.<br/><br/>
Please note that you must not change the data source that time cockpit generated in the RDL files. The data source is created only for design time. At runtime, time cockpit will ignore it and deliver the appropriate data on the fly.

1. **Is it possible to add a report to time cockpit's menu?**<br/>
Currently not. We are planning to add this possibility in one of the next versions of time cockpit.

1. **Can I use Reporting Services' parameters and filters?**<br/>
Yes and no. Custom reports in time cockpit use time cockpit's existing filtering mechanism. You can add new report filters to your list if you want to. time cockpit will automatically pass these filter conditions to Reporting Services. Please note that you have to use time cockpit's filtering mechanisms. You cannot add additional filters or parameters directly in Reporting Services.

1. **Can I combine data from multiple time cockpit lists in a single report?**<br/>
No, this is currently not supported. The time cockpit list engine is very powerful. You can even create lists based on [time cockpit scripts](~/doc/scripting/overview.md). In such script you can put together data from all areas in time cockpit. However, this is a quite advanced scenario. If you want to build such a report and you have questions about it, please contact us at [support@timecockpit.com](mailto:support@timecockpit.com).

1. **Can I combine data from time cockpit and other sources in a single report?**<br/>
No, this is currently not supported. If you want to include data in your report, you have to first import it into time cockpit. You can use time cockpit's [Excel importer](~/doc/data-exchange/importer.md) for that.

1. **Can I automatically send reports to users?**<br/>
No, this is currently not supported. Would you like to have this functionality? We would love to hear your feedback at [support@timecockpit.com](mailto:support@timecockpit.com).

1. **I would need some reports but do not have the time to build them myself. Can you do it for me?**<br/>
Yes of course. Let us know how your reports should look like and we will be glad to send you a cost estimation.

1. **How can I give feedback?**<br/>
Please send your questions and feedback to [support@timecockpit.com](mailto:support@timecockpit.com).