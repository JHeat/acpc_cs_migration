## This app allows anyone to create a trial tenant under the Silvereye MSP Tenant

"Hola! Thanks for the lead love! LFG!"

$new_tenant_name = Read-Host "Please enter the name of the tenant (e.g. Best Western"
$new_tenant_short = Read-Host "Please enter a short name for the tenant (e.g. bw)"
$first_name = Read-Host "Please enter your first name"
$email = Read-Host "What's YOUR email address?"
$base_url = "https://us5-cloud.acronis.com"
$parent_tenant_id = "d6aa7c1f-727a-48b3-9cd3-76371341fc4d"
$offering_items_json = @"

{
  "offering_items": [
    {
      "name": "pu_base_fc_storage",
      "application_id": "dfd85a5f-a464-32ab-81fd-99bcc66a070f",
      "edition": "fss_per_user",
      "usage_name": "fc_storage",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": false,
      "quota": {
        "value": null,
        "overage": null,
        "version": 0
      },
      "type": "infra",
      "infra_id": "fd8731d5-ede9-4dd4-93e4-6066b044879c",
      "measurement_unit": "bytes"
    },
    {
      "name": "pw_base_storage",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "storage",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": false,
      "quota": {
        "value": null,
        "overage": null,
        "version": 0
      },
      "type": "infra",
      "infra_id": "e72104a3-c013-4e18-bb71-7bce1dcdcaf2",
      "measurement_unit": "bytes"
    },
    {
      "name": "pw_base_dr_base",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "dr_base",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": null,
      "type": "feature",
      "infra_id": "2d67488d-f8b5-4733-a531-e2878ed0b887",
      "measurement_unit": "n/a"
    },
    {
      "name": "pw_base_adv_dr_storage",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "dr_storage",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": false,
      "quota": {
        "value": null,
        "overage": null,
        "version": 0
      },
      "type": "infra",
      "infra_id": "2d67488d-f8b5-4733-a531-e2878ed0b887",
      "measurement_unit": "bytes"
    },
    {
      "name": "pw_base_adv_dr_compute_points",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "compute_points",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": false,
      "quota": {
        "value": null,
        "overage": null,
        "version": 0
      },
      "type": "infra",
      "infra_id": "2d67488d-f8b5-4733-a531-e2878ed0b887",
      "measurement_unit": "seconds"
    },
    {
      "name": "pw_base_adv_dr_cloud_servers",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "dr_cloud_servers",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": false,
      "quota": {
        "value": null,
        "overage": null,
        "version": 0
      },
      "type": "infra",
      "infra_id": "2d67488d-f8b5-4733-a531-e2878ed0b887",
      "measurement_unit": "quantity"
    },
    {
      "name": "pw_base_adv_dr_internet_access",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "dr_internet_access",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": null,
      "type": "feature",
      "infra_id": "2d67488d-f8b5-4733-a531-e2878ed0b887",
      "measurement_unit": "n/a"
    },
    {
      "name": "local_storage",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": null,
      "usage_name": "local_storage",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": false,
      "quota": {
        "value": null,
        "overage": null,
        "version": 0
      },
      "type": "count",
      "infra_id": null,
      "measurement_unit": "bytes"
    },
    {
      "name": "pw_base_workstations",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "workstations",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": false,
      "quota": {
        "value": null,
        "overage": null,
        "version": 0
      },
      "type": "count",
      "infra_id": null,
      "measurement_unit": "quantity"
    },
    {
      "name": "pw_base_servers",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "servers",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": false,
      "quota": {
        "value": null,
        "overage": null,
        "version": 0
      },
      "type": "count",
      "infra_id": null,
      "measurement_unit": "quantity"
    },
    {
      "name": "pw_base_vms",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "vms",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": false,
      "quota": {
        "value": null,
        "overage": null,
        "version": 0
      },
      "type": "count",
      "infra_id": null,
      "measurement_unit": "quantity"
    },
    {
      "name": "pw_base_mobiles",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "mobiles",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": false,
      "quota": {
        "value": null,
        "overage": null,
        "version": 0
      },
      "type": "count",
      "infra_id": null,
      "measurement_unit": "quantity"
    },
    {
      "name": "pw_base_m365_seats",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "mailboxes",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": false,
      "quota": {
        "value": null,
        "overage": null,
        "version": 0
      },
      "type": "count",
      "infra_id": null,
      "measurement_unit": "quantity"
    },
    {
      "name": "pw_base_websites",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "websites",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": false,
      "quota": {
        "value": null,
        "overage": null,
        "version": 0
      },
      "type": "count",
      "infra_id": null,
      "measurement_unit": "quantity"
    },
    {
      "name": "pw_base_gworkspace_seats",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "gsuite_seats",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": false,
      "quota": {
        "value": null,
        "overage": null,
        "version": 0
      },
      "type": "count",
      "infra_id": null,
      "measurement_unit": "quantity"
    },
    {
      "name": "pw_base_web_hosting_servers",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "web_hosting_servers",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": false,
      "quota": {
        "value": null,
        "overage": null,
        "version": 0
      },
      "type": "count",
      "infra_id": null,
      "measurement_unit": "quantity"
    },
    {
      "name": "pw_base_m365_mailboxes",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "o365_mailboxes",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": null,
      "type": "feature",
      "infra_id": null,
      "measurement_unit": "n/a"
    },
    {
      "name": "pw_base_m365_onedrive",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "o365_onedrive",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": null,
      "type": "feature",
      "infra_id": null,
      "measurement_unit": "n/a"
    },
    {
      "name": "pw_base_m365_sharepoint_sites",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "o365_sharepoint_sites",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": false,
      "quota": {
        "value": null,
        "overage": null,
        "version": 0
      },
      "type": "count",
      "infra_id": null,
      "measurement_unit": "quantity"
    },
    {
      "name": "pw_base_google_mail",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "google_mail",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": null,
      "type": "feature",
      "infra_id": null,
      "measurement_unit": "n/a"
    },
    {
      "name": "pw_base_google_drive",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "google_drive",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": null,
      "type": "feature",
      "infra_id": null,
      "measurement_unit": "n/a"
    },
    {
      "name": "pw_base_google_team_drive",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "google_team_drive",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": null,
      "type": "feature",
      "infra_id": null,
      "measurement_unit": "n/a"
    },
    {
      "name": "pw_base_m365_teams",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "o365_teams",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": false,
      "quota": {
        "value": null,
        "overage": null,
        "version": 0
      },
      "type": "count",
      "infra_id": null,
      "measurement_unit": "quantity"
    },
    {
      "name": "pw_pack_adv_backup_workstations",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "pack_adv_backup_workstations",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": false,
      "quota": {
        "value": null,
        "overage": null,
        "version": 0
      },
      "type": "count",
      "infra_id": null,
      "measurement_unit": "quantity"
    },
    {
      "name": "pw_pack_adv_backup_servers",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "pack_adv_backup_servers",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": false,
      "quota": {
        "value": null,
        "overage": null,
        "version": 0
      },
      "type": "count",
      "infra_id": null,
      "measurement_unit": "quantity"
    },
    {
      "name": "pw_pack_adv_backup_vms",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "pack_adv_backup_vms",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": false,
      "quota": {
        "value": null,
        "overage": null,
        "version": 0
      },
      "type": "count",
      "infra_id": null,
      "measurement_unit": "quantity"
    },
    {
      "name": "pw_pack_adv_backup_web_hosting_servers",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "pack_adv_backup_web_hosting_servers",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": false,
      "quota": {
        "value": null,
        "overage": null,
        "version": 0
      },
      "type": "count",
      "infra_id": null,
      "measurement_unit": "quantity"
    },
    {
      "name": "pw_pack_adv_management",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "pack_adv_management",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": false,
      "quota": {
        "value": null,
        "overage": null,
        "version": 0
      },
      "type": "count",
      "infra_id": null,
      "measurement_unit": "quantity"
    },
    {
      "name": "pw_pack_adv_security",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "pack_adv_security",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": false,
      "quota": {
        "value": null,
        "overage": null,
        "version": 0
      },
      "type": "count",
      "infra_id": null,
      "measurement_unit": "quantity"
    },
    {
      "name": "pu_base_fc_seats",
      "application_id": "dfd85a5f-a464-32ab-81fd-99bcc66a070f",
      "edition": "fss_per_user",
      "usage_name": "fc_seats",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": false,
      "quota": {
        "value": null,
        "overage": null,
        "version": 0
      },
      "type": "count",
      "infra_id": null,
      "measurement_unit": "quantity"
    },
    {
      "name": "pw_pack_adv_email_security",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "pack_adv_email_security_mailboxes",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": false,
      "quota": {
        "value": null,
        "overage": null,
        "version": 0
      },
      "type": "count",
      "infra_id": null,
      "measurement_unit": "quantity"
    },
    {
      "name": "pw_pack_adv_dlp",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "pack_adv_dlp",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-14T17:52:39Z",
      "deleted_at": null,
      "status": 1,
      "locked": false,
      "quota": {
        "value": null,
        "overage": null,
        "version": 0
      },
      "type": "count",
      "infra_id": null,
      "measurement_unit": "quantity"
    },
    {
      "name": "pw_base_storage",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "storage",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-05-04T13:24:13Z",
      "deleted_at": null,
      "status": 0,
      "locked": false,
      "type": "infra",
      "infra_id": "2284998d-5a60-4595-919b-d56faa28dd29",
      "measurement_unit": "bytes"
    },
    {
      "name": "pw_base_storage",
      "application_id": "6e6d758d-8e74-3ae3-ac84-50eb0dff12eb",
      "edition": "pck_per_workload",
      "usage_name": "storage",
      "tenant_id": "$new_tenant_id",
      "updated_at": "2022-09-23T03:44:17Z",
      "deleted_at": null,
      "status": 0,
      "locked": false,
      "type": "infra",
      "infra_id": "9b080ec7-b032-453f-aeb8-444867b24520",
      "measurement_unit": "bytes"
    }
  ]
}

"@

### First we get our token
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/x-www-form-urlencoded")
$headers.Add("Authorization", "Basic ZjkwMmE0MGYtY2FjOS00NzIyLTgyNmMtMWRiZTZlYWU0MWIwOnNqczJidmJyajI2M242bmZjbHY2eHN5bmlhZTRiMnFvamg0M2k3ZWlzbjdwa252N2RocXU=")

$body = "grant_type=client_credentials"

$basiccreds = Invoke-RestMethod "$base_url/api/2/idp/token" -Method 'POST' -Headers $headers -Body $body
$basiccreds | ConvertTo-Json -Depth 100 | Out-File "api_token.json"

$token = $basiccreds.access_token

## Now we Create a partner
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", "Bearer $token")
$headers.Add("Content-Type", "application/json")

$json = @"
{
    "name": "$new_tenant_name",
    "parent_id": "$parent_tenant_id",
    "kind": "customer"
  }
"@

$new_tenant = Invoke-RestMethod -Method Post -Uri "$base_url/api/2/tenants" -Headers $headers -Body $json
$new_tenant_id = $new_tenant.id

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", "Bearer $token")
$headers.Add("Content-Type", "application/json")

# Enable all offering items for the customer
$response = Invoke-RestMethod -Method Put -Uri "$base_url/api/2/tenants/$new_tenant_id/offering_items" -Headers $headers -Body $offering_items_json

## Create user account

$login = "$($new_tenant_short)_$($first_name)"

$json = @"

{
    "tenant_id": "$new_tenant_id",
    "login": "$login",
    "contact": {
        "email": "$email"
    }
}

"@

$new_user = Invoke-RestMethod -Method "POST" -Uri "$base_url/api/2/users" -Headers $headers -Body $json
$new_user_id = $new_user.id

##send Activation to new user

$json = @"

{}

"@

$reference = Invoke-RestMethod -Method "POST" -Uri "$base_url/api/2/users/$new_user_id/send-activation-email" -Headers $headers

