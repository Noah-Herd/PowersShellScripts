<#
.SYNOPSIS
Creates a vm
.DECRIPTION
Asks user for a name and memory size then creates a Virtual Machine according to those specifications.
NOTE: The paths must be edited in accordance with your specific filesystem
#>

$name = Read-Host "Name"

$memory = Read-Host "Memory to allocate (Bytes)"

New-VM -Name $name -path "C:\ProgramData\Microsoft\Windows\Hyper-V" -MemoryStartupBytes $memory

New-VHD -Path "C:\Users\Public\Documents\Hyper-V\Virtual Hard Disks" -SizeBytes 10GB -Dynamic

Add-VMHardDiskDrive -VMName $name -path "C:\Users\Public\Documents\Hyper-V\Virtual Hard Disks\$name.vhdx"

Set-VMDvdDrive -VMName $name -ControllerNumber 1 -Path 'C:\Users\Noah\Documents\NTEN\Server2022.iso'

Start-VM -Name $name