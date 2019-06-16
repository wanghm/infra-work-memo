## Network Settings by Powershell

* Delete default gateway

````
Remove-NetRoute -InterfaceAlias Ethernet -DestinationPrefix 0.0.0.0/0 -NextHop 10.48.108.254 -Confirm:$false

Get-NetIPConfiguration -InterfaceAlias $Nic_name


InterfaceAlias       : 
InterfaceIndex       : 
InterfaceDescription : 
NetProfile.Name      : Network
IPv4Address          : xxx.xxx.xxx.xxx
                       xxx.xxx.xxx.xxx
IPv6DefaultGateway   :
IPv4DefaultGateway   : xxx.xxx.xxx
DNSServer            : xxx.xxx.xxx
                       xxx.xxx.xxx
                       

Get-NetAdaper

#Setup static IP, default Gateway, netmask(PrefixLength)
New-NetRoute -InterfaceAlias $Nic_name -DestinationPrefix 0.0.0.0/0 -NextHop $Gateway -Confirm:$false

#Add new IP
New-NetIPAddress -InterfaceIndex 23 -IPAddress xxx.xxx.xxx -AddressFamily IPv4 -PrefixLength 22 -DefaultGateway xxx.xxx.xxx.xxx

````
                       
