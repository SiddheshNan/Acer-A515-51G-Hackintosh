# Acer-A515-51G-Hackintosh
#### Supports MacOS 10.13.x and 10.14.x
---
### What Works
 - [x] Audio w/ headphone jack
 - [x] CPU Speedstep (XCPM)
 - [x] iGPU with disabled dGPU
 - [x] Battery Management
 - [x] Backlight
 - [x] Ethernet
 - [x] HDMI
 - [x] HDMI audio
 - [x] Sleep + Wake
 - [x] Smart Touchpad + Gestures (using I2C)
 - [x] WebCam
 - [x] Usb 3.0 + Type C
 - [x] Sleep From (Lid)
 - [x] WiFi (2.4 + 5GHz) + BT by using BCM94352z
 - [x] Native hotkey support w/ Fn keys
 - [x] Sleep wake using mouse or any external Input device (Enable Wake from USB from BIOS)
 
---
###  Basic Installation

- Create a Bootable USB for OSx by using the guide by RehabMan [[Guide] Booting the OS X installer on LAPTOPS with Clover](https://www.tonymacx86.com/el-capitan-laptop-support/148093-guide-booting-os-x-installer-laptops-clover.html).
- Install MacOS to SSD / hard drive.
- Install [Clover Bootloader](https://sourceforge.net/projects/cloverefiboot) into SSD / hard drive.
- Copy the contains of this repo into clover folder of you're EFI.
- **[IMPORTANT]** Make sure to Generate system definitions of MacBook pro 15.2 in config.plist file using [Clover Configurator](https://mackie100projects.altervista.org/download-clover-configurator/) or Else MacOS will not Boot! You can find Tutorial about it [Here](https://www.tonymacx86.com/threads/guide-how-to-configure-your-systems-smbios-correctly.198155/).

### Tweaking the HackBook..

- To fix the cracking sound from headphones, please see [ALCPlugFix](https://github.com/Siddhesh9146/Acer-E515-51G-Hackintosh/tree/master/ALCPlugFix)

----

### Info about the build

#### Audio
- The Sound Card is `Realtek ALC255`, which is drived by `AppleALC` on layout-id 3.

#### Bluetooth
- The Native Atheros BT will work out-of-the Box, But you can't turn off the BT becouse Power Management is not supported;
- To Fix this, you'll have to get a MacOS compatible wifi+BT card. The best choice will be BCM94352Z which has WiFi+BT.


#### Ethernet
- The Ethernet is `8411B`, and you'll need RealtekRTL8111.kext to Enable Gigabit Ethernet.

#### Graphics
- The iGPU is `Intel UHD Graphics 620`, and its enabled using `Ig-Platform-id=0x191E0000`
- The discrete graphics' name is `NVIDIA GeForce MX150`, and its disabled becuase macOS doesn't support Optimus technology. Plus Battery Life is Improved to 6-7 hours of Backup.
- Native brightness hotkey support; using DSDT.aml patched from RehabMan's [[Guide] Patching DSDT/SSDT for LAPTOP backlight control](https://www.tonymacx86.com/threads/guide-patching-dsdt-ssdt-for-laptop-backlight-control.152659/).

#### Touchpad
- The touchpad works After Installing VoodooPs2Controller.kext, After that Install VoodooI2C.kext in order to recognise the touchpad as native one, And after that all gestures will work fine.

#### USB
- To Raise the Port Limit, We're using USBInjectAll.kext from RehabMan. You can also Find Patched SSDT-UIAC under ACPI/Patched Folder.


#### Wi-Fi
- The Native Wi-Fi Card this Laptop uses is `Atheros QCA9377`. Since it is not supported natively, and there are none kexts to enable this card on macOS, We can't use this card and I don't think it'll get supported in the future.
- The Best Choice will be to Replace current Card with BCM94352Z which has WiFI+BT, or BCM943602BAED Which Supports MacOS natively.
- I Have Already Changed My Current WiFi card with BCM94352Z, you can find it on AliExpress for like $20-30.
- I've Patched Config.plist for BCM94352Z and BCM943602BAED and also added Kexts for BT as well. Keep in mind, this laptop uses **M.2(NGFF)** Socket with **A+E Key**. Half size Card Won't Work.

## Credits

- **Special Thanks** to [Acidanthera](https://github.com/acidanthera) for most of the Kexts.
- **Special Thanks** to [RehabMan](https://github.com/RehabMan).
- Thanks to [Clover Bootloader](https://sourceforge.net/projects/cloverefiboot).
- Thanks to [goodwin](https://github.com/goodwin/) for [ALCPlugfix](https://github.com/goodwin/ALCPlugFix).
- Thanks to [daliansky](https://github.com/daliansky/) for Some Patches which I used here from [XiaoMi-Pro](https://github.com/daliansky/XiaoMi-Pro/).
