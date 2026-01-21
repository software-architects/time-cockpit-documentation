---
title: SqlCeLockTimeoutException - Database Lock Fix
description: Resolve SqlCeLockTimeoutException in time cockpit. Fix database locks by restarting the full client and signal tracker.
---
# SqlCeLockTimeoutException

## Error Cause
In case of a ```SqlCeLockTimeoutException``` you have got a lock on your local client time cockpit database. A lock can occur if several processes (signal tracker, time cockpit full client) access the same data at the same time.

## How to Solve It
To solve the lock you have to stop and restart the time cockpit full client and its signaltracker. 
