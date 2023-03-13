# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable with Git branch information
zstyle ':vcs_info:git:*' formats '(%b)'

# Set up the prompt string
setopt PROMPT_SUBST
PROMPT='${PWD/#$HOME/~} ${vcs_info_msg_0_}
$ '

# Sample Zsh prompt output:
#   ~/dotfiles (branch: main)
#   $ 