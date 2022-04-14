<#
.SYNOPSIS
Scans a remote computer for a virus
.DESCRIPTION
Starts the windows defender service if it has stopped on a remote computer or multiple remote computers then starts a fullscan
.PARAMETER ComputerNames
The names of the computers to be scanned
.EXAMPLES
.\Scan-RemotePC -ComputerNames DESKTOP01,DESKTOP2
#>

Param(
[Parameter(Mandatory = $True)]$ComputerNames
)

Invoke-Command -ComputerName "$ComputerNames" -ScriptBlock{
$Status = (get-service windefend).Status
if ($Status = "Stopped"){
    Start-Service windefend
    }
Start-MpScan -ScanType FullScan
}