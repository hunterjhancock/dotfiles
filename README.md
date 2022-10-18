# Hunter's MacOS dotfiles

> **Warning** Still a work in progess. Use at your own risk!

My personal dotfiles for macOS, inspired by:

- [Patrick McDonald's dotfiles](https://github.com/eieioxyz/dotfiles_macos) (check out his Udemy course: ["Dotfiles from Start to Finish-ish"](https://www.udemy.com/share/1043Ta3@fWYLq4xuDOzVCe1n-FaqtWDKj3GC3nhuomzNqQF4nzT-7OwA669olDFasO7t_S53Tw==/))
- [Takuya Matsuyama's dotfiles](https://github.com/craftzdog/dotfiles-public)
- [Mathias Bynen's dotfiles](https://github.com/mathiasbynens/dotfiles)

## How it works

This repository depends on [Xcode Command Line Tools](https://developer.apple.com/library/archive/technotes/tn2339/_index.html#//apple_ref/doc/uid/DTS40014588-CH1-WHAT_IS_THE_COMMAND_LINE_TOOLS_PACKAGE_). It gives us a bunch of tools (like [git](https://git-scm.com)) that are needed to access & run our [`install`](install) script.

After installing Xcode Command Line Tools and cloning this repository to your local machine, the [`install`](install) script tells [Dotbot](https://github.com/anishathalye/dotbot) to run according to the configuration in [`install.conf.yaml`](install.conf.yaml):

- [Dotbot](https://github.com/anishathalye/dotbot) sets up dotfile symlinks as defined in the `link` section of [`install.conf.yaml`](install.conf.yaml)
- [Dotbot](https://github.com/anishathalye/dotbot) creates directories as defined in the `create` section of [`install.conf.yaml`](install.conf.yaml)
- [Dotbot](https://github.com/anishathalye/dotbot) runs the [`setup_homebrew.zsh`](setup_homebrew.zsh) script
  - Installs [Homebrew](https://brew.sh)
  - Tells [Homebrew](https://brew.sh) to install the software in [`Brewfile`](Brewfile)
  - Note: This script tells [Homebrew](https://brew.sh) to use [mas-cli](https://github.com/mas-cli/mas) to install apps from the Mac App Store. Be sure the `mas` commands (e.g. `mas "Software Name", id: 12345`) in [`Brewfile`](Brewfile) only include software that you have purchased or installed before with your Apple ID.
- [Dotbot](https://github.com/anishathalye/dotbot) runs the [`setup_zsh.zsh`](setup_zsh.zsh) script
  - Adds the [Homebrew](https://brew.sh) version of [zsh](https://zsh.sourceforge.io) to the list of available shells
  - Sets the [Homebrew](https://brew.sh) version of [zsh](https://zsh.sourceforge.io) as the default **_interactive_** shell (instead of the Apple default version)
  - Sets the Apple default version of [zsh](https://zsh.sourceforge.io) as the default **_non-interactive_** shell (instead of [bash](https://www.gnu.org/software/bash/))
- [Dotbot](https://github.com/anishathalye/dotbot) runs the [`setup_node.zsh`](setup_node.zsh) script
  - Tells [n](https://github.com/tj/n) (a version manager for [Node.js](https://nodejs.org/en/)) to install the latest versions of [Node.js](https://nodejs.org/en/) and [npm](https://www.npmjs.com)
  - Tells [npm](https://www.npmjs.com) to install any packages listed in [`setup_node.zsh`](setup_node.zsh)

## File structure explained

| Name                                            | Description                                                                                                               |
| ----------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| [`dotbot/`](dotbot/)                            | [Dotbot](https://github.com/anishathalye/dotbot) submodule                                                                |
| [`Brewfile`](Brewfile)                          | [Homebrew](https://brew.sh) install configuration                                                                         |
| [`gitconfig`](gitconfig)                        | git config (symlink to `~/.gitconfig` by Dotbot)                                                                          |
| [`install`](install)                            | primary install script; runs Dotbot according to appropriate `.yaml` config                                               |
| [`install.conf.arm64.yaml`](install.conf.yaml)  | Dotbot install configuration for Apple Silicon machines                                                                   |
| [`install.conf.x86_64.yaml`](install.conf.yaml) | Dotbot install configuration for Intel machines                                                                           |
| [`setup_homebrew.zsh`](setup_homebrew.zsh)      | Dotbot script; installs Homebrew                                                                                          |
| [`setup_node.zsh`](setup_node.zsh)              | Dotbot script; installs [Node.js](https://nodejs.org/en/) & [npm](https://www.npmjs.com) via [n](https://github.com/tj/n) |
| [`setup_zsh.zsh`](setup_zsh.zsh)                | Dotbot script; installs [zsh](https://zsh.sourceforge.io) and sets it as the default shell                                |
| [`zprofile_arm64`](zshrc)                       | Apple Silicon zsh config (symlink to `~/.zprofile` by Dotbot)                                                             |
| [`zshenv_arm64`](zshenv)                        | Apple Silicon zsh config (symlink to `~/.zshenv` by Dotbot)                                                               |
| [`zshrc_arm64`](zshrc)                          | Apple Silicon zsh config (symlink to `~/.zshrc` by Dotbot)                                                                |
| [`zprofile_x86_64`](zshrc)                      | Intel zsh config (symlink to `~/.zprofile` by Dotbot)                                                                     |
| [`zshenv_x86_64`](zshenv)                       | Intel zsh config (symlink to `~/.zshenv` by Dotbot)                                                                       |
| [`zshrc_x86_64`](zshrc)                         | Intel zsh config (symlink to `~/.zshrc` by Dotbot)                                                                        |

## Installation

> **Note** These steps assume a clean install of macOS. I haven't yet considered the potential conflict between directly installed apps & packages and those that will be installed by this repo.

To-do: need to add GitHub SSH authentication stuff here...

Open up your [terminal](https://support.apple.com/guide/terminal/open-or-quit-terminal-apd5265185d-f365-44cb-8b09-71a064a42125/mac) and follow these steps:

1. Run `xcode-select --install` in terminal to install [Xcode Command Line Tools](https://developer.apple.com/library/archive/technotes/tn2339/_index.html#//apple_ref/doc/uid/DTS40014588-CH1-WHAT_IS_THE_COMMAND_LINE_TOOLS_PACKAGE_).
1. Run `git clone https://github.com/hunterjhancock/dotfiles.git ~/.dotfiles && cd ~/.dotfiles` to clone & navigate to the repo.
1. If desired, run `git checkout new_branch_name` to create a new [git](https://git-scm.com) branch.
1. Verify that [`install.conf.yaml`](install.conf.yaml) includes the dotfiles, directories, and scripts you want [Dotbot](https://github.com/anishathalye/dotbot) to symlink, create, and run, respectively.
1. Verify that [`Brewfile`](Brewfile) includes the exact software you want [Homebrew](https://brew.sh) to install.
1. Verify that [`setup_node.zsh`](setup_node.zsh) includes the exact [npm](https://www.npmjs.com) packages you want to install.
1. Run [`./install`](install) to start the installation with [Dotbot](https://github.com/anishathalye/dotbot).
1. _Coming soon..._

## Usage

_Coming soon..._

## Uninstallation

_Coming soon..._
