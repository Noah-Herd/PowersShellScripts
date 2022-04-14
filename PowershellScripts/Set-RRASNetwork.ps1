<#
.SYNOPSIS
Sets the Network Adapters for a RRAS server
.DESCRIPTION
Renames adapters and assigns ip address information for 2 network adapters used in RRAS server
NOTE: When next hop is calculated for the WAN adapter it is always one addres above. Script needs to be edited to fit your environment
#>

#Renames net adapters
$LAN = Read-Host "Enter name of desired LAN adapter"
$WAN = Read-Host "Enter name of desired WAN adapter"
Rename-NetAdapter -Name $LAN -NewName "LAN"
Rename-NetAdapter -Name $WAN -NewName "WAN"

#Sets IP address for the LAN link
$LANAddress = Read-Host "Enter LAN IPAddress"
$Subnet = Read-Host "Enter Subnet (Slash notation)"
New-NetIPAddress -IPAddress $LANAddress -InterfaceAlias LAN -AddressFamily IPv4 -PrefixLength $Subnet
New-NetFirewallRule -DisplayName "ICMPv4 - Allow Echo Request Packets" -Action Allow -Protocol ICMPv4 -Direction Inbound -InterfaceAlias LAN


[String]$WANAddress = Read-Host "Enter WAN IPAddress"
Write-Host "SubnetMask is automatically set to /30"


#Calculates next hop address used for default gateway
[Int]$LastBit = $WANAddress.Substring(10)#Change this depending on length of address
$LastBit++ #Change to '--' if the next hop needs to be one address lower
$NextHop =$WANAddress -replace ".$"
$NextHop = $NextHop + $LastBit

#Sets IP address for the WAN
New-NetIPAddress -IPAddress $WANAddress -InterfaceAlias WAN -DefaultGateway $NextHop -AddressFamily IPv4 -PrefixLength /30
New-NetFirewallRule -DisplayName "ICMPv4 - Allow Echo Request Packets" -Action Allow -Protocol ICMPv4 -Direction Inbound -InterfaceAlias WAN