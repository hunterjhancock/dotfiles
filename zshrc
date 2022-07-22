echo "Hello from .zshrc"

# Variables
export HOMEBREW_CASK_OPTS="--no-quarantine"
export N_PREFIX="$HOME/.n"
export PREFIX="$N_PREFIX"

# Aliases
alias ls='ls -oAhFG'
alias bbd='brew bundle dump --force --describe --file=~/.dotfiles/Brewfile'
alias trail='<<<${(F)path}'

# Prompt(s)
PROMPT='
%1~ %L %# '
RPROMPT='%*'

# Functions
function mkcd() {
  mkdir -p "$@" && cd "$_";
}

# Locations to $path array
typeset -U path

path=(
  "$N_PREFIX/bin"
  "/usr/local/opt/curl/bin"
  $path
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
)