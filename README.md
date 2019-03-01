# Acer-A515-51G-Hackintosh with MacOS Mojave and HighSierra
Acer E515-51G Hackintosh Guide for MacOS Mojave, And High Sierra.

* Supports 10.13.x and 10.14.x


## Installation

Create a Bootable USB for the OSX, So refer to the Guide by RehabMan [[Guide] Booting the OS X installer on LAPTOPS with Clover](https://www.tonymacx86.com/el-capitan-laptop-support/148093-guide-booting-os-x-installer-laptops-clover.html).

### Audio
* The Sound card this Laptop uses is `Realtek ALC255`, which is drived by `AppleALC` on layout-id 3.
* If headphones are not working, please see [ALCPlugFix](https://github.com/Siddhesh9146/Acer-E515-51G-Hackintosh/tree/master/ALCPlugFix). You may need to replug headphone after every boot.

    
### Bluetooth
* The Native Atheros BT will work out-of-the Box, But you can't turn off the BT becouse Power Management is not supported;
    * To Fix this, you'll have to get a MacOS compatible wifi+BT card. The best choice will be BCM94352Z which has WiFi+BT.


### Ethernet
* The Ethernet is `8411B`, and you'll need RealtekRTL8111.kext to Enable Gigabit Ethernet.

### Graphics
* The iGPU is `Intel UHD Graphics 620`, and its enabled using `Ig-Platform-id=0x191E0000`
* For HDMI Implementation we need patched the FrameBuffer & HDMI audio, I have already patched it in Config.plist
* The discrete graphics' name is `NVIDIA GeForce MX150`, and its disabled becuase macOS doesn't support Optimus technology. Plus Battery Life if Improved to 6-7 hours of Backup.
* Native brightness hotkey support; using DSDT.aml patched from RehabMan's [[Guide] Patching DSDT/SSDT for LAPTOP backlight control](https://www.tonymacx86.com/threads/guide-patching-dsdt-ssdt-for-laptop-backlight-control.152659/).

### Touchpad
* The touchpad works After Installing VoodooPs2Controller.kext, After that Install ApplePS2SmartTouchpad.kext in order to recognise the touchpad as native one, And after that all gestures will work fine.

### USB
* To Raise the Port Limit, We're using USBInjectAll.kext from RehabMan. You can also Find Patched SSDT-UIAC under ACPI/Patched Folder.
* SD Card Reader is not supported and it's disabled to save power.

### Wi-Fi
* The Wi-Fi Card this Laptop uses is `Atheros QCA9377`. Since it is not supported natively, and there are none kexts to enable this card on macOS, We can't use this card on MacOS and I don't think it'll get supported in the future.
* The Best Choice will be to Replace current Card with BCM94352Z which has WiFI+BT, or BCM943602BAED Which Supports MacOS natively.
* I Have Already Changed My Current WiFi card with BCM94352Z, you can find it on AliExpress for like $20-30.
* I've Patched Config.plist for BCM94352Z and BCM943602BAED and also added Kexts for BT as well. Keep in mind, this laptop uses **M.2(NGFF)** Socket with **A+E Key**. Half size Card Won't Work.



## Credits

- **Special Thanks** to [Acidanthera](https://github.com/acidanthera) for most of the Patches.

- Thanks to [apianti](https://sourceforge.net/u/apianti), [blackosx](https://sourceforge.net/u/blackosx), [blusseau](https://sourceforge.net/u/blusseau), [dmazar](https://sourceforge.net/u/dmazar), and [slice2009](https://sourceforge.net/u/slice2009) for providing [Clover](https://sourceforge.net/projects/cloverefiboot).

- Very Very **Special Thanks** to [RehabMan](https://github.com/RehabMan) for All his Work for the Hackintosh Community, Literally 90% of this Guide has his Kexts and Patches.

- Thanks to [goodwin](https://github.com/goodwin/) for [ALCPlugfix](https://github.com/goodwin/ALCPlugFix).

- Thanks to [toleda](https://www.tonymacx86.com/members/toleda.2393/) for [AppleHDA patches](https://www.tonymacx86.com/threads/audio-realtek-alc-applehda-guide.143757/).

- Thanks to [EMlyDinEsH](https://osxlatitude.com/profile/7370-emlydinesh/) for [ApplePS2SmartTouchPad.kext](https://osxlatitude.com/forums/topic/1948-elan-focaltech-and-synaptics-smart-touchpad-driver-mac-os-x/).

- Thanks to [micky1979](https://www.insanelymac.com/forum/profile/674334-micky1979/) for [AppleHDA patcher(MironeAudio)](https://www.insanelymac.com/forum/files/file/496-applehda-patcher/).

- Thanks to [mackie100projects](https://mackie100projects.altervista.org) for [Clover Configurator](https://mackie100projects.altervista.org/download-clover-configurator/).

- Thanks to [blackosx](https://bitbucket.org/blackosx/darwindumper/) for [DarwinDumper](https://bitbucket.org/blackosx/darwindumper/downloads/).

- Thanks to [tonymacx86](https://www.tonymacx86.com/) for [EFI Mounter](https://www.tonymacx86.com/resources/efi-mounter-v3.280/).

- Thanks to [toleda](https://www.tonymacx86.com/members/toleda.2393/) for [ioregexplorer](https://www.tonymacx86.com/threads/guide-how-to-make-a-copy-of-ioreg.58368/).

- Thanks to cvad-mac for [Kext Utility](http://cvad-mac.narod.ru/index/0-4).

- Thanks to [fatcatsoftware](https://www.fatcatsoftware.com/) for [PlistEditor Pro](https://www.fatcatsoftware.com/plisteditpro/).

- Thanks again to [RehabMan]() for [iasl](https://github.com/RehabMan/Intel-iasl) & [MaciASL](https://bitbucket.org/RehabMan/os-x-maciasl-patchmatic/downloads/).

- And **Special** Thanks to [daliansky](https://github.com/daliansky/) for Some Patches which I used here from [XiaoMi-Pro](https://github.com/daliansky/XiaoMi-Pro/).

