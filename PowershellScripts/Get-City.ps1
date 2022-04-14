<#
.SYNOPSIS
Finds the city relating to a public IP address
.DESCRIPTION
If given an IP address the script will find the city that the IP address is located in. If not given an IP address the script will find the city relating to the host machines IP address
.PARAMETERS PublicAddress
Any public IP address
.EXAMPLES
.\Get-City -PublicAddress 192.0.66.168
.\Get-City 142.250.69.206
#>


Param(
[String]$PublicAddress
)

If ($PublicAddress -eq ''){
    $PublicAdress = (Invoke-WebRequest -uri "http://ifconfig.me/ip").Content}
$Location = Invoke-RestMethod -Method Get -Uri "http://ip-api.com/json/$PublicAddress"
$Location.city