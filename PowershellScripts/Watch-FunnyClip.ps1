<#
.SYNOPSIS
Opens up a funny youtube clip
.DESCRIPTION
Asks the user if they want to see a funny clip and if they click yes opens a funny youtube clip
#>

$ButtonType = [System.Windows.MessageBoxButton]::YesNo
$MessageBoxTitle = "Funny Clip"
$MessageBoxBody =  "Would you like to open a funny clip?"
$MessageIcon = [System.Windows.MessageBoxImage]::Question
$Result = [System.Windows.MessageBox]::Show($Messageboxbody,$MessageboxTitle,$ButtonType,$messageicon)
If ($Result -eq 'Yes'){
Start https://youtu.be/BAF0Ig63z98
}
    

