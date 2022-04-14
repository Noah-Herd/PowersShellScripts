#Name: Get-VideoCardInfo.ps1
#Date: March 26/2020
#Synopsis: Grabs the model, driver version, and video settings of the Current machines hardware. 

<#
.SYNOPSIS
Displays info relating to the current hardware
.DESCRIPTION
Grabs the model, driver version and video settings of the current machines installed hardware and displays it in a nice list
#>

Get-WmiObject -Class win32_VideoController  | Select-Object -Property @{name='Video Card';expression={$_.Caption}},DriverVersion,@{name='Video Settings';expression={$_.VideoModeDescription}} | fl
