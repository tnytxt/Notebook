## Create New File(s) with the `touch` Command

The `touch` command is used to create empty files.

### Create a single file

```
touch filename
```

### Create a file inside a specific directory

Option 1: Navigate to the directory first

```
cd Documents
touch filename
```

Option 2: Create the file using a relative or absolute path

```
touch Documents/filename
```

Option 3: Open a terminal directly in the target directory and run

```
touch filename
```

### Create multiple files using brace expansion

Brace expansion allows you to create several files at once.

Example: create four files numbered 1 through 4

```
touch {1..4}
```

Resulting files:

```
📄 1
📄 2
📄 3
📄 4
```


Notes:

* `touch` will not overwrite existing files; it only updates their timestamps.
* Brace expansion works in most modern shells (bash, zsh).
