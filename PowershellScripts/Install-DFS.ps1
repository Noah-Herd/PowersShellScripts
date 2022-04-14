<#
.SYNOPSIS
Installs DFS server roles
.DESCRIPTION
Installs both the DFS Namespace and DFS Replication server roles as well as thier associated management tools
#>

Install-WindowsFeature "FS-DFS-Replication", "RSAT-DFS-Mgmt-Con"
Install-WindowsFeature "FS-DFS-Namespace", "RSAT-DFS-Mgmt-Con"