#!/usr/local/bin/python3
#
# Custom md2notion script
# 
# ----
# 
# A customised [md2notion](https://github.com/Cobertos/md2notion) script to assist in importing a directory of Markdown files to Notion.
#
# Imports all Markdown files in `~\Downloads\Markdown` to Notion.
# 
# Setup:
#
# 1. Copy "notion.env.example" to "notion.env"
# 2. Set appropriate values for the variables in "notion.env"
# 3. Install required packages: `pip3 install notion-cobertos-fork md2notion python-dotenv`
#   - Temporarily using "notion-cobertos-fork" instead of "notion" due to https://github.com/Cobertos/md2notion/issues/40
# 4. Run this script: `python3 md2notion-import.py`
#

import os
from dotenv import dotenv_values
from notion.client import NotionClient
from notion.block import PageBlock
from md2notion.upload import upload

# Load the configuration values from "notion.env"
script_file_path = os.path.dirname(__file__)
config = dotenv_values("%s/notion.env" % script_file_path)

# Setup the Notion API client
client = NotionClient(token_v2=config['NOTION_TOKEN_V2'])
page = client.get_block(config['NOTION_IMPORT_PARENT_PAGE_URL'])

# Get a list of the Markdown files in `~\Downloads\Markdown`
sourceDir = "%s/Downloads/Markdown" % (os.path.expanduser('~'))
markdownFiles = os.listdir(sourceDir)
markdownFiles = [ x for x in markdownFiles if x[-3:] in ['.md'] ]

# Import each of these Markdown files to Notion as a subpage of `NOTION_IMPORT_PARENT_PAGE_URL`
for markdownFile in markdownFiles:
  with open("%s/%s" % (sourceDir, markdownFile), "r", encoding="utf-8") as mdFile:
    newPageTitle = markdownFile[:-3]

    newPage = page.children.add_new(PageBlock, title=newPageTitle)

    upload(mdFile, newPage)
