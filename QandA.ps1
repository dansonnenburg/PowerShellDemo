# Interactiving with Excel directly with PowerShell

# Search for modules in PowerShell Gallery Online
Find-Module *excel* -Repository PSGallery

# Install module from PSGallery
Install-Module -Name ImportExcel -Repository PSGallery

# Load the module
Import-Module ImportExcel

# List the available commands in a module
Get-Command -Module ImportExcel

# Execute some commands in Excel
Get-ExcelSheetInfo -Path ".\excel_demo.xlsx"

$path = Resolve-Path ".\excel_demo.xlsx"
$excel = Open-ExcelPackage -Path $path
Select-Worksheet -ExcelPackage $excel -WorksheetName "Sheet1" 

Set-ExcelRow -ExcelPackage $excel -value "test3" -verbose
Close-ExcelPackage -ExcelPackage $excel

#

#merge multiple text files into a single file
$outputdir = Resolve-Path .
Remove-Item -path "$outputdir\CombinedFiles.ps1" -ErrorAction Ignore
foreach ($file in (Get-ChildItem -Path "$outputdir\*.ps1" | Sort-Object Name)){
    Get-Content $file | out-file "$outputdir\CombinedFiles.ps1" -Append
}

#Jeremy - Formatting network addresses
[System.Net.IPAddress]$IPAddr = "8.8.8.8"
$IPAddr | Get-Member
[System.Net.IPAddress]$IPAddr = "600.40.10.1"

[System.Net.NetworkInformation.PhysicalAddress]$macaddr = "D4-54-8B-AD-5C-9B"
$macaddr | Get-Member
$macaddr.ToString() -Split '(..)' -ne '' -join ':'
[System.Net.NetworkInformation.PhysicalAddress]$macaddr = "D4:54:8B:AD:5C:9B"
[System.Net.NetworkInformation.PhysicalAddress]$macaddr = "D4548BAD5C9B"
[System.Net.NetworkInformation.PhysicalAddress]$macaddr = "Z4-54-8B-AD-5C-9B"

$macaddr.GetType().Name

#Tom - Outputting multiple variables or data from function
function Format-SomeInput {
    param(
        $InputObject
    )

    if ($InputObject -is [String]){
        $OutputInfo = "StringValue = $InputObject"
    }
    elseif ($InputObject -is [int]) {
        $OutputInfo = "IntValue = $InputObject"
    }
    else {
        $OutputInfo = "$($InputObject.GetType().Name)Value = $InputObject"
    }

    Write-Output [PSCustomObject]@{
        MyTextData = $OutputInfo
        TheDataTypeIAm = $InputObject.GetType()
        MyValue = $InputObject
    }

}

Format-SomeInput -InputObject "Here is some text"
Format-SomeInput -InputObject 100
Format-SomeInput -InputObject (Get-Credential)
