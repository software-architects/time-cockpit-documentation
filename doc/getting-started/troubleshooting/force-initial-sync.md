# Force Initial Sync of time cockpit

In some cases it’s necessary to force an initial synchronization for time cockpits full client. That means your local database (client database) will be deleted and replaced with the actual version of time cockpits server database. 
> [!NOTE]
Be aware that not synchronized data of the client database will be lost after an initial sync.

Examples for needed initial synchronization:
* General Error in Synchronization
* No Synchronization was done for longer than two months
* Device was deprecated

## How to Force an Initial Sync
1. Stop the signaltracker if it’s running

1. Reset your time cockpit configuration. 
   Therefore you have to delete the configuration. To do this, please delete all files in the following directory: “C:\Users\[YourUserName]\AppData\Local\software architects\Time Cockpit”.

1. Start time cockpit. It will walk you through the initial configuration wizard. After that, you should be able to use time cockpit as usual
