<#
.SYNOPSIS
Displays info relating to the current machine
.DESCRIPTION
Grabs the current machines Operating System, Computer Name, Current user, and the Operating System Architecture. 
.EXAMPLES
.\Get-ComputerInfo
#>


Get-CimInstance -ClassName win32_Operatingsystem | Select-Object -Property @{name='OS';expression={$_.Caption}}, @{name='ComputerName';expression={$_.CSName}}, @{name='CurrentUser';expression={$_.registereduser}}, OSArchitecture | fl 
