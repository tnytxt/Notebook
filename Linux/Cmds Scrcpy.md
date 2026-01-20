# Scrcpy cmds

Ensure USB debugging on and USB mode = MTP (not CHARGE).

1. Basic:
scrcpy

2. Specific device:
scrcpy -s <device_serial>

3. Resolution:
scrcpy --max-size <width>

4. Bitrate:
scrcpy --bit-rate <bitrate>

5. Fullscreen:
scrcpy --fullscreen

6. No display (control only):
scrcpy --no-display

7. Record:
scrcpy --record file.mp4

8. Keyboard shortcuts modifier:
scrcpy --shortcut-mod=<modifier>

9. Audio output:
scrcpy --audio <output>

10. Prevent screen off:
scrcpy --stay-awake

11. Rotation:
scrcpy --rotation <0|90|180|270>

12. Custom adb:
scrcpy --adb=<path_to_adb>

13. Show touches:
scrcpy --show-touches

14. Window title:
scrcpy --window-title <title>

15. Codec:
scrcpy --codec <codec>

Combine options as needed. For all options:
scrcpy --help

#Linux #Scrcpy #Android #Cmds
