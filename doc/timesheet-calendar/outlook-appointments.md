---
title: Office 365 Integration - Outlook Appointments
description: Integrate time cockpit with Office 365 to display Outlook appointments and sent emails in your calendar. Transform appointments into time sheet entries.
---
# Working With Outlook Appointments

Time cockpit can be integrated with your Office 365 account. Once the connection is configured, time cockpit can display your Outlook appointments and sent emails directly in your time sheet calendar. This functionality is particularly useful booking your time as it gives you a good idea of how you have spent your working day. Sent emails are also a good indication of your activities throughout the day. 

By connecting time cockpit with your Office 365 account, you can gain a more holistic view of your workday and easily track and manage your time.

## Configure the Office 365 Connection

* In the time sheet calendar, click **Settings** and enable **Show Office 365 calendar items** and **Show Office 365** sent mails. 

![Enable Office 365](images/wc-enable-office365.png "Enable Office 365")

* Click **Sign In** in the time cockpit toolbar and enter your Office 365 credentials

![Log In Office 365](images/wc-office365-login.png "Log In Office 365")

> [!NOTE]
> The login might open in the background. So check your windows with Alt + Tab if you are not immediately seeing the Office 365 prompt

* Click **Refresh** in the time cockpit toolbar to fetch Outlook appointments and mails from Office 365.

![Office 365 Data](images/wc-office365-enabled.png "Office 365 Data")

> [!NOTE]
> To transform your Outlook appointment to a time sheet entry just double-click it and enter missing data.

![Double-Click Appointment](images/wc-transform-appointments.png "Double-Click Appointment")

## How Appointments Appear in the Calendar

Timesheets are filled with a colour. Outlook appointments have only an outline, so you can tell at a glance what is booked and what is not.

By default, timesheets lie over the appointments of the same time, and an appointment stays visible:

* If a timesheet covers only part of an appointment, the text of the appointment moves to its longest free part.
* If timesheets cover the whole appointment, a narrow strip remains visible at its right edge. In the week view, the strip shows a calendar icon and, on longer appointments, the title. In the wide day view, it shows the full text.
* Appointments that overlap each other and are fully covered share the strip. Hover over a strip to see the details of the appointment.

The strip is only reserved when an appointment with a start and end time is on one of the days shown.

To show timesheets and appointments side by side instead, click **Change office 365 calendar view mode** in the toolbar of the time sheet calendar, or press Ctrl + Alt + O.

<!-- > [!NOTE]
If you are not using Microsoft Office Outlook to manage your appointments, time cockpit cannot display your appointments at the moment.

In the right area of a day in the time sheet calendar time sheet entries and Microsoft Office Outlook appointments are displayed. Microsoft Office Outlook appointments cannot be changed. You can double-click an appointment to create a new time sheet entry with the corresponding time span, description and location. The new time sheet entry will be opened and you can complete the data for the time sheet entry.

![Convert outlook appointment](images/convert-outlook-appointment.png "Convert outlook appointment") -->