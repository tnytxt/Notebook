Create Auto Maint Timer for Flatpack

Keeping Flatpak clean with a **maintenance schedule** ensures your system stays lean, secure, and efficient — especially on Arch Linux, where simplicity and control matter.

Well create a **simple, automated maintenance schedule** using **`systemd` timers** (the Arch Way 🐧), so `flatpak uninstall --unused` runs automatically — no manual work needed.

---

## 🛠️ Goal:
Automatically clean unused Flatpak runtimes and old versions **once a month**.

We’ll use:
- A **custom systemd service** (to run the command)
- A **timer unit** (to schedule it)

---

### ✅ Step 1: Create the Service File

Open a terminal and run:

```bash
sudo nano /etc/systemd/system/flatpak-cleanup.service
```

Paste this content:

```ini
[Unit]
Description=Remove unused Flatpak runtimes and old versions
After=flatpak-system-helper.service

[Service]
Type=oneshot
ExecStart=/usr/bin/flatpak uninstall --unused -y
RemainAfterExit=no
User=root

[Install]
WantedBy=multi-user.target
```

> 🔍 This service runs `flatpak uninstall --unused` silently (`-y` = auto-confirm).

Save & exit:
- **Nano**: `Ctrl+O` → `Enter` → `Ctrl+X`

---

### ✅ Step 2: Create the Timer File

Now create the timer:

```bash
sudo nano /etc/systemd/system/flatpak-cleanup.timer
```

Paste this:

```ini
[Unit]
Description=Monthly cleanup of unused Flatpak runtimes
Requires=flatpak-cleanup.service

[Timer]
OnCalendar=monthly
Persistent=true
OnBootSec=15min

[Install]
WantedBy=timers.target
```

> ⏱️ This runs the cleanup **once per month**, even if your machine was off during the last run (`Persistent=true`).

---

### ✅ Step 3: Enable and Start the Timer

```bash
sudo systemctl daemon-reexec
sudo systemctl enable flatpak-cleanup.timer --now
```

> This activates the timer and starts it immediately.

---

### ✅ Step 4: Verify It’s Active

Check if the timer is scheduled:

```bash
systemctl list-timers | grep flatpak
```

You should see something like:

```
next                        left       unit                      activation
Sun 2025-04-06 00:00:00 CEST  2 weeks left  flatpak-cleanup.timer       n/a
```

🎉 Success! Your system will now **automatically clean Flatpak clutter monthly**.

---

## 🧼 Optional: Add a Log (For Peace of Mind)

Want to know when it runs? Modify the **service file** to log:

Update `ExecStart` like this:

```ini
ExecStart=/bin/sh -c '/usr/bin/flatpak uninstall --unused -y >> /var/log/flatpak-cleanup.log 2>&1'
```

And create the log file:

```bash
sudo touch /var/log/flatpak-cleanup.log
sudo chown root:root /var/log/flatpak-cleanup.log
```

Now every run is recorded — great for audits or debugging.

---

Need a version that runs weekly? Or want to include other cleanup tasks (like `paccache` for pacman)? I’ll tailor it for you — just ask! 💬✨

Tags:
  A.I, flatpack, linux, systemd