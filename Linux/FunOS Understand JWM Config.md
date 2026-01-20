FunOS: Understand JWM Config

Documentation https://funos.org/documentation/

JWM (Joe’s Window Manager) is a lightweight and highly configurable window manager used as the default in FunOS. Like many minimalist window managers, JWM relies on plain-text XML files for its configuration, offering users complete control over their desktop environment.

At the heart of this configuration is the ~/.jwmrc file. This file serves as the main entry point for all other modular configuration components, and understanding its structure is essential for customizing your JWM desktop experience.

Table of Contents

    1. Backing Up Before Editing
    2. Accessing the Main JWM Configuration File
        a. File Manager
        b. Terminal
    3. Purpose of ~/.jwmrc
    4. Default Contents of ~/.jwmrc in FunOS
    5. Included Configuration Files
        5.1. ~/.config/jwm/keys
        5.2. ~/.config/jwm/menu
        5.3. ~/.config/jwm/preferences
        5.4. ~/.config/jwm/start
        5.5. ~/.config/jwm/theme
        5.6. ~/.config/jwm/tray
        5.7. ~/.config/jwm/icons
    6. Editing ~/.jwmrc
    7. Applying Changes
    8. Summary

1. Backing Up Before Editing

Before making changes to this file, it’s a good idea to back it up:

cp ~/.jwmrc ~/.jwmrc.bak

2. Accessing the Main JWM Configuration File

The main JWM configuration file is located at:

~/.jwmrc

This file resides in your home directory and is typically hidden (as indicated by the leading dot). You can access it using either the File Manager or Terminal:
a. File Manager

    Click Menu > File Manager
    Press Ctrl + H or click View > Show Hidden to reveal hidden files.
    Locate the .jwmrc file in your home directory and open the file with a text editor.

b. Terminal

mousepad ~/.jwmrc

This opens the file in the Mousepad text editor, allowing you to view or modify its contents.
3. Purpose of ~/.jwmrc

The ~/.jwmrc file is responsible for assembling the complete JWM environment by including various other configuration files. It functions as a modular framework that makes it easier to manage and edit specific aspects of the system independently, such as key bindings, the menu, tray, theme, and more.
4. Default Contents of ~/.jwmrc in FunOS

Below is the default content of ~/.jwmrc in FunOS:

<?xml version="1.0" encoding="UTF-8"?>
<JWM>
    <Include>$HOME/.config/jwm/menu</Include>
    <Include>$HOME/.config/jwm/tray</Include>
    <Include>$HOME/.config/jwm/theme</Include>
    <Include>$HOME/.config/jwm/icons</Include>
    <Include>$HOME/.config/jwm/preferences</Include>
    <Include>$HOME/.config/jwm/keys</Include>
    <Include>$HOME/.config/jwm/start</Include>
</JWM>

Let’s break down what each line does.
5. Included Configuration Files

Each <Include> directive pulls in another XML file that defines a specific aspect of JWM’s behavior or appearance. Here’s what each file does:
5.1. ~/.config/jwm/keys

Defines keyboard shortcuts (key bindings) used for window management and launching applications. For example, Alt + F4 to close windows or Ctrl + Alt + T to open a terminal.

    Learn more: Understanding the JWM Key Bindings Configuration in FunOS

5.2. ~/.config/jwm/menu

Defines the application menu structure, including custom launchers and links to the documentation, themes, and logout options.

    Learn more: Understanding the JWM Menu Configuration in FunOS

5.3. ~/.config/jwm/preferences

Controls general behavior like focus model, virtual desktops, double-click behavior, and window snapping.

    Learn more: Understanding the JWM Preferences Configuration in FunOS

5.4. ~/.config/jwm/start

Specifies which programs should automatically start when JWM launches (e.g., volume icon, network tray, wallpaper restore).

    Learn more: Understanding the JWM Startup Configuration in FunOS

5.5. ~/.config/jwm/theme

Defines the current active visual theme (colors, fonts, border widths, etc.). This file is typically a copy of one of the themes from ~/.config/jwm/themes/.
5.6. ~/.config/jwm/tray

Configures the tray (panel), including layout, launcher buttons, the task list, system clock, and workspace pager.

    Learn more: Understanding the JWM Tray Configuration in FunOS

5.7. ~/.config/jwm/icons

Specifies the directories where JWM should look for application icons used in the menu and tray.
6. Editing ~/.jwmrc

In most cases, you do not need to manually edit ~/.jwmrc unless you want to include or exclude configuration components. All individual configurations are modular and maintained in their respective files under ~/.config/jwm/.

However, if you ever need to add a new include directive or test custom configurations, you can do so in this file.

Example:

<Include>$HOME/.config/jwm/left-tray</Include>

Make sure the included file exists and follows proper XML structure to avoid loading issues.
7. Applying Changes

After editing any JWM configuration file (including ~/.jwmrc), you must restart JWM for the changes to take effect.

To apply changes:

Run the command in Terminal:

jwm -restart

8. Summary

The ~/.jwmrc file in FunOS serves as the master configuration hub for JWM. By including separate files for keys, menus, themes, and more, it provides a clean and modular way to manage your desktop environment. Understanding how this file works will give you the confidence to customize and fine-tune your FunOS experience to suit your workflow.
