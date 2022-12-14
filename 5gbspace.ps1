$SpaceWarning = 150
$SpaceCritcal = 5


$a = Get-CimInstance -ClassName Win32_LogicalDisk
#$a

Foreach($space in $a){

$b=$space.deviceID
$b
$c=$space.driveType
#$c

if ($space.size -ne $NULL) {
$DiskFreeSpace = ($space.freespace/1GB).ToString('F2')
$DiskFreeSpace

if($DiskFreeSpace -le $SpaceWarning){
$Message= "Warning!"

if($DiskFreeSpace -le $SpaceCritcal){
$Message= "Alert!"
}
$wshell = New-Object -ComObject Wscript.Shell
$Output = $wshell.Popup("Disk $($Disk.DeviceID) has only $DiskFreeSpace GB of free space left",0,$Message,48)
}
}
}



