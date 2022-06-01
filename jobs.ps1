# Example 4.3
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

# Example 4.4 - Invoke-Command
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