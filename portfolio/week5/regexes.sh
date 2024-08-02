#!/bin/bash

# Search for all sed statements
grep -r 'sed ' . 

# Search for all lines that start with the letter m
grep -r '^m' .

# Search for all lines that contain three digit numbers
grep -r '[0-9][0-9][0-9]' .

# Search for all echo statements with at least three words
grep -r 'echo "[^"]* [^"]* [^"]*"' .

# Search for all lines that would make a good password
# Example criteria: at least 12 characters, mix of uppercase, lowercase, digits, and special characters
grep -rE '^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[\W_]).{12,}$' .
