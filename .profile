### SSH configuration

alias sshgo="eval \"$(ssh-agent -s)i\" && ssh-add ~/.ssh/id_rsa"

### Git configuration

git config --global user.email "b@murty.io"
git config --global user.name "Brendan Murty"
git config --global push.default simple

### Setup Google Drive syncing

google-drive-ocamlfuse ~/Drive
