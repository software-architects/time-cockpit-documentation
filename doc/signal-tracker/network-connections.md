# Signal Tracker for Network Connections	

The signal tracker for network connections tracks all networks the computer was connected with and all available Wi-Fi networks. If you are working in different locations with your laptop, the names of connected and available networks may help you to identify the customer you were working for.

## Collected Data

The signal tracker for network connections tracks every x seconds all networks your computer is connected with and all available Wi-Fi networks.

If you exit or pause the signal tracker, it will not track network connections.

## Configuration Parameters for the Signal Tracker

Parameter Name | Data Type | Description
--- | --- | ---
Query interval (`Interval`) | Timespan | Interval within which the signal tracker tracks network connections. The setting `00:01:00` specifies that the tracker should track network connections every minute. Smaller values may decrease the performance of your computer, larger values lead to more inaccurate values. We recommend using a timespan of 1 minute.