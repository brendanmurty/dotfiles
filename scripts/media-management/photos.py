#!/usr/bin/python

# Photo management script
# 
# ----
# 
# Originally forked from https://gist.github.com/cliss/6854904
# 
# Organises all media files (defined by "mediaFileExtensions") in the "sourceDir" in to a subfolder of "destDir" named like:
#   2020\01 Jan\
# 
# Setup:
#   echo "alias photomgmt='python ~/Git/dotfiles/scripts/media-management/photos.py'" >> ~/.bash_aliases
#   source ~/.bash_aliases
# 
# Requirements:
#  - Windows machine
#  - Python 3.8: https://www.python.org/downloads/release/python-380/
#  - ExifRead: https://pypi.org/project/ExifRead/
#
# TODO:
#  - 
#  

import sys
import os, shutil
import os.path
import exifread
from datetime import datetime

### Functions

def photoDate(f):
    "Return the date/time on which the given photo was taken."

    try:
        img = open(f, 'rb')
        imgTags = exifread.process_file(img)
        return datetime.strptime(str(imgTags['EXIF DateTimeOriginal']), "%Y:%m:%d %H:%M:%S")
    except:
        # Default to using today's date if the required image properties can't be found
        return datetime.now()

### Main program

# Get the date details
now = datetime.now()
yearNow = now.year

# Where the media files are and where they're going
sourceDir = "%s\\Dropbox\\Camera Uploads" % os.environ['USERPROFILE']
destDir = "%s\\Dropbox\\Photos\\Brendan" % os.environ['USERPROFILE']
errorDir = "%s\\00 Unsorted" % destDir

# Create the required directories
if not os.path.exists(destDir):
    os.makedirs(destDir)
if not os.path.exists(errorDir):
    os.makedirs(errorDir)

# The format for the new file names
fmt = "%Y-%m-%d %H-%M-%S"

# The problem files
problems = []

# Get all the media files in the source folder
mediaFileExtensions = [
    '.bmp',
    '.BMP',
    '.gif',
    '.GIF',
    '.jpg',
    '.JPG',
    '.mov',
    '.MOV',
    '.mp4',
    '.MP4',
    '.png',
    '.PNG'
]
photos = os.listdir(sourceDir)
photos = [ x for x in photos if x[-4:] in mediaFileExtensions ]

# Prepare to output as processing occurs
lastMonth = 0
lastYear = 0

# Copy photos into year and month subfolders
#  - Name the copies according to their timestamps, defaulting to today's date
#  - If more than one photo has the same timestamp, add suffixes ('a', 'b', etc) to the file names
for photo in photos:
    original = "%s\\%s" % (sourceDir, photo)
    fileExtension = os.path.splitext(original)[1]
    suffix = 'a'

    print("Processing file: %s" % original)

    try:
        pDate = photoDate(original)
        yr = pDate.year
        mo = pDate.month
        moDirectory = "%s" % datetime.strftime(pDate, '%m %b')

        print("Organising files (%04d - %s)..." % (yr, moDirectory))

        newname = pDate.strftime(fmt)
        thisDestDir = destDir + '/%04d/%s' % (yr, moDirectory)
        if not os.path.exists(thisDestDir):
            os.makedirs(thisDestDir)

        duplicate = thisDestDir + '/%s%s' % (newname, fileExtension)
        while os.path.exists(duplicate):
            newname = pDate.strftime(fmt) + suffix
            duplicate = destDir + '/%04d/%s/%s%s' % (yr, moDirectory, newname, fileExtension)
            suffix = chr(ord(suffix) + 1)
        shutil.move(original, duplicate)
    except Exception:
        shutil.move(original, "%s\\%s" % (errorDir, photo))
        problems.append(photo)
    except:
        sys.exit("Cancelled")

# Output a report of any problem files
if len(problems) > 0:
    print("Problem files:")
    print("%s" % problems)
    print("These can be found in: %s" % errorDir)
