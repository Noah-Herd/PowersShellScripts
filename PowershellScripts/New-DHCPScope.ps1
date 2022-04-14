<#
.SYNOPSIS
A script that creates a simple DHCP scope
.DESCRIPTION
This script takes in a name, a starting address, final address, Subnet Mask, address of a dns server, and a default gateway
and creates a simple DHCP scope.
.PARAMETER Name
The name for the DHCP scope
.PARAMETER StartAddress
The desired starting address for the scope
.PARAMETER EndAddress
The desired ending address for the scope
.PARAMETER Subnet
The desired subnet mask for the scope
.PARAMETER DNS
The primary DNS for the scope
.PARAMETER Gateway
The address of the router
.EXAMPLE
New-DHCPScope -name NewScope -StartAddress 10.10.10.1 -EndAddress 10.10.10.100 -SubnetMask 255.255.255.0 -DNS 1.1.1.1 -Gateway 10.10.10.254
#>

[CmdletBinding()]

Param(
[Parameter(Mandatory = $True)][String]$Name,
[Parameter(Mandatory = $True)][String]$StartAddress,
[Parameter(Mandatory = $True)][String]$EndAddress,
[Parameter(Mandatory = $True)][String]$SubnetMask,
[Parameter(Mandatory = $True)][String]$DNS,
[Parameter(Mandatory = $True)][String]$Gateway
)

Add-DhcpServerv4Scope -Name "$Name" -StartRange "$StartAddress" -EndRange "$EndAddress" -SubnetMask "$SubnetMask"
Set-DhcpServerv4OptionValue -DnsServer "$DNS" -Force -Router "$Gateway"
Set-DhcpServerv4Scope -ScopeId "$StartAddress" -LeaseDuration 4.00:00:00 -State Active
Restart-Service dhcpserver