# Signal Tracker for Computer Activity

The signal tracker for computer activity tracks when your computer is turned on and off. This information is particularly helpful if you spend most of your working time at your PC. The points in time when you turn on and off your computer mostly mark the start and end of your working day.

## Collected Data

The signal tracker for computer activity records a signal every x seconds as long as your computer is turned on the the signal tracker is running. As the signal tracker is started at system startup of your computer it usually includes the whole period when your computer is running. Times in power-save mode are not counted as active.

The computer activity is not equivalent to the time you are working on your computer. You can track the time you are actually working on your computer with the [user activity tracker](user-activity.md). It regards if you are moving your mouse or using the keyboard. If no input occurs, the [user activity tracker](user-activity.md) assumes that you are currently not working.

Times when the signal tracker for computer activity was not running are displayed in the time sheet calendar as if your computer was not turned on.

## Configuration Parameters for the Signal Tracker

Parameter Name | Data Type | Description
--- | --- | ---
Query interval (Interval) | Timespan | Interval within which the signal tracker records when the computer is activ. The setting `00:00:10` specifies that the tracker should record that the computer is active every 10 seconds. Smaller values may decrease the performance of your computer, larger values lead to more inaccurate values. We recommend using a timespan of 10 seconds or larger.