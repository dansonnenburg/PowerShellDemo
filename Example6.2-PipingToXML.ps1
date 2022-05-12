# Pipe process output to xml
Get-Process | Export-CliXML proc.xml

# Import process information from XML
Import-Clixml .\procs.xml