<#
.SYNOPSIS
Checks a drive for free space
.DESCRIPTION
Checks a drive for free space. If no drive is specified then the user will be asked if they want to see a list of drives. The user will then be prompted to enter the name of a drive to check.
The user will be told how much free space is left on the drive in GB. If less than 20 GB is free the user will be given a warning instead.
.PARAMETERS Drive
Name of drive to check
.EXAMPLES
.\Check-Drive C
.\Check-Drive -Drive C
.\Check-Drive
#>

param(
[string]$Drive, 
[int]$MinLevel = 20
)

if ($Drive -eq "" ) { 
    $A = Read-Host "Would you like to see a list of drives?"
    if($A -eq "yes"){
    Get-PSDrive | Format-Table -Property Name
    }
$Drive = read-host "Enter drive to check" 
}

$DriveDetails = (Get-PSDrive $Drive)
[int]$Free = (($DriveDetails.Free / 1024) / 1024) / 1024
[int]$Used = (($DriveDetails.Used / 1024) / 1024) / 1024
[int]$Total = ($Used + $Free)

if ($Free -lt $MinLevel) {
    write-warning "Drive $Drive has only $Free GB left to use! ($Used of $Total GB used, minimum is $MinLevel GB)"
	}
Else {
    Write-Host "Drive has $Free GB left"
    }