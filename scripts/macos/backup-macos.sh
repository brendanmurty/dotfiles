# Copy relevant user configuration files and folders to Dropbox
# ----
# Configure this script to run daily at 9am as the "root" user: 
# crontab -e
# 0 9 * * * sh /Users/USERNAME/path/to/this-file.sh
# ----

backupdir=/Users/USERNAME/Backups/Example

cp ~/.bash_aliases $backupdir
cp ~/.bash_profile $backupdir
cp ~/.bash_prompt $backupdir
cp ~/.gitconfig $backupdir
cp ~/.gitignore $backupdir
cp ~/.vimrc $backupdir
