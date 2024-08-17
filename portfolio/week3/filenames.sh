#!/bin/bash

# Check if the input file "filenames.txt" exists.
if [ ! -f "filenames.txt" ]; then
    echo "The file 'filenames.txt' does not exist."
    exit 1
fi

# Read each line from the file "filenames.txt".
while IFS= read -r line; do
    # Check if the line is a valid filename (file exists).
    if [ -f "$line" ]; then
        echo "That file exists."
    # Check if the line is a directory name (directory exists).
    elif [ -d "$line" ]; then
        echo "That’s a directory."
    # If neither, print an unknown type message.
    else
        echo "I don’t know what that is!"
    fi
done < "filenames.txt"
