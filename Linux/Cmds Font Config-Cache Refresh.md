Remove most Asian fonts:
	sudo apt-get remove "fonts-noto*"` 

Install useful non-Asian fonts:   
	sudo apt-get install fonts-noto-mono fonts-noto-unhinted fonts-noto-color-emoji`

Run this cmd when done:
	sudo dpkg-reconfigure fontconfig

Reruns Debian package config (prompts, config files). Use this if you changed package options or want to reset Debian's fontconfig package settings.

or

 sudo fc-cache -f -v

rebuilds fontconfig's font cache so changes take effect immediately.
Run dpkg-reconfigure first (if you need to change settings), then
fc-cache to apply changes.
