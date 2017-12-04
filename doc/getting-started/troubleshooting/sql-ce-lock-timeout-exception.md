# SqlCeLockTimeoutException

## Error Cause
In case of a SqlCeLockTimeoutException you have got a lock on your local client time cockpit database. A lock can occur if several processes (signal tracker, time cockpit full client) access the same data at the same time.

## How to solve it
To solve the lock you have to stop and restart the time cockpit full client and its signaltracker. 
