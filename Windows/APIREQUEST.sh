#!/bin/bash

# Define variables
URL="https://FQDN/api/integrations/1zk3sl1236efe39i"
  # Replace with your API endpoint
JSON_FILE="/home/userfolder/data.json"  # Path to your JSON file

# Send the API request
curl -X POST "$URL" \
     -H "Content-Type: application/json" \
     -H "VALUE: KEY" \
     -d @"$JSON_FILE"
# Where JSON_FILE = format as below
# {
#  "key1": "value1",
#  "key2": "value2"
# }
