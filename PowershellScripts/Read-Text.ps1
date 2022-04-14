<#
.SYNOPSIS
Reads the text from a .txt file
.DESCRIPTION
Reads the content of a .txt file and speaks it
.PARAMETER Path
The path of the text file
.EXAMPLES
.\Read-Text "C:\Users\BObama\Desktop\StateOfTheUnion.txt"
#>

Param(
[Parameter(Mandatory = $true)][String]$Path
)

Add-Type -AssemblyName System.Speech
$Voice = New-Object System.Speech.Synthesis.SpeechSynthesizer
$Text = Get-Content -Path "$Path"
$Voice.SpeakAsync($Text)
