# Brendan Murty's dotfiles

Configuration files for a local development environment

## Contents

- **[atom](atom/)**: [Atom](https://atom.io/) text editor configuration
- **[scripts](scripts/)**: Various scripts to assist with new system setup and automated backup processes
- **[terminus](terminus/)**: [Terminus](https://eugeny.github.io/terminus/) terminal configuration
- **[custom.bash_aliases](custom.bash_aliases)**: Shortcut commands to make common commands easier to use
- **[custom.bash_prompt](custom.bash_prompt)**: Customised terminal command prefix configuration
- **[custom.gitconfig](custom.gitconfig)**: [Git configuration](https://git-scm.com/docs/git-config) including alias commands
- **[custom.gitignore](custom.gitignore)**: [Git ignore](https://git-scm.com/docs/gitignore) list
- **[custom.vimrc](custom.vimrc)**: [Vim](http://www.vim.org/) text editor
- **[setup.sh](setup.sh)**: Script to deploy changes to user configuration files
- **[undo.sh](undo.sh)**: Script to undo changes to user configuration files

## Initial Setup

```
sudo sh setup.sh
```

## Revert Customisations

```
sudo sh undo.sh
```
