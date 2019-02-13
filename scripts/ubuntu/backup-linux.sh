# Copy relevant user configuration files and folders to Dropbox
# ----
# Configure this script to run daily at 9am as the "root" user: 
# sudo crontab -e
# 0 9 * * * sh /home/USERNAME/path/to/this-file.sh
# ----

backupdir=/home/USERNAME/Backups/Example

cp ~/.bash* $backupdir
cp ~/.gitconfig $backupdir
cp ~/.gitignore $backupdir
cp ~/.viminfo $backupdir

cp -r ~/proxy/* $backupdir/proxy
cp -r ~/.ssh/* $backupdir/.ssh

chown -R USERNAME:USERNAME $backupdir/*
