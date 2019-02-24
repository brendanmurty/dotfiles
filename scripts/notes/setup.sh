# setup.sh - Install the required packages and add time-saving alias commands

# Install the required packages

apt-get update
apt-get -y install php7.3 php7.3-cli php7.3-mbstring php7.3-zip

# Setup the folder structure

mkdir "$1/_Backups"
mkdir "$1/_Inbox"
mkdir "$1/Personal"
mkdir "$1/Work"

# Setup alias commands

cp ~/.bash_aliases ~/.bash_aliases.bak

echo "\n# Notes shortcuts related to files in '$1'" >> ~/.bash_aliases.tmp
echo "alias notebackup='php "$(dirname $(readlink -f $0))"/backup.php $1'" >> ~/.bash_aliases.tmp
echo "alias notenew='php "$(dirname $(readlink -f $0))"/new.php $1'" >> ~/.bash_aliases.tmp
echo "function notesearch() { grep --exclude=readme.md --color -rni '\$1' $1; }" >> ~/.bash_aliases.tmp

. ~/.bash_aliases
