#!/bin/bash

echo "Updating AWS CLI version 2..."

# Check if AWS CLI v2 is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Please install it first."
    exit 1
fi

# Get current version
CURRENT_VERSION=$(aws --version | cut -d ' ' -f1 | cut -d '/' -f2)
echo "Current AWS CLI version: $CURRENT_VERSION"

# Download the latest AWS CLI v2 installer
echo "Downloading the latest AWS CLI v2 installer..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Unzip the installer
echo "Extracting installer..."
unzip -q awscliv2.zip

# Update AWS CLI
echo "Updating AWS CLI..."
sudo ./aws/install --update

# Clean up
echo "Cleaning up temporary files..."
rm -rf aws awscliv2.zip

# Verify the new version
NEW_VERSION=$(aws --version | cut -d ' ' -f1 | cut -d '/' -f2)
echo "AWS CLI updated successfully!"
echo "New version: $NEW_VERSION"

exit 0
