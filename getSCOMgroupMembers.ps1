#Connect to SCOM and Check MgmtGroup Connection
$ManagementServer ='Localhost'
$connectSCOM = New-SCOMManagementGroupConnection -ComputerName $ManagementServer
$checkMGConnection = Get-SCOMManagementGroupConnection
$groupDisplayName = 'GROUPNAME'


$Class = Get-SCOMClass | ?{$_.DisplayName -eq $groupDisplayName}

$MMGroup = Get-SCOMClassInstance -Class $Class 
$MMObjects = Get-SCOMClassInstance $MMGroup | select Displayname, ID, Path
$MMObjects
$MMObjects | Export-Csv -Path C:\users\user\Desktop\utrekk.csv
