---
title: User Activity Signal Tracker - Keyboard & Mouse
description: Track keyboard and mouse activity in time cockpit to identify working time. Monitor user interactions and detect breaks automatically.
---
# Signal Tracker for User Activity

The signal tracker for user activity tracks when you are working at your computer by attending your keyboard and mouse activity. We do not track what you are typing but only that your are currently using the keyboard. This signal tracker may help you to identify times when you left you computer like lunch time or meetings.

## Collected Data

The signal tracker for user activity tracks the interval between your keyboard and mouse interactions. If the interval exceeds a specified value the signal tracker assumes that you are currently not working at your computer.

Times when the signal tracker for user activity was not running are displayed in the time sheet calendar as if you were not working at your computer.

## Configuration Parameters for the Signal Tracker

Parameter Name | Data Type| Description
--- | --- | ---
Query interval (Interval)| Timespan | Interval within which the signal tracker records keyboard and mouse activity. The setting `00:00:10` specifies that the tracker should record input device activity every 10 seconds. Smaller values may decrease the performance of your computer, larger values lead to more inaccurate values. We recommend using a timespan of 10 seconds or larger.
Limit for inactivity (ActivityTimeout)| Timespan | The limit for inactivity specifies when a duration without keyboard or mouse interaction is considered as break. The setting `00:00:30` means that after 30 seconds without user interaction a break begins. The break lasts as long as the next user interaction is recorded.	Smaller values may decrease the performance of your computer, larger values lead to more inaccurate values. We recommend using a timespan of 30 seconds or larger.

> [!NOTE]
Please note that you can also change the limit for inactivity in the options for the time sheet calendar. The setting in the signal tracker specifies the most accurate interval for inactivity that you can use for subsequent analysis.