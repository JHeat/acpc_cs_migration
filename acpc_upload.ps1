$cert = Read-Host "Storage Certificate (e.g. silvereye_migrationco.crt) [KB60082]"
$dc = Read-Host "Cloud Storage Location (e.g. abgw-phx1-arp1.acronis.com) [KB62658]"
$simconn = Read-Host "Set simultaneous upload limit (e.g. 2)"
$clientid = Read-Host "API Client ID [InsertKB]"
$clientsecret = Read-Host "API Client Secret" -MaskInput
$dcprefix = $dcprefix = Read-Host "Enter the datacenter prefix (e.g. us5, us2"

## Create the Bas64 Pair
$pair = "${clientid}:${clientsecret}"
$bytes = [System.Text.Encoding]::ASCII.GetBytes($pair)
$base64 = [System.Convert]::ToBase64String($bytes)
$basicauth = "Basic $base64"

### First we get our token
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/x-www-form-urlencoded")
$headers.Add("Authorization", "$basicauth")

$body = "grant_type=client_credentials"

$basiccreds = Invoke-RestMethod "https://$dcprefix-cloud.acronis.com/api/2/idp/token" -Method 'POST' -Headers $headers -Body $body
$basiccreds | ConvertTo-Json -Depth 100

$token = $basiccreds.access_token

$backupid = Read-Host "Please specifiy the Backup Plan ID of the archives you'd like to UPLOAD"

$archivesu = Get-Content -Path "$backupid-archives.txt"

$archivesu | foreach-object -parallel{
    $archiveu=$_
    Start-Process -FilePath ".\archive_io_ctl.exe" -ArgumentList "--copy $archiveu.tibx --astor $($using:dc) --cert $($using:cert) --dst=/1/$archiveu.tibx --show-progress --infinite-timeouts --continue" -Wait -RedirectStandardError upload.txt
           } -ThrottleLimit $simconn