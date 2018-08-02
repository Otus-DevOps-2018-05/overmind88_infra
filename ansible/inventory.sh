#!/bin/bash
set -e

param="$1"

if [[ $param == "--list" ]]; then
    cat inventory.json
elif [[  $param == "--host" ]]; then
    echo "{}"
else 
    echo "No param specified"
    exit 1
fi
exit 0
