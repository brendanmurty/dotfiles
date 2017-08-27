# Sublime Text Configuration

Here are the contents of my [Sublime Text 3](http://sublimetext.com/3) packages folder.

To use this configuration in your installation of Sublime Text, start by [installing Package Control](https://packagecontrol.io/installation).

Then copy all the files in this folder to your computer:

- Windows: `%APPDATA%\Sublime Text 3`
- OS X: `~/Library/Application Support/Sublime Text 3`
- Linux: `~/.config/sublime-text-3`

Now manually install all of the packages listed in [Package Control.sublime-settings](https://github.com/brendanmurty/sublime-text-configuration/blob/master/User/Package%20Control.sublime-settings) using the Package Control [Install Package command](https://packagecontrol.io/docs/usage).

## Updating user preferences

If you'd like to tweak the editor preferences, update [Preferences.sublime-settings](https://github.com/brendanmurty/sublime-text-configuration/blob/master/User/Preferences.sublime-settings) to meet your needs.

To learn more about the available settings, read the [official documentation about settings](http://www.sublimetext.com/docs/3/settings.html).

## Custom keyboard shortcuts

I've configured some customised keyboard shortcuts in [Default (Windows).sublime-keymap](https://github.com/brendanmurty/sublime-text-configuration/blob/master/User/Default%20(Windows).sublime-keymap).

To set your own keyboard shortcuts, you'll need to make sure you add these in the file that matches your operating system. Check out the [unofficial documentation about this](http://docs.sublimetext.info/en/latest/customization/key_bindings.html) for more information.

## Increasing file tab height

I prefer larger file tabs to make the file names more prominent on the screen.

If you'd like to do this too, edit your chosen `.sublime-theme` file and increase the value of the `tab_height` setting to `40`.
