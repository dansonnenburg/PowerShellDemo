# this object...
$computers = "computer1, computer2"
$computers[0] # This returns the first letter in the string
$computers.GetType() # This is a String

# is not the same as...
$computers = "computer1", "computer2"
$computers[0] # This returns the first object in the array
$computers.GetType() # This object is an array

# Let's combine some of what we learned before and...

# Work with multiple items in a variable
$processes = Get-Process
$Top5procs = $processes | Sort-Object CPU -Descending | Select-Object ProcessName -First 5
Write-Output $Top5procs