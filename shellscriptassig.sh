#!/bin/bash

# Function to validate input against given options
validate_input() {
    local input="$1"
    local options="$2"
    for option in $options; do
        if [ "$input" == "$option" ]; then
            return 0  # Input is valid
        fi
    done
    return 1  # Input is invalid
}

# Prompt user for input values
read -p "Enter Component Name:" component
validate_input "$component" "INGESTOR JOINER WRANGLER VALIDATOR" || { echo "Invalid input!"; exit 1; }

read -p "Enter Scale:" scale
validate_input "$scale" "MID HIGH LOW" || { echo "Invalid input!"; exit 1; }

read -p "Enter View:" view
validate_input "$view" "Auction Bid" || { echo "Invalid input!"; exit 1; }

read -p "Enter Count:" count
if ! [[ "$count" =~ ^[0-9]$ ]]; then
    echo "Invalid input! Count must be a single digit number."
    exit 1
fi
# Determine the appropriate view string
if [ "$view" == "Auction" ]; then
    view_string="vdopiasample"
elif [ "$view" == "Bid" ]; then
    view_string="vdopiasample-bid"
else
    echo "Invalid input! View must be either 'Auction' or 'Bid'."
    exit 1
fi

line_to_replace="$view_string ; $scale ; $component ; ETL ; vdopia-etl= $count"

# Use sed to replace the line in the file
sed -i "s/^.*ETL ; vdopia-etl=.*$/$line_to_replace/" sig.conf

echo "Line in sig.conf has been updated:"
echo "$line_to_replace"
