<#
.SYNOPSIS
Prompts user to delete old files
.DESCRIPTION
Locates old unused files within the current directory using a specified date. Then asks the user if they would like to delete these files.
.EXAMPLES
.\Cleanup-OldFiles
#>

$filepath = (Get-Location)

[Int]$days = Read-Host "How many days back would you like to go?"

$days = $days * -1

$olderthandate = (Get-Date).AddDays($days)

Get-ChildItem -Path $filepath -Recurse | 

Where-Object {$_.LastWriteTime -lt $olderthandate} |

Format-Table -Property Name,LastWriteTime 


$prompt = Read-Host "Would you like to delete these files?"


if($prompt -eq "yes"){

Get-ChildItem -Path $filepath -Recurse | 

Where-Object {$_.LastWriteTime -lt $olderthandate} |

Remove-Item -Filter * -WhatIf

Write-Host "Files deleted"
}

else{
Write-host "No files will be deleted"
}