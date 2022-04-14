<#
.SYNOPSIS
Resets a user password and prompts them to change password at next log in
.DESCRIPTION
Takes in a username and resets the accounts password to a default password. Then on the users next log in they will then be prompted to change their password.
.PARAMETER User
The username
.PARAMETER Password
Password that the user will use for their next log in
.EXAMPLE
.\Reset-UserPassword -User K.Cobain -Password P@ssw0rd
#>

[CmdletBinding()]

Param(
[Parameter(Mandatory = $True)]$User,
[Parameter(Mandatory = $True)]$Password
)

$DefaultPassword = ConvertTo-SecureString $Password -AsPlainText -Force
Set-ADAccountPassword -Identity $User -NewPassword $DefaultPassword -Reset
Set-ADUser -Identity $User -ChangePasswordAtLogon $True