#!/usr/bin/env zsh

echo "\n<<< Starting GitHub SSH setup >>>\n"

FILE=/etc/resolv.conf
if test -f "$FILE"; then
    echo "$FILE exists."
fi


# Prompts go as follows:
# Location to save
# Passphrase
# Repeat passphrase
printf '\n\n\n'| ssh-keygen -t ed25519 -C "55824161+hunterjhancock@users.noreply.github.com"

