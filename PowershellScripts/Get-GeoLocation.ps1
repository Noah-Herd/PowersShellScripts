<#
.SYNOPSIS
Display location info based on IP Address
.DESCRIPTION
Displays information about a specific location based on an provided IP address. If no IP address is provided the program will instead use the public ip address of the current machine.
.PARAMETER PublicAddress
This is the address used to find the location information
.EXAMPLES
.\Get-GeoLocation
.\Get-GeoLocation -PublicAddress 192.0.66.168
.\Get-GeoLocation 1
#>

Param(
[String]$PublicAddress
)

If ($PublicAddress -eq ''){
    $PublicAdress = (Invoke-WebRequest -uri "http://ifconfig.me/ip").Content}

Invoke-RestMethod -Method Get -Uri "http://ip-api.com/json/$PublicAddress"
