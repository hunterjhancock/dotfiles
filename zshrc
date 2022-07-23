echo "Sourced .zshrc"

# Git info for prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%b '

# Variables
export HOMEBREW_CASK_OPTS="--no-quarantine"
export N_PREFIX="$HOME/.n"
export PREFIX="$N_PREFIX"

# Aliases
alias ls='ls -oAhFG'
alias bbd='brew bundle dump --force --describe --file=~/.dotfiles/Brewfile;echo "Updated Brewfile"'
alias trail='<<<${(F)path}'
alias sa='source ~/.zshrc'

# Prompt(s)
PROMPT='
%* %F{white}%L%f %F{cyan}%2~%f %F{red}${vcs_info_msg_0_}%f$ '
RPROMPT=''

# Locations to $path array
typeset -U path

path=(
  "$N_PREFIX/bin"
  "/usr/local/opt/curl/bin"
  $path
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
)