#!/bin/bash

while true; do
    # Prompt the user to type a website URL or "exit" to quit
    read -p "Please type a full URL to download (including the filename) or type 'exit' to quit: " url

    # Check if the user wants to exit
    if [ "$url" == "exit" ]; then
        echo "Exiting..."
        break
    fi

    # Prompt the user to type a download location
    read -p "Please type the download location: " location

    # Ensure the download location is a valid directory
    if [ ! -d "$location" ]; then
        echo "Error: The specified location is not a valid directory."
        continue
    fi

    # Use wget to download the file to the specified location
    wget -P "$location" "$url"
    
    echo "Download complete!"
done
