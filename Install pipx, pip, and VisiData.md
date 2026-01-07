Below is a **clear, beginner-friendly how-to** for installing **pipx**, **pip**, and **VisiData** **without using the Debian package**.
This follows modern Debian rules and avoids the *externally-managed environment* error you hit.

---

# How to install pipx, pip, and VisiData (non-Debian version)

This method:

* ✔️ Uses **pipx** (the safest way for Python apps)
* ✔️ Avoids breaking system Python
* ✔️ Installs the **latest VisiData**
* ✔️ Works on Debian 12 / 13

---

## Step 1: Install required system tools

Open a terminal and run:

```bash
sudo apt update
sudo apt install python3-full pipx
```

What this does:

* `python3-full` → full Python install (needed for pipx)
* `pipx` → installs Python apps safely in isolation

---

## Step 2: Enable pipx in your PATH (important)

Run this **once**:

```bash
pipx ensurepath
```

Then **restart your terminal**
(or log out and back in).

To check it worked:

```bash
echo $PATH | grep .local/bin
```

If you see `~/.local/bin`, you’re good.

---

## Step 3: (Optional) Install pip for your user

You usually **don’t need pip** when using pipx, but if you want it:

```bash
python3 -m ensurepip --user
```

Check:

```bash
pip --version
```

> ⚠️ Do **not** use `sudo pip install` on Debian

---

## Step 4: Install VisiData using pipx (recommended)

Now install VisiData:

```bash
pipx install visidata
```

This:

* Creates an isolated environment
* Installs the latest version
* Makes `vd` available system-wide (for you)

---

## Step 5: Run VisiData

Try:

```bash
vd
```

Or:

```bash
visidata
```

You should see VisiData launch 🎉

---

## Step 6: Confirm where it’s coming from (optional)

To verify you’re **not using the Debian package**:

```bash
which vd
```

Expected output:

```
/home/lee/.local/bin/vd
```

If you see `/usr/bin/vd`, the Debian package is still installed.

---

## (Optional) Remove the Debian version if present

If you previously installed it via `apt` and want to avoid confusion:

```bash
sudo apt remove visidata
```

Then confirm again:

```bash
which vd
```

---

## Quick recap (copy-paste version)

```bash
sudo apt update
sudo apt install python3-full pipx
pipx ensurepath
# restart terminal
pipx install visidata
vd
```

---

## When to use each tool (simple rule)

* **apt** → system libraries, desktop apps
* **pipx** → Python command-line tools (✔ VisiData)
* **pip** → inside virtual environments only


