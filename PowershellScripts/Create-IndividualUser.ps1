<#
.SYNOPSIS
Colects info and makes an account
.DESCRIPTION
Allows user to input details about themself (first name, Last name, and student number) in order to creat a new AD user
#>


$fname = Read-Host "Please enter your First name"
$lname = Read-Host "Please enter your Last name"
$number = Read-Host "Please enter your student number"
$email = $fname[0] + $lname + '@okanagan.bc.ca'
$display = $fname[0] + $lname 
$initial = $fname[0] + $lname[0]


$securepassword = ConvertTo-SecureString 'P@ssw0rd' -AsPlainText -Force

New-ADUser -Name "$fname $lname" -GivenName $fname -SurName $lname -DisplayName $display -EmailAddress $email -EmployeeNumber $number -Initials $initial -SamAccountName $display  -AccountPassword $securepassword -ChangePasswordAtLogon $true -Enabled $true -Verbose 
