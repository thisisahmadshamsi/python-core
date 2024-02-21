#!/bin/bash

# Check if a project name was provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <project_name>"
    exit 1
fi

PROJECT_NAME=$1
VENV_PATH="/home/$USER/virtualenv/$PROJECT_NAME"

# Check if the virtual environment already exists
if [ ! -d "$VENV_PATH" ]; then
    echo "Virtual environment does not exist. Creating one..."
    virtualenv "$VENV_PATH"
else
    echo "Virtual environment already exists. Using the existing one..."
fi
