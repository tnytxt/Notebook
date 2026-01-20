Managing GNOME Logs (the graphical log viewer in GNOME-based Linux distributions like Ubuntu, Fedora, Arch, etc.) is quite straightforward. Here's a comprehensive guide on how to use and manage it effectively.

### 1. Opening GNOME Logs
- **App Menu**: Search for “Logs” or “GNOME Logs” in your applications menu.
- **Terminal**: Run `gnome-logs` in the terminal.
- **Keyboard shortcut** (optional): You can bind it to a custom shortcut in Settings → Keyboard → Shortcuts.

### 2. Basic Usage of GNOME Logs
GNOME Logs uses `systemd-journal` as its backend (journalctl), so it shows the same data as the `journalctl` command, but with a nice GUI.

#### Main categories on the left sidebar:
- **Important** – Critical errors and warnings (very useful to check first)
- **All** – Every log entry
- **System** – System-wide logs (kernel, systemd services, etc.)
- **Hardware** – Devices, USB, graphics, etc.
- **Applications** – Logs from apps (Flatpaks, Snap, etc.)
- **Security** – Audit logs, polkit, sudo, etc. (if auditd is enabled)

You can also search for specific services (e.g., `gdm`, `NetworkManager`, `firefox`) in the search bar.

### 3. Useful Tips & Tricks
| Task                                | How to do it in GNOME Logs                              |
|-------------------------------------|----------------------------------------------------------|
| Follow live logs                    | Click the ▶️ Play button at the top right                |
| Filter by boot                      | Click the clock icon → select “Current boot” or previous boots |
| Filter by time range                | Click the calendar/clock icon and pick a range |
| Show only errors/warnings           | Go to “Important” category or use search: `priority:err` |
| Search for a specific service       | Type the service name (e.g. `sshd`, `docker`, `bluetooth`) |
| Export logs                         | Select entries → right-click → Save selection as…        |

### 4. Managing the Journal Size (Very Important!)
By default, systemd stores logs in `/var/log/journal` and can grow quite large.

#### Check current journal size:
```bash
journalctl --disk-usage
```

#### Limit journal size (recommended for laptops/SSDs):
Edit or create the file `/etc/systemd/journald.conf` (needs sudo):

```ini
[Journal]
SystemMaxUse=100M      # Maximum disk space used (e.g., 100 MB)
SystemMaxFileSize=10M  # Max size per log file
SystemKeepFree=500M    # Always keep this much free on disk
RuntimeMaxUse=50M      # For /run/log/journal (tmpfs)
```

Then restart the service:
```bash
sudo systemctl restart systemd-journald
```

#### Vacuum (clean) old logs manually:
```bash
# Remove logs older than 30 days
sudo journalctl --vacuum-time=30d

# Limit total size to 200 MB
sudo journalctl --vacuum-size=200M

# Keep only the last 3 boots
sudo journalctl --vacuum-files=3
```

You can combine them:
```bash
sudo journalctl --vacuum-time=2weeks --vacuum-size=100M
```

### 5. Advanced: Use journalctl from terminal (often faster)
Since GNOME Logs is just a frontend, many people prefer the command line:

```bash
# Live tail
journalctl -f

# Show only errors
journalctl -p 3 -xb

# Follow a specific service
journalctl -u ssh.service -f

# Show logs since last boot
journalctl -b

# Show logs from previous boot
journalctl -b -1
```

### 6. Common Issues & Fixes
- GNOME Logs shows nothing → Your system may not have persistent journaling enabled.
  Fix:
  ```bash
  sudo mkdir -p /var/log/journal
  sudo systemd-tmpfiles --create --prefix /var/log/journal
  sudo systemctl restart systemd-journald
  ```

- Very slow on large journals → Limit size with the steps in section 4.

### Summary Cheat Sheet
| Goal                            | Command / Action                                      |
|---------------------------------|-------------------------------------------------------|
| Open GNOME Logs                 | `gnome-logs` or search “Logs”                         |
| Limit journal to ~100 MB        | Edit `/etc/systemd/journald.conf` → `SystemMaxUse=100M` |
| Clean old logs                  | `sudo journalctl --vacuum-time=30d`                   |
| Live view in terminal           | `journalctl -f`                                       |
| See only errors                 | `journalctl -p 3 -xb` or “Important” tab in GNOME Logs   |

That’s it! With these steps you can efficiently view, search, and manage logs on any modern GNOME-based Linux system.
