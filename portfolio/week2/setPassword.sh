#!/bin/bash

# Ask the user for folder name
read -p "Enter the folder name: " folder_name

# Create the folder if it does not exist
mkdir -p "$folder_name"

# Ask the user for secret password (input will be hidden)
read -sp "Enter the secret password: " secret_password
echo # for a newline after hidden input

# Save the user's password in a file called 'secret.txt' inside the folder
echo "$secret_password" > "${folder_name}/secret.txt"

# Confirm to the user that the password has been saved
echo "The password has been saved in ${folder_name}/secret.txt"
