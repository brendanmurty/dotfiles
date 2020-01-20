#!/usr/bin/python

# Photo management script
# 
# ----
# 
# Originally forked from https://gist.github.com/cliss/6854904
# 
# Requirements:
#  - Windows machine
#  - Python 3.8: https://www.python.org/downloads/release/python-380/
#  - ExifRead: https://pypi.org/project/ExifRead/

import sys
import os, shutil
import os.path
import exifread
from datetime import datetime

######################## Functions #########################

def photoDate(f):
    "Return the date/time on which the given photo was taken."

    img = open(f, 'rb')
    imgTags = exifread.process_file(img)

    return datetime.strptime(str(imgTags['EXIF DateTimeOriginal']), "%Y:%m:%d %H:%M:%S")

###################### Main program ########################

# Get the date details
now = datetime.now()
yearNow = now.year

# Where the photos are and where they're going.
sourceDir = "%s\\Dropbox\\Camera Uploads" % os.environ['USERPROFILE']
destDir = "%s\\Dropbox\\Photos\\Brendan" % os.environ['USERPROFILE']
errorDir = "%s\\00 Unsorted" % destDir

# Create the required directories
if not os.path.exists(destDir):
    os.makedirs(destDir)
if not os.path.exists(errorDir):
    os.makedirs(errorDir)

# The format for the new file names.
fmt = "%Y-%m-%d %H-%M-%S"

# The problem files.
problems = []

# Get all the JPEGs in the source folder.
photos = os.listdir(sourceDir)
photos = [ x for x in photos if x[-4:] == '.jpg' or x[-4:] == '.JPG' ]

# Prepare to output as processing occurs
lastMonth = 0
lastYear = 0

# Copy photos into year and month subfolders. Name the copies according to
# their timestamps. If more than one photo has the same timestamp, add
# suffixes 'a', 'b', etc. to the names. 
for photo in photos:
    original = "%s\\%s" % (sourceDir, photo)
    suffix = 'a'

    # print("\nProcessing: %s" % original)

    try:
        pDate = photoDate(original)
        # print("Photo date: %s" % str(pDate))

        yr = pDate.year
        mo = pDate.month
        moDirectory = "%s" % datetime.strftime(pDate, '%m %b')
        # print("\nPhoto directory: %s" % moDirectory)

        if not lastYear == yr or not lastMonth == mo:
            sys.stdout.write('\nProcessing %04d-%02d...' % (yr, mo))
            lastMonth = mo
            lastYear = yr
        else:
            sys.stdout.write('.')

        newname = pDate.strftime(fmt)
        thisDestDir = destDir + '/%04d/%s' % (yr, moDirectory)
        if not os.path.exists(thisDestDir):
            os.makedirs(thisDestDir)
        # print("\nDestination directory: %s" % thisDestDir)

        duplicate = thisDestDir + '/%s.jpg' % (newname)
        while os.path.exists(duplicate):
            newname = pDate.strftime(fmt) + suffix
            duplicate = destDir + '/%04d/%s/%s.jpg' % (yr, moDirectory, newname)
            suffix = chr(ord(suffix) + 1)
        shutil.move(original, duplicate)
    except Exception:
        shutil.move(original, errorDir + photo)
        problems.append(photo)
    except:
        sys.exit("Execution stopped.")

# Report the problem files, if any.
if len(problems) > 0:
    print("\nProblem files:")
    print("\n%s" % problems)
    print("\nThese can be found in: %s" % errorDir)
