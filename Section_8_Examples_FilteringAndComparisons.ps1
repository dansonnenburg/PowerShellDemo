#############################################################################################################################################################
#######################################################Filtering and Comparisons DEMOS#######################################################################
#############################################################################################################################################################

#Demo 1 - Filtering
Get-Process -Name P*
Get-Process -ID 3532

#Demo 2 Lets talk about $_.
Get-Process | Where-Object {$_.ProcessName -eq 'dllhost'}

$Processes = Get-Process
$Processes
#A shortcut that prevents you have having to retype a variable name within a pipeline command.
$Processes.ProcessName
$Processes | Where-Object {$Processes.ProcessName -eq 'dllhost'}


#Demo 2 - Comparison Operators
Get-Process | Where-Object {$_.ID -eq 288}
Get-Process | Where-Object {$_.CPU -gt 1}
Get-ChildItem | Where-Object {$_.Name -like '*.ps1'}

#Demo 3 - Iterative Command line - How much CPU is the top 10 processes eating up
Get-Process
Get-Process | Where-Object {$_.Name -notlike 'pwsh*'} 
Get-Process | Where-Object {$_.Name -notlike 'pwsh*'} | Sort-Object CPU -Descending
Get-Process | Where-Object {$_.Name -notlike 'pwsh*'} | Sort-Object CPU -Descending | SELECT -First 10
Get-Process | Where-Object {$_.Name -notlike 'pwsh*'} | Sort-Object CPU -Descending | SELECT -First 10 | Measure-Object -Property CPU -Sum

#Demo 4 - PowerShell operators on macOS
Get-Process 
Get-Process | Where-Object {$_.Name -eq 'WeatherWidge'}
Get-Process | Where-Object {$_.Name -like 'com.apple.*'}
Get-Process | Where-Object {$_.Name -like 'com.apple.'}



######################################################OV Filtering & Comparison Examples######################################################################

#Demo 1 Filtering Left 
Get-RDSessionHost -CollectionName 'CollectionName' -ConnectionBroker 'BROKERNAME'
Get-CMSoftwareUpdate -ArticleId 'ArticleID' | SELECT ArticleID,LocalizedDisplayName,DateCreated,IsSuperceded


#Demo 2 Where-Object & Comparison Operators
Get-RDUserSession -ConnectionBroker 'BROKERNAME' | ?{$_.SessionState -eq 'STATE_DISCONNECTED'}
Get-RDRemoteApp -ConnectionBroker 'BROKERNAME' -CollectionName 'CollectionName' | Where-Object {$_.DisplayName -like '*Test*'}
Get-AzSubscription | Where-Object {$_.Name -notlike '*Test*' -and $_.Name -like '*IT*'}

#Demo 3 Iterative Command Line & RemoteApp users Connection Status
Get-RDUserSession -ConnectionBroker 'BROKERNAME'
Get-RDUserSession -ConnectionBroker 'BROKERNAME' | SELECT *
Get-RDUserSession -ConnectionBroker 'BROKERNAME' | Where-Object {$_.SessionState -eq "STATE_ACTIVE"}
