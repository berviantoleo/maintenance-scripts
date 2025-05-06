# System Maintenance Scripts

This directory contains scripts for various system maintenance tasks, primarily focused on package manager cache cleanup and AWS CLI updates.

## Available Scripts

### Package Manager Cache Cleanup

**Script:** `clear-package-caches.sh`

This script cleans the caches for multiple package managers:
- npm: Clears the npm cache using `npm cache clean --force`
- apt: Cleans the apt cache using `sudo apt-get clean`
- NuGet: Clears NuGet caches using either `nuget locals all -clear` or `dotnet nuget locals all --clear`
- pip: Purges the pip cache using `pip cache purge` or `pip3 cache purge`

The script checks for the presence of each package manager before attempting to clear its cache, so it's safe to run even if some package managers aren't installed.

**Usage:**
```bash
./clear-package-caches.sh
```

### AWS CLI Update Scripts

#### AWS CLI Version 2 Update

**Script:** `update-aws-cli-v2.sh`

Updates AWS CLI version 2 (recommended version) by:
1. Downloading the latest installer from AWS
2. Extracting and running the update process
3. Cleaning up temporary files
4. Displaying the old and new versions

**Usage:**
```bash
./update-aws-cli-v2.sh
```

#### AWS CLI Version 1 Update

**Script:** `update-aws-cli-v1.sh`

Updates AWS CLI version 1 using pip by:
1. Checking if pip is installed
2. Using pip to update the AWS CLI package
3. Displaying the old and new versions

**Usage:**
```bash
./update-aws-cli-v1.sh
```

## General Notes

- All scripts include checks to verify prerequisites before performing operations
- Scripts will display informative messages about what they're doing
- Most scripts require an internet connection to download updates
- The apt cache clearing requires sudo privileges, so you may be prompted for your password
