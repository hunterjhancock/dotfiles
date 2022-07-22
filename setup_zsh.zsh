#!/usr/bin/env zsh

echo "\n<<< Starting zsh setup >>>\n"

# Installation unnecessary; it's in the Brewfile.

# Adds the Homebrew version of zsh to the list of shells
if grep -Fxq '/usr/local/bin/zsh' '/etc/shells'; then
    echo '/usr/local/bin/zsh already exists in etc/shells'
else
    # echo "Enter superuser (sudo) password to edit /etc/shells"
    echo '/usr/local/bin/zsh' | sudo tee -a '/etc/shells' >/dev/null
fi

# Sets Homebrew-installed zsh as default interactive shell
if [ "$SHELL" = '/usr/local/bin/zsh' ]; then
    echo '$SHELL is already /usr/local/bin/zsh'
else 
    echo "Enter user password to change login shell"
    chsh -s '/usr/local/bin/zsh'
fi

# Sets Apple-installed zsh as default non-interactive shell
# This step is overkill, honestly - might delete
if sh --version | grep -q zsh; then
    echo '/private/var/select/sh already linked to /bin/zsh'
else
    echo "Enter superuser (sudo) password to symlink sh to zsh"
    sudo ln -sfv /bin/zsh /private/var/select/sh

    # Doesn't work, but I'd like to use Homebrew zsh instead of Apple zsh:
    # sudo ln -sfv /usr/local/bin/zsh /private/var/select/sh
fi