# Web Client

Time cockpit has undergone significant development since its release in 2010. It began with a Windows Presentation Foundation (WPF) fat client, which provided a rich and responsive user interface. Additionally, we introduced a Silverlight client, which offered cross-platform compatibility.

Due to several reasons such as the deprecation of the Silverlight framework, the Silverlight client was deprecated a few years ago. For the past couple of years, the web client has been time cockpit's primary client.

The web client is built using modern web technologies such as HTML5, CSS3, and JavaScript, and runs on any modern web browser. The web client provides a responsive and adaptive user interface making it accessible from a range of devices, including desktops, laptops, tablets.

If you're just starting out with time cockpit, the web client is the recommended client to use, providing a modern and robust solution for time tracking.

## Limitations

- It is not possible to track computer signals with the web client. But if you have installed the full client to track signals, you can view the tracked signals in the web client, too. At the moment we are working on a lightweight version of the signal tracker that works without the WPF full client.
- It is not possible to modify the data model. But all changes made with the full client are available in the web client.

If you have questions regarding signal trackers or time cockpit's customization capabilities drop us a mail at [support@timecockpit.com](support@timecockpit.com) or refer to [Data Model Customization](~/doc/data-model-customization/overview.md)

## Release Plan

We offer three different time cockpit environments:

### Dev: <https://web-dev.timecockpit.com>

This is an experimental version that we continuously update with new releases. Never use it for production purposes! Some things are likely to be broken. Using it with your production tenant might even lead to data corruption. If you want to use this version, ask for a time cockpit Sandbox.

### Preview: <https://web-preview.timecockpit.com>

We publish preview releases in this environment. Between 10th and end of each month the preview release might be unstable. Still, it is way more stable than Dev. Between 1st and 9th of each month, the preview environment should not change. It contains the release candidate for the upcoming version. You can use this time frame for making your team ready and for giving us feedback. Between 1st and 9th we only update Preview if it is absolutely necessary. 

### Prod: <https://web.timecockpit.com>

This is the stable production environment for time cockpit. On the 10th of each month (resp. the first working day after the 10th) we create Prod from the latest preview release. This is also the new date for our newsletter. During the month, we only update Prod in case of critical hotfixes.

The following picture illustrates our release cadence:

![Time cockpit release plan](images/tc-release-plan.png "Time cockpit release plan")