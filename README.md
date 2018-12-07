# Acer-E515-51G-Hackintosh with MacOS HighSierra and Mojave
Acer E515-51G Hackintosh Guide for MacOS Sierra, High Sierra And Mojave.

* Support 10.13.x and 10.14.
* ACPI fixes use hotpatch; related files are located in `/CLOVER/ACPI/patched`.

## Installation

Create a Bootable USB for the OSX, So refer to the Guide by RehabMan [[Guide] Booting the OS X installer on LAPTOPS with Clover](https://www.tonymacx86.com/el-capitan-laptop-support/148093-guide-booting-os-x-installer-laptops-clover.html).

### Audio
* The Sound card this Laptop uses is `Realtek ALC255`, which is drived by `AppleALC` on layout-id 3 (On High Sierra and Earlier) But Since Mojave 10.14 layout-id 3 is depricated, So you have to use layout-id 4; injection information is located in `/CLOVER/config.plist`. After that You have to Install [Patched_AppleHDA](https://github.com/Siddhesh9146/Acer-E515-51G-Hackintosh/tree/master/AppleHDA_ALC225_Patched) With its HDAEnabler & CodecCommander Kext.
* If headphones are not working, please see [ALCPlugFix](https://github.com/Siddhesh9146/Acer-E515-51G-Hackintosh/tree/master/ALCPlugFix). You may need to replug headphone after every boot.

    
### Bluetooth
* The Native Ather
    *

### CPU
* The model is `i5-8250U` or `i7-8550U`, and XCPM power management is native supported. 
* XCPM and HWP are recommended to work together to reach better power management (>=10.13.6). Please replace `/CLOVER/kexts/Other/CPUFriendDataProvider.kext` with the archive in [#53](https://github.com/daliansky/XiaoMi-Pro/issues/53) to enable HWP.

### Ethernet
* The model name is `RTL8153`, and is natively supported by 10.13+.
* This ethernet card is connected to USB port.

### Graphics
* The model name is `Intel UHD Graphics 620`, faked to `Intel HD Graphics 620` by injecting ig-platform-id `00001659`.
* The discrete graphics' name is `NVIDIA GeForce MX150`, disabled by `SSDT-DDGPU.aml` becuase macOS doesn't support Optimus technology.
* Use HDMI port on the left side may cause black internal display, please try to reopen the lid.
* Native brightness hotkey support; related file is located in `/CLOVER/ACPI/patched/SSDT-LGPA.aml`.

### Keyboard
* Caps Lock may not function well, please read instructions in [#2](https://github.com/stevezhengshiqi/XiaoMi-Pro/issues/2) to uncheck `Use the Caps Lock key to switch to and from ABC`. 
* The latest keyboard driver can temporily disable the touchpad during typing. If you are not happy with the lag, a workaround is provided in [#19](https://github.com/stevezhengshiqi/XiaoMi-Pro/issues/19).

### SSD
* Recent model uses `PM981` SSD instead of `PM961`. This EFI doesn't fully support `PM981`, and `PM981` users can replace their SSDs or visit [How to fix PM981 in 10.3.3](https://www.tonymacx86.com/threads/how-to-fix-pm981-in-10-13-3-17d47.245063).
    * `PM981` SSD's serial number starts with `MZVLB`, and `PM961` SSD's serial number starts with `MZVLW`.

### Touchpad
* The model name is `ETD2303`(ELAN), and the driver is a patched verison of `VoodooI2C`, which has no scale problem or sleep issue.
* Don't forget to uncheck `Smart Zoom` in `SysPref - Trackpad - Scroll & Zoom` to help trackpad work better.

### USB
* USB Port Patching uses [Intel FB-Patcher](https://www.tonymacx86.com/threads/release-intel-fb-patcher-v1-4-1.254559), related file is located in `/CLOVER/kexts/Other/USBPorts.kext`.
* SD Card Reader's model name is `RTS5129`. It is not supported and be disabled to save power.

### Wi-Fi
* The wireless model is `Intel® Dual Band Wireless-AC 8265`. Unfortunately, there's no way to enable it. You can follow [Intel WiFi Driver Effort](https://www.tonymacx86.com/threads/intel-wifi-driver-effort.186344) to check the latest progress.
* A workaround is to insert a supported wireless card into M.2 slot. More information can be viewed in [Xiaomi Mi Notebook Pro High Sierra 10.13.6](https://www.tonymacx86.com/threads/guide-xiaomi-mi-notebook-pro-high-sierra-10-13-6.242724).


## FAQ

### My device is locked by `Find My Mac` and can't be booted, what should I do now?

I believe there are many ways to solve this problem. I give a most understandable one here (at least for me). The solution is to refresh your BIOS in order to clean `nvram.plist`. Please read `How to update BIOS` in [BIOS folder](https://github.com/daliansky/XiaoMi-Pro/blob/master/BIOS/README.md).


### I opened the `FileVault` and I can't find macOS partition in Clover boot page, how can I solve it?

It is not recommened to open `FileVault`. You can press Fn + F3 in the Clover boot page and choose the icon with `FileVault`. Then you can boot in the system and close `FileVault`.


### My touchpad isn't working after update.

You need to rebuild the kext cache after every system update. Use `Kext Utility.app` or type `sudo kextcache -i /` in `Terminal.app`. Then restart. If this still doesn't work, try to press F9.


### I can't boot in Windows/Linux by using Clover, but able to boot by press F12 and select OS.

Many people met this problem by using the new version of `AptioMemoryFix.efi`. A workaround is to delete `AptioMemoryFix-64.efi` in `/CLOVER/drivers64UEFI/` and replace it with the old version provided in [#93](https://github.com/daliansky/XiaoMi-Pro/issues/93).


A complete EFI archive is available in [releases](https://github.com/daliansky/XiaoMi-Pro/releases) page,Thanks to the continuous update of [stevezhengshiqi](https://github.com/stevezhengshiqi).

If the tracpad doesn't work during installation, please plug a wired mouse or a wireless mouse projector before the installation. After the installation completes, open `Terminal.app` and type `sudo kextcache -i /`. Wait for the process ending and restart the device. Enjoy your trackpad!


## Changelog

You can view [Changelog](Changelog.md) for detailed information.



## Credits

- Thanks to [Acidanthera](https://github.com/acidanthera) for providing [AppleALC](https://github.com/acidanthera/AppleALC), [CPUFriend](https://github.com/acidanthera/CPUFriend), [HibernationFixup](https://github.com/acidanthera/HibernationFixup), [Lilu](https://github.com/acidanthera/Lilu), `USBPorts`, [VirtualSMC](https://github.com/acidanthera/VirtualSMC), and [WhateverGreen](https://github.com/acidanthera/WhateverGreen).

- Thanks to [alexandred](https://github.com/alexandred) and [hieplpvip](https://github.com/hieplpvip) for providing [VoodooI2C](https://github.com/alexandred/VoodooI2C).

- Thanks to [apianti](https://sourceforge.net/u/apianti), [blackosx](https://sourceforge.net/u/blackosx), [blusseau](https://sourceforge.net/u/blusseau), [dmazar](https://sourceforge.net/u/dmazar), and [slice2009](https://sourceforge.net/u/slice2009) for providing [Clover](https://sourceforge.net/projects/cloverefiboot).

- Thanks to [FallenChromium](https://github.com/FallenChromium), [Javmain](https://github.com/javmain), and [johnnync13](https://github.com/johnnync13) for valuable suggestions.

- Thanks to [hieplpvip](https://github.com/hieplpvip) and [syscl](https://github.com/syscl) for providing sample of DSDT patches.

- Thanks to [RehabMan](https://github.com/RehabMan) for providing [AppleBacklightFixup](https://github.com/RehabMan/AppleBacklightFixup), [EAPD-Codec-Commander](https://github.com/RehabMan/EAPD-Codec-Commander), [OS-X-Clover-Laptop-Config](https://github.com/RehabMan/OS-X-Clover-Laptop-Config), [OS-X-Voodoo-PS2-Controller](https://github.com/RehabMan/OS-X-Voodoo-PS2-Controller), and [SATA-unsupported](https://github.com/RehabMan/hack-tools/tree/master/kexts/SATA-unsupported.kext).

