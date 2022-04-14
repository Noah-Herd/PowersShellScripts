 <#
 .SYNOPSIS
 Gets info relating to a student ID number
 .DESCRIPTION
 Asks the user to input a student number and then displays information relating to that number suh as First name, Last name, etc.
 .EXAMPLES
 .\Get-ADUserStudentNumber
 #>

$number = Read-Host "Please enter a student number"
 
Get-ADUser -filter "EmployeeNumber -eq $number" | Select-Object -Property @{name='First Name';expression={$_.givenname}}, @{name='Last Name';expression={$_.Surname}}, SamAccountName, Enabled, DistinguishedName
