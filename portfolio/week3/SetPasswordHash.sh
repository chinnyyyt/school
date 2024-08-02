#!/bin/bash

# Ask the user for folder name
read -p "Enter the folder name: " folder_name

# Create the folder if it does not exist
mkdir -p "$folder_name"

# Ask the user for a secret password (input will be hidden)
read -sp "Enter the secret password: " secret_password
echo # for a newline after hidden input

# Generate the SHA-256 hash of the password
password_hash=$(echo -n "$secret_password" | sha256sum | awk '{print $1}')

# Save the hashed password in a file called 'secret.txt' inside the folder
echo "$password_hash" > "${folder_name}/secret.txt"

# Confirm to the user that the password hash has been saved
echo "The hashed password has been saved in ${folder_name}/secret.txt"
