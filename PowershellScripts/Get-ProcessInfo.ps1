<#
.SYNOPSIS
Creates an HTML file that contains the highest consuming processes
.DESCRIPTION
Retrieves the highest consuming processes in the computer and places them into an HTML file. 
Asks for a name for the file the amount of processes
#>

$filename = Read-Host "What would you like to name the File?"
$number = Read-Host "How many Processes would you like to see?"

Get-Process | Sort-Object -Descending PM | Select-Object -First $number -Property ProcessName,ID,@{name="CPU Time(Seconds)";expression={$_.CPU -as [int]}} | ConvertTo-Html | Out-File -FilePath "C:\Users\Jared\Desktop\$filename.html"

