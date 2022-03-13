## Pseudocode-Installer
Currently, this repository contains only the pre-alpha installer for Windows. 
A less edgy installer will be released soon!

### About
Pseudocode is an imperative programming language. This repository contains the installer-files, as well as the standard-library "stdlib".
- [Official website](https://pseudocode.site/)
- [Official GitHub project](https://github.com/xtay2/Pseudocode)

### Installing
- Download the archive "pseudocode-win-installer.zip".
- Unzip it anywhere.
- Start the file "Installer.bat".
  - If you dont have the current version of java, the installer asks you to update.
  - All installed files, including the source-libraries are stored in "%Program Files%\Pseudocode" and "%windir%".
  - Any previous content in "C:\Program Files\Pseudocode" gets completely deleted. Proceed with caution.

### Using Pseudocode
- If you want to create a Pseudocode-project, it has to contain one file called "Main.pc".
- Open cmd and navigate to your project directory. This has to be a parent-directory of the "Main.pc"-file.
- Execute "pseudocode run" in your shell.
- Now your main-func in the "Main.pc" should get found and executed. Have fun!
