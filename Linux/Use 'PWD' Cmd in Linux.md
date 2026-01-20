This command in Linux stands for "print working directory." It is used to display the current directory you are in within the terminal. Here’s how to use it:

`pwd [OPTIONS]`

Here, you have `[OPTIONS]`which are used to modify the default behaviour of the pwd command. If you don't use any options with the pwd command, it will show the physical path of the current working directory by default.

Unlike many other Linux commands, pwd does not come with many flags and has only two important flags:

|Option|Description|
|---|---|
|`-L`|Displays logical current working dir, including sym links|
|`-P`|Displays physical current working dir, resolving sym links|
|`--help`|Displays help info about pwd cmd|
|`--version`|Outputs pwd cmd ver info|

Heres some practical examples of the pwd command.

#### 1. Display current location

This is what the pwd command is famous for, giving you the name of the directory where you are located or from where you are running the command.

```
pwd
```

![Display the current working directory](https://linuxhandbook.com/content/images/2024/12/Display-the-current-working-directory.png)

#### 2. Display logical path including sym links

If you want to display logical paths and [symbolic links](https://linuxhandbook.com/symbolic-link-linux/), all you have to do is execute the `pwd` command with the `-L` flag as shown here:

```
pwd -L
```

To showcase its usage, I will need to go through multiple steps so stay with me. First, go to the `tmp` directory using [the `cd` command](https://linuxhandbook.com/cd-command-examples/) as shown here:

```
cd /tmp
```

Now, let's create a symbolic link which is pointing to the `/var/log` directory:

```
ln -s /var/log log_link
```

Finally, change your directory to `log_link` and use the pwd command with the `-L` flag:

```
pwd -L
```

![Display the logical path including symbolic links](https://linuxhandbook.com/content/images/2024/12/Display-the-logical-path-including-symbolic-links.png)

In the above steps, I went to the `/tmp` directory and then [created a symbolic link](https://linuxhandbook.com/symbolic-link-linux/) which points to a specific location (`/var/log`) and then I used the pwd command and it successfully showed me the symbolic link.

#### 3. Display physical path resolving sym links

The pwd command is one of the ways to [resolve symbolic links](https://linuxhandbook.com/follow-symbolic-link/). Meaning, you'll see the destination directory where soft link points to.

Use the `-P` flag:

```
pwd -P
```

I am going to use the symbolic link which I had created in the 2nd example. Here's what I did:

- Navigate to `/tmp`.
- Create a symbolic link (`log_link`) pointing to `/var/log`.
- Change into the symbolic link (`cd log_link`)

Once you perform all the steps, you can check the real path of the symbolic link:

```
pwd -P
```

![Follow symbolic link using the pwd command](https://linuxhandbook.com/content/images/2024/12/Follow-symbolic-link-using-the-pwd-command.png)

#### 4. Use pwd cmd in shell scripts

To get the current location in a [bash shell script](https://linuxhandbook.com/bash/), you can store the value of the pwd command in a variable and later on print it as shown here:

```
current_dir=$(pwd)
echo "You are in $current_dir"
```

Now, if you [execute this shell script](https://linuxhandbook.com/run-shell-script/) in your home directory like I did, you will get similar output to mine:

![Use the pwd command in the shell script](https://linuxhandbook.com/content/images/2024/12/Use-the-pwd-command-in-the-shell-script.png)

#### Know the previous working directory

This is not exactly the use of the pwd command but it is somewhat related and interesting. There is an environment variable in Linux called `OLDPWD` which stores the previous working directory path.

This means you can get the previous working directory by [printing the value of this environment variable](https://linuxhandbook.com/print-environment-variables/):

```
echo "$OLDPWD"
```

![know the previous working directory](https://linuxhandbook.com/content/images/2024/12/know-the-previous-working-directory.png)

---

