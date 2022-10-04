#!/usr/bin/env zsh

echo "\n<<< Starting Python setup >>>\n"

# Python versions are managed with 'pipenv', which is in the Brewfile.
# See zshrc for PYENV_ROOT variable and addition to $path array.

if exists python3; then
    echo "brew exists, skipping install"
else
    echo "brew doesn't exist, continuing install"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi