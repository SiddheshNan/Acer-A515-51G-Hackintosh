# Acer-A515-51G-Hackintosh
#### Supports MacOS 10.13.x and 10.14.x

### What Works
 - [x] Audio w/ headphone jack
 - [x] CPU Speedstep (XCPM)
 - [x] iGPU with disabled dGPU
 - [x] Battery Management
 - [x] Backlight
 - [x] Ethernet
 - [x] HDMI + Audio
 - [x] Sleep + Wake
 - [x] Smart Touchpad + Gestures (using I2C)
 - [x] WebCam
 - [x] Usb 3.0 + Type C
 - [x] Sleep From (Lid)
 - [x] WiFi (2.4 + 5GHz) + BT by using BCM94352z
 - [x] Native hotkey support w/ Fn keys
 
 ![alt text](https://i.imgur.com/A0cKRrX.png  "Benchmarks")
  - Geekbench Score : 
  - - Single-Core Score : 4219 [Link](https://browser.geekbench.com/v4/cpu/13793813).
  - - Multi-Core Score : 14837 [Link](https://browser.geekbench.com/v4/cpu/13793813).
  - - GPU OpenCL Score : 31191 [Link](https://browser.geekbench.com/v4/compute/4258348).

###  Basic Installation

- Create a Bootable USB for OSx by using the guide by RehabMan [[Guide] Booting the OS X installer on LAPTOPS with Clover](https://www.tonymacx86.com/el-capitan-laptop-support/148093-guide-booting-os-x-installer-laptops-clover.html).
- Install MacOS to SSD / hard drive.
- Install [Clover Bootloader](https://sourceforge.net/projects/cloverefiboot) into SSD / hard drive.
- Copy **ALL** the contains of this Repo into **CLOVER** Folder inside the EFI partition of SSD / hard drive.
- **[IMPORTANT]** Make sure to Generate system definitions of MacBook pro 15.2 in config.plist file using [Clover Configurator](https://mackie100projects.altervista.org/download-clover-configurator/) or Else MacOS will not Boot! You can find Tutorial about it [Here](https://www.tonymacx86.com/threads/guide-how-to-configure-your-systems-smbios-correctly.198155/).

### Post Installation

- Disable Hibernation : Hibernation (suspend to disk or S4 sleep) is not supported on hackintosh. it could cause problems if you don't disable it.

```sh

$ sudo pmset -a hibernatemode 0

$ sudo rm /var/vm/sleepimage

$ sudo mkdir /var/vm/sleepimage

$ sudo pmset -a standby 0

$ sudo pmset -a autopoweroff 0

```

- To fix the cracking sound from headphones, please see [ALCPlugFix](https://github.com/Siddhesh9146/Acer-E515-51G-Hackintosh/tree/master/ALCPlugFix).

---
 #### **If You Don't Have any Compatible WiFi Card installed then Please visit [without-wifi-patches(BCM94352Z) Branch](https://github.com/SiddheshNan/Acer-A515-51G-Hackintosh/tree/without-wifi-patches(BCM94352Z)) of this Repo.**
---

### Info about the Laptop

 
- **Audio** : The Sound Card is `Realtek ALC255`, which is drived by `AppleALC` on `layout-id 3`.

- **CPU** : The CPU model is `i5-8250U` and XCPM power management is native supported.
 - - XCPM and HWP are recommended to work together to reach better power management, using Pikar-Alpha's [ssdtPRGen](https://github.com/Piker-Alpha/ssdtPRGen.sh). & also by injecting `plugin-type=1` using SSDT, and most importantly `CPUFriend.kext`.

- **Graphics** : The iGPU is `Intel UHD Graphics 620`, and its enabled using `Ig-Platform-id=0x191E0000`.
- - The discrete dGPU is `NVIDIA GeForce MX150`, and it is disabled becuase macOS doesn't support optimus technology. Plus battery life is much improved.
- - Native brightness hotkey support; using DSDT.aml patched from RehabMan's [[Guide] Patching DSDT/SSDT for LAPTOP backlight control](https://www.tonymacx86.com/threads/guide-patching-dsdt-ssdt-for-laptop-backlight-control.152659/).

- **Battery** : Battery Management using `SMCBatteryManager.kext`.

- **Backlight** : Native Brightness control using `AppleBacklightFixup.kext` & `SSDT-PNLF.aml`.

- **Ethernet** : Gigabit Ethernet using `RealtekRTL8111.kext`.

- **HDMI** : Intel Framebuffer patches to change the connector-type to match the physical connector, using `WhateverGreen.kext`.
- - **HDMI Audio** : Injecting property `"hda-gfx" = "onboard-1"` on HDAU, IGPU, HDEF objects & also injecting `layout-id 3` on HDAU to match layout-id on HDEF.

- **Touchpad** : Native I2C touchpad support using `VoodooI2C.kext`; Set touchpad Mode to Advance from `BIOS` & All gestures will work fine.

- **USB** : Custom `SSDT-UIAC.aml` SSDT for `USBInjectAll.kext` that configures USB ports on XHC such that the port limit patch is not needed, and each UsbConnnector value is correct for each port.
- - You can also find USB port mapping for `SSDT-UIAC` [Here](https://github.com/SiddheshNan/Acer-A515-51G-Hackintosh/blob/master/USB%20port%20mapping%20for%20SSDT-UIAC.txt).


- **Wi-Fi** : Stock WiFi Card is `Atheros QCA9377` It is not supported on MacOS.
- - Best Choice will be to replace current Card with `BCM94352Z` which has WiFI+BT, or `BCM943602BAED`. You can find it on AliExpress for like $20-30. I Have Already Changed My Current WiFi card with `BCM94352Z`.
- - Config.plist is already patched for `BCM94352Z` and `BCM943602BAED` & added kexts for BT as well.
- - Keep in mind, this laptop uses **M.2(NGFF)** Socket with **A+E Key**. Half size Card Won't Work.
- - **If You Don't Have Compatible WiFi Card Installed then Please visit [without-wifi-patches(BCM94352Z) Branch](https://github.com/SiddheshNan/Acer-A515-51G-Hackintosh/tree/without-wifi-patches(BCM94352Z)) of this Repo.**

- **Bluetooth** : Stock Atheros BT will work out-of-the box, But you can't turn it off becouse BT power management is not supported;
- - To Fix this you'll have to get a MacOS compatible WiFi+BT card. The best choice will be `BCM94352Z` which has WiFi+BT.


## Credits

- **Special Thanks** to [Acidanthera](https://github.com/acidanthera) for most of the Kexts.
- **Special Thanks** to [RehabMan](https://github.com/RehabMan).
- Thanks to [Clover Bootloader](https://sourceforge.net/projects/cloverefiboot).
- Thanks to [goodwin](https://github.com/goodwin/) for [ALCPlugfix](https://github.com/goodwin/ALCPlugFix).
- Thanks to [alexandred](https://github.com/alexandred/VoodooI2C) for [VoodooI2C](https://github.com/alexandred/VoodooI2C).
- Thanks to [daliansky](https://github.com/daliansky/) for Some Patches which I used here from [XiaoMi-Pro](https://github.com/daliansky/XiaoMi-Pro/).