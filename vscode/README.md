# Visual Studio Code Configuration

Here are the contents of my [Visual Studio Code](https://code.visualstudio.com/) configuration directory.

## Usage

1. Purchase your own license for the `Regular` variant of the [IO font by Mass-Driver](https://io.mass-driver.com/) and install the OTF file on your machine
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

## Update VS Code settings and extensions install script

Run in a terminal (use [Git Bash](https://git-scm.com/downloads) in Windows) from this subdirectory:

```
bash update.sh
```
