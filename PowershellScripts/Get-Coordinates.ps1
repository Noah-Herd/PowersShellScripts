<#
.SYNOPSIS
Displays your coordinates
.DESCRIPTION
Finds your IP address and relates it to a set of GPS coordinates
#>



$PublicAdress = (Invoke-WebRequest -uri "http://ifconfig.me/ip").Content
$Location = Invoke-RestMethod -Method Get -Uri "http://ip-api.com/json/$PublicAddress"
$Coordinates = New-Object -TypeName PSObject
$Coordinates | Add-Member -MemberType NoteProperty -Name Latitude -Value $Location.lat
$Coordinates | Add-Member -MemberType NoteProperty -Name Longitude -Value $Location.lon
$Coordinates | Format-List