# Copy relevant user configuration files and folders to a backup directory
# ----
# Edit the crontab to add a scheduled task:
# crontab -e
# 
# Then add a line to this file like (this will run daily at 9am):
# 0 9 * * * BACKUP_DIR=/Users/USERNAME/Sync/Backup/macos-user sh /Users/USERNAME/path/to/this-file.sh
#
# Save and exit the file to schedule the script to run.
# ----

# Exit this script if any error occurs
set -e

# Copy files to the backup directory
cp ~/.bash_aliases $BACKUP_DIR
cp ~/.bash_profile $BACKUP_DIR
cp ~/.bash_prompt $BACKUP_DIR
cp ~/.gitconfig $BACKUP_DIR
cp ~/.gitignore $BACKUP_DIR
cp ~/.vimrc $BACKUP_DIR
