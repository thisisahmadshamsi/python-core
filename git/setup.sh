#!/bin/bash

# Check if Git name and email were provided as parameters
if [ $# -lt 2 ]; then
    echo "Usage: $0 \"Git Name\" \"Git Email\""
    exit 1
fi

GIT_NAME="$1"
GIT_EMAIL="$2"

# Update and install Git
echo "Updating package lists..."
sudo apt update
echo "Installing Git..."
sudo apt install git -y

# Configure Git with provided name and email
echo "Configuring Git..."
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"

# Instructions for generating and adding SSH keys are commented out.
# Uncomment them if needed, and remember to replace the email placeholder.
# echo "Generating SSH keys..."
# ssh-keygen -t rsa -b 4096 -C "$GIT_EMAIL"
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_rsa
# echo "SSH key generated. Please add the public key to your Git hosting service."

echo "Git installation and basic setup completed with the provided user information."

# Placeholder for repository setup (replace with your actual repository URL)
# REPO_URL="your_repository_url"
# PROJECT_DIR="myproject"

# Uncomment and modify below to initialize a new repository and push an initial commit
# echo "Setting up a new project directory..."
# mkdir "$PROJECT_DIR"
# cd "$PROJECT_DIR"
# git init
# git remote add origin "$REPO_URL"
# echo "Hello World" > README.md
# git add README.md
# git commit -m "Initial commit"
# git push -u origin master

echo "Remember to add your repository URL and project directory."
echo "Uncomment the repository setup commands to automatically set up and push to a new repository."
