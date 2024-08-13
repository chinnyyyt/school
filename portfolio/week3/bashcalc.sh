#!/bin/bash

# Function to display the menu
show_menu() {
    echo "Simple Calculator"
    echo "Select operation:"
    echo "1) Addition"
    echo "2) Subtraction"
    echo "3) Multiplication"
    echo "4) Division"
    echo "5) Exit"
    read -p "Enter your choice: " choice
}

# Function to perform the calculation
calculate() {
    read -p "Enter first number: " num1
    read -p "Enter second number: " num2

    case $choice in
        1)
            result=$((num1 + num2))
            echo -e "\e[34mAddition Result: $result\e[0m"
            ;;
        2)
            result=$((num1 - num2))
            echo -e "\e[32mSubtraction Result: $result\e[0m"
            ;;
        3)
            result=$((num1 * num2))
            echo -e "\e[31mMultiplication Result: $result\e[0m"
            ;;
        4)
            if [ $num2 -ne 0 ]; then
                result=$((num1 / num2))
                echo -e "\e[35mDivision Result: $result\e[0m"
            else
                echo -e "\e[35mError: Division by zero is not allowed.\e[0m"
            fi
            ;;
        *)
            echo "Invalid choice."
            ;;
    esac
}

while true; do
    show_menu
    if [ "$choice" -eq 5 ]; then
        echo "Exiting..."
        break
    fi
    calculate
done
