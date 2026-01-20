zRAM (alternatively written "zram") is a Linux feature which allows us to treat a portion of the computer's physical memory as though it were compressed storage space. This allows us to write information to storage space that looks and acts like a physical disk, but has the speed benefit of RAM and the added bonus of being compressed to use less space.  
  
There are a few instances where this could be useful. One is to set up a temporary directory that will typically only hold small files which can be discarded when the computer restarts. This avoids writing a bunch of small, probably rarely-used files to our hard drive while maintaining higher performance. Another common scenario is to set aside a portion of RAM to be used as swap space. When memory begins to fill up, lesser-used data stored in memory will get swapped out. In this case the data is moved from regular memory into the compressed memory, where it will take up less space, yet still be instantly accessible if needed. In practise this approach uses relatively small amounts of physical memory while making it seem as though we have very fast, compressed swap space.

Using zRAM is an attractive option when running low-resource computers, such as the Raspberry Pi, or systems where we might want to store temporary files in RAM rather than have them written to a disk, particularly an older SSD.

There are a number of utilities for working with zRAM storage and each distribution packages these tools a bit differently. One way to avoid confusion is to follow the Linux kernel's [zRAM documentation](https://www.kernel.org/doc/Documentation/blockdev/zram.txt) which explains how to work with zRAM in a distro-neutral fashion. However, while these steps work across distributions, they are not the most straight forward. With this in mind, I will be going through an example of how to use zRAM using the _zramctl_ utility which is usually supplied by a distribution's _util-linux_ package.  
  
The first thing we need to do in order to work with zRAM is to enable the _zram_ kernel module. Most Linux distributions do not enable this module by default. We can load the _zram_ module and, at the same time, specify how many zRAM devices we want to work with. Sometimes it can be useful to have more than one, for instance if we want to set up multiple temporary directories. In this case I will create just one zRAM device. The _modprobe_ command loads the _zram_ module and, in this instance, creates one virtual device for compressed RAM.

> modprobe zram num_devices=1

We can verify the above command worked by running the _zramctl_ program and asking it to find any available zRAM devices. In this example, it found one, called **_zram0_:**

> **sudo zramctl --find**  
> /dev/zram0

Now we have a zRAM device, an interface which will reside in memory while acting like a storage device. If we want to use this compressed storage as swap space, effectively compressing data in memory and making it seem like we have more RAM/swap, we can treat _zram0_ as a swap partition. Next we set aside 1GB of memory to be compressed and mount it as swap space. The first step is to specify a size for the available zRAM device:

> **sudo zramctl --find --size 1G**  
> /dev/zram0

The above command locates the first available zRAM device and assigns it a size of 1GB. The command responds with the name of the device we are now using. The next two commands format the compressed RAM to be used as swap space and activate it:

> mkswap /dev/zram0  
> swapon /dev/zram0

We can confirm the above commands worked by running _swapon_ again with no arguments:

> **sudo swapon** 
> |---|---|---|---|---|
> |NAME|TYPE|SIZE|USED|PRIO|
> |/dev/zram0|partition|1024M|0B|-2|

The above command shows we have one swap device, called _zram0_, and that it is 1024MB (1GB) in size. At the moment, none of the available space is being used. We can remove the zRAM swap space by using the _**swapoff**_ command:

> swapoff /dev/zram0

We can deactivate the zRAM device we were using, freeing it up for future use elsewhere by running:

> zramctl --reset /dev/zram0

What if we want to set up a zRAM device to act as temporary fast storage space that will be discarded when the computer shuts down? The steps are approximately the same. Once again we begin by assigning a size to the zRAM device. Here I set aside 500MB of space to use as temporary storage.

> **sudo zramctl --find --size 500M**  
> /dev/zram0

Next we need to format the memory. In my case I set it up to use the ext2 filesystem:

> mkfs.ext2 /dev/zram0

Finally, we can assign the zRAM space to a directory, mounting it in place. Usually we would want to put temporary storage under _/tmp_ or _/var/tmp_, but we can place it just about anywhere:

> mount /dev/zram0 /tmp

Now any files we write to the **_/tmp_** directory will be compressed and stored in RAM instead of on the local disk. We can remove the temporary storage and clean-up by running the following commands:

> umount /tmp  
> zramctl --reset /dev/zram0

A word of caution. It is probably a good idea to keep the size of your zRAM devices at 50% or less of your total physical RAM space. Trying to compress all your RAM to use as swap or temporary storage is likely to squeeze the system's resources and possibly cause more trouble than it is worth. I also recommend mounting any temporary storage early in the boot process rather than after you login to the desktop, especially if you mount temporary storage under _/tmp_. Some programs still save files in _/tmp_ and mounting compressed storage in this location will make existing files vanish and that can cause unwanted behaviour in running programs.

#Linux 
