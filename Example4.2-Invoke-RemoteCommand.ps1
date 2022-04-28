# Get Service named 'Spooler' on computers CL01 and CL02

$Computers = 'CL01', 'CL02'


$ScriptBlock = {
    Get-Service -Name 'Spooler'
}
Invoke-Command -ScriptBlock $ScriptBlock -ComputerName $Computers