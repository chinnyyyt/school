#!/bin/bash

# Run the passwordCheck.sh script
./passwordCheck.sh

# Capture the exit code of the passwordCheck.sh script
exit_code=$?

# Check if the exit code is 0
if [ $exit_code -eq 0 ]; then
    # If the password is correct, display the menu
    echo "1. Create a folder"
    echo "2. Copy a folder"
    echo "3. Set a password"
    
    # Get the user's choice
    read -p "Please enter your choice: " choice

    # Use a case statement to run the corresponding script
    case $choice in
        1)
            ./foldermaker.sh
            ;;
        2)
            ./foldercopier.sh
            ;;
        3)
            ./setPassword.sh
            ;;
        *)
            echo "Invalid choice. Please enter 1, 2, or 3."
            exit 1
            ;;
    esac
else
    # If the password is incorrect, exit the script
    echo "Access Denied"
    exit 1
fi
