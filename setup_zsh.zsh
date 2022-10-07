#!/usr/bin/env zsh

echo "\n<<< Starting zsh setup >>>\n"

# Sets Apple-installed zsh as default non-interactive shell (might be overkill)
if sh --version | grep -q zsh; then
    echo '/private/var/select/sh already linked to /bin/zsh'
else
    echo "Enter superuser (sudo) password to symlink sh to zsh"
    sudo ln -sfv /bin/zsh /private/var/select/sh
    # Doesn't work, but I'd like to use Homebrew zsh instead of Apple zsh:
    # sudo ln -sfv /usr/local/bin/zsh /private/var/select/sh
fi

if [ $(uname -m) = 'arm64' ]; then
    # Adds the Homebrew version of zsh to the list of shells
    if grep -Fxq '/opt/homebrew/bin/zsh' '/etc/shells'; then
        echo '/opt/homebrew/bin/zsh already exists in etc/shells'
    else
        # echo "Enter superuser (sudo) password to edit /etc/shells"
        echo '/opt/homebrew/bin/zsh' | sudo tee -a '/etc/shells' >/dev/null
    fi

    # Sets Homebrew-installed zsh as default interactive shell
    if [ "$SHELL" = '/opt/homebrew/bin/zsh' ]; then
        echo '$SHELL is already /opt/homebrew/bin/zsh'
    else 
        echo "Enter user password to change login shell"
        chsh -s '/opt/homebrew/bin/zsh'
    fi
elif [ $(uname -m) = 'x86_64' ]; then
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
else
    echo "Computer architecture unsupported ($(uname -m)). Exiting zsh setup."
    exit
fi