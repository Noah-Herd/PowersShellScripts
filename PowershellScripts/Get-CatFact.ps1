<#
.SYNOPSIS
Displays a random fact about cats
.DESCRIPTION
Gets a random cat fact from catfact.ninja and display it in a message box
#>

$CatFact = Invoke-WebRequest https://catfact.ninja/fact
$Fact = $CatFact.Content
$Fact = $Fact -replace '{"fact":"'
$Fact = $Fact -replace ".{14}$"

If ($Fact -match '"$'){
    $Fact = $Fact -replace ".$"
}
$Fact = $Fact.Replace("\u2019","'")
$Fact = $Fact.Replace("\","")
$Fact = $Fact.Replace("\u00b0","°")
[System.Windows.MessageBox]::Show($Fact)