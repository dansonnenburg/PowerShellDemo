# Example 5.1 - List available PowerShell Providers
Get-PSProvider

# Example 5.2 - List available PowerShell Drives
Get-PSDrive

# Connect to your local C:\ drive, typically the OS drive
Set-Location C:\

# Connect to the Local Machine registry hive
Set-Location HKLM:\
Get-ChildItem

# Typical things that you can do in a provider
New-Item $env:TEMP\test.txt
Copy-Item $env:TEMP\test.txt $env:TEMP\test2.txt
Get-Item $env:TEMP\test2.txt
Rename-Item $env:TEMP\test.txt $env:TEMP\test1.txt
Get-ChildItem $env:TEMP | Where-Object {$_.Name -like 'test*'}
Remove-Item $env:TEMP\test1.txt
Remove-Item $env:TEMP\test2.txt -Confirm
Get-ChildItem $env:TEMP | Where-Object {$_.Name -like 'test*'}

Get-ChildItem env:*