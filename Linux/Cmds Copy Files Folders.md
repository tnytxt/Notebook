To copy files and directories in Linux using the terminal, use the `cp` command:

`cp` <source> <destination>

**Common examples:**

- Copy a file:
  `cp file.txt /path/to/directory/`

- Copy a file and rename it:
  `p original.txt copy.txt`

- Copy a directory and its contents (recursive):
  `cp -r my_folder /path/to/new_location/`

- Copy multiple files to a directory:
  `cp file1.txt file2.txt file3.txt /path/to/directory/`

- Copy a file to current directory (use `.`):
  `cp /path/to/file.txt .`

- Copy with confirmation (prompts before overwriting):
  `cp -i source destination`

**Common flags:**
- `-r` — copy directories recursively (required for directories)
- `-v` — verbose mode (shows what's being copied)
- `-i` — interactive mode (prompts before overwriting)
- `-f` — force copy without prompting (overwrite without asking)
- Combine flags: `cp -rv source destination`

**Key difference from `mv`:** `cp` creates a copy while leaving the original file/directory intact, whereas `mv` moves it (removes from source).
