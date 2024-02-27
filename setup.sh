#!/bin/bash
# setup.sh: checks for required software and prepares environment

# check for awk, sed, grep
for tool in awk sed grep; do
    if ! command -v $tool &> /dev/null; then
        echo "$tool could not be found, please install it."
        exit 1
    fi
done

echo "Required software is installed. Environment is ready."

