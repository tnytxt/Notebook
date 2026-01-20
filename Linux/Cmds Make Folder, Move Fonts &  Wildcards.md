Create Directory Move Fonts Into It Using Wildcards

An example of creating a directory and moving fonts into that directory
while using wildcards to move only the fonts we require.

Create Font Directory For Custom Fonts
	
	sudo mkdir /usr/share/fonts/sample_fonts

Move all .ttf Fonts to New Directory
	
	sudo mv *.ttf /usr/share/fonts/sample_fonts

Explanation of the * wildcard

The * symbol is a wildcard that matches any sequence of characters.
So, *.ttf matches all files with the .ttf extension in the current directory.

Additional Tips:

- PERMISSIONS:
Ensure you have the necessary permissions to create and modify files in the
/usr/share/fonts directory. You may need to use sudo to gain root privileges.
- FONT REFRESH:
After moving fonts, you may need to refresh your font cache. This can be done
with the following command

	sudo fc-cache -fv
	
---

	
	TAGS: #Linux #Fonts #Directories #Wildcards #Move-Copy-Cmds
