# Signal Tracker for Sent Emails	

The signal tracker for sent emails tracks all emails sent with Microsoft Office Outlook. This signal tracker may help you to identify when you have finished some work package and sent the results to you customer or colleagues.

## Collected Data

The signal tracker for sent emails tracks all emails sent with Microsoft Office Outlook. Unfortunately we do not support other email clients than Microsoft Office Outlook at the moment.

If you exit or pause the signal tracker, it will not track sent emails in Microsoft Office Outlook.

When you start this signal tracker the first time on your computer the tracker will import all emails from the current day. Afterwards it will track all new sent emails. The tracker will not import sent mails from the past.

## Configuration Parameters for the Signal Tracker

Parameter Name | Data Type | Description
--- | --- | ---
Query interval (IntervalValue) | Timespan | Interval within which the signal tracker looks for new emails in Microsoft Office Outlook. The setting `00:05:00` specifies that the tracker should look for new emails every 5 minutes. Smaller values may decrease the performance of your computer, larger values lead to more inaccurate values. We recommend using a timespan of 5 minutes.
Resolve email adress (ResolveAddress) | Boolean | Specifies if time cockpit should read the email adress of the recipient from Microsoft Office Outlook. If this value is set to `True`, Microsoft Office Outlook will ask you to confirm that time cockpit is allowed to access the email adress of the recipient when you send an email.