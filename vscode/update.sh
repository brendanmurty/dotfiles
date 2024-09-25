cp $HOME/AppData/Roaming/Code/User/settings.json settings.json

code --list-extensions | xargs -L 1 echo code --install-extension > setup.sh

git add settings.json
git add setup.sh

git status
