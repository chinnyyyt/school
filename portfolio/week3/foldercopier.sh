#!/bin/bash

read -p "Type the name of the folder you would like to copy: " folderName

# If the name is a valid directory
if [ -d "$folderName" ]; then

    # Copy it to a new location
    read -p "Type the name of the destination folder: " newFolderName

    cp -r "$folderName" "$newFolderName"
    echo "Folder copied successfully to $newFolderName."

else

    # Otherwise, print an error
    echo "I couldn't find that folder."
fi
