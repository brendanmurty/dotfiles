# Apply customised configuration files
touch ~/.gitconfig ~/.gitignore

cp ~/.gitconfig ~/.gitconfig.before-dotfiles-base.bak
cp ~/.gitignore ~/.gitignore.before-dotfiles-base.bak

cat custom.gitconfig >> ~/.gitconfig
cat custom.gitignore >> ~/.gitignore

# Clone repositories from `repositories.txt` to folders under `GIT_REPOSITORY_FOLDER`
#  - Originally found here: https://github.com/rkalis/dotfiles/blob/master/repos/setup.sh
GIT_REPOSITORY_FOLDER="$HOME/Repositories"
GIT_REPOSITORY_LIST="$(pwd)/repositories.txt"
if [[ -f "repositories.txt" ]]; then
  echo "INFO  Loading repositories from '$GIT_REPOSITORY_LIST' in to directories under '$GIT_REPOSITORY_FOLDER'"

  mkdir -p $GIT_REPOSITORY_FOLDER
  cd $GIT_REPOSITORY_FOLDER

  while read repo; do
    if [[ $repo == \#* ]]; then continue; else # Skip comment lines in the file
      if [[ $repo != "" ]]; then # Skip empty lines in the file
        echo "INFO  Running 'git clone $repo'..."
        git clone $repo &> /dev/null
      fi
    fi
  done < $GIT_REPOSITORY_LIST

  echo "DONE  Finished cloning Git repositories"
else
  echo "INFO  No repository md file found, this can be recreated by copying 'repositories.example.txt'"
fi