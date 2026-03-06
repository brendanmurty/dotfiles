# Backup Obsidian Notes
#  - Makes a timestamped ZIP file backup of your entire Obsidian notes directory
#  - Requires Git Bash: https://git-scm.com/downloads
#  - Requires 7zip: https://www.7-zip.org/
#  - 7zip must use the default install location
#  - Requires a Windows system
#  - Tested on Windows 11, may need some tweaks for other Windows versions

# Requires Windows, Git Bash and 7-Zip installed in their default locations.
cd /c/Users/example/Backups/Obsidian
"/c/Program Files/7-Zip/7z.exe" a "obsidian_$(date +%Y%m%d-%H%M%S).zip" /c/Users/example/Notes