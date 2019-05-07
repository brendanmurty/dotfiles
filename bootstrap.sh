# Run all "setup.sh" scripts in each subfolder besides "scripts"
#   - Originally found here: https://github.com/rkalis/dotfiles/blob/master/bootstrap.sh
find * -name "setup.sh" -not -wholename "scripts*" | while read setup; do
  ./$setup
done
