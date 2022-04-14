<#
.SYNOPSIS
Search for a process and then end it
.DESCRIPTION
Asks the user for a keyword to search for a process. Then displays any processes that matches the keyword.\
Then the user can input the specific name for the process and the script stops it.
#>

$Keyword = Read-Host "Search for a process"
$Keyword = "*$Keyword*"

$array = (Get-Process -Name $letter*)

$counter = 1
Write-Host "These are the current running processes starting with the letter $letter`:"

ForEach ($process in $array){
Write-Output "[$counter] $($process.name)"
$counter++
}

$Process = Read-Host "Which process should be stopped"
Stop-Process -Name $Process -WhatIf