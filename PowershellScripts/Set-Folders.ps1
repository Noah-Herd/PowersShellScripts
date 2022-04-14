<#
.SYNOPSIS
Creates a set of folders
.DESCRIPTION
Asks for a first name and a last name then creates a custom set of folders based on those specifications
#>

$firstname = Read-Host "Please enter the patients first name"

$lastname = Read-host "Please enter the patients last name"

New-Item -Path .\Desktop\Client -Name "$lastname,$firstname" -ItemType Directory
New-Item -Path ".\Desktop\Client\$lastname,$firstname" -Name "Accounting" -ItemType Directory
New-Item -Path ".\Desktop\Client\$lastname,$firstname" -Name "X-Rays" -ItemType Directory
New-Item -Path ".\Desktop\Client\$lastname,$firstname" -Name "Medical Records" -ItemType Directory
New-Item -Path ".\Desktop\Client\$lastname,$firstname" -Name "Correspondence" -ItemType Directory