# Visual Studio Code Configuration

Here are the contents of my [Visual Studio Code](https://code.visualstudio.com/) configuration directory.

## Usage

1. Download the [Monaspace](https://monaspace.githubnext.com/) fonts and install the `Monaspace Argon Regular` OTF file
2. Install [VS Code]((https://code.visualstudio.com/)), open it and wait for it to load
3. If you're using macOS, you have to press `Cmd+Shift+P` and select the `Shell Command: Install 'code' command in PATH` 
4. Close VS Code so that the settings files are initialised
5. Open Terminal
6. Check that the `code` command works now: `which code`
7. Run [setup.sh](setup.sh) from this directory: `bash setup.sh`
8. Copy [settings.json](settings.json) and [keybindings.json](keybindings.json) from this directory to your [VS Code Configuration Directory](https://code.visualstudio.com/docs/getstarted/settings#_settings-file-locations)
9. Open VS Code

## Customise

You can also tweak the layout colours by modifying the `workbench.colorCustomizations` section in `settings.json`.

The available otions are detailed in the [API Documentation](https://code.visualstudio.com/api/references/theme-color).
