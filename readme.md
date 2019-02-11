# Brendan Murty's dotfiles

Configuration files for a local development environment

## Contents

- **[Atom](Atom/)**: [Atom](https://atom.io/) text editor configuration
- **[VSCode](VSCode/)**: [Visual Studio Code](https://code.visualstudio.com/) text editor configuration
- **[SublimeText](SublimeText/)**: [Sublime Text 3](https://www.sublimetext.com/3) text editor configuration
- **[Terminus](Terminus/)**: [Terminus](https://eugeny.github.io/terminus/) terminal configuration
- **[custom.bash_aliases](custom.bash_aliases)**: Shortcut commands to make common commands easier to use
- **[custom.bash_prompt](custom.bash_prompt)**: Customised terminal command prefix configuration
- **[custom.gitconfig](custom.gitconfig)**: [Git](https://git-scm.com/) user and alias configuration
- **[custom.gitignore](custom.gitignore)**: [Git](https://git-scm.com/) file ignore configuration
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
