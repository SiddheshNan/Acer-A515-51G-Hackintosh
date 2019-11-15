# [Working] Keyboard fix for MacOS 

#### Many people have reported a problem that their Keyboard is not working after installation of MacOS.
#### Upon Further Investigation, I Have found that `BIOS` version might affect this.
#### You need v1.19 `BIOS` verion. In Any other `BIOS` version than this, the MacOS *might* not work.

## Really Simple Fix - Courtesy of @(rahulbablu)[https://github.com/rahulbablu]

- Download the `BIOS` installer for older `BIOS`. you'll probebly get error due to older version number after running it, Please do following -
- Run setup
- When you get an error, don't close the window, Just minimize it
- Open file explorer ( Make sure 'display hidden files/folders' is ON )
- Go to `C:\Users\<Your username>\AppData\Local\Temp`
- There should be the `BIOS` setup temporary folder with a different name
- Copy that folder and paste it in a different location (say for example - Desktop)
- Now you can close setup window which shows version number error
- In the folder you copied and pasted there will be a configuration file ( A .ini file )
- Open it using notepad.
- There should be a line with version `check=0` or 1 or 2
- Change it to 0
- Save the file
- Now run this temporary setup (Not the original one)
- It will skip BIOS version check

#### Above method is Tested and Reported to work `OK`.

### This File will be updated as I have more information about this issue.
