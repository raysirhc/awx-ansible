#skip cert check
[System.Net.ServicePointManager]::ServerCertificateValidationCallback = { $true }

#powershell code

$URL = "https://fqdn/api/integrations/123513t1313"
$JSON_FILE = "C:\Users\yaryu\data.json"

$Body = Get-Content -Raw -Path $JSON_FILE
$Headers = @{ 
"Content-Type" = "application/json"
"YYX" = "YYXAPI" 
}

Invoke-RestMethod -Uri $URL -Method Post -Headers $Headers -Body $Body

#return cert check
[System.Net.ServicePointManager]::ServerCertificateValidationCallback = $null
