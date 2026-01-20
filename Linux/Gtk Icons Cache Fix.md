Gtk Icons Cache Fix

Run gtk-update-icon-cache on every theme directory in the system
and user icon folders with one command. For system-wide themes:


For icons in home
```
sudo gtk-update-icon-cache -f -t /usr/share/icons/<theme-name>
```

```
sudo find /usr/share/icons -maxdepth 1 -mindepth 1 -type d -print0 \
| xargs -0 -I{} sudo gtk-update-icon-cache -f "{}"
```


For per-user themes (~/.icons and ~/.local/share/icons):  


```
find ~/.icons ~/.local/share/icons -maxdepth 1 -mindepth 1 -type d -print0 \
| xargs -0 -I{} gtk-update-icon-cache -f "{}"
```


To do both (system + user) in one run:

```
sudo bash -c 'find /usr/share/icons ~/.icons ~/.local/share/icons -maxdepth 1 -mindepth 1 -type d -print0' \
| xargs -0 -I{} sudo gtk-update-icon-cache -f "{}"
```

If gtk-update-icon-cache is missing, install it first:

	sudo apt update
	sudo apt install libgtk-3-bin


Log out and back in (or restart the shell) after running these.

&ndsp:


Tags:
  fonts-Icons, linux, to-edit