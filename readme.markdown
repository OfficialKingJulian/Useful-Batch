# my Windows 10 rice // scripts

Some useful windows dotfiles and/or batch scripts I use on the daily.

## Installation: 

AutoHotkey is required to get everything to work as desired. 

Simply...

`git clone https://github.com/OfficialKingJulian/dotbatch`

`cd dotbatch`

`dotbatch -install`

Then reload the Command Prompt. To remove, it's the same but with: 

`dotbatch -uninstall`

Make sure lots of stuff is in the path environment, such as vim. I might make the installation process smoother at some point, but I don't swap Windows machines very often.

## Workflow:

`cmdrc.bat` : Press `alt+enter` to run the Command Prompt (an AHK script). This runs it through the script cmdrc.bat, which alters the look of the prompt.

`general.ahk` : Where most of my every day, ususally sensible, default bindings are.

`tools\` : All of the tools, pretty much always batch. Most should have good descriptions for what they do, but some of the most useful ones include: 

- `renr.bat` : ren (rename) but recursively
- `ll.bat` : lists files and folders nicely
- `gui.bat` : open current location in windows explorer
- `push.bat` : push github repo, quickly, nicely, better
- `idle.vbs` : keep the screen awake
- `search.bat` : search; a lot fast (feeling) than gui
- `shortcut.bat` and `drives.bat` : create shortcuts to folders or drives with minimal effort
- `add-path.bat` : add a folder to the path environment, and then refresh using `refresh.bat` (stolen from [Chocolatey](https://github.com/chocolatey/choco/blob/b6495f72d1f2b9901747d857467c4ed3f7306391/src/chocolatey.resources/redirects/RefreshEnv.cmd))

`hours\` : An VBS CLI application for keeping track of hours worked with text files. Always a WIP. 

