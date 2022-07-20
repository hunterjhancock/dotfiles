# Variables
## export HOMEBREW_CASK_OPTS="--no-quarantine"
## ^an option for installing casks without a warning

# Aliases
alias ls='ls -oAhFG'

# Prompt(s)
PROMPT='
%1~ %L %# '
RPROMPT='%*'

# Functions
function mkcd() {
  mkdir -p "$@" && cd "$_";
}

# Locations to $PATH variable
## Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
