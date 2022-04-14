#Name: Get-LogInfo
#Date: April 1, 2020
#Creator: Jared Bartley

#Synopsis: Asks user which log and how many entries they would like to see and collects information and inserts into a CSV file. 
<#
.SYNOPSIS
Exports a csv of an event log
.DESCRIPTION
Asks user which log and how many entries they would like to see and collects information and inserts into a CSV file. The CSV is exported to a path that is passed before the script is ran.
.PARAMETER Path
The location that the CSV file will be stroed in
.EXAMPLES
.\Get-LogInfo
.\Get-LogInfo -Path C:\Users\Herdn\Dektop
#>

[CmdletBinding()]

Param(
[Parameter(Mandatory = $True)][String]$Path
)

Get-EventLog -LogName * | Select-Object -Property @{name="EventLog";expression={$_.Log}} | Format-table

$logname = Read-Host "Please enter an Eventlog to review"

$num = Read-Host "Please enter the amount of entries you would like"

$ui = (Get-Date).Millisecond

Get-EventLog -LogName $logname -Newest $num | Export-Csv -Path "$Path log $ui.csv" -NoClobber
