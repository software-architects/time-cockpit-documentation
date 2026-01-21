---
title: Network Related Error - Connection Issues
description: Troubleshoot network-related errors in time cockpit. Fix SQL Server connection issues, timeouts, and firewall configuration problems.
---
# Network Related or Instance Specific Error

## Possible Exceptions in Error Dialog
* ```SqlException (0x80131904)``` A network-related or instance-specific error occurred while establishing a connection to SQL Server
* ```SqlException (0x80131904)```: Connection Timeout Expired
* ```WebException```: The remote name could not be resolved: 'management.timecockpit.com'
* ```EndpointNotFoundException```: There was no endpoint listening

## Error Cause
This error indicates that your are not connected to the internet or that your internet connection is unstable.

## How to Solve
Please check your network connection and your firewall settings - maybe port 1433-Outbound is blocked. 
