Rclone - Backup & sync and use yad for progress display

updated: Dec 2024


### Table of Contents

1. **Introduction**
   - Overview of Rclone for syncing and backing up files

2. **Step-by-Step Guide to Sync and Backup Using Rclone**
   1. **Step 1: Verify Your Rclone Configuration**
      - Command to check remote configurations
   2. **Step 2: Syncing Files**
      - Syntax for the `rclone sync` command
      - My actual command
      - Example of syncing files
   3. **Step 3: Backing Up Files**
      - Syntax for the `rclone copy` command
      - Example of backing up files
   4. **Step 4: Additional Options**
      - Useful flags for Rclone commands
   5. **Step 5: Scheduling Backups**
      - Creating a cron job for automated backups

3. **Conclusion**
   - Summary of using Rclone for backups

4. **Using YAD to Show Progress**
   - Overview of YAD and its purpose

5. **Example of Using YAD with Rclone**
   1. **Install YAD**
   2. **Bash Script for Rclone Sync with YAD**
      - Example script for Rclone with YAD
   3. **Make the Script Executable**
   4. **Run the Script**
   5. **Important Notes**
      - Progress output and error handling

6. **Fish Shell Compatibility**
   1. **Fish Shell Script for Rclone Sync with YAD**
      - Example Fish script for Rclone with YAD
   2. **Steps to Use the Script**
      - Creating, making executable, and running the Fish script
   3. **Important Notes for Fish Script**
      - YAD progress output and error handling considerations

7. **Final Thoughts**
   - Enhancing user experience with YAD and Rclone

This TOC provides a structured overview of the content, making it easier to navigate through the different sections related to Rclone and YAD.

To sync and back up files using Rclone, you can use its powerful command-line interface to perform various operations. Since you already have Rclone set up and mounted to a cloud storage drive, here’s a step-by-step guide on how to sync and back up your files:

### Step 1: Verify Your Rclone Configuration

Before proceeding, ensure that your Rclone configuration is set up correctly. You can check your remote configurations by running:

```bash
rclone listremotes
```

This command will display a list of configured remotes (e.g., your cloud storage).

### Step 2: Syncing Files

To sync files from your local directory to your cloud storage, you can use the `rclone sync` command. The basic syntax is:

```bash
rclone sync /path/to/local/directory remote:remote_directory
```

- Replace `/path/to/local/directory` with the path to the local folder you want to back up.
- Replace `remote:remote_directory` with your configured remote name and the target directory in your cloud storage.

**Example:**

```bash
rclone sync /home/user/myfolder remote:mybackupfolder
```
 My actual cmd 
 ```
rclone sync /home/lee/Desktop/Notes gdrive:My-Backup-Folder --progress
```

This command will sync the contents of `myfolder` to `mybackupfolder` in your cloud storage. Note that `sync` will make the destination identical to the source, meaning it will delete files in the destination that are not present in the source.

### Step 3: Backing Up Files

If you want to back up files without deleting anything in the destination, you can use the `rclone copy` command instead. The syntax is similar:

```bash
rclone copy /path/to/local/directory remote:remote_directory
```

**Example:**

```bash
rclone copy /home/user/myfolder remote:mybackupfolder
```

This command will copy the contents of `myfolder` to `mybackupfolder` without deleting any existing files in the destination.

### Step 4: Additional Options

Rclone provides various options to customize your sync or copy operations. Here are a few useful flags:

- `--dry-run`: Simulates the operation without making any changes. This is useful for testing what will happen.
  
  ```bash
  rclone sync /home/user/myfolder remote:mybackupfolder --dry-run
  ```

- `--progress`: Displays progress during the transfer.

  ```bash
  rclone sync /home/user/myfolder remote:mybackupfolder --progress
  ```

- `--exclude`: Excludes specific files or directories from the sync.

  ```bash
  rclone sync /home/user/myfolder remote:mybackupfolder --exclude "*.tmp"
  ```

- `--delete-excluded`: Deletes files in the destination that are excluded from the source.

### Step 5: Scheduling Backups

To automate your backup process, you can create a cron job (on Linux) to run your Rclone commands at specified intervals. For example, to run a backup every day at 2 AM, you can add the following line to your crontab:  
```bash
0 2 * * * rclone sync /home/user/myfolder remote:mybackupfolder
```
See [rclone Sync On Change](/Linux/rclone%20Sync%20On%20Change.md) for breakdown of above scheduling cmd.

### Conclusion

Using Rclone for syncing and backing up files is straightforward and powerful. By utilizing the `sync` and `copy` commands, along with various options, you can effectively manage your backups to cloud storage. Always remember to test your commands with the `--dry-run` option before executing them to avoid unintended data loss.

Yes, you can use YAD (Yet Another Dialog) to create a graphical progress dialog while running Rclone commands. YAD is a tool that allows you to create GTK+ dialogues from the command line, and it can be particularly useful for displaying progress for long-running tasks like file synchronization or backup operations.

### Example of Using YAD with Rclone

Here’s a basic example of how to use YAD to show progress while running an Rclone sync or copy command.

1. **Install YAD**: If you haven't installed YAD yet, you can do so using your package manager.

2. **Bash Script for Rclone Sync with YAD**: use this bash script that runs the Rclone command and uses YAD to display the progress. Here’s a simple example script:

   ```bash
   #!/bin/bash

   # Define your source and destination
   SOURCE="/path/to/local/directory"
   DESTINATION="remote:remote_directory"

   # Run Rclone with YAD progress dialog
   rclone sync "$SOURCE" "$DESTINATION" --progress | yad --progress --title="Rclone Sync" --text="Syncing files..." --percentage=0 --auto-close --no-cancel --width=300 --height=100 --timeout=10 --timeout-indicator=top

   # Check the exit status of Rclone
   if [ $? -eq 0 ]; then
       yad --title="Success" --text="Sync completed successfully!" --button="OK"
   else
       yad --title="Error" --text="An error occurred during sync." --button="OK"
   fi
   ```

3. **Make the Script Executable**: Save the script to a file, for example, `rclone_sync.sh`, and make it executable:

   ```bash
   chmod +x rclone_sync.sh
   ```

4. **Run the Script**: Execute the script to start the sync process with a YAD progress dialog:

   ```bash
   ./rclone_sync.sh
   ```

### Important Notes

- **Progress Output**: The `--progress` flag in the Rclone command outputs progress information to the terminal. YAD can read this output to update the progress bar. However, you may need to parse the output to extract the percentage and update the YAD dialog accordingly.

- **Advanced Usage**: For more advanced usage, you can customize the YAD dialog further, such as adding buttons, changing colors, or modifying the layout.

- **Error Handling**: The script includes basic error handling to notify you if the sync operation was successful or if an error occurred.

### Conclusion

Using YAD with Rclone can enhance the user experience by providing a graphical interface to monitor the progress of file synchronization or backup operations. You can customize the script to fit your specific needs and improve the functionality as required.

### Important Notes

- **YAD Progress Output**: The `--progress` flag in the Rclone command outputs progress information to the terminal. The YAD dialog will show a progress bar, but you may need to implement additional parsing of the Rclone output to update the progress bar accurately. The current script does not parse the output for percentage updates; it simply shows a dialog.

- **Error Handling**: The script includes basic error handling to notify you if the sync operation was successful or if an error occurred.

- **Adjust Paths**: Make sure to replace `/path/to/local/directory` and `remote:remote_directory` with your actual source and destination paths.

This Fish shell script should work similarly to the Bash version, providing a graphical progress dialog while syncing files with Rclone.

#rclone #yad #backup-sync #bash-scripts #scripts #bash #cronjobs