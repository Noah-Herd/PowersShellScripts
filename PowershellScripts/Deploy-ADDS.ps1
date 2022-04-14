<#
.SYNOPSIS
Windows PowerShell script for basic AD DS Deployment
.DESCRIPTION
This scripts installs AD DS role and deploys a basic setup for an AD DS environment
.PARAMETER DomainName
The desired DNS namespace
.PARAMETER
The desired NetBios name
.EXAMPLE
Deploy-ADDS -DomainName Int.Company.Com -NetBios COMP
#>

[CmdletBinding()]

Param(
[Parameter(Mandatory = $True)][String]$DomainName,
[Parameter(Mandatory = $True)][String]$NetBios
)

Add-WindowsFeature -name AD-Domain-Services -IncludeManagementTools
Install-ADDSForest `
-CreateDnsDelegation:$false `
-DatabasePath "C:\Windows\NTDS" `
-DomainMode "WinThreshold" `
-DomainName "$DomainName" `
-DomainNetbiosName "$NetBios" `
-ForestMode "WinThreshold" `
-InstallDns:$true `
-LogPath "C:\Windows\NTDS" `
-NoRebootOnCompletion:$false `
-SysvolPath "C:\Windows\SYSVOL" `
-Force:$true