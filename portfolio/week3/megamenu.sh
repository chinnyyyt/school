#!/bin/bash

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Run the passwordCheck.sh script
./passwordCheck.sh

# Capture the exit code of the passwordCheck.sh script
exit_code=$?

# Check if the exit code is 0
if [ $exit_code -eq 0 ]; then
    while true; do
        # Display the menu
        echo -e "${GREEN}1. Create a folder${NC}"
        echo -e "${GREEN}2. Copy a folder${NC}"
        echo -e "${GREEN}3. Set a password${NC}"
        echo -e "${GREEN}4. Calculator${NC}"
        echo -e "${GREEN}5. Create Week Folders${NC}"
        echo -e "${GREEN}6. Check filenames${NC}"
        echo -e "${GREEN}7. Download a file${NC}"
        echo -e "${YELLOW}8. Exit${NC}"
        
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
            4)
                ./bashcalc.sh
                ;;
            5)
                read -p "Enter the start number: " start
                read -p "Enter the end number: " end
                
                # Call the actual folder creation script with the provided arguments
                ./megafoldermaker.sh $start $end
                ;;
            6)
                read -p "Enter the filename to check: " filename
                ./filenames.sh "$filename"
                ;;
            7)
                ./webdownloader.sh
                ;;
            8)
                echo -e "${YELLOW}Exiting...${NC}"
                exit 0
                ;;
            *)
                echo -e "${RED}Invalid choice. Please enter a number between 1 and 8.${NC}"
                ;;
        esac
    done
else
    # If the password is incorrect, exit the script
    echo -e "${RED}Access Denied${NC}"
    exit 1
fi
