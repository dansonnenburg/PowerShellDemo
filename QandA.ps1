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

# Help about Import-Excel
Get-Help Import-Excel -Examples

# Get the columns and values in a spreadsheet
Import-Excel -Path ".\excel_demo.xlsx"

# Get Help about Set-Row
Get-Help Set-Row -Examples

$objExcel = New-Object -ComObject Excel.Application
$worksheet = $objExcel.Workbooks.Open("C:\Users\dan.sonnenburg\github\PowerShellDemo\excel_demo.xlsx")

$worksheetObj = New-Object -TypeName OfficeOpenXml.ExcelPackage

Set-ExcelRow -Worksheet $worksheet -Heading Column1 -Value "test3"