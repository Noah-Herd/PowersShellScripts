<#
.SYNOPSIS
Displays a weather report
.DESCRIPTION
Uses "ifconfig.me/ip" to find your IP Address then passes the ip address to "ip-api.com" to find the city
related to that address. Finally passes the city to "wttr.in" to and pulls a weather report of that city.
#>

Function Get-MyCity{
$PublicAdress = (Invoke-WebRequest -uri "http://ifconfig.me/ip").Content
$Location = Invoke-RestMethod -Method Get -Uri "http://ip-api.com/json/$PublicAddress"
$City = $Location.City
Return $City
}

$MyCity = Get-MyCity
(curl http://wttr.in/"$MYCity" -UserAgent "curl" ).Content