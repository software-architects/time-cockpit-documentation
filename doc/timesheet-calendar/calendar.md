# Time Sheet Calendar

The time sheet calendar is the main tool to create timesheet entries in time cockpit. Please refer to [Working with Timesheet Entries](working-with-timesheet-entries.md) to learn how to create and edit your timesheet entries.

## Outline of the Time Sheet Calendar

![Timesheet calendar](images/wc-calendar-overview.png "Timesheet calendar")

The time sheet calendar consists of the following parts:

- Main menu
- Toolbar (contains commands that are available for the time sheet calendar or selected time sheet entries)
- Date selection
- [User selection](#user-selection)
- [Time sheet calendar](#time-sheet-calendar-1)
- [Working time](working-time.md)
- [Formatting profiles](formatting-profiles.md)
- [Timesheet Templates](timesheet-templates.md)
- [Account Information](account-information.md)

## User Selection

In the user selection area you can select the user for which the time sheet entries should be displayed. Please note the following restrictions:

- Time cockpit provides a sophisticated permission system. You are able to specify read and write permissions for users and groups. Please find more information about permissions at [Permission Management](~/doc/data-model-customization/permission.md).

> [!NOTE] By default, time cockpit does not ship any permissions. Everybody is allowed to see everything.

Since version 1.7 of time cockpit you are able to hide users in the user selection list. Switch to **Users** in the main menu and open the **User Details** list. Open the user you want to hide and check the **Hidden** check box.

## Time Sheet Calendar

The time sheet calendar shows different types of information:

* Timesheet Entries
* Absence Times (vacation, compensatory time off, sick leave). See also [Absence Time Management](~/doc/employee-time-tracking/absence-time-management.md).
* Outlook Appointments and Sent Mails from your Office 365 account. See also [Office 365](office365.md).

You can manually create, change or delete time sheet entries, or you can create them with help of signals or Microsoft Office Outlook appointments. The time sheet calendar consists of the following parts:

![Timesheet calendar](images/timesheet-calendar.png "Timesheet calendar")

### Day, Work Week, Week and Month View

You can switch between the following views in the time sheet calendar:

- day view
- work week view
- week view
- month view

Use the day view if you want to create your time sheet entries based on your collected signals and your Microsoft Office Outlook appointments. In the week and work week views you get an overview of your working time but you can also create and change time sheet entries in these views. The month view is only designed to give you an overview of the whole month.

![Day view](images/day-view.png "Day view")

![Work week view](images/work-week-view.png "Work week view")

![Week view](images/week-view.png "Week view")

![Month view](images/month-view.png "Month view")

### Zoom

In the day, work week, and week view you can change the scaling of the time axis by zooming in and out. The function is especially helpful if you have lots of signals in a short time span. You can change the zoom level by one of the following ways:

- Press the **CTRL** key, keep it pressed and use the mouse wheel to change the zoom level.
- Use the ribbon commands **Zoom** in and **Zoom out**.
- Press **CTRL + (+)** to increase the zoom level and **CTRL + (-)** to decrease the zoom level.

### Navigation

You can navigate between days in the calendar by one of the following ways:

- Click on a day in the calendar for navigation in the left bar.
- Press **CTRL + right arrow** for the next day, **CTRL + left arrow** for the previous day, **CTRL + down arrow** for the next week and **CTRL + up arrow** for the previous week.