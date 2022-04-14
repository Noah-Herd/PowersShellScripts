<#
.SYNOPSIS
Starts the Print Spooler service
.DESCRIPTION
Ensures the Print Spooler service is always running by checking if it is running or not. If it is running the program will restart it and if it is not running then the program will start it.
.EXAMPLES
.\Fix-PrintSpooler
#>

$status = Get-Service -Name spooler | Select-Object -Property Status


if($status.Status -eq "Running"){

Restart-Service -Name Spooler -WhatIf

Write-Host "The service has been restarted"

}


else{
Start-Service -Name Spooler -WhatIf

Write-Host "The service has been started"
}