# Network related or instance specific error

## Possible raised exceptions
* SqlException (0x80131904) A network-related or instance-specific error occurred while establishing a connection to SQL Server
* SqlException (0x80131904): Connection Timeout Expired
* WebException: The remote name could not be resolved: 'management.timecockpit.com'
* EndpointNotFoundException: There was no endpoint listening

## Error cause
Missing stable internet connection. 

## Hot to solve
Please Check your network connection and your firewall settings - maybe port 1433-Outbound is blocked. 
