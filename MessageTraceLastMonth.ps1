$username="<username>"
$password = get-content C:\pss\cred.txt | convertto-securestring
$UserCredential = new-object -typename System.Management.Automation.PSCredential -argumentlist $username,$password

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session -DisableNameChecking

$day = (Get-Date).Day
$month = (Get-Date).Month
$year = (Get-Date).Year
$today = (Get-Date).toString('yyyMMdd')

$startdate = (get-date).AddDays(-30)
$enddate = get-date
Get-MessageTrace -StartDate $startdate -EndDate $enddate > "C:\pss\Message_Trace_$today.txt"
Get-PSSession | Remove-PSSession