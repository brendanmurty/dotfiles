# open-browser-tabs.sh
# 
# ----
#
# Open a set of tabs defined by a text file containing one URL per line.
# To use the URLs stored in "tabs-example", run "bash open-browser-tabs.sh example".
#

if [ "$(which start)" == "" ]; then
  echo "Requires the 'start' program."
  exit 1
fi

if [ $# -eq 0 ]; then
  echo "Usage: open-browser-tabs.sh example"
  exit 1
fi

TABS_FILE="tabs-$1.txt"

if [ ! -f "$TABS_FILE" ]; then
  echo "Tabs file doesn't exist: $TABS_FILE"
  exit 1
fi

echo "Using $TABS_FILE"

for tab in $(cat $TABS_FILE); do
  echo "Opening: $tab";
  start $tab;
done
