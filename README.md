# Hunter's dotfiles

Warning: This is still a work in progess. Use at your own risk!

My personal dotfiles for macOS, inspired by this course: 
[Dotfiles from Start to Finish-ish](https://www.udemy.com/share/1043Ta3@fWYLq4xuDOzVCe1n-FaqtWDKj3GC3nhuomzNqQF4nzT-7OwA669olDFasO7t_S53Tw==/) by Patrick McDonald

[Skip to installation](#Installation).

## How it works

This repository is dependent on [Xcode Command Line Tools](https://developer.apple.com/library/archive/technotes/tn2339/_index.html#//apple_ref/doc/uid/DTS40014588-CH1-WHAT_IS_THE_COMMAND_LINE_TOOLS_PACKAGE_). Installing it gives us access to a bunch of tools (like [git](https://git-scm.com)) that are needed to access & run our [install](install) scripts.

After installing the [Xcode Command Line Tools](https://developer.apple.com/library/archive/technotes/tn2339/_index.html#//apple_ref/doc/uid/DTS40014588-CH1-WHAT_IS_THE_COMMAND_LINE_TOOLS_PACKAGE_) and cloning this repository to your local machine (specifically in `~/.dotfiles`), the [install](install) script does the following things:

- Tells [Dotbot](https://github.com/anishathalye/dotbot) to set up dotfile symlinks in the home directory defined in the `link` section of [install.conf.yaml](install.conf.yaml)
- Tells [Dotbot](https://github.com/anishathalye/dotbot) to create any directories defined in the `create` section of [install.conf.yaml](install.conf.yaml)
- Tells [Dotbot](https://github.com/anishathalye/dotbot) to run the [setup_homebrew.zsh](setup_homebrew.zsh) script
    - Installs [Homebrew](https://brew.sh)
    - Tells [Homebrew](https://brew.sh) to install the software in [Brewfile](Brewfile)
    - Note: This script tells [Homebrew](https://brew.sh) to use [mas-cli](https://github.com/mas-cli/mas) to install apps from the Mac App Store. Be sure the `mas "Software Name", id: 12345` commands in [Brewfile](Brewfile) only include software that you have purchased or installed before with your Apple ID.
- Tells [Dotbot](https://github.com/anishathalye/dotbot) to run the [setup_zsh.zsh](setup_zsh.zsh) script
    - Adds the [Homebrew](https://brew.sh) version of [zsh](https://zsh.sourceforge.io) to the list of available shells
    - Sets the [Homebrew](https://brew.sh) version of [zsh](https://zsh.sourceforge.io) as the default interactive shell (over the Apple version)
    - Sets the Apple version of [zsh](https://zsh.sourceforge.io) as the default non-interactive shell (over [bash](https://www.gnu.org/software/bash/)), which may be unnecessary...
- Tells [Dotbot](https://github.com/anishathalye/dotbot) to run the [setup_node.zsh](setup_node.zsh) script
    - Tells [n](https://github.com/tj/n) (a version manager for [Node.js](https://nodejs.org/en/)) to install the latest versions of [Node.js](https://nodejs.org/en/) and [npm](https://www.npmjs.com)
    - Tells [npm](https://www.npmjs.com) to install any packages listed in [setup_node.zsh](setup_node.zsh)

## Installation

1. Run `xcode-select --install` in terminal to install Xcode Command Line Tools (may take a while)
2. Clone and enter the repo `git clone https://github.com/hunterjhancock/dotfiles.git ~/.dotfiles && cd ~/.dotfiles`
3. If necessary, cut a new git branch: `git checkout new_branch_name`
4. Verify that [Brewfile](Brewfile) includes the exact software you want [Homebrew](https://brew.sh) to install
5. Verify that [setup_node.zsh](setup_node.zsh) includes the exact [npm](https://www.npmjs.com) packages you want to install
6. Run [`./install`](install)
5. GitHub SSH

## Usage

## File Structure ELI5

- `dotbot/`: 
- `.gitignore`:
- `.gitmodules`:
- `Brewfile`:
- `gitconfig`
- 

## TODO
- Automate macOS system preferences
- Automate sign-in to apps after installing
- Automate app preferences after installing
    - VS Code settings sync

## Useful Commands
- `brew bundle dump --force --describe`
- `source .zshrc`

## Aliases
- ls
- bbd
- trail

## List of software
- 

## Resources
[zsh documentation](https://zsh.sourceforge.io)
[Homebrew](https://brew.sh)
[Dotbot](https://github.com/anishathalye/dotbot)