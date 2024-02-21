#!/bin/bash

# Update the package list
echo "Updating package list..."
sudo apt update

# Check and install pip for Python 3 if not installed
if ! command -v pip3 &> /dev/null; then
    echo "Installing pip for Python 3..."
    sudo apt install -y python3-pip
else
    echo "pip for Python 3 is already installed."
fi

# Check and install virtualenv using apt to avoid externally-managed-environment issue
if ! command -v virtualenv &> /dev/null; then
    echo "Installing virtualenv..."
    sudo apt install -y virtualenv
else
    echo "virtualenv is already installed."
fi

# Verify the installations
echo "Verifying the installations..."
pip3 --version
virtualenv --version

echo "pip and virtualenv installation completed."
