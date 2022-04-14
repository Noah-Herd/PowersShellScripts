<#
.SYNOPSIS
Creates a batch of AD users
.DESCRIPTION
This program creates multiple AD users from a CSV file that contains the important values needed to create these users. You must also pass a default password to this script.
.PARAMETER File
This is the filepath for the CSV file being used
.PARAMETER DefualtPassword
This is the default password for every user being created.
.EXAMPLES
.\New-BatchUsers -File C:Users\KCobain\Documents\NewUsers.Csv -DefaultPassword P@ssw0rd
.\New-BatchUsers -File C:Users\KCobain\Documents\NewUsers.Csv -Password P@ssw0rd
#>

[CmdletBinding()]

Param(
[Parameter(Mandatory = $True)][String]$File,
[Parameter(Mandatory = $True)][Alias('Password')][String]$DefaultPassword
)

Import-Module ActiveDirectory
  
$Users = Import-Csv $File

foreach ($User in $Users) {

    $username = $User.SamAccountName
    $firstname = $User.firstname
    $lastname = $User.lastname
    $initials = $User.initials
    $Path = $User.Path

    if (Get-ADUser -F { SamAccountName -eq $username }) {
        
        Write-Warning "A user account with username $username already exists in Active Directory."
    }
    else {
        New-ADUser `
            -SamAccountName $username `
            -Name "$firstname $lastname" `
            -GivenName $firstname `
            -Surname $lastname `
            -Enabled $True `
            -DisplayName "$lastname, $firstname" `
            -Path $Path `
            -AccountPassword (ConvertTo-secureString $DefaultPassword -AsPlainText -Force) `
            -ChangePasswordAtLogon $True
    }
}