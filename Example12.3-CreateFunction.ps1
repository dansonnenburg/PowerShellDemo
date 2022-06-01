#example command that will be turned into a function
Get-Process -Name @("pwsh*","powershell*")
Get-Process -Name @("pwsh*","powershell*") | Select-Object -First 1 -Property *
Get-Process -Name @("pwsh*","powershell*") | Select-Object Id, Name, FileVersion, @{l="Parent";e={$_.Parent.Description}}, @{l="MemoryMB";e={[Math]::Round($_.vm/1MB,1)}}








#sample function to use in new module demo
function Get-PowerShellProcs {
    <#
    .SYNOPSIS
    Returns the running processes that are running powershell
    
    .PARAMETER ExcludeMe
    Excludes the current powershell session
    
    .EXAMPLE
    PS> Get-PowerShellProcs -ExcludeMe
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$false)] [switch]$ExcludeMe
    )

    #get all the powershell processes
    $PowershellProcs = Get-Process -Name @("pwsh*","powershell*")

    Write-Verbose "Found processes: $(($PowershellProcs | Measure-Object).Count)"

    #exclude the current process if specified
    if ($ExcludeMe){
        $PowershellProcs = $PowershellProcs | Where-Object {$_.ID -ne $PID }
        Write-Verbose "Filtered out current session: $($PID). Total processes: $(($PowershellProcs | Measure-Object).Count)"
    }

    #return the properties we want to see
    return ($PowershellProcs | Select-Object Id, Name, FileVersion, @{l="Parent";e={$_.Parent.Description}}, @{l="MemoryMB";e={[Math]::Round($_.vm/1MB,1)}})
}