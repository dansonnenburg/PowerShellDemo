# Measure performance of a command running sequentially on hosts

$Computers = 'CL01', 'CL02'
$ScriptBlock = {
    Get-Service -Name 'Spooler'
}
Measure-Command {
    ForEach ($c in $Computers) {
        Invoke-Command -ScriptBlock $ScriptBlock -ComputerName $c
    }
}