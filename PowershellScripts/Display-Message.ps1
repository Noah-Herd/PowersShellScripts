<#
.SYNOPSIS
Creates a message window
.DESCRIPTION
Creates a message window using a string passed to it
.PARAMETER Message
The message that will be displayed
.EXAMPLES
.\Display-Message -Message "Hello World"
#>
[CmdletBinding()]

Param(
[Parameter(Mandatory = $True)][String]$Message
)
[System.Windows.MessageBox]::Show($Message)