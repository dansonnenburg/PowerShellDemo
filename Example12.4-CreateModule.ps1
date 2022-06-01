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

