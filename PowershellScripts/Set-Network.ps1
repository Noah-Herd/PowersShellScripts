<#
.SYNOPSIS
sets networking info
.DESCRIPTION
Asks user for values relating to IP addressing then sets the Network Interface to the specified values. Also edits the firewall to allow ping requests.
#>

$ipaddress = Read-Host "Enter IPv4 Address"

$Subnet = Read-Host "Enter Subnet (Slash Notation)"

$Gateway = Read-Host "Enter Default Gateway?"

$dns = Read-Host "Enter Default DNS Server?"

New-NetIPAddress -IPAddress $ipaddress -InterfaceAlias Ethernet -DefaultGateway $Gateway -AddressFamily IPv4 -PrefixLength $Subnet

Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses $dns 

New-NetFirewallRule -DisplayName "ICMPv4 - Allow Echo Request Packets" -Action Allow -Protocol ICMPv4 -Direction Inbound -InterfaceAlias Ethernet 

