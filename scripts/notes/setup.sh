# setup.sh - Install the required packages and add time-saving alias commands

# Load the environment variables

source .env

# Setup the folder structure

mkdir -p "$NOTES_STORAGE_FOLDER/_Backups"
mkdir -p "$NOTES_STORAGE_FOLDER/_Inbox"
mkdir -p "$NOTES_STORAGE_FOLDER/_Templates"
mkdir -p "$NOTES_STORAGE_FOLDER/Personal"
mkdir -p "$NOTES_STORAGE_FOLDER/Work"

# Setup alias commands

cp ~/.bash_aliases ~/.bash_aliases.bak

echo "# Notes shortcuts related to files in '$NOTES_STORAGE_FOLDER'" >> ~/.bash_aliases
echo "alias notebackup='php \"$NOTES_SCRIPTS_FOLDER/backup.php\" \"$NOTES_STORAGE_FOLDER\"'" >> ~/.bash_aliases
echo "alias notenew='php \"$NOTES_SCRIPTS_FOLDER/new.php\" \"$NOTES_STORAGE_FOLDER\"'" >> ~/.bash_aliases
echo "function notesearch() { grep --include=*.md --exclude=readme.md --exclude-dir=_Backups --color -rni \$1 \"$NOTES_STORAGE_FOLDER\"; }" >> ~/.bash_aliases

source ~/.bash_aliases
