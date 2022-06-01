# this object...
$computers = "computer1, computer2"
$computers[0] # This returns the first letter in the string
$computers.GetType() # This is a String
$computers.count # This returns a single string object

# is not the same as...
$computers = "computer1", "computer2"
$computers[0] # This returns the first object in the array
$computers.GetType() # This object is an array
$computers.count # this returns an array of 2 string objects

# Let's combine some of what we learned before and...

# Work with multiple items in a variable
$processes = Get-Process
$Top5procs = $processes | Sort-Object CPU -Descending | Select-Object ProcessName -First 5
Write-Output $Top5procs

# Another example of working with items in an array
$computers = "computer1", "computer2"
$count = 1
$computers | ForEach-Object {
    Write-Output "$_ is the $count object in the array."
    $count++
}

# Doing arithmetic with variables
$number = Read-Host "Enter a number"
$number * 10 # whoa...what is this craziness... it multiplies the string 100 (10) times, by repeating the string 100 ten times

# Making the variable an integer type
[int]$number = Read-Host "Enter a number"
$number * 10 # now this returns an integer with the result of 1000, as we would expect
# Variable Scoping

# Variable Scoped to Script
$service = 'spooler'

Function Get-ServiceStatus {
    $service = 'teamviewer' # the variable $service is scoped inside the function here
    $status = Get-Service -Name $service | Select-Object -ExpandProperty Status
    Write-Output "The service $service is in the $status status."
}
# We see that it returns a result for the teamviewer service which was scoped to the function
Get-ServiceStatus
# Yet, the script variable $service is still set to 'spooler'
Write-Output "The script-scoped variable `$service is still $service."

# Example of escaping the $ in the first line of the string
$computername = 'Server01'
$EscapedString = "`$computername`ncontains`n$computername"
$EscapedString