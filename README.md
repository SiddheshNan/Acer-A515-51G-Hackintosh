# Acer-A515-51G-Hackintosh with MacOS HighSierra and Mojave
Acer E515-51G Hackintosh Guide for MacOS Sierra, High Sierra And Mojave.

* Supports 10.13.x and 10.14.


## Installation

Create a Bootable USB for the OSX, So refer to the Guide by RehabMan [[Guide] Booting the OS X installer on LAPTOPS with Clover](https://www.tonymacx86.com/el-capitan-laptop-support/148093-guide-booting-os-x-installer-laptops-clover.html).

### Audio
* The Sound card this Laptop uses is `Realtek ALC255`, which is drived by `AppleALC` on layout-id 3 (On High Sierra and Earlier) But Since Mojave 10.14 layout-id 3 is depricated, So you have to use layout-id 4; injection information is located in `config.plist`. After that You have to Install [Patched_AppleHDA](https://github.com/Siddhesh9146/Acer-E515-51G-Hackintosh/tree/master/AppleHDA_ALC225_Patched) With its HDAEnabler & CodecCommander Kext.
* If headphones are not working, please see [ALCPlugFix](https://github.com/Siddhesh9146/Acer-E515-51G-Hackintosh/tree/master/ALCPlugFix). You may need to replug headphone after every boot.

    
### Bluetooth
* The Native Atheros BT will work out-of-the Box, But you can't turn off the BT becouse Power Management is not supported;
    * To Fix this, you'll have to get a MacOS compatible wifi+BT card becouse the default one is combo card. The best choice will be BCM94352HMB which has WiFi+BT.


### Ethernet
* The Ethernet is `8411B`, and you'll need RealtekRTL8111.kext to enable Ethernet.

### Graphics
* The iGPU is `Intel UHD Graphics 620`, Please refer to [GPUFixup](https://github.com/Siddhesh9146/Acer-E515-51G-Hackintosh/blob/master/GPUFixup.txt) link to enable the iGPU.
* The discrete graphics' name is `NVIDIA GeForce MX150`, disabled by `SSDT-DDGPU.aml` becuase macOS doesn't support Optimus technology.
* Native brightness hotkey support; using DSDT.aml patched from RehabMan's [[Guide] Patching DSDT/SSDT for LAPTOP backlight control](https://www.tonymacx86.com/threads/guide-patching-dsdt-ssdt-for-laptop-backlight-control.152659/).

### Touchpad
* The touchpad works After Installing VoodooPs2Controller.kext, After that Install ApplePS2SmartTouchpad.kext in order to recognise the touchpad as native one, And after that all gestures will work fine.

### USB
* To Raise the Port Limit, We're using USBInjectAll.kext from RehabMan.
* SD Card Reader is not supported and be disabled to save power.

### Wi-Fi
* The Wi-Fi Card this Laptop uses is `Atheros QCA9377`. Since it is not supported natively, and there are none kexts to enable this card on macOS, We can't use this card on MacOS and I don't think it'll get supported in the future.
* The Best Choice will be to Replace current Card with BCM94352HMB which has WiFI+BT, or BCM94360HMB Which Supports MacOS natively.



## Credits

- Thanks to [Acidanthera](https://github.com/acidanthera) 

- Thanks to [alexandred](https://github.com/alexandred) and [hieplpvip](https://github.com/hieplpvip) for providing [VoodooI2C](https://github.com/alexandred/VoodooI2C).

- Thanks to [apianti](https://sourceforge.net/u/apianti), [blackosx](https://sourceforge.net/u/blackosx), [blusseau](https://sourceforge.net/u/blusseau), [dmazar](https://sourceforge.net/u/dmazar), and [slice2009](https://sourceforge.net/u/slice2009) for providing [Clover](https://sourceforge.net/projects/cloverefiboot).

- Special Thanks to [RehabMan](https://github.com/RehabMan).

- Thanks to [goodwin](https://github.com/goodwin/) for [ALCPlugfix](https://github.com/goodwin/ALCPlugFix).

- Thanks to [toleda](https://www.tonymacx86.com/members/toleda.2393/) for [AppleHDA patches](https://www.tonymacx86.com/threads/audio-realtek-alc-applehda-guide.143757/).

- Thanks to [EMlyDinEsH](https://osxlatitude.com/profile/7370-emlydinesh/) for [ApplePS2SmartTouchPad.kext](https://osxlatitude.com/forums/topic/1948-elan-focaltech-and-synaptics-smart-touchpad-driver-mac-os-x/).


