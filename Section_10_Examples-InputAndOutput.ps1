# Example 10.1
# How to use Read-Host cmdlet
Read-Host "Enter a computer name"

# Example 10.2 Parameter Block
Function Do-SomethingUseful {
    param(
        [switch]$SomethingUseful
    )
    If ($SomethingUseful -eq $true) {
        Write-Output "This was really useful."
    }
    Else {
        Write-Output "This was not useful."
    }
}
Do-SomethingUseful -SomethingUseful # This switch parameter bounds the output.
Do-SomethingUseful # This time the switch was not used and therefore didn't do anything useful.

# Example 10.3
# How to use Write-Host (ignores the pipeline)
Write-Host "Server01" -ForegroundColor Yellow -BackgroundColor Magenta

# Example 10.4
# How to use write-output (uses the pipeline by default)
Write-Output "Hello"

# Write-Output can filter output in the pipeline example 1
Write-Output "Hello" | Where-Object { $_.length -gt 10 } # returns nothing, because it does not meet criteria

# Write-Output with filtered output in pipeline example 2
$integers = @(1, 2, 3, 5, 10, 20, 30, 40, 50)
Write-Output $integers `
| Where-Object { $_ -gt 10 }

# Make the computer beep.  This is an accent character preceeding the a. ;)
"`a"