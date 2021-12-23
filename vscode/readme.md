# Visual Studio Code Configuration

Here are the contents of my [Visual Studio Code](https://code.visualstudio.com/) configuration directory.

## Usage

1. Purchase the [MonoLisa](https://www.monolisa.dev/) font and install it
2. Install [VS Code]((https://code.visualstudio.com/)), open it and wait for it to load
3. If you're using macOS, you have to press `Cmd+Shift+P` and select the `Shell Command: Install 'code' command in PATH` 
3. Close VS Code so that the settings files are initialised
4. Open Terminal
5. Check that the `code` command works now: `which code`
6. Run [setup.sh](setup.sh) from this directory: `bash setup.sh`
7. Copy [settings.json](settings.json) from this directory to your [VS Code Configuration Directory](https://code.visualstudio.com/docs/getstarted/settings#_settings-file-locations)
8. Open VS Code

## Customise

You can also tweak the layout colours by modifying the `workbench.colorCustomizations` section in `settings.json`.
The available otions are detailed in the [API Documentation](https://code.visualstudio.com/api/references/theme-color).
