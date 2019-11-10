#!/bin/bash

sudo cp -a "./ALCPlugFix" /usr/bin
sudo chmod 755 /usr/bin/ALCPlugFix
sudo chown root:wheel /usr/bin/ALCPlugFix
sudo cp -a "./hda-verb" /usr/bin
sudo chmod 755 /usr/bin/hda-verb
sudo chown root:wheel /usr/bin/hda-verb
sudo cp -a "./good.win.ALCPlugFix.plist" /Library/LaunchAgents/
sudo chmod 644 /Library/LaunchAgents/good.win.ALCPlugFix.plist
sudo chown root:wheel /Library/LaunchAgents/good.win.ALCPlugFix.plist
sudo launchctl load /Library/LaunchAgents/good.win.ALCPlugFix.plist
sudo kextcache -i /
echo 'The installation of the ALCPlugFix daemon is complete'
bash read -p 'Press any key to Exit'
