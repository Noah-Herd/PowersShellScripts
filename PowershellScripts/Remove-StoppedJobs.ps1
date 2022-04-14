<#
.SYNOPSIS
removes stopped jobs
.DESCRIPTIon
Finds all stopped jobs and removes them
.EXAMPLES
.\Remove-StoppedJobs
#>

Get-Job | Where-Object {$_.State -eq "Stopped"} | Remove-Job