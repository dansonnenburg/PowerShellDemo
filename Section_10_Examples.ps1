# Example 10.1
# How to use Read-Host cmdlet
Read-Host "Enter a computer name"

# Example 10.2
# How to use Write-Host (ignores the pipeline)
Write-Host "Server01" -ForegroundColor Yellow -BackgroundColor Magenta

# Example 10.3
# How to use write-output (uses the pipeline by default)
Write-Output "Hello"

# Write-Output can filter output in the pipeline example 1
Write-Output "Hello" | Where-Object {$_.length -gt 10} # returns nothing, because it does not meet criteria

# Write-Output with filtered output in pipeline example 2
[int[]]$integers = 1,2,3,5,10,20,30,40,50
Write-Output $integers | Where-Object{$_ -gt 10}