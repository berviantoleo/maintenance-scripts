#!/bin/bash

echo "Updating AWS CLI version 1..."

# Check if pip is installed
if ! command -v pip &> /dev/null; then
    echo "pip is not installed. Please install pip first."
    exit 1
fi

# Check if AWS CLI v1 is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Please install it first."
    exit 1
fi

# Get current version
CURRENT_VERSION=$(aws --version | cut -d ' ' -f1 | cut -d '/' -f2)
echo "Current AWS CLI version: $CURRENT_VERSION"

# Update AWS CLI using pip
echo "Updating AWS CLI..."
pip install --upgrade --user awscli

# Verify the new version
NEW_VERSION=$(aws --version | cut -d ' ' -f1 | cut -d '/' -f2)
echo "AWS CLI updated successfully!"
echo "New version: $NEW_VERSION"

exit 0
