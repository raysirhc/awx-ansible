$URL = "https://fqdn/api/integrations/eafqfq2g232g3f"
$Directory = "C:\Users\"  # Directory to monitor
$Headers = @{
    "Content-Type" = "application/json"
    "YYX" = "YYXAPI"
}

# Function to process JSON files
function Process-JsonFile {
    param($JsonFile)

    # Read the content of the JSON file
    $Body = Get-Content -Raw -Path $JsonFile

    # Disable SSL certificate validation temporarily
    [System.Net.ServicePointManager]::ServerCertificateValidationCallback = { $true }

    # Send POST request
    Invoke-RestMethod -Uri $URL -Method Post -Headers $Headers -Body $Body

    # Re-enable SSL certificate validation
    [System.Net.ServicePointManager]::ServerCertificateValidationCallback = $null

    # Optionally, move or delete the file after processing
    Move-Item $JsonFile -Destination C:\Users\archive -Force
}

# Loop to monitor the directory
while ($true) {
    # Get all JSON files that match the naming convention
    $PendingFiles = Get-ChildItem -Path $Directory -Filter "data_*.json"

    foreach ($File in $PendingFiles) {
        # Process the JSON file
        Process-JsonFile $File.FullName
    }

    # Wait for a few seconds before checking again
    Start-Sleep -Seconds 20
}
