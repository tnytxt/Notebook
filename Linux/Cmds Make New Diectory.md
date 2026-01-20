To create a new directory in Linux using the terminal, use the `mkdir` command:

```bash
mkdir directory_name
```

**Common examples:**

- Create a single directory:
  ```bash
  mkdir my_folder
  ```

- Create multiple directories at once:
  ```bash
  mkdir folder1 folder2 folder3
  ```

- Create nested directories (parent directories are created automatically):
  ```bash
  mkdir -p path/to/nested/directory
  ```
  The `-p` flag creates parent directories if they don't exist.

- Create a directory with spaces in the name (use quotes):
  ```bash
  mkdir "my folder name"
  ```

That's it! The directory will be created in your current working directory. You can verify it was created by listing files with `ls`.
