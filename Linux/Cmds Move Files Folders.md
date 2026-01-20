To move files and directories in Linux using the terminal, use the `mv` command:

```bash
mv source destination
```

**Common examples:**

- Move a file to a directory:
  ```bash
  mv file.txt /path/to/directory/
  ```

- Move a directory:
  ```bash
  mv my_folder /path/to/new_location/
  ```

- Move and rename a file at the same time:
  ```bash
  mv old_filename.txt new_filename.txt
  ```

- Move multiple files to a directory:
  ```bash
  mv file1.txt file2.txt file3.txt /path/to/directory/
  ```

- Move a file to current directory (use `.`):
  ```bash
  mv /path/to/file.txt .
  ```

- Move with confirmation (prompts before overwriting):
  ```bash
  mv -i source destination
  ```

**Tips:**
- Use `-v` flag to see what's being moved (verbose mode)
- Use `-f` flag to force move without prompting (overwrite without asking)
- Combine flags: `mv -iv source destination`
