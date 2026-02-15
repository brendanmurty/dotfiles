#
# Supernote Setup
#   - Requires a Linux distro with Flatpak already setup
#   - Initial Setup
#     - Install Bottles app via Flatpak
#     - Setup new Bottle named 'Supernote'
#     - Run the latest Supernote Partner App for Windows installer in that Bottle
#     - Once installed, run that app in the Bottle
#     - In the Bottles app, rename the 'supernote_partner' app to 'Supernote Partner App'
#     - Flatseal app (install via Flatpak): allow Bottles to access host filesystem and home files
#     - Confirm the 'flatpak run' command below works
#   - Ideally run this at startup on user login, delay by 15 seconds
#

SCRIPT_DIR=$(dirname "$(realpath "$0")")

LOG_FILE="$SCRIPT_DIR/supernote-setup.log"
LOG_FMT="+%Y-%m-%d %H:%M:%S"
touch "$LOG_FILE"

cp -n "$SCRIPT_DIR/supernote-setup.sample.env" "$SCRIPT_DIR/supernote-setup.env"
source "$SCRIPT_DIR/supernote-setup.env"

# Exit if the source or target dirs doesn't exist

if [ ! -d $SOURCE_DIR ]; then
  ERR_MSG=$(date "$LOG_FMT") "ERROR source dir not found at $SOURCE_DIR"
  echo "$ERR_MSG"
  echo "$ERR_MSG" >> "$LOG_FILE"
fi
if [ ! -d $TARGET_DIR ]; then
  ERR_MSG=$(date "$LOG_FMT") "ERROR target dir not found at $TARGET_DIR"
  echo "$ERR_MSG"
  echo "$ERR_MSG" >> "$LOG_FILE"
fi

# Setup a symlink in TARGET_DIR that points SOURCE_DIR (the folder holding the files)

echo $(date "$LOG_FMT") "INFO emptying target dir" >> "$LOG_FILE"

rm -rf "$TARGET_DIR"

echo $(date "$LOG_FMT") "INFO creating symlink: '$SOURCE_DIR' >>> '$TARGET_DIR'" >> "$LOG_FILE"

ln -s "$SOURCE_DIR" "$TARGET_DIR"

# Run the Supernote Partner App via Bottles in the background

nohup setsid \
  flatpak run \
  --command=bottles-cli com.usebottles.bottles \
  run -b "Supernote" \
  -p "Supernote Partner App" \
  >/dev/null 2>&1 &

echo $(date "$LOG_FMT") "INFO done" >> "$LOG_FILE"
