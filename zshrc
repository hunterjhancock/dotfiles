# Aliases
alias ls='ls -oAhFG'

# Prompt(s)
PROMPT='%1~ %L %# '
RPROMPT='%*'

# Functions
function mkcd() {
  mkdir -p "$@" && cd "$_";
}
