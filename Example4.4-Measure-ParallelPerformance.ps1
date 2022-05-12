# Measure performance of a command running in parallel

$Computers = 'CL01', 'CL02'
$ScriptBlock = {
    Get-Service -Name 'Spooler'
}
Measure-Command {
    Invoke-Command -ScriptBlock $ScriptBlock -ComputerName $Computers
}