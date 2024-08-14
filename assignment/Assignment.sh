#!/bin/bash

# Define the CVE API endpoint
API_URL="https://cve.circl.lu/api/last"

# Fetch the latest CVE data
echo "Fetching the latest CVE data from $API_URL..."
response=$(curl -s $API_URL)

# Check if the response is empty
if [ -z "$response" ]; then
    echo "Error: No data received from the API."
    exit 1
fi

# Process the JSON data using jq
echo "Processing data..."
cve_data=$(echo "$response" | jq -r '.[] | "\(.id) | \(.summary) | \(.published)"')

# Check if jq processed the data successfully
if [ -z "$cve_data" ]; then
    echo "Error: Failed to process data."
    exit 1
fi

# Output the data in a formatted table
echo -e "CVE ID | Summary | Published Date"
echo "-----------------------------------------"
echo "$cve_data" | awk -F '|' '{printf "%-15s | %-50s | %s\n", $1, $2, $3}'

# Calculate statistics
total_cves=$(echo "$cve_data" | wc -l)
echo "-----------------------------------------"
echo "Total CVEs: $total_cves"

# Save the output to a CSV file for further analysis
output_file="cve_data.csv"
echo "CVE ID,Summary,Published Date" > $output_file
echo "$cve_data" | tr '|' ',' >> $output_file
echo "Data saved to $output_file"

# Optional: Generate a basic report
echo "Generating report..."
echo "Latest CVE Report" > cve_report.txt
echo "Generated on: $(date)" >> cve_report.txt
echo "Total CVEs: $total_cves" >> cve_report.txt
echo "-----------------------------------------" >> cve_report.txt
echo "$cve_data" >> cve_report.txt

echo "Report saved to cve_report.txt"

echo "Script completed successfully."
