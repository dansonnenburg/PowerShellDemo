# Example 4.1 - Using an exe with a CLI
& ping CL01

# Example 4.2 - Command Aliases
Get-Process
#vs
gps

Get-ChildItem
#vs
ls

# Example 4.3 - Discover aliases
Get-Alias

# Example 4.4 - Truncating Parameter Names
# using truncated ComputerName as 'Comp'
Get-CimInstance -ClassName Win32_OperatingSystem -Comp CL01

# Example 4.5 - Parameter name aliases
(Get-Command Get-Process | Select-Object -Expand parameters).erroraction.aliases
# you will see that the alias for 'ErrorAction' is 'ea'

# Example 4.6 - Positional Parameters
Get-Help Get-Process -Full
# Get-Process accepts a property called 'Name' as the first parameter, as seen in the help file.

# Example 4.7 - Running a Command
Get-Service -Name 'Spooler'

# Example 4.8 - Running a finicky command-line utility
# prefix with an '&' so the PowerShell does not try to use native parsing method
& ping.exe CL01

# Example 4.9 - Invoke a Remote Command
# Get Service named 'Spooler' on computers CL01 and CL02
$Computers = 'CL01', 'CL02'
$ScriptBlock = {
    Get-Service -Name 'Spooler'
}
Invoke-Command -ScriptBlock $ScriptBlock -ComputerName $Computers