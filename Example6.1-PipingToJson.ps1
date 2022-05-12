# Pipe process output to json file
Get-Process | ConvertTo-Json | Out-File procs.json​

# Read processes from json file
Get-Content .\procs.json | ConvertFrom-Json