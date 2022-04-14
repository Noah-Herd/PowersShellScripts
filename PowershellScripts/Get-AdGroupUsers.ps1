<#
.SYNOPSIS
Displays the names of users in a group
.DECRIPTION
Displays a list of the names of all the AD Users in specified group. If no group is passed then the user will be asked which group they want
.PARAMETER Group
Name of AD group
.EXAMPLES
.\Get-ADGroupUsers
.\Get-ADGroupUsers -Group ITADmin
#>

Param(
[String]$Group
) 

if($Group -eq ''){
    $Group = Read-Host "Enter name of group?"
}
Get-ADGroupMember -Identity $Group | Select-Object Name