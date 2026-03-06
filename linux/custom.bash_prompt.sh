# Customised shell prompt
#  - Relies on the '__git_ps1' script from the official Git repo:
#    https://raw.githubusercontent.com/git/git/refs/heads/master/contrib/completion/git-prompt.sh
#  - Download of this is also included in 'setup.sh'
#  - That downloaded file is also loaded via 'custom.bash_profile.sh'
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " %s")'; PS1='\[\e[38;5;249m\]\u\[\e[0m\] \[\e[38;5;183m\]\W\[\e[38;5;87m\]${PS1_CMD1}\[\e[0m\]: '
