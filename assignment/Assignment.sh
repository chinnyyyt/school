#!/bin/bash

# Define Variables
URL="https://www.sophos.com/en-us"
CERT_DETAILS="ssl_details.txt"
TRACKERS="trackers_found.txt"

# Fetch coontent from website to to analysed
echo "Fetching data from $URL..."
webpage=$(curl -s $URL)

# Retrieve SSL Certificate information
echo "Retrieving SSL certificate details..."
ssl_info=$(echo | openssl s_client -servername $(echo $URL | awk -F/ '{print $3}') -connect $(echo $URL | awk -F/ '{print $3}'):443 2>/dev/null | openssl x509 -noout -dates -issuer -subject)

# Save SSL information
echo -e "SSL Certificate Details:\n" > $CERT_DETAILS
echo "$ssl_info" >> $CERT_DETAILS

# Check against trackers, eg. Google, Facebook
echo "Checking for common trackers..."
trackers=$(echo "$webpage" | grep -Eo 'google-analytics.com|facebook.com/tr|adsystem.com|doubleclick.net')

# Save trackers
if [ -z "$trackers" ]; then
    echo "No trackers found." > $TRACKERS
else
    echo "Trackers found:" > $TRACKERS
    echo "$trackers" | sort | uniq >> $TRACKERS
fi

echo "Processing complete."

# Output report location
echo "SSL details saved in $CERT_DETAILS"
echo "Tracker result saved in $TRACKERS"
