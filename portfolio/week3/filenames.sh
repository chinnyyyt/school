#!/bin/bash

# Check if the input file is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Iterate through each line of the input file
while IFS= read -r line; do
    if [ -f "$line" ]; then
        echo "That file exists"
    elif [ -d "$line" ]; then
        echo "That’s a directory"
    else
        echo "I don’t know what that is!"
    fi
done < "$1"
