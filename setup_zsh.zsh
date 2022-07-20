#!/usr/bin/env zsh

echo "\n<<< Starting ZSH Setup >>>\n"

# Installation unnecessary; it's in the Brewfile.

if grep -Fxq '/usr/local/bin/zsh' '/etc/shells'; then
    echo '/usr/local/bin/zsh already exists in etc/shells'
else
    # echo "Enter superuser (sudo) password to edit /etc/shells"
    echo '/usr/local/bin/zsh' | sudo tee -a '/etc/shells' >/dev/null
fi

if [ "$SHELL" = '/usr/local/bin/zsh' ]; then
    echo '$SHELL is already /usr/local/bin/zsh'
else 
    echo "Enter user password to change login shell"
    chsh -s '/usr/local/bin/zsh'
fi

# This step is overkill, honestly - might delete
if sh --version | grep -q zsh; then
    echo '/private/var/select/sh already linked to /bin/zsh'
else
    echo "Enter superuser (sudo) password to symlink sh to zsh"
    sudo ln -sfv /bin/zsh /private/var/select/sh

    # I'd like to run this command instead, which uses Homebrew zsh
    # instead of the Apple default installation of zsh:
    # sudo ln -sfv /usr/local/bin/zsh /private/var/select/sh
fi