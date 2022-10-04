#!/usr/bin/env zsh

echo "\n<<< Starting Rust setup >>>\n"

# Rust versions are managed with 'rustup', which is in the Brewfile.
# See zshrc for RUST_DIR variable and addition to $path array.

# The rustup-init promts (change in the "printf" command as necessary):
#  default host triple: x86_64-apple-darwin
#    default toolchain: stable
#              profile: default
# modify PATH variable: no

printf '2\n\n\n\nn\n1\n' | rustup-init