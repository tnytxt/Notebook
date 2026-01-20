Sample cmds 
```
pm disable-user --user 0 com.android.chrome` 
```

```
pm uninstall -k --user 0 com.google.android.youtube`⁠
```
Note: When in shell / $ remove adb from command
### ADB Commands

- `adb devices` - shows all connected adb devices
- `adb shell` - launches a shell on the device
- `adb shell pm list packages` - list all installed packages on the device
- `adb shell pm list packages -3"|cut -f 2 -d ":` - lists all user installed packages
- `adb push <local> <remote>` - pushes the file to
- `adb pull <remote> [<local>]` - pulls the file to . If isn’t specified, it will pull to the current folder.
- `adb logcat` - allows you to view the device log in real-time. You can use adb logcat -b radio to view radio logs, and adb logcat -C to view logs in colour
- `adb install <file>` - installs the given .apk file to your device
- `adb uninstall com.packagename` - uninstalls package from shell pm list packages

- _Note: if you encounter “[DELETE_FAILED_INTERNAL_ERROR]” type this to bypass:_ `adb shell pm uninstall --user 0 <appname>`

- `adb reboot` - reboots system
- `adb reboot bootloader` - reboots to bootloader
- `adb reboot recovery` - reboots into recovery mode
- `adb reboot fastboot` - reboots into fastboot mod
### Fastboot Commands

- `fastboot devices` - shows all connected devices
- `fastboot reboot` - reboots device - can add bootloader, recovery, and fastboot
- `fastboot oem device-info` - shows oem bootloader status (unlocked or locked)
- `fastboot oem unlock` - unlocks oem phones - _note: aosp and unlocked phones don’t need this_
- `fastboot flashing unlock` - unlocks system for custom rom in pixel and other phones
- `fastboot flashing unlock_critical` - unlocks bootloader and system partitions - _note: this isn’t generally needed_
- `fastboot format:ext4 userdata` - format userdata on device - _note: this will erase your entire device_
- `fastboot boot recovery.img` - test recovery image without flashing
- `fastboot flash recovery recovery.img` - flash recovery image then run `fastboot reboot recovery` to boot into it.
- `fastboot flash boot boot.img` - flash boot image - this is the kernel
- `fastboot -w` - wipes device
- `fastboot update </path/to/your/Rom.zip>` - flashes zip to the device