# Code in this file is available to non-interactive
# shells, instead of only interactive shells

echo "Hello from .zshenv"

function exists() {
  # `command -v` is similar to `which`
  command -v $1 >/dev/null 2>&1
}