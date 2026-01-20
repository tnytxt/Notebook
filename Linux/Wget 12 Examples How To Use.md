---
title: "What is the wget command and how to use it (12 examples included)"
source: "https://www.hostinger.com/tutorials/wget-command-examples/#Using_Wget_Command_to_Retrieve_Whole_Websites"
author:
  - "[[Domantas G.]]"
published: 2018-02-23
created: 2025-02-12
description: "Learn how to use wget command and find 12 practical wget examples by reading this guide! We'll also show you how to install and utilize it."
tags:
  - "clippings"
---
This guide teaches you how to use the **wget** command on Linux. It provides 12 examples of wget commands in action to help you use them. Once you’re done, you’ll know all about wget and how to use it to get files from the web.

- [What is the wget command?](https://www.hostinger.com/tutorials/wget-command-examples/#What_is_the_wget_command "What is the wget command?")
- [How to install wget?](https://www.hostinger.com/tutorials/wget-command-examples/#How_to_install_wget "How to install wget?")
- [Wget command examples](https://www.hostinger.com/tutorials/wget-command-examples/#Wget_command_examples "Wget command examples")
- [Using wget command to download single files](https://www.hostinger.com/tutorials/wget-command-examples/#Using_wget_command_to_download_single_files "Using wget command to download single files")
- [Using wget command to download multiple files](https://www.hostinger.com/tutorials/wget-command-examples/#Using_wget_command_to_download_multiple_files "Using wget command to download multiple files")
- [Using wget command to get files under different names](https://www.hostinger.com/tutorials/wget-command-examples/#Using_wget_command_to_get_files_under_different_names "Using wget command to get files under different names")
- [Using wget command to save files in specified directory](https://www.hostinger.com/tutorials/wget-command-examples/#Using_wget_command_to_save_files_in_specified_directory "Using wget command to save files in specified directory")
- [Using wget command to limit download speed](https://www.hostinger.com/tutorials/wget-command-examples/#Using_wget_command_to_limit_download_speed "Using wget command to limit download speed")
- [Using wget command to set retry attempts](https://www.hostinger.com/tutorials/wget-command-examples/#Using_wget_command_to_set_retry_attempts "Using wget command to set retry attempts")
- [Using wget command to download in background](https://www.hostinger.com/tutorials/wget-command-examples/#Using_wget_command_to_download_in_background "Using wget command to download in background")
- [Using wget command to download via FTP](https://www.hostinger.com/tutorials/wget-command-examples/#Using_wget_command_to_download_via_FTP "Using wget command to download via FTP")
- [Using wget command to continue interrupted downloads](https://www.hostinger.com/tutorials/wget-command-examples/#Using_wget_command_to_continue_interrupted_downloads "Using wget command to continue interrupted downloads")
- [Using wget command to retrieve whole websites](https://www.hostinger.com/tutorials/wget-command-examples/#Using_wget_command_to_retrieve_whole_websites "Using wget command to retrieve whole websites")
- [Using wget command to locate broken links](https://www.hostinger.com/tutorials/wget-command-examples/#Using_wget_command_to_locate_broken_links "Using wget command to locate broken links")
- [Using wget command to download numbered files](https://www.hostinger.com/tutorials/wget-command-examples/#Using_wget_command_to_download_numbered_files "Using wget command to download numbered files")
- [Wget command FAQ](https://www.hostinger.com/tutorials/wget-command-examples/#Wget_command_FAQ "Wget command FAQ")
- [What is the wget command used for?](https://www.hostinger.com/tutorials/wget-command-examples/#What_is_the_wget_command_used_for "What is the wget command used for?")
- [How do I run wget?](https://www.hostinger.com/tutorials/wget-command-examples/#How_do_I_run_wget "How do I run wget?")
- [How do I download files using wget?](https://www.hostinger.com/tutorials/wget-command-examples/#How_do_I_download_files_using_wget "How do I download files using wget?")

## What is the wget command?

**Wget** is a command-line tool that makes it possible to **download files from the internet directly to your active directory.** It operates in the background, allowing tasks to continue even if you’re offline. The name is a combination of World Wide Web and the word get. It supports downloads via FTP, SFTP, HTTP, and HTTPS.

Wget is created in portable C and is usable on any Unix system. It’s also possible to implement on Mac OS X, Microsoft Windows, AmigaOS, and other popular platforms.

## How to install wget?

For this wget command demonstration, we’ll be using Ubuntu 22.04. But the syntax will work on any other [Linux distribution](https://www.hostinger.com/tutorials/best-linux-distro) too.

Firstly, [access your server via SSH](https://www.hostinger.com/tutorials/how-to-use-putty-ssh):

```
ssh user@your_server_ip -port
```

To install wget on **Ubuntu 22.04**, execute the following command:

```
sudo apt-get install wget
```

To install wget on **CentOS 9** **Sream** or its previous distros, use:

```
sudo yum install wget
```

Once the setup finishes, you’ll be ready to use it. Also, the knowledge of [basic SSH commands](https://www.hostinger.com/tutorials/ssh/basic-ssh-commands) can make things easier.

## Wget command examples

To get you started, we’ll provide 12 wget command examples that you can use for everyday tasks. Keep in mind that you may also call this function from scripts and [cron jobs](https://www.hostinger.com/tutorials/cron-job)!

### Using wget command to download single files

One of the most basic wget command examples is downloading a single file and storing it in your current working directory. For example, you may get the latest version of [WordPress](https://www.hostinger.com/tutorials/what-is-wordpress) by using the following:

```
wget https://wordpress.org/latest.zip
```

Here is the output that you will see:

```
--2018-02-23 12:53:10-- https://wordpress.org/latest.zip
Resolving wordpress.org (wordpress.org)... 198.143.164.252
Connecting to wordpress.org (wordpress.org)|198.143.164.252|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 9332728 (8,9M) [application/zip]
Saving to: 'latest.zip'

latest.zip 100%[===================>] 8,90M 6,88MB/s in 1,3s

2018-02-23 12:53:14 (6,88 MB/s) - 'latest.zip' saved [9332728/9332728]
```

In this example, a file named **latest.zip** will be downloaded in the current working directory. You’ll also see extra information, such as the download progress, speed, size, time, and date.

### Using wget command to download multiple files

We can take wget usage one step further and download multiple files at once. To do that, we will need to create a text document and place the download URLs there. In this example, we will retrieve the latest versions of WordPress, [Joomla](https://www.hostinger.com/tutorials/joomla/), and [Drupal](https://www.hostinger.com/tutorials/drupal) by using wget. Enter the following:

```
nano example.txt
```

This will create an example.txt file and open a text editor interface. Paste these links there:

```
https://wordpress.org/latest.zip

https://downloads.joomla.org/cms/joomla3/3-8-5/Joomla_3-8-5-Stable-Full_Package.zip

https://ftp.drupal.org/files/projects/drupal-8.4.5.zip
```

Once done, you may use **\-i** to get all the files stored in your example text file:

```
wget -i example.txt
```

Wait for the process to finish, and you’ll have the installations of the three most popular content management systems.

### Using wget command to get files under different names

In this wget example, we will save a file using a different name with the help of the **\-O** option:

```
wget -O wordpress-install.zip https://wordpress.org/latest.zip
```

In this case, the downloaded resource will be saved as **wordpress-install.zip** instead of its original name.

The **\-O** option makes [unzipping archives in Linux](https://www.hostinger.com/tutorials/how-to-unzip-files-linux/) more efficient, as you don’t need to retype the full name.

### Using wget command to save files in specified directory

You can utilize wget to place a file in another directory using the **\-P** function:

```
wget -P documents/archives/ https://wordpress.org/latest.zip
```

The file you retrieve using this syntax will appear in the **documents/archives/** folder.

### Using wget command to limit download speed

With wget, you can also limit the download speed. This is useful when retrieving huge files and will prevent the command from using all of your bandwidth. This wget example will set the limit to 500k:

```
wget --limit-rate=500k https://wordpress.org/latest.zip
```

### Using wget command to set retry attempts

Internet connection problems can interrupt your download. To tackle this issue, we can increase the retry attempts using the **\-tries** function:

```
wget -tries=100 https://wordpress.org/latest.zip
```

### Using wget command to download in background

For extremely large files, you may take advantage of the **\-b** function. It will download your content in the background.

```
wget -b http://example.com/beefy-file.tar.gz
```

A **wget-log** will appear in your working directory, which can be used to check your download progress and status. You can also use the [tail command](https://www.hostinger.com/tutorials/how-to-use-tail-command/):

```
tail -f wget-log
```

### Using wget command to download via FTP

The command is also usable with FTP. All you need to do is specify the username and password like in this wget example:

```
wget --ftp-user=YOUR_USERNAME --ftp-password=YOUR_PASSWORD ftp://example.com/something.tar
```

### Using wget command to continue interrupted downloads

Your download can get interrupted if you lose the internet connection or experience a power outage. This is quite a common occurrence when getting huge files. Instead of starting over, it’s possible to continue the download using the **\-c** function:

```
wget -c https://example/very-big-file.zip
```

If you proceed without the **\-c** function, the new file will have **.1** added at the end as it already exists.

### Using wget command to retrieve whole websites

It is also possible to use the wget command to download the content of an entire site. This will let you view it locally without an internet connection. Here is an example:

```
wget --mirror --convert-links --page-requisites --no-parent -P documents/websites/ https://some-website.com
```

Let’s analyze the ingredients of this wget command:

| **–mirror** | Makes your download recursive. |
| --- | --- |
| **–convert-links** | All links will be converted for proper offline usage. |
| **–page-requisites** | The following will include all necessary files such as CSS, JS, and images. |
| **–no-parent** | Ensures that directories *above* the hierarchy are not retrieved. |
| **\-P documents/websites/** | Ensures that the following will include all necessary files, such as CSS, JS, and images. |

Once the process finishes, you’ll be able to open the downloaded website locally and find all the files in the **documents/websites/** folder.

### Using wget command to locate broken links

Let’s try something more advanced. We can use the wget command to locate all broken URLs that display a 404 error on a specific website. Start by executing the following:

```
wget -o wget-log -r -l 5 --spider http://example.com
```

| **\-o** | Gathers output into a file for later use. |
| --- | --- |
| **\-l** | Specifies the recursion level. |
| **\-r** | Makes the download recursive. |
| **–spider** | Sets wget to spider mode. |

We may now investigate the **wget-log** file to find the list of broken links. Here’s the command to do it:

```
grep -B 2 '404' wget-log | grep "http" | cut -d " " -f 4 | sort -u
```

### Using wget command to download numbered files

If you have files or images numbered in a certain list, you may easily download all of them with the following syntax:

```
wget http://example.com/images/{1..50}.jpg
```
### What is the wget command used for?

Wget is a command-line tool that makes it possible to download files and interact with REST APIs. It supports various internet protocols and can deal with both unstable and slow connections, too.

