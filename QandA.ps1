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

$path = Resolve-Path ".\powershelldemo\excel_demo.xlsx"
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
