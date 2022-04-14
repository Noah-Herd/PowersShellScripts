<#
.SYNOPSIS
Sends a discord message
.DESCRIPTION
Prompt user to enter a message to send to a discord channel
NOTE: the url must be changed to the URL of your own webhook
#>
$hookUrl = 'https://discord.com/api/webhooks/964033568953212998/RYhGurn0P42pPneGzL49iW7X8Pf5SJnm-EB8UTm81_skEUcTPzcebU7fIjrbv4tW1qez'
$Message = Read-Host "Enter your message"
$content = @"
$Message
"@

$payload = [PSCustomObject]@{
content = $content
}
Invoke-RestMethod -Uri $hookUrl -Method Post -Body ($payload | ConvertTo-Json) -ContentType 'Application/Json'