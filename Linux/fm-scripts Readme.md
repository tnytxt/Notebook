# Enhanced File Manager Actions for Linux

A collection of file manager actions that enhance your workflow. Useful right-click options to simplify common tasks across GNOME, KDE, Xfce, and more.

[![Release](https://img.shields.io/github/v/release/cfgnunes/fm-scripts?labelColor=333333&color=339933)](#installation)
[![Stars](https://img.shields.io/github/stars/cfgnunes/fm-scripts?style=flat&labelColor=333333&color=339933)](#installation)
[![License](https://img.shields.io/github/license/cfgnunes/fm-scripts?labelColor=333333&color=339933)](#installation)
[![Supported](https://img.shields.io/badge/Supported-GNOME%20%7C%20KDE%20%7C%20MATE%20%7C%20Xfce%20%7C%20Cinammon%20%7C%20LXQt-339933?labelColor=333333)](#compatibility)
## Installation

### Option 1: Online installation (recommended)

You can use either **curl** or **wget**. Choose **one** of the following commands and run it in your terminal:

#### 🚀 Using `curl`

```bash
bash -c "$(curl -fsSL https://cfgnunes.github.io/fm-scripts/install.sh)"
```

#### 🚀 Using `wget`

```bash
bash -c "$(wget -qO- https://cfgnunes.github.io/fm-scripts/install.sh)"
```

### Option 2: Local installation

After cloning this repository, run the following command:

```bash
bash install.sh
```

## Advantages

While numerous *Nautilus Scripts* are available for file managers on the web, many suffer from poor functionality, lack of error checking, and dependency management. Some scripts only work with files that don't have special characters in their names, among other limitations. To address these shortcomings, I have developed my own set of scripts, which offer the following advantages:

- **Parallel task execution**: Processes multiple files simultaneously. Very fast!
- **Multi-language support**: Automatically detects the system language and displays messages in the appropriate language.
- **Progress dialog**: Displays a progress dialog and allows interruption of tasks at any time.
- **Dependency management**: Prompts users to install any missing dependencies.
- **Status notifications**: Notifies users of dependency errors and types.
- **Keyboard accelerators**: Provides keyboard shortcuts for some scripts.
- **Easy access to recent scripts**: Includes a menu, _Accessed recently_, to quickly access recently used scripts.
- **Category-based installation:** The installer allows you to choose which script categories you want to install, so there's no need to install everything.
- **Log file**: Produces an `Errors.log` file when a task finishes with an error.
- **File manager compatibility**: Designed for major file managers like GNOME Files (Nautilus), Nemo, Caja, Dolphin, and Thunar.
- **Distro compatibility**: Works on major GNU/Linux distributions, such as Debian, Ubuntu, Fedora, and Arch Linux.
- **Easy adaptation**: Scripts can be easily copied and adapted for other purposes.
- **Bash implementation**: All scripts are implemented in Bash. So, the scripts work well in the shell (without a graphical interface) and file managers.
- **Shell script validation**: All scripts have been checked using [ShellCheck](https://github.com/koalaman/shellcheck).

**Design philosophy:** Fewer clicks, dependencies, and verbose notifications, with a simple and intuitive directory structure.

## Keyboard accelerators

| Key                 | Action                            |
| ------------------- | --------------------------------- |
| `F3`                | Code Editor                       |
| `F4`                | Terminal                          |
| `F7`                | Disk Usage Analyzer               |
| `<Control>E`        | Extract here                      |
| `<Control><Alt>G`   | Compress to 'tar.gz'              |
| `<Control><Alt>S`   | Compress to 'tar.zst'             |
| `<Control><Alt>X`   | Compress to 'tar.xz'              |
| `<Control><Alt>Z`   | Compress to 'zip'                 |
| `<Control><Alt>I`   | Show files information            |
| `<Control><Alt>M`   | Show files MIME type              |
| `<Control><Alt>0`   | Find empty files                  |
| `<Control><Alt>J`   | Find junk files                   |
| `<Control><Alt>U`   | Find duplicate files              |
| `<Control><Alt>H`   | List hidden files                 |
| `<Control><Alt>P`   | List permissions and owners       |
| `<Control><Alt>B`   | List largest files                |
| `<Control><Alt>R`   | List recent files                 |
| `<Control><Alt>W`   | Text: List issues                 |
| `<Control><Alt>C`   | Copy file names                   |
| `<Control><Alt>V`   | Paste clipboard content           |
| `<Control><Shift>V` | Paste as symbolic link            |
| `<Control><Shift>C` | Compare items                     |
| `<Control><Shift>O` | Open item location                |
| `<Control><Shift>H` | Compute all checksums             |
| `<Control><Shift>E` | Find empty directories            |
| `<Control><Shift>P` | Rename: Remove parentheses blocks |
| `<Control><Shift>G` | Git: Clone URLs                   |
| `<Control><Shift>R` | Git: Reset and pull               |
| `<Control><Shift>X` | URL: Download file                |

## Compatibility

| File manager           | Environment | Menu integration | Application shortcuts | Keyboard accelerators | Menu "Accessed recently" |
| ---------------------- | ----------- | ---------------- | --------------------- | --------------------- | ------------------------ |
| GNOME Files (Nautilus) | GNOME       | 🟢                | 🟢                     | 🟢                     | 🟢                        |
| Nemo                   | Cinnamon    | 🟢                | 🟢                     | 🟢                     | 🟢                        |
| Caja                   | MATE        | 🟢                | 🟢                     | 🟢                     | 🟢                        |
| Thunar                 | Xfce        | 🟢                | 🟢                     | 🟢                     | 🔴                        |
| Dolphin                | KDE Plasma  | 🟢                | 🟢                     | 🔴                     | 🔴                        |
| PCManFM-Qt             | LXQt        | 🟢                | 🟢                     | 🔴                     | 🔴                        |
| PCManFM                | LXDE        | 🟢                | 🟢                     | 🔴                     | 🔴                        |

## Batch mode for large file selections

For very large selections (e.g., 10,000 input files), use **batch mode**: place everything inside a folder named `batch` and run the action on that folder. The scripts will process the files individually and avoid the "argument list too long" error.

#Linux #Scripts