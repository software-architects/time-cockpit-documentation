# You have got the error System.Security.Cryptography.CryptographicException… or next Button missing in configuration wizard

![Next Button Missing](images/next-button-missing-en.png "Next Button Missing")

## Error cause
The data protection key of timecockpit provided by windows is no longer valid. This may happen e.g. when your windows profile was ported to another pc. Therefore, the existing privacy key must be deleted so that a new valid can be created.

## Background
To protect your personal data (e.g. signals) time cockpit uses the data protection function of windows. This ensures that protected data can only be read using your windows profile.

## How to troubleshoot (removal of invalid data protection key)
