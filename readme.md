# Brendan Murty's dotfiles

Configuration files for a local development environment.

## Contents

- **[atom](atom/)**: [Atom](https://atom.io/) text editor configuration
- **[bash](bash/)**: Bash terminal configuration
- **[git](git/)**: [Git configuration](https://git-scm.com/docs/git-config) including alias commands
- **[phpstorm](phpstorm/)**: [PhpStorm](https://www.jetbrains.com/phpstorm/) IDE configuration
- **[scripts](scripts/)**: Various scripts to assist with new system setup and automated backup processes
- **[vim](vim/)**: [Vim](http://www.vim.org/) text editor configuration
- **[vscode](vscode/)**: [Visual Studio Code](https://code.visualstudio.com/) IDE configuration
- **[setup.sh](setup.sh)**: Script to deploy changes to user configuration files
- **[undo.sh](undo.sh)**: Script to undo changes to user configuration files

## Initial Setup

```
sudo sh bootstrap.sh
```

## Revert Customisations

```
sudo sh undo.sh
```
