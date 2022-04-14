<#
.SYNOPSIS
Provides details on defender scans then asks to start a scan
.DESCRIPTION
Tells the user how many days it has been since the last full scan and asks if a fullscan should be started. If no then the process repeats but for a quickscan instead.
#>

$Status = (get-service windefend).Status
if ($Status = "Stopped"){
    Start-Service windefend
    }

$Days = (Get-MpComputerStatus).FullScanAge
$Run = Read-Host "It has been $Days since the last fullscan.`n`nStart a fullscan?"
if ($Run -eq "yes"){
    Start-MpScan -ScanType FullScan
    }
else{
    $Days = (Get-MpComputerStatus).QuickScanAge
    $Run = Read-Host "It has been $Days since the last Quickscan.`n`nStart a Quickscan?"
    if($Run -eq "yes"){
        Start-MpScan -ScanType QuickScan
        }
    }