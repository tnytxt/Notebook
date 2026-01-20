
> This note shows how to create simple Linux shortcuts to run `git pull` commands. It covers making a clickable desktop launcher, adding desktop notifications when the update finishes, running the update automatically on login, and using one shortcut to update multiple Git repositories at once. The steps are written for a GNOME/Debian system and focus on small, reusable scripts that fit into a daily workflow.

---

## Easy method: Desktop shortcut (double-click icon)

This creates a clickable icon that runs the command.
### 1. Create a small script

Open a terminal and run:

```bash
nano /home/lee/git-pull-fm-scripts.sh
```

Paste this in:

```bash
#!/usr/bin/env bash

cd /home/lee/Git-clones/fm-scripts || exit
git pull
```

Save and exit:

- **Ctrl + O**, Enter
    
- **Ctrl + X**
    
Make it executable:

```bash
chmod +x /home/lee/git-pull-fm-scripts.sh
```

---

### 2. Create a desktop shortcut

Create a `.desktop` file:

```bash
nano /home/lee/Desktop/Git Pull fm-scripts.desktop
```

Paste this:

```ini
[Desktop Entry]
Type=Application
Name=Git Pull (fm-scripts)
Comment=Update fm-scripts repository
Exec=/home/lee/git-pull-fm-scripts.sh
Icon=utilities-terminal
Terminal=true
```

Save and exit.

Make it executable:

```bash
chmod +x /home/lee/Desktop/Git\ Pull\ fm-scripts.desktop
```

---

### 3. Allow it to run

On GNOME:

- Right-click the icon
    
- Click **“Allow Launching”**
    

Now you can **double-click the icon** and it will:

- Open a terminal
    
- `cd` into the repo
    
- Run `git pull`
    

---

# More options

## 4. Alternative (KB shortcut instead of icon)

If you prefer a key combo:

1. Open **Settings → Keyboard → Custom Shortcuts**
    
2. Add new shortcut
    
    - **Name:** Git Pull fm-scripts
        
    - **Command:**
        
        ```bash
        gnome-terminal -- bash -c "cd /home/lee/Git-clones/fm-scripts && git pull; exec bash"
        ```
        
    - **Shortcut:** pick one (e.g. `Ctrl + Alt + G`)
        

Press the keys → repo updates.

---
Nice — here are all three, with the simplest first. You can mix-and-match.

## 5. Add a notification when it finishes (to your existing script)

Edit your script:

```bash
nano /home/lee/git-pull-fm-scripts.sh
```

Replace it with:

```bash
#!/usr/bin/env bash

REPO="/home/lee/Git-clones/fm-scripts"

cd "$REPO" || exit 1

# Run pull and capture output + status
OUT="$(git pull 2>&1)"
STATUS=$?

if [ $STATUS -eq 0 ]; then
  notify-send "Git pull: fm-scripts" "$OUT"
  exit 0
else
  notify-send "Git pull FAILED: fm-scripts" "$OUT"
  exit $STATUS
fi
```

Make sure `notify-send` exists:

```bash
command -v notify-send || sudo apt install libnotify-bin
```

Now when you run the shortcut, you’ll get a desktop notification with the result.

---

## 6. Auto-run on login (GNOME Startup Apps)

This is the cleanest way on GNOME.

1. Open **“Startup Applications”** (you can search it in Activities).
    
2. Click **Add**
    
3. Name: `Git pull fm-scripts`
    
4. Command:
    
    ```bash
    /home/lee/git-pull-fm-scripts.sh
    ```
    

Done — it’ll run each time you log in.

Tip: if you _don’t_ want a terminal window popping up, set your `.desktop` launcher to `Terminal=false` (but the notification will still show).

---

## 7. One shortcut that updates multiple repos (recommended)

Create a new script:

```bash
nano /home/lee/git-pull-all.sh
```

Paste:

```bash
#!/usr/bin/env bash

repos=(
  "/home/lee/Git-clones/fm-scripts"
  # add more like:
  # "/home/lee/Git-clones/another-repo"
)

summary=""
fail=0

for repo in "${repos[@]}"; do
  if [ ! -d "$repo/.git" ]; then
    summary+="$repo: not a git repo\n"
    fail=1
    continue
  fi

  out="$(cd "$repo" && git pull 2>&1)"
  status=$?

  name="$(basename "$repo")"
  if [ $status -eq 0 ]; then
    summary+="$name: $out\n"
  else
    summary+="$name: FAILED - $out\n"
    fail=1
  fi
done

if [ $fail -eq 0 ]; then
  notify-send "Git pull: all repos" "$(printf "%b" "$summary")"
else
  notify-send "Git pull: some failures" "$(printf "%b" "$summary")"
fi
```

Make it executable:

```bash
chmod +x /home/lee/git-pull-all.sh
```

Now point your desktop shortcut (or keyboard shortcut, or login startup) at:

```bash
/home/lee/git-pull-all.sh
```

To add more repos, just add more paths in the `repos=( ... )` list.

---
# Script: auto-update all repos in a folder

> Here’s a drop-in script for **#3** that **automatically finds every Git repo** inside a folder (like `/home/lee/Git-clones`), runs `git pull` on each, and shows **one notification** at the end.

Create it:

```bash
nano /home/lee/git-pull-all-auto.sh
```

Paste this:

```bash
#!/usr/bin/env bash
set -u

ROOT="/home/lee/Git-clones"   # <- change this if needed

# Ensure notifications work (Debian/Ubuntu: sudo apt install libnotify-bin)
if ! command -v notify-send >/dev/null 2>&1; then
  echo "notify-send not found. Install with: sudo apt install libnotify-bin"
fi

summary=""
fail=0
count=0

# Find .git folders up to 2 levels deep (fast + sensible for a clones folder)
while IFS= read -r gitdir; do
  repo="${gitdir%/.git}"
  name="$(basename "$repo")"
  count=$((count + 1))

  out="$(cd "$repo" && git pull 2>&1)"
  status=$?

  if [ $status -eq 0 ]; then
    summary+="$name: $out\n"
  else
    summary+="$name: FAILED - $out\n"
    fail=1
  fi
done < <(find "$ROOT" -maxdepth 2 -type d -name .git 2>/dev/null)

if [ $count -eq 0 ]; then
  notify-send "Git pull: no repos found" "No .git folders found under:\n$ROOT"
  exit 0
fi

title="Git pull: $count repo(s)"
if [ $fail -eq 0 ]; then
  notify-send "$title" "$(printf "%b" "$summary")"
else
  notify-send "$title (some failures)" "$(printf "%b" "$summary")"
fi
```

Make it executable:

```bash
chmod +x /home/lee/git-pull-all-auto.sh
```

Run it:

```bash
/home/lee/git-pull-all-auto.sh
```

### If you want it to search deeper

Change this line:

```bash
-maxdepth 2
```

to something like:

```bash
-maxdepth 4
```

### If notifications don’t work

Install the notifier:

```bash
sudo apt install libnotify-bin
```

If you want, I can also give you a version that **skips repos with uncommitted changes**, or **logs output to a file** as well as notifying.
