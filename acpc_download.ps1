"!!USE AT YOUR OWN RISK!! This tool IS NOT certified by Acronis or Guaranteed by Silvereye. Enjoy!" | Out-Host

$cert = Read-Host "Storage Certificate (e.g. silvereye_migrationco.crt) [KB60082]"
$dc = Read-Host "Cloud Storage Location (e.g. abgw-phx1-arp1.acronis.com) [KB62658]"
$simconn = Read-Host "Set simultaneous download limit (e.g. 2)"
$clientid = Read-Host "API Client ID"
$clientsecret = Read-Host "API Client Secret" -MaskInput
$dcprefix = Read-Host "Enter the datacenter prefix (e.g. us5, us2)"

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

### Get the cloud archives
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", "Bearer $token")
$headers.Add("Content-Type", "application/json")

$body = @"
{
    "name": "*",
    "wildard": "true"
  }
"@

$getarchives = Invoke-RestMethod "https://$dcprefix-cloud.acronis.com/api/vault_manager/v1/archives" -Method 'GET' -Headers $headers
$getarchives | ConvertTo-Json -Depth 100 | ForEach-Object { $_ } | Out-Null

$archives = $getarchives.items.name |out-file all-archives.txt

$backupid = Read-Host "Please specifiy the Backup Plan ID of the archives you'd like to download"

#TNow we'll filter based on the backupid
$filtered = Get-Content .\all-archives.txt | Where-object {$_ -like "*$backupid*"} | out-file $backupid-archives.txt

##Download Archives
Get-Content $backupid-archives.txt | foreach-object -parallel{
    $archive=$_
    Start-Process -FilePath ".\archive_io_ctl.exe" -ArgumentList "--astor $($using:dc) --cert $($using:cert) --copy /1/$archive.tibx --show-progress --infinite-timeouts --continue" -Wait -RedirectStandardError download.txt
           } -ThrottleLimit $simconn