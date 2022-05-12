# Write processes to json file
Get-Process | ConvertTo-Json | Out-File procs.json​

# Read process from json file
Get-Content ./procs.json | ConvertFrom-Json