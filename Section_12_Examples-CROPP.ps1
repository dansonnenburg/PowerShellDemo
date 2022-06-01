# Example 12.1 - Compare published Azure Artifiacts to the modules that PowerShell sees in that Repository
Find-Module -Name * -Repository AzureDevOps


# Example 12.2 - Running Pester against an entire test script
Invoke-Pester .\Section_12_PesterExamples.Tests.ps1 -Output Detailed


# Example 12.3 - Command that will be turned into a function
#region E12.3
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
#endregion E12.3

# Example 12.4
#region E12.4
<###############
New Module Demo
###############>

#Create repository in Azure DevOps and init with readme.md

#clone repository to set up connection to Azure DevOps and the local folder
git status
git clone <REPO SSH Connection>

#navigate into the empty cloned folder
cd cPSModuleDemo

#run commands from PSModuleScaffold module to create the base structure
New-ModuleScaffold -ModuleName cPSModuleDemo -ModuleDesc "Example module created for Powershell Course to demonstrate modules" -ModuleAuthor "Nick Doskocil"

#review folder structure

#sample describe for the pester test of this function in the module demo
Describe "Get-PowerShellProcs" {
    It "Returns 1 or more results" {
        (Get-PowerShellProcs | Measure-Object).Count | Should -BeGreaterOrEqual 1
    }
    It "Returns 0 or more if excluding self" {
        (Get-PowerShellProcs -ExcludeMe | Measure-Object).Count | Should -BeGreaterOrEqual 0
    }
    It "There should be 5 properties returned in the first result" {
        (Get-PowerShellProcs | Select-Object -First 1 | Get-Member -MemberType NoteProperty | Measure-Object).Count | Should -Be 5
    }
}
#endregion E12.4


# Example 12.5 - Measure Command
Measure-Command {Get-Process}

# Example 12.6 - Measure Parallel Performance
# Measure performance of a command running in parallel
$Computers = 'CL01', 'CL02'
$ScriptBlock = {
    Get-Service -Name 'Spooler'
}
Measure-Command {
    Invoke-Command -ScriptBlock $ScriptBlock -ComputerName $Computers
}

#Example 12.7 - Measure Sequential Performance
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

# Example 12.8
# The commands to run in a background job
$ScriptBlock = { 
    Get-ChildItem -Path 'C:\Program Files\' -Include '*.exe' -Recurse -ErrorAction SilentlyContinue
}
# Run the ScriptBlock in the Background
Start-Job -ScriptBlock $ScriptBlock -Name 'test'

# Get Status of 'test' job
Get-Job -Name 'test'

# Receive output from job
Receive-Job -Name 'test'

# Example 12.9 - Invoke-Command
# Requires Administrator and psremoting enabled regardless of whether this is localhost or a remote system
# The commands to run in a background job
$ScriptBlock = { 
    Get-Service
}
# Run the ScriptBlock in the Background
Invoke-Command -ComputerName 'localhost' -ScriptBlock $ScriptBlock -AsJob -JobName 'test'

# Get Status of 'test' job
Get-Job -Name 'test'

# Receive output from job
Receive-Job -Name 'test'