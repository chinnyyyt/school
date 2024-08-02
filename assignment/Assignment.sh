#!/bin/bash

# URL to fetch
url="https://www.cisco.com/c/en/us/products/security/what-is-cybersecurity.html#:~:text=Cybersecurity%20is%20the%20practice%20of,or%20interrupting%20normal%20business%20processes."

# Fetch the HTML content
html=$(curl -s "$url")

# Extract meta tags using grep
meta_tags=$(echo "$html" | grep -o '<meta [^>]*>')

# Print the extracted meta tags
echo "Meta tags found:"
echo "$meta_tags"
