# Apply customised configuration files
touch ~/.gitconfig ~/.gitignore

cp ~/.gitconfig ~/.gitconfig.before-dotfiles-base.bak
cp ~/.gitignore ~/.gitignore.before-dotfiles-base.bak

cat custom.gitconfig >> ~/.gitconfig
cat custom.gitignore >> ~/.gitignore

# Clone repositories in "repositories.list" to folders under "~/Git"
#  - Originally found here: https://github.com/rkalis/dotfiles/blob/master/repos/setup.sh
GIT_REPOSITORY_FOLDER="$HOME/Git/Temp"
GIT_REPOSITORY_LIST="$(pwd)/repositories.list"
if [[ -f "repositories.list" ]]; then
  echo "INFO  Loading repositories from '$GIT_REPOSITORY_LIST' in to directories under '$GIT_REPOSITORY_FOLDER'"

  mkdir -p $GIT_REPOSITORY_FOLDER
  cd $GIT_REPOSITORY_FOLDER

  while read repo; do
    if [[ $repo == \#* ]]; then continue; else # Skip comment lines in the list file
      if [[ $repo != "" ]]; then # Skip empty lines in the list file
        echo "INFO  Running 'git clone $repo'..."
        git clone $repo &> /dev/null
      fi
    fi
  done < $GIT_REPOSITORY_LIST

  echo "DONE  Finished cloning Git repositories"
else
  echo "INFO  No repository list file found, this can be recreated by copying 'repositories.example.list'"
fi