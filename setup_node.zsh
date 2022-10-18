#!/usr/bin/env zsh

echo "\n<<< Starting Node setup >>>\n"

# Node versions are managed with 'n', which is in the Brewfile.
# See zshrc for N_PREFIX variable and addition to $path array.

if exists node; then
    echo "Node $(node --version) and npm $(npm --version) already installed..."
else
    echo "Installing Node & npm with n..."
    n latest
fi

# Install global npm packages
## npm install --global firebase-tools
## npm install --global typescript

echo "Global npm packages installed:"
npm list --global --depth=0