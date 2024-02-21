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

# Activate the virtual environment
echo "Activating virtual environment..."
source "$VENV_PATH/bin/activate"

# Install Django if it's not already installed
if ! pip freeze | grep Django; then
    echo "Installing Django..."
    pip install django
else
    echo "Django is already installed."
fi

# Check if the virtual environment is 'working' by checking Django version
echo "Checking Django installation..."
DJANGO_VERSION=$(django-admin --version)
if [ -z "$DJANGO_VERSION" ]; then
    echo "Failed to verify Django installation. Is the virtual environment activated correctly?"
else
    echo "Django version $DJANGO_VERSION is installed."
fi

# Create the Django project
echo "Creating Django project named $PROJECT_NAME..."
django-admin startproject $PROJECT_NAME

echo "Django project '$PROJECT_NAME' has been created successfully."

# The script ends here assuming the user might want to perform
# more actions within the virtual environment.
# The user can manually deactivate the virtual environment by running `deactivate`.
