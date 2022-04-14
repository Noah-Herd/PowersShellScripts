<#
.SYNOPSIS
Retrieves a list of AD Accounts
.Description
Lists either all the active AD Accounts or disabled AD Accounts. If the type of account is not specified then will prompt the user for input.
.PARAMETER AccountType
This is the type of AD account you wish to list. Can be A for active or D for disabled. If left blank then the user will be prompted.
.EXAMPLES
.\Get-ADAccounts
.\Get-ADAccounts -AccountType A
.\Get-ADAccounts -AccountType D
#>

[CmdletBinding()]

Param(
[ValidateSet('A','D','')]$AccountType
)

if($AccountType -eq ''){
$AccountType = Read-Host "Do you want a list of active or disabled accounts? (`"A`" for Active, `"D`" for Disabled)"
}

if($AccountType -eq "A"){
Get-ADUser -Filter {Enabled -eq $True} | Select-Object -Property Name,Enabled
}

if($AccountType -eq "D") {
Get-ADUser -Filter {Enabled -eq $False} | Select-Object -Property Name,Enabled
}
