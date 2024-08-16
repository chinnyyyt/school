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

# Extract CVE ID, Summary, and Published Date using grep, awk, and sed
echo "Processing data..."
cve_data=$(echo "$response" | grep -E '"id":|"summary":|"Published":' | sed 's/[",]//g' | awk -F':' '
    /id/ {id=$2}
    /summary/ {summary=$2}
    /Published/ {
        published=$2;
        print id "|" summary "|" published
    }'
)

# Check if data was processed
if [ -z "$cve_data" ]; then
    echo "Error: Failed to process data."
    exit 1
fi

# Create the table
table_width=120

# Output the data in a formatted table with aligned columns
printf "%-${table_width}s\n" | tr ' ' '-'
printf "| %-15s | %-80s | %-15s |\n" "CVE ID" "Summary" "Published Date"
printf "%-${table_width}s\n" | tr ' ' '-'

# Loop through each CVE and print in table format
echo "$cve_data" | while IFS="|" read -r id summary published; do
    printf "| %-15s | %-80s | %-15s |\n" "$id" "$(echo "$summary" | cut -c1-80)" "$published"
done

# Add the closing line for the table
printf "%-${table_width}s\n" | tr ' ' '-'

# Calculate statistics
total_cves=$(echo "$cve_data" | wc -l)

# Display the total in the table format
printf "| %-15s | %-80s | %-15s |\n" "Total CVEs:" "$total_cves" ""
printf "%-${table_width}s\n" | tr ' ' '-'

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
