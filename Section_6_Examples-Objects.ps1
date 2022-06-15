# Example 6.1 - Piping output to json
Get-Process | ConvertTo-Json | Out-File procs.json​

# Read processes from json file
Get-Content .\procs.json | ConvertFrom-Json | Select-Object Name, ID

#Example 6.2 - Piping output to XML
Get-Process | Export-CliXML proc.xml

# Import process information from XML
Import-Clixml .\proc.xml

# Example 6.3 - Object Comparison
Compare-Object -ReferenceObject (Import-Clixml .\proc.xml) -DifferenceObject (Get-Process) -Property Name

# Example 6.4 - Piping to a File
# Old method: 
Dir > files.txt
# New Method: 
Dir | Out-File files.txt

# Append file
Dir >> file.txt

# Open file
.\files.txt

# Example 6.5 - Converting to HTML
# Get the first running process and pipe the output to html.
Get-Process | Select-Object -First 1 | ConvertTo-Html | Out-File processes.html

# Open processes.html
.\processes.html

# Example 6.6 - Stopping Processes
# Only run this command with the -WhatIf parameter or for the intended process(es)
Get-Process | Stop-Process -WhatIf

# Example 6.7 - Select-Object
Get-Process | Select-Object Name, ID

# Example 6.8 - Sort-Object
Get-Process | Sort-Object CPU -Descending | Select-Object -First 5
