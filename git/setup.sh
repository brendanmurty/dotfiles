# Apply customised configuration files
touch ~/.gitconfig ~/.gitignore

cp ~/.gitconfig ~/.gitconfig.before-dotfiles-base.bak
cp ~/.gitignore ~/.gitignore.before-dotfiles-base.bak

cat custom.gitconfig >> ~/.gitconfig
cat custom.gitignore >> ~/.gitignore

# Clone repositories in "repositories.list" to folders under "~/Git"
#  - Originally found here: https://github.com/rkalis/dotfiles/blob/master/repos/setup.sh
if [[ -f "repositories.list" ]]; then
  echo "INFO\tLoading repositories from 'repositories.list'"

  cd "$HOME/Git"
  
  find * -name "repositories.list" | while read fn; do
    while read repo; do
      if [[ $repo == \#* ]]; # Skip comment lines in the file
      then continue; else
        echo "INFO\tRunning 'git clone $repo'..."
        git clone $repo &> /dev/null

        if [[ $? -eq 128 ]]; then
          echo "ERROR\tRepository already exists"
        elif [[ $? -eq 0 ]]; then
          echo "DONE\tFinished cloning repository"
        else
          echo "ERROR\tFailed to clone repository"
        fi

        popd &> /dev/null
      fi
    done < "$fn"

    echo "DONE\tFinished cloning Git repositories"
  done
else
  echo "INFO\tNo repository list file found, this can be created by running:\n\tcp repositories.example.list repositories.list && vim repositories.list\n"
fi