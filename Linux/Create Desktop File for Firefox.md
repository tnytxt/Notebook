### ✅ Step-by-Step Solution:

1. **Create the directory if it doesn't exist:**

```bash
sudo mkdir -p /usr/local/share/applications
```

This creates the full path if it doesn't already exist.

2. **Create the desktop file:**

```bash
sudo nano /usr/local/share/applications/firefox.desktop
```

3. **Paste the following content into the file:**

```text
[Desktop Entry]
Version=1.0
Type=Application
Name=Firefox
Comment=Browse the Web
Exec=/opt/firefox/firefox %u
Icon=firefox
Categories=Network;WebBrowser;
Terminal=false
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/atom+xml;
StartupNotify=true
```

4. **Save and exit** by pressing `Ctrl+X`, then `Y`, then `Enter`.

5. **Make the desktop file executable:**

```bash
sudo chmod +x /usr/local/share/applications/firefox.desktop
```

6. **Update the desktop database so GNOME recognizes the new entry:**

```bash
sudo update-desktop-database
```

7. **Verify it works:**
- Press the **Activities** button (top-left corner).
- Type **Firefox** and see if it appears in the search results.

Let me know if you need help finding the Firefox icon or if you're still having trouble!
