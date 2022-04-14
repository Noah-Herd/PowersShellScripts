 <#
.SYNOPSIS
Displays info for the current machines drives
.DESCRIPTION
A script that displays the current machines drives, available space, and size. 
#>

Get-WmiObject -Class win32_logicaldisk | Select-Object -Property VolumeName, @{name='Drive';expression={$_.DeviceID}}, @{name='FreeSpace(GB)';expression={$_.FreeSpace / 1gb -as [int]}}, @{name='Size(GB)';expression={$_.Size / 1gb -as [int]}}


