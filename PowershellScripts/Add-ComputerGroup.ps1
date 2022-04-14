<#
.SYNOPSIS
Adds multiple computers to a Domain
.DESCRIPTION
Takes in a list of computers and their local admin credentials and adds them to a domain using the domain credentials and restarts
.PARAMETER Domain
This is the Domain the PCs are to be added to
.PARAMETER Admin
Username of the Domain Administrator 
.PARAMETER Password
Password of the Domain Administrator
.PARAMETER PC
PC or list of PCs that are to be added to domain
.PARAMETER PCUser
Local Administrator username of PCs
.EXAMPLE
.\Add-ComputerGroup -Domain Int.Company.Com -Admin COMP\K.Cobain -Password P@ssw0rd -PC PC01, PC02, PC03 -PCUser Admin
#>

[CmdletBinding()]

Param(
[Parameter(Mandatory = $True)][String]$Domain,
[Parameter(Mandatory = $True)][String]$Password,
[Parameter(Mandatory = $True)][String]$Admin,
[Parameter(Mandatory = $True)]$PC,
[Parameter(Mandatory = $True)][String]$PCUser
)

$SecurePassword = ConvertTo-SecureString "$Password" -AsPlainText -Force
$Cred = New-Object System.Management.Automation.PSCredential ("$Admin","$SecurePassword")

Add-Computer -ComputerName $PC -LocalCredential $PC\$PCUser `
 -DomainName $Domain -Credential $Cred -restart -force