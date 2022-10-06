"!!USE AT YOUR OWN RISK!! This tool IS NOT certified by Acronis or Guaranteed by Silvereye. Enjoy!" | Out-Host
##Cetificate obtained from <Insert KB>
$cert = Read-Host "Storage Certificate (e.g. silvereye_migrationco.crt) [KB60082]"

##The Cloud Storage datacenter locatio <Insert KB>
$dc = Read-Host "Cloud Storage Location (e.g. abgw-phx1-arp1.acronis.com) [KB62658]"

$simconn = Read-Host "Set simultaneous download limit (e.g. 2)"

#We'll uload archives in batches using the plan ID as the reference
$planid = Read-Host "Enter the backup plan ID (e.g. CEE8DB80-9740-46AD-BBF2-62256A1EE023)"

Get-Content 'archive_list.txt' | Where-object {$_ -like "*$planid*"} | out-file archive_list_temp.txt

get-content .\archive_list_temp.txt | foreach-object -parallel{
    $archiveu=$_
    Start-Process -FilePath ".\archive_io_ctl.exe" -ArgumentList "--copy $archiveu --astor $($using:dc) --cert $($using:cert) --dst=/1/$archiveu --show-progress --infinite-timeouts" -Wait -RedirectStandardError upload.txt
           } -ThrottleLimit $simconn
    