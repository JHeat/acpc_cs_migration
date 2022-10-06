"!!USE AT YOUR OWN RISK!! This tool IS NOT certified by Acronis or Guaranteed by Silvereye. Enjoy!" | Out-Host
##Cetificate obtained from <Insert KB>
$cert = Read-Host "Storage Certificate (e.g. silvereye_migrationco.crt) [KB60082]"

##The Cloud Storage datacenter locatio <Insert KB>
$dc = Read-Host "Cloud Storage Location (e.g. abgw-phx1-arp1.acronis.com) [KB62658]"

$simconn = Read-Host "Set simultaneous download limit (e.g. 2)"

##Now we'll query the cloud storage for .tibx archives
Start-Process -FilePath ".\archive_ctl.exe" -ArgumentList "--cert $cert --astor $dc --list-archives /1" -Wait -NoNewWindow -RedirectStandardError session.txt

Select-String -Path ".\session.txt" -Pattern "tibx" | select-object -ExpandProperty Line | out-file archive_list.txt

(Get-Content 'archive_list.txt') -replace '^..........................' | Set-Content 'archive_list.txt'

##Download Archives
get-content .\archive_list.txt | foreach-object -parallel{
    $archive=$_
    Start-Process -FilePath ".\archive_io_ctl.exe" -ArgumentList "--astor $($using:dc) --cert $($using:cert) --copy /1/$archive --show-progress --infinite-timeouts" -Wait -RedirectStandardError download.txt
           } -ThrottleLimit $simconn

## Future Dev for replacing the plan ID

## $newplan = Read-Host "Please enter your NEW backup plan ID"

## Download all Archives --> Identify all Plan ID's