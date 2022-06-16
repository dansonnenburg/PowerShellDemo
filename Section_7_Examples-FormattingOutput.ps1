####################################################PART 7: FORMATTING OUTPUT DEMOS##########################################################################
#############################################################################################################################################################

#Demo 1: Format Table with Property Parameter
Get-Date 
Get-Date | Format-Table
Get-Date | Format-Table -Property *

#Demo 2: Format List
get-aduser username -properties * | Format-Table
# Use format-list for a single column
get-aduser username -properties * | Format-list

#Demo 3: Format Wide
Get-ChildItem HKCU:\software\microsoft
Get-ChildItem HKCU:\software\microsoft | Format-Wide
Get-ChildItem HKCU:\software\microsoft | Format-Wide -Property pschildname -AutoSize

#Demo 4: Creating a Custom Column Header
Get-Date | Format-Table -Property *
Get-Date| Format-Table Displayhint,Date,Day,@{name='WeekDay';Expression={$_.DayOfWeek}},DayOfYear,Hour,Kind,Milllisecond,Minute,Month

#Demo 5: Out-File
Get-Process | Out-File -FilePath "C:\temp\process.txt"

#Demo 6: Out-GridView
Get-Process | Out-GridView

######################################################OV Formating Examples#################################################################################

#OV Demo 1 - Get Application Information & Format
Get-CMApplication -Name 'Google Chrome (x64)'
Get-CMApplication -Name 'Google Chrome (x64)' | Format-Table
Get-CMApplication -Name 'Google Chrome (x64)' | SELECT PackageID,LocalizedDisplayName, SoftwareVersion | Format-Table

#OV Demo 2 - Creating a Custom Column Header   
Get-CMApplication -Name 'Google Chrome (x64)' | SELECT PackageID,LocalizedDisplayName, SoftwareVersion | Format-Table PackageID,@{name='Application Name';Expression={$_.LocalizedDisplayName}},SoftwareVersion

#OV Demo 3 - Getting Pilot Devices for Google Chrome Deployment
Get-CMCollectionMember -CollectionName "CollectionName"
Get-CMCollectionMember -CollectionName "CollectionName" | SELECT Name | Format-Table | Out-File C:\temp\PilotDevices.csv

#Demo 4: Querying Azure VM Status & Formatting Output, Query Azure Resources & Formatting Output for geographical Location
Get-AzVM -Status | Sort-Object PowerState | Format-Table -Property Name,Location,ResourceGroupName -GroupBy PowerState
Get-AzResource  | Format-Table -Property Name,Type -GroupBy Location
