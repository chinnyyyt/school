#!/bin/bash

# Function to print error messages in red
printError() {
    echo -e "\033[31mERROR:\033[0m $1"
}

# Function to get a number within a specified range
getNumber() {
    read -p "$1: "
    while (( $REPLY < $2 || $REPLY > $3 )); do
        printError "Input must be between $2 and $3"
        read -p "$1: "
    done
}

echo "Welcome to the Number Guessing Game!"
echo "Try to guess the number between 1 and 100."

# Generate a random number between 1 and 100
target=42

while true; do
    getNumber "Enter your guess" 1 100

    if (( $REPLY == $target )); then
        echo "Correct!"
        break
    elif (( $REPLY < $target )); then
        echo "Too Low!"
    else
        echo "Too High!"
    fi
done

echo "Congratulations! You found the correct number."
