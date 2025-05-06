#!/bin/bash

# Script to clear caches for multiple package managers
# Includes: npm, apt, NuGet, and pip

echo "===== Package Manager Cache Cleaner ====="
echo "This script will clear caches for npm, apt, NuGet, and pip"
echo ""

# Function to check if a command exists
command_exists() {
  command -v "$1" &> /dev/null
}

# Clear npm cache
echo "Checking for npm..."
if command_exists npm; then
  echo "Clearing npm cache..."
  npm cache clean --force
  echo "npm cache cleared successfully!"
else
  echo "npm not found. Skipping npm cache cleanup."
fi
echo ""

# Clear apt cache
echo "Checking for apt..."
if command_exists apt-get; then
  echo "Clearing apt cache..."
  sudo apt-get clean
  echo "apt cache cleared successfully!"
else
  echo "apt-get not found. Skipping apt cache cleanup."
fi
echo ""

# Clear NuGet cache
echo "Checking for NuGet..."
if command_exists nuget || command_exists dotnet; then
  echo "Clearing NuGet cache..."
  
  # Check for traditional nuget command
  if command_exists nuget; then
    nuget locals all -clear
  # Check for dotnet CLI (which can also manage NuGet)
  elif command_exists dotnet; then
    dotnet nuget locals all --clear
  fi
  
  echo "NuGet cache cleared successfully!"
else
  echo "NuGet/dotnet not found. Skipping NuGet cache cleanup."
fi
echo ""

# Clear pip cache
echo "Checking for pip..."
if command_exists pip || command_exists pip3; then
  echo "Clearing pip cache..."
  
  # Try pip first
  if command_exists pip; then
    pip cache purge
  # Fall back to pip3
  elif command_exists pip3; then
    pip3 cache purge
  fi
  
  echo "pip cache cleared successfully!"
else
  echo "pip/pip3 not found. Skipping pip cache cleanup."
fi
echo ""

echo "===== Cache cleanup completed! ====="
