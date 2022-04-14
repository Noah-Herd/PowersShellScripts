<#
.SYNOPSIS
Displays current USB devices
.DESCRIPTION
This script grabs all currently connected Plug and Play (PnP) devices and displays then in a table showing their class and friendly name.
#>

Get-PnpDevice -PresentOnly | Sort-Object -Property Class | Format-Table -Property Class,FriendlyName