#!/usr/bin/env zsh

echo "\n<<< Starting Homebrew setup >>>\n"

if exists brew; then
    echo "brew exists, updating homebrew..."
    brew update
    brew upgrade
else
    echo "brew doesn't exist, continuing install..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew bundle --verbose