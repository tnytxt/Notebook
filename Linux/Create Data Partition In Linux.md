<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>
```
# <q>create a dedicated data partition to hold files like Documents, Downloads, and Media, and then symlink these directories into your /home directories on each OS, keeping application and system config files separate.</q> how to?
```

To create a dedicated data partition on Linux and link your Documents, Downloads, and Media folders to it, follow this step-by-step process.[^1][^2]

## Create and Format the Data Partition

- Use a tool like GParted (GUI) or the command line utilities fdisk/parted.
- Example using fdisk for disk /dev/sda:

1. Run `sudo fdisk /dev/sda` and enter `n` to create a new partition. Accept defaults for sector sizes or set your desired partition size.
2. Write changes with `w` and exit fdisk.
3. Format the new partition (for example, /dev/sda3) as ext4:

```
sudo mkfs.ext4 /dev/sda3
```

- Create a mount point directory, such as /mnt/DATA:

```
sudo mkdir /mnt/DATA
```

- Mount the partition:

```
sudo mount /dev/sda3 /mnt/DATA
```

- Change ownership to your user:

```
sudo chown -R yourusername: /mnt/DATA
```

- Optionally, configure /etc/fstab for automatic mounting at boot.[^1]


## Move User Data and Create Symlinks

- Create folders in /mnt/DATA:

```
mkdir /mnt/DATA/Documents /mnt/DATA/Downloads /mnt/DATA/Music /mnt/DATA/Pictures
```

- Move your actual data:

```
mv ~/Documents/* /mnt/DATA/Documents/
mv ~/Downloads/* /mnt/DATA/Downloads/
# Repeat for other folders
```

- Remove/backup the original folders:

```
rm -r ~/Documents ~/Downloads
```

- Create symbolic links from your home directory:

```
ln -s /mnt/DATA/Documents ~/Documents
ln -s /mnt/DATA/Downloads ~/Downloads
# Repeat for other folders
```


Repeat the symlink step for each Linux installation, ensuring that both systems use the same mount point for the data partition.[^2][^1]

This keeps config files local to each OS and shares actual data seamlessly—reducing risk of config file conflicts.
<span style="display:none">[^10][^3][^4][^5][^6][^7][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://community.linuxmint.com/tutorial/view/1609

[^2]: https://phoenixnap.com/kb/linux-create-partition

[^3]: https://gcore.com/learning/how-to-partition-a-disk-in-linux

[^4]: https://www.digitalocean.com/community/tutorials/create-a-partition-in-linux

[^5]: https://www.youtube.com/watch?v=gJDmqXI7RFA

[^6]: https://www.digitalocean.com/community/tutorials/how-to-partition-and-format-storage-devices-in-linux

[^7]: https://docs.fedoraproject.org/en-US/quick-docs/creating-a-disk-partition-in-linux/

[^8]: https://www.youtube.com/watch?v=LPYfoFSXB9A

[^9]: https://www.reddit.com/r/linuxquestions/comments/po2kq7/how_do_i_partition_and_store_files_in_linux/

[^10]: https://www.reddit.com/r/linuxquestions/comments/16amtg2/how_to_create_partition_in_linux_ubuntu/

