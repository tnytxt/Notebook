edited: 24.12.24

**Creating a Font Directory:**

To create a new directory for custom fonts, use the following command:

```
sudo mkdir /usr/share/fonts/sample_fonts
```

**Moving Fonts to the New Directory:**

To move all `.ttf` font files from the current directory to the newly created directory, use:

```
sudo mv *.ttf /usr/share/fonts/sample_fonts
```

**Explanation of the `*` wildcard:**

The `*` symbol is a wildcard that matches any sequence of characters. So, `*.ttf` matches all files with the `.ttf` extension in the current directory.

**Additional Tips:**

-   **Permissions:** Ensure you have the necessary permissions to create and modify files in the `/usr/share/fonts` directory. You may need to use `sudo` to gain root privileges.
-   **Font Refresh:** After moving fonts, you may need to refresh your font cache. This can be done with the following command:
```
sudo fc-cache -fv
```

By following these steps, you can easily organize and manage your custom fonts on your system.

#How-to #linux #filters #directories #wildcards #mv #cmds #cache #fonts #font-cache  