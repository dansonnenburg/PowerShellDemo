# Example of escaping the $ in the first line of the string
$computername = 'Server01'
$EscapedString = "`$computername`ncontains`n$computername"
$EscapedString