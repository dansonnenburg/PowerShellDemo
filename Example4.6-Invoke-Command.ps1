# Requires psremoting enabled regardless of whether this is localhost or a remote system

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