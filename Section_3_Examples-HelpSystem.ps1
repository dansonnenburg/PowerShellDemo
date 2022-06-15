# Example 3.1 Update Help
Update-Help -ErrorAction SilentlyContinue

# How to get help example, but default pipes to less
Get-Help Get-Process

# Get Full Help
Get-Help Get-Process -Full

# Get Help with examples
Get-Help Get-Process -Examples

# Get Help Online
Get-Help Get-Process -Online

# Get help using a wilcard in the -Name parameter
Get-Help *AD*

# Using Get-Command
Get-Command *Get* -Type cmdlet

# Get Active Directory Commands by its noun
Get-Command -Noun AD*

Get-ITToolkitHelp

Get-Help Get-Process -ShowWindow