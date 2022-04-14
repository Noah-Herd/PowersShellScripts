<#
.SYNOPSIS
Searches for a script
.DESCRIPTION
asks the user for a keyword to search for a script
#>

$keyword = Read-Host "Search for a script"
$keyword = "*$keyword*"

Find-Script $keyword | Format-Table Name,Description -Wrap
