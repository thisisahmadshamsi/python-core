#!/bin/bash

# Check if Python version was passed as a parameter
if [ -z "$1" ]; then
    echo "Usage: $0 <python-version>"
    echo "Example: $0 3.11"
    exit 1
fi

PYTHON_VERSION=$1

# Update the package list
echo "Updating package list..."
sudo apt update

# Install prerequisites
echo "Installing prerequisites..."
sudo apt install -y software-properties-common

# Add the deadsnakes PPA
echo "Adding deadsnakes PPA..."
sudo add-apt-repository -y ppa:deadsnakes/ppa

# Update the package list after adding new PPA
echo "Updating package list again..."
sudo apt update

# Install specified Python version
echo "Installing Python $PYTHON_VERSION..."
sudo apt install -y python$PYTHON_VERSION

# Install pip for specified Python version
echo "Installing pip for Python $PYTHON_VERSION..."
sudo apt install -y python$PYTHON_VERSION-venv python$PYTHON_VERSION-distutils
python$PYTHON_VERSION -m ensurepip

# Optional: Set specified Python version as the default Python version
read -p "Do you want to set Python $PYTHON_VERSION as the default 'python' command? [y/N]: " answer
case ${answer:0:1} in
    y|Y )
        echo "Setting up Python $PYTHON_VERSION as the default 'python' command..."
        sudo update-alternatives --install /usr/bin/python python /usr/bin/python$PYTHON_VERSION 1
        echo "Select the default Python version by following the on-screen instructions..."
        sudo update-alternatives --config python
    ;;
    * )
        echo "Skipping setting Python $PYTHON_VERSION as the default 'python' command."
    ;;
esac

# Verify the installation
echo "Verifying the Python and pip installation..."
python --version
pip --version

echo "Python $PYTHON_VERSION and pip installation completed."

# Added section: Change Python version
echo "Available Python versions:"
sudo update-alternatives --list python
read -p "Do you want to change the current Python version? [y/N]: " change_version
if [[ ${change_version:0:1} =~ [yY] ]]; then
    echo "Select the Python version by following the on-screen instructions..."
    sudo update-alternatives --config python
    echo "Updated Python version:"
    python --version
else
    echo "No changes made to the Python version."
fi
