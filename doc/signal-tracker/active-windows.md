# Signal Tracker for Active Windows

The signal tracker for active windows records the program with which you are currently working. Additionally it tracks the title of the active window. The name of the program and the title of the window often imply the customer and project you are working on.

## Collected Data

The signal tracker for active windows tracks every x seconds the program you are currently working with and the title of the active window.

If you exit or pause the signal tracker, it will not track your used programs and active windows.

## Configuration Parameters for the Signal Tracker

Parameter Name | Data Type| Description
--- | --- | ---
Query interval (Interval) | Timespan | Interval within which the signal tracker records the active program and the title of the active window. The setting `00:00:02` specifies that the tracker should record the program and window title every 2 seconds. Smaller values may decrease the performance of your computer, larger values lead to more inaccurate values. We recommend using a timespan of 2 seconds.