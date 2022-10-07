#!/usr/bin/env zsh

echo "\n<<< Starting GitHub SSH setup >>>\n"

# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/checking-for-existing-ssh-keys

# Make sure this runs in the home directory

# Lists the files in your .ssh directory, if they exist
# id_ed25519.pub is needed
# Tip: If you receive an error that ~/.ssh doesn't exist, you do not have an existing SSH key pair in the default location. You can create a new SSH key pair in the next step.
ls -al ~/.ssh

printf '\n\n\n'| ssh-keygen -t ed25519 -C "55824161+hunterjhancock@users.noreply.github.com"

eval "$(ssh-agent -s)"

if [ ! -f ~/.ssh/config ]; then
    touch ~/.ssh/config
fi

echo "Host *\n"
echo "  AddKeysToAgent yes\n"
echo "  IdentityFile ~/.ssh/id_ed25519\n"

ssh-add ~/.ssh/id_ed25519

# Copies in order to paste on GitHub.com, can't automate further
pbcopy < ~/.ssh/id_ed25519.pub

# To check if everything works
ssh -T git@github.com