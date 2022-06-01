# Example 11.1 - Discovering available azure modules on PSGallery
Find-Module azure* | more

# Example 11.2 - Installing a module from PSGallery
Install-Module OSD

# Example 11.3 - Listing loaded modules
Get-Module

# List all available modules on the local computer
Get-Module -ListAvailable

# Example 11.4 - Get commands available in a module
Get-Command –Module IT-Toolkit