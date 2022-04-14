<#
.SYNOPSIS
Removes all print jobs
.DESCRIPTION
This program finds all printers then all their associated pending print jobs and removes them
.EXAMPLES
.\Remove-AllPrintJobs
#>

$Printers = Get-Printer

if ($Printers.count -eq 0) {Write-Host "No Printers found"}

foreach ($printer in $printers){
    $printjobs = Get-PrintJob -PrinterObject $printer

        foreach($PrintJob in $PrintJobs){
            Remove-PrintJob -InputObject $PrintJob
            }
        }