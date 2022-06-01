# Example 12.1 - Measure Command
Measure-Command {Get-Process}

# Example 12.2 - Measure Parallel Performance
# Measure performance of a command running in parallel
$Computers = 'CL01', 'CL02'
$ScriptBlock = {
    Get-Service -Name 'Spooler'
}
Measure-Command {
    Invoke-Command -ScriptBlock $ScriptBlock -ComputerName $Computers
}

#Example 12.3 - Measure Sequential Performance
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