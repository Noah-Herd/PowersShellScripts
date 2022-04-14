<#
.SYNOPSIS
Installs Routing and RemoteAcces roles
.DESCRIPTION
Installs the Routing and RemoteAccess server roles needed to configure a RRAS server for a S2S VPN
#>
Install-WindowsFeature RemoteAccess
Install-WindowsFeature Routing
Restart-Computer