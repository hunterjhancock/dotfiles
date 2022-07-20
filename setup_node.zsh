#!/usr/bin/env zsh

echo "\n<<< Starting Node Setup >>>\n"

# Node versions are managed with 'n', which is in the Brewfile.
# See zshrc for N_PREFIX variable and addition to PATH.

if exists node; then
    echo "Node $(node --version) and npm $(npm --version) already installed"
else
    echo "Installing Node & npm with n..."
    n latest
fi

