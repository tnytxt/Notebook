**This is a structured way to diagnose Bluetooth failures on Debian using Gnome.
The adapter is visible but cannot connect or pair. Follow the steps in order; do not skip.**

First, confirm Bluetooth service state and logs.

Run:

```
systemctl status bluetooth
```

You want `Active: active (running)`. If it is inactive or failed:

```
sudo systemctl restart bluetooth
```

Now check recent Bluetooth errors:

```
journalctl -u bluetooth -n 100 --no-pager
```

Look specifically for:

* `Failed to set mode`
* `Authentication failed`
* `Protocol not available`
* `br-connection-profile-unavailable`
* `org.bluez.Error.*`

These messages determine the failure class.

Second, verify the adapter itself is not soft- or hard-blocked.  
Installation of `rfkill` needed for this cmd to work  

Run:

```
rfkill list
```

If Bluetooth is blocked:

```
sudo rfkill unblock bluetooth
```

Then confirm the controller is detected:

```
bluetoothctl list
```

If **no controller appears**, this is a kernel/firmware issue, not GNOME.

Third, reset the Bluetooth stack completely (common fix).

Stop Bluetooth:

```
sudo systemctl stop bluetooth
```

Remove cached device data (this deletes remembered devices):

```
sudo rm -rf /var/lib/bluetooth/*
```

Start Bluetooth again:

```
sudo systemctl start bluetooth
```

Now try pairing again after rebooting.

Fourth, test pairing using `bluetoothctl` instead of GNOME (this isolates UI issues).

Run:

```
bluetoothctl
```

Inside the prompt:

```
power on
agent on
default-agent
scan on
```

When the device appears:

```
pair XX:XX:XX:XX:XX:XX
connect XX:XX:XX:XX:XX:XX
trust XX:XX:XX:XX:XX:XX
```

If pairing fails here too, GNOME is not the cause.

Fifth, confirm required packages and versions.

Check:

```
dpkg -l | grep -E 'bluez|blueman'
```

You should have:

* `bluez`
* `bluez-tools` (optional)
* `gnome-bluetooth` or `gnome-bluetooth-3.0`

If `blueman` is installed, temporarily remove it; it sometimes conflicts with GNOME:

```
sudo apt remove blueman
```

Sixth, check kernel and firmware (very common on Debian).

Identify the adapter:

```
lsusb
```

or (for internal devices):

```
lspci | grep -i bluetooth
```

Then check firmware loading:

```
dmesg | grep -i bluetooth
dmesg | grep -i firmware
```

If you see firmware load failures (e.g. Intel, Realtek, Broadcom), install firmware:

```
sudo apt install firmware-linux firmware-iwlwifi firmware-realtek
```

Then reboot.

Seventh, test profile-level failures (connects but immediately drops).

If devices pair but won’t connect, PulseAudio / PipeWire profiles may be broken.

Check audio backend:

```
pactl info | grep "Server Name"
```

If using PipeWire, restart it:

```
systemctl --user restart pipewire pipewire-pulse wireplumber
```

Then reconnect the device.

Eighth, confirm BlueZ version compatibility.

Check:

```
bluetoothd -v
```

Older BlueZ versions have pairing issues with newer devices. On Debian Stable this is common. If your device is recent (Bluetooth 5.x), this may be the root cause.

If so, options are:

* Enable Debian backports and upgrade `bluez`
* Test with a live USB of a newer distro to confirm hardware compatibility

Before proceeding further, provide the following outputs (paste exactly):

1. `journalctl -u bluetooth -n 50`
2. `bluetoothctl list`
3. `rfkill list`
4. `bluetoothctl` pairing error output
5. Adapter model from `lsusb` or `lspci`

With those, the failure can be identified precisely.
