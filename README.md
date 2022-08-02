# Hunter's dotfiles

> **Warning** This is still a work in progess. Use at your own risk!

My personal dotfiles for macOS, inspired by:

- [Patrick McDonald's dotfiles](https://github.com/eieioxyz/dotfiles_macos) (check out his amazing Udemy course: ["Dotfiles from Start to Finish-ish"](https://www.udemy.com/share/1043Ta3@fWYLq4xuDOzVCe1n-FaqtWDKj3GC3nhuomzNqQF4nzT-7OwA669olDFasO7t_S53Tw==/))
- [Takuya Matsuyama's dotfiles](https://github.com/craftzdog/dotfiles-public)
- [Mathias Bynen's dotfiles](https://github.com/mathiasbynens/dotfiles)

## How it works

This repository is dependent on [Xcode Command Line Tools](https://developer.apple.com/library/archive/technotes/tn2339/_index.html#//apple_ref/doc/uid/DTS40014588-CH1-WHAT_IS_THE_COMMAND_LINE_TOOLS_PACKAGE_). Installing it gives us access to a bunch of tools (like [git](https://git-scm.com)) that are needed to access & run our [`install`](install) script.

After installing the [Xcode Command Line Tools](https://developer.apple.com/library/archive/technotes/tn2339/_index.html#//apple_ref/doc/uid/DTS40014588-CH1-WHAT_IS_THE_COMMAND_LINE_TOOLS_PACKAGE_) and cloning this repository to your local machine (specifically to `~/.dotfiles`), the [`install`](install) script tells [Dotbot](https://github.com/anishathalye/dotbot) to run according to the configuration in [`install.conf.yaml`](install.conf.yaml):

- [Dotbot](https://github.com/anishathalye/dotbot) sets up dotfile symlinks as defined in the `link` section of [`install.conf.yaml`](install.conf.yaml)
- [Dotbot](https://github.com/anishathalye/dotbot) creates directories as defined in the `create` section of [`install.conf.yaml`](install.conf.yaml)
- [Dotbot](https://github.com/anishathalye/dotbot) runs the [`setup_homebrew.zsh`](setup_homebrew.zsh) script
  - Installs [Homebrew](https://brew.sh)
  - Tells [Homebrew](https://brew.sh) to install the software in [`Brewfile`](Brewfile)
  - Note: This script tells [Homebrew](https://brew.sh) to use [mas-cli](https://github.com/mas-cli/mas) to install apps from the Mac App Store. Be sure the `mas` commands (e.g. `mas "Software Name", id: 12345`) in [`Brewfile`](Brewfile) only include software that you have purchased or installed before with your Apple ID.
- [Dotbot](https://github.com/anishathalye/dotbot) runs the [`setup_zsh.zsh`](setup_zsh.zsh) script
  - Adds the [Homebrew](https://brew.sh) version of [zsh](https://zsh.sourceforge.io) to the list of available shells
  - Sets the [Homebrew](https://brew.sh) version of [zsh](https://zsh.sourceforge.io) as the default **_interactive_** shell (instead of the Apple default version)
  - Sets the Apple default version of [zsh](https://zsh.sourceforge.io) as the default **_non-interactive_** shell (instead of [bash](https://www.gnu.org/software/bash/), which may be unnecessary...)
- [Dotbot](https://github.com/anishathalye/dotbot) runs the [`setup_node.zsh`](setup_node.zsh) script
  - Tells [n](https://github.com/tj/n) (a version manager for [Node.js](https://nodejs.org/en/)) to install the latest versions of [Node.js](https://nodejs.org/en/) and [npm](https://www.npmjs.com)
  - Tells [npm](https://www.npmjs.com) to install any packages listed in [`setup_node.zsh`](setup_node.zsh)

## File structure explained

| Name                                       | Description                                                                                                                                                                                                           |
| ------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [`dotbot/`](dotbot/)                       | contains [Dotbot](https://github.com/anishathalye/dotbot) submodule (see associated page for more info)                                                                                                               |
| [`.gitignore`](.gitignore)                 | defines files & file types to ignore in [git](https://git-scm.com) commits                                                                                                                                            |
| [`.gitmodules`](.gitmodules)               | defines submodules used by [git](https://git-scm.com) (such as [Dotbot](https://github.com/anishathalye/dotbot))                                                                                                      |
| [`Brewfile`](Brewfile)                     | [Homebrew](https://brew.sh) install configuration                                                                                                                                                                     |
| [`gitconfig`](gitconfig)                   | [git](https://git-scm.com) configuration (symlinked to `~/.gitconfig` by [Dotbot](https://github.com/anishathalye/dotbot))                                                                                            |
| [`install`](install)                       | primary install script; run [Dotbot](https://github.com/anishathalye/dotbot) (configured with [`install.conf.yaml`](install.conf.yaml))                                                                               |
| [`install.conf.yaml`](install.conf.yaml)   | [Dotbot](https://github.com/anishathalye/dotbot) install configuration                                                                                                                                                |
| [`LICENSE`](LICENSE)                       | license information for this repository                                                                                                                                                                               |
| [`README.md`](README.md)                   | README for this repository                                                                                                                                                                                            |
| [`setup_homebrew.zsh`](setup_homebrew.zsh) | script for [Dotbot](https://github.com/anishathalye/dotbot); install [Homebrew](https://brew.sh) (configured with [`Brewfile`](Brewfile))                                                                             |
| [`setup_node.zsh`](setup_node.zsh)         | script for [Dotbot](https://github.com/anishathalye/dotbot); install [Node.js](https://nodejs.org/en/) & [npm](https://www.npmjs.com) with [n](https://github.com/tj/n) and any [npm](https://www.npmjs.com) packages |
| [`setup_zsh.zsh`](setup_zsh.zsh)           | script for [Dotbot](https://github.com/anishathalye/dotbot); install [zsh](https://zsh.sourceforge.io) and set it as the default shell                                                                                |
| [`zshenv`](zshenv)                         | [zsh](https://zsh.sourceforge.io) configuration (symlinked to `~/.zshenv` by [Dotbot](https://github.com/anishathalye/dotbot))                                                                                        |
| [`zshrc`](zshrc)                           | [zsh](https://zsh.sourceforge.io) configuration (symlinked to `~/.zshrc` by [Dotbot](https://github.com/anishathalye/dotbot))                                                                                         |

## Software list

I sometimes forget to update this list, so the items in [Brewfile](Brewfile) and [setup_node.zsh](setup_node.zsh) should more accurately reflect my current setup. Maybe I should write a script to auto-update this list... 🤔

| Name                                                                                                           | Description                                                                                                                   |
| -------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| [Homebrew](https://brew.sh)                                                                                    | the missing package manager for macOS (or Linux)                                                                              |
| [curl](https://curl.se)                                                                                        | to get a file from an HTTP, HTTPS or FTP server                                                                               |
| [git](https://git-scm.com)                                                                                     | a distributed revision control system                                                                                         |
| [less](https://www.greenwoodsoftware.com/less/)                                                                | a pager program similar to [more](<https://en.wikipedia.org/wiki/More_(command)>)                                             |
| [mas-cli](https://github.com/mas-cli/mas)                                                                      | a Mac App Store [command-line interface](https://en.wikipedia.org/wiki/Command-line_interface)                                |
| [n](https://github.com/tj/n)                                                                                   | for [Node.js](https://nodejs.org/en/) version management                                                                      |
| [Node.js](https://nodejs.org/en/)                                                                              | a JavaScript runtime built on Chrome's V8 JavaScript engine.                                                                  |
| [npm](https://www.npmjs.com)                                                                                   | a package manager for JavaScript included with [Node.js](https://nodejs.org/en/)                                              |
| [nano](https://www.nano-editor.org)                                                                            | a free ([GNU](https://www.gnu.org)) replacement for the [Pico](https://www.uic.edu/depts/accc/software/pine/pico) text editor |
| [neovim](https://neovim.io)                                                                                    | an ambitious Vim-fork focused on extensibility and agility                                                                    |
| [pyenv](https://github.com/pyenv/pyenv)                                                                        | for Python version management                                                                                                 |
| [rustup](https://rustup.rs)                                                                                    | Rust toolchain installer                                                                                                      |
| [vim](https://www.vim.org)                                                                                     | a Vi 'workalike' with many additional features                                                                                |
| [zsh](https://zsh.sourceforge.io)                                                                              | a UNIX shell (command interpreter)                                                                                            |
| [Adguard](https://adguard.com/)                                                                                | a stand-alone ad blocker                                                                                                      |
| [Anki](https://apps.ankiweb.net)                                                                               | memory training application                                                                                                   |
| [Discord](https://discord.com)                                                                                 | voice and text chat software                                                                                                  |
| [Firefox](https://www.mozilla.org/en-US/firefox/)                                                              | a web browser                                                                                                                 |
| [Fira Code](https://github.com/tonsky/FiraCode)                                                                | a free monospaced font with programming ligatures                                                                             |
| [Google Chrome](https://www.google.com/chrome/)                                                                | a web browser                                                                                                                 |
| [iTerm2](https://iterm2.com)                                                                                   | Terminal emulator as alternative to Apple's Terminal app                                                                      |
| [Logi Options+](https://www.logitech.com/en-us/software/logi-options-plus.html)                                | software for Logitech devices                                                                                                 |
| [Logseq](https://logseq.com)                                                                                   | privacy-first, open-source platform for knowledge sharing and management                                                      |
| [Native Access](https://support.native-instruments.com/hc/en-us/categories/360000053677-Download-Installation) | administration tool for Native Instruments products                                                                           |
| [Obsidian](https://obsidian.md)                                                                                | Knowledge base that works on top of a local folder of plain text Markdown files                                               |
| [Visual Studio Code](https://code.visualstudio.com)                                                            | an open-source code editor                                                                                                    |
| [Auto HD FPS for YouTube](https://apps.apple.com/us/app/auto-hd-fps-for-youtube/id1546729687)                  | a Safari extension to auto-set YouTube quality                                                                                |
| [Final Cut Pro](https://www.apple.com/final-cut-pro/)                                                          | video editing software from Apple                                                                                             |
| [Logic Pro](https://www.apple.com/logic-pro/)                                                                  | a [DAW](https://en.wikipedia.org/wiki/Digital_audio_workstation) and MIDI sequencer from Apple                                |
| [Magnet](https://magnet.crowdcafe.com)                                                                         | a window manager for macOS                                                                                                    |
| [Speedtest](https://www.speedtest.net/about)                                                                   | an internet speed & performance analyzer                                                                                      |
| [Things](https://culturedcode.com/things/)                                                                     | a task manager for the Apple ecosystem                                                                                        |
| [Xcode](https://developer.apple.com/xcode/)                                                                    | Apple's IDE for developing Apple ecosystem software                                                                           |

## Alias list

My command aliases are located in [zshrc](zshrc), but here's a neat list with descriptions:

| Alias   | Command                                                                                   | Description                                                                     |
| ------- | ----------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| `ll`    | `ls -oAhFG`                                                                               | lists directory contents in a simpler and more legible format                   |
| `bbd`   | `brew bundle dump --force --describe --file=~/.dotfiles/Brewfile;echo "Updated Brewfile"` | updates [`Brewfile`](Brewfile) to match the set of currently installed software |
| `trail` | `<<<${(F)path}`                                                                           | returns `PATH` in a list format                                                 |
| `sa`    | `source ~/.zshrc`                                                                         | sources the `.zshrc` file in home directory                                     |

## Installation

> **Note** These steps assume a clean install of macOS. I haven't yet considered the potential conflict between directly installed apps & packages and those that will be installed by this repo (via [Homebrew](https://brew.sh) or other package/version managers, like [npm](https://www.npmjs.com) or [n](https://github.com/tj/n)).

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
