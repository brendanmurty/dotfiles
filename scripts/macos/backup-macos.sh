# Copy relevant user configuration files and folders to a backup directory specified in a parameter.
# ----
# Edit the crontab to add a scheduled task:
# sudo crontab -e
# 
# Then add a line to this file like (this will run daily at 9am):
# 0 9 * * * sh /Users/USERNAME/path/to/this-file.sh "/Users/USERNAME/Synced/Backup/macos-user"
#
# Save and exit the file to schedule the script to run.
# ----

# Exit this script if any error occurs
set -e

# Exit if the backup directory is not sent as a parameter
if [ -z "$1" ]
then
  exit 1
fi

# Copy files to the backup directory
cp ~/.bash_aliases $1/backup.bash_aliases
cp ~/.bash_profile $1/backup.bash_profile
cp ~/.bash_prompt $1/backup.bash_prompt
cp ~/.gitconfig $1/backup.gitconfig
cp ~/.gitignore $1/backup.gitignore
cp ~/.vimrc $1/backup.vimrc

# Copy folders to the backup directory
mkdir -p $1/SSH
sudo cp -r ~/.ssh/* $1/SSH

# Copy the user's crontab list
crontab -l > $1/backup.crontab

# Fix permissions in the backup directory
sudo chown -R "$USER" $1
chmod -R u+rw $1
