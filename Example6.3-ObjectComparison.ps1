# Compare processes that were running when we created the file to currently running processes
Compare-Object -ReferenceObject (Import-Clixml .\procs.xml) -DifferenceObject (Get-Process) -Property Name