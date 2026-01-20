---
title: "How to Change the Directory in Linux | cd Command - GeeksforGeeks"
source: "https://www.geeksforgeeks.org/cd-command-in-linux-with-examples/"
author:
  - "[[GeeksforGeeks]]"
published: 2018-12-26
created: 2025-02-12
description: "The cd command in Linux is essential for changing directories, allowing users to navigate the file system efficiently through various syntax and examples."
tags:
  - "clippings"
---
The ****cd command in Linux**** is one of the most basic and frequently used commands for Linux users. The cd command allows you to ****change directories in Linux****, making it easier to navigate through the file system and manage your files efficiently. Whether you’re a beginner or an experienced user, understanding how to ****use the cd command in Linux**** is essential for smooth command-line operations.

This article will walk you through the process of ****changing directories in Linux**** and provide practical examples to help you get comfortable with this basic yet powerful command.

> ### Prerequisites:
> 
> - Admin Access
> - Familiar with Linux commands
> - Must know the Directory Structure (Linux Directory)

## ****Syntax of the CD Command in Linux****

The ****‘cd’ command**** allows users to change their current working directory within the file system. The basic syntax of the \`cd\` command is as follows:

```
cd [directory]
```

Here, replace ****\[directory\]**** with the destination directory path you want to navigate to. If no directory is specified, ****‘cd’**** will redirect to your home directory by default. Let’s explore the command’s functionality through examples.

Now, it is time to understand the ****use of CD Command**** in ****the**** [Terminal of Linux OS](https://www.geeksforgeeks.org/linux-commands/). Here, we are going to discuss a few examples with practical use to clarify the ****CD Command Concept****.

### 1\. Move Inside a Subdirectory

To move inside a subdirectory in Linux we use the CD [Linux Command](https://www.geeksforgeeks.org/basic-linux-commands/). Here, replace \[directory\_name\] with the desired directory you want to move in.

```
cd [directory_name]
```

****For Example:**** If we want to move to a subdirectory named “Documents”

```
cd Documents
```

![1--CD-Documents](https://media.geeksforgeeks.org/wp-content/uploads/20240125114556/1--CD-Documents.webp)

> ****Explanation:**** Here, we have used the following commands:
> 
> - ****\`ls\`**** \= To display all the files and directories in the current location (directory)
> - ****\`pwd\`**** \= to check the current location path or we can say the current directory name

### 2\. Using \`/\` as an Argument

By using \`/\` as an argument in \`cd\` we can change the directory to the root directory. The root directory is the first directory in your file system hierarchy. 

```
cd /
```

![2--CD-Slash](https://media.geeksforgeeks.org/wp-content/uploads/20240125114643/2--CD-Slash.webp)

> ****Explanation:**** Above, / represents the root directory. and used \`pwd\` to check the current location path or we can say the current directory name.

### 3\. Move Inside a Directory From a Directory

This command is used to move inside a directory from a directory. Here, replace “dir\_1/dir\_2/dir\_3” with the subdirectory name or location you want to move in.

```
cd dir_1/dir_2/dir_3
```

****For Example:**** We are in the “/home/raghvendra” directory and we want to move to its sub-directory location (path) “Documents/geeksforgeeks/example”

```
cd Documents/geeksforgeeks/example
```

![3--CD-Document-Geeks](https://media.geeksforgeeks.org/wp-content/uploads/20240125114719/3--CD-Document-Geeks.webp)

> ****Explanation:**** We have the document directory and inside the document directory we have a directory named geeksforgeeks and inside that directory, we have an example directory. To navigate the example directory, we have used the command cd Documents/geeksforgeeks/example.

### 4\. Change Directory to Home Directory From Any Location

****\`~\`**** This argument is used in the \`cd\` command to change the directory to the home directory from any location in the Linux System.

```
cd ~
```

****For Example:**** We are in location “/home/raghvendra/Documents/geeksforgeeks/example” and want to move to the home directory. We can use the following command.

```
cd ~
```

![4--CD-Tilda](https://media.geeksforgeeks.org/wp-content/uploads/20240125114755/4--CD-Tilda.webp)

We can also pass the \`cd\` command with no arguments, which will eventually land us in our home directory.

```
cd
```

![5--Only-CD](https://media.geeksforgeeks.org/wp-content/uploads/20240125114820/5--Only-CD.webp)

### 5\. Move to Parent or One Level Up from the Current Directory

We use \`..\` this as an argument in the \`cd\` command which is used to move to the parent directory of the current directory, or the directory one level up from the current directory. “..” represents the parent directory.

```
cd .. 
```

****For Example:**** We are in location “/home/raghvendra/Documents/geeksforgeeks/example” and want to move to the parent or one level up in the directory. We can use the following command.

```
cd ..
```

![6--CD-](https://media.geeksforgeeks.org/wp-content/uploads/20240125114857/6--CD-.webp)

### 6\. Change Directory by Using DIR NAME Command

This command is used to navigate to a directory with white spaces. Instead of using double quotes, we can use single quotes then also this command will also work. Here, replace “dir name” with the directory name you want. 

```
cd "dir name"
```

****For Example:**** If we want to move to “dir name” = “My songs”. We use the following command.

```
cd "My songs"
```

![7--CD-My-Song](https://media.geeksforgeeks.org/wp-content/uploads/20240125114932/7--CD-My-Song.webp)

We can also use \`\\\` in between if we don’t want to use double or single quotes.

```
cd My\ songs
```

![8--CD-Slash-Song](https://media.geeksforgeeks.org/wp-content/uploads/20240125114956/8--CD-Slash-Song.webp)

## Tabular Summarization: cd Commands

| ****Use Cases**** | ****Description**** | ****Examples / Notes**** |
| --- | --- | --- |
| ****Basic Syntax**** | `cd [directory]` | `[directory]`: Path to navigate to. Defaults to home if omitted. |
| ****Navigate to a Specific Directory**** | `cd /path/to/directory` | `cd /var/log` |
| ****Go Back to the Home Directory**** | `cd` or `cd ~` | `cd` or `cd ~` |
| ****Navigate to the Previous Directory**** | `cd -` | `cd -` from `/var/log` returns to `/home/user/Documents` |
| ****Navigate to the Parent Directory**** | `cd ..` | `cd ..` from `/home/user/Documents` moves to `/home/user` |
| ****Use Relative Paths**** | `cd subdirectory` | `cd Documents` moves from `/home/user` to `/home/user/Documents` |
| ****Use Absolute Paths**** | `cd /absolute/path` | `cd /usr/local/bin` |
| ****Use Tab Completion**** | Auto-complete directory names | `cd /var/l + Tab => cd /var/log` |
| ****Check Current Directory**** | `pwd` | Prints the full path of your current location. |
| ****Handle Spaces in Names**** | Use quotes or escape spaces | `cd "My Documents"` or `cd My\ Documents` |
| ****Access Hidden Directories**** | Include dot in path | `cd .config` |
| ****Directory Not Found**** | Error: No such file or directory | Ensure correct path. |
| ****Insufficient Permissions**** | Error: Permission denied | Use `ls -l` for permissions or `sudo`. |
| ****Navigate to Root Directory**** | `cd /` | Navigate to the root directory. |
| ****Chain Commands**** | `cd /path/to/directory && ls` | Changes directory and lists contents. |
| ****Add Aliases**** | Create shortcuts in shell config file | `alias docs="cd ~/Documents"` and `source ~/.bashrc` |

## Conclusion

Learning how to ****change directories in Linux**** using the ****cd command**** is a crucial step in becoming proficient with the Linux terminal. By following the tips and examples provided in this guide, you’ll be able to ****navigate directories in Linux**** with ease. Whether you’re managing files, accessing different folders, or simply exploring the file system, mastering the ****Linux cd command**** will greatly enhance your efficiency and command-line confidence.

## How to Change the Directory in Linux | cd Command – FAQs

### ****How do I navigate directories in Linux if I’m not sure of the exact path?****

> You can use the `ls` command to list the contents of your current directory and then use the ****cd command**** to ****move to the directory**** you want. Additionally, the Tab key can help autocomplete directory names.

### ****What is the difference between absolute and relative paths when using the ‘cd’ command in Linux?****

> Absolute paths start from the root directory (e.g., \`**``**/home/user/documents`**``**), while relative paths are about your current location (e.g., `` ..` ``**``**/pictures`**``** to move up one level and then into the “pictures” directory). Understanding these distinctions is crucial for effective directory navigation.

### ****How can I use the ‘cd’ command to move to a directory with spaces in its name?****

> If a directory has spaces in its name, enclose the entire path in quotes.
> 
> For example: To move to a directory named “My Documents,” you would type ****cd “My Documents”****

### ****Is there a shortcut to switch between the current and previous directories using the ‘cd’ command?****

> Yes, you can use the \`**`**cd -**`**`` ` `` command to quickly switch between the current and previous directories. This is handy for toggling back and forth between two locations.

### Is the cd command case-sensitive?

> Yes, Linux file paths are case-sensitive, and therefore, ****cd Documents**** is different from ****cd documents****.

### Can I navigate to a directory without typing the full path?

> Yes, use relative paths or shortcuts like ~ for home and `..` for a parent directory

### ****Can I use the ‘cd’ command to navigate to a directory without typing the full path in Linux?****

> Yes, you can make use of tab completion. Start typing the directory name and press the ‘Tab’ key. The system will either complete the name if it’s unique or show you options if there are multiple matches. This makes navigating through the file system faster and more efficient.