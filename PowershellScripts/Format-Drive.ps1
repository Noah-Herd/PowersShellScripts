<#
.SYNOPSIS
Fromats a drive to  certain 
.DESCRIPTION
Takes in a name of a drive and formats to NTFS using the NewDriveName and DriveLetter parameters. If no values are passed for the parameters the user is prompted to enter them.
.PARAMETER Drive
The name of the drive to be formatted
.PARAMETER NewDriveName
The desired name of the drive after formatting
.PARAMETER DriveLetter
The drive letter that will be used after formatting
.EXAMPLES
.\Format-Drive -$Drive MyDrive -NewDriveName MyCoolDrive -$DriveLetter E
.\Format-Drive -Name MyDrive -NewName MyCoolDrive -Letter E
.\Format-Drive -$Drive MyDrive
#>

[CmdletBindin()]

Param(
[ALias('Name')][String]$Drive,
[ALias('NewName')][String]$NewDriveName,
[ALias('Letter')][String]$DriveLetter
)

If ($Drive -eq ''){
Get-Disk
$Drive = Read-Host "Enter Drive to format"
}

If($NewDriveName -eq ''){
$NewDriveName = Read-Host "Enter new name for drive"
}

If($DriveLetter -eq ''){
$DriveLetter = Read-Host "Enter a letter for the drive"
}

Get-Disk $Drive | Clear-Disk -RemoveData
Initialize-Disk -Number $Drive
New-Partition -DiskNumber $Drive -UseMaximumSize | Format-Volume NTFS -NewFileSystemLabel $drivename
Get-Partition -DiskNumber $Drive | Set-Partition -NewDriveLetter $DriveLetter
