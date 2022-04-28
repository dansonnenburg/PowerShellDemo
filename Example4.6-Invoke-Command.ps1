# The commands to run in a background job
$ScriptBlock = { 
    Get-ChildItem -Path 'C:\Program Files\' -Include '*.exe' -Recurse -ErrorAction SilentlyContinue
}
# Run the ScriptBlock in the Background
Invoke-Command -ComputerName 'CL01' -ScriptBlock $ScriptBlock -AsJob -JobName 'test'

# Get Status of 'test' job
Get-Job -Name 'test'

# Receive output from job
Receive-Job -Name 'test'