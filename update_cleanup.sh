#!/bin/bash

echo "Starting system update and cleanup process..."

# 1. Update package lists
echo "--- Running apt update ---"
sudo apt update

# 2. Upgrade all installed packages
echo "--- Running apt upgrade ---"
sudo apt upgrade -y

# 3. Remove unnecessary packages
echo "--- Running apt autoremove ---"
sudo apt autoremove -y

# 4. Clean up downloaded package archives
echo "--- Running apt clean ---"
sudo apt clean

echo "System maintenance complete."
