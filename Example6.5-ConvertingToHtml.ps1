# Get the first running process and pipe the output to html.
Get-Process | Select -First 1 | ConvertTo-Html | Out-File processes.html

# Open processes.html
.\processes.html