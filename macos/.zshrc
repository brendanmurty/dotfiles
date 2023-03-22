# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

# Format the vcs_info_msg_0_ variable with Git branch information
zstyle ':vcs_info:git:*' formats '(%b)'

# Set up the prompt string
autoload -U colors && colors
setopt PROMPT_SUBST
PROMPT='%{$fg[cyan]%}${PWD/#$HOME/~}%{$reset_color%}%  %{$fg[yellow]%}${vcs_info_msg_0_}%{$reset_color%}%
$ '

# Sample Zsh prompt output:
#   ~/dotfiles (main)
#   $
 
