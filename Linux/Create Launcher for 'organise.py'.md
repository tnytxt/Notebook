# Create Launcher for 'organise.py' Script

Note: place the script in download directory.

- Edit your script so it can run directly:
Add this line: #!/usr/bin/env python3
at the top of "/home/lee/Downloads/organise.py"

- e.g.
#!/usr/bin/env python3
import os
import shutil

This tells Linux which interpreter to use.

- Make executable:
chmod +x /home/lee/Downloads/organise.py

- Create desktop launcher:
Open text editor Paste following content

[Desktop Entry]
Type=Application
Name=Organise Downloads
Exec=/home/lee/Downloads/organise.py
Icon=folder
Terminal=true

- Save file as:
/home/lee/Desktop/organise.desktop

(If Desktop name different like *~/berti-big-bollocks* etc., use that folder.)

- Make launcher executable:
chmod +x /home/lee/Desktop/organise.desktop

- Allow GNOME to trust launcher:
The first time you run it, GNOME shows a warning saying it’s “untrusted.”
Just click "Allow Launching"

-🎉 Done!

Now you have a simple desktop icon.
When you double-click it:

- A terminal opens
- Your organise.py script runs
- Files get sorted automatically

You can also add:

✔ A custom icon
✔ make it run silently (no terminal window)
✔ add logs so you can see what was moved
✔ add “undo” support















