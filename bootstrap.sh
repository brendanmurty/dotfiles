# Run all "setup.sh" scripts in each subfolder besides "scripts"
#   - Originally found here: https://github.com/rkalis/dotfiles/blob/master/bootstrap.sh
find * -name "setup.sh" -not -wholename "scripts*" | while read setup; do
  echo $setup
  # ./$setup
done

# Alternative method: Manually run each relevant "setup.sh" script
#
# cd atom
# sh setup.sh
# cd ..
# 
# cd bash
# sh setup.sh
# cd ..
# 
# cd git
# sh setup.sh
# cd ..
# 
# cd phpstorm
# sh setup.sh
# cd ..
# 
# cd vim
# sh setup.sh
# cd ..
# 
# cd vscode
# sh setup.sh
# cd ..
