#!/bin/bash

# Ask the user to type a secret password (input will be hidden)
read -sp "Enter the secret password: " input_password
echo # for a newline after hidden input

# Generate the SHA-256 hash of the input password
input_hash=$(echo -n "$input_password" | sha256sum | awk '{print $1}')

# Read the stored hash from secret.txt
stored_hash=$(cat secret.txt | tr -d ' \n')

# Check if the input hash matches the stored hash
if [ "$input_hash" == "$stored_hash" ]; then
    echo "Access Granted"
    exit 0
else
    echo "Access Denied"
    exit 1
fi
