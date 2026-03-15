#!/usr/bin/env bash
#
#
# Linux: Disable Dropbox file sync checkmark icon overlays in Linux file managers
#
#

cd "~/.dropbox-dist/dropbox-lnx.x86_64-52.3.55/images/emblems"

mv emblem-dropbox-uptodate.icon emblem-dropbox-uptodate.icon.bak
mv emblem-dropbox-uptodate.png emblem-dropbox-uptodate.png.bak
