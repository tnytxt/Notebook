# Fstab Config Backup

Some distros have alt locations for external storage. 
One of them is `/run/media/lee/Storage`

fstab location: /etc/fstab

```
# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a device; this may
# be used with UUID= as a more robust way to name devices that works even if
# disks are added and removed. See fstab(5).
#
# <file system>             <mount point>  <type>  <options>  <dump>  <pass>
UUID=91D9-5727                            /efi           vfat    fmask=0137,dmask=0027 0 2
UUID=3894117e-4fad-4f95-8c45-9865f42db5ea /home          ext4    noatime    0 2
UUID=b529ce10-46e9-4d35-ad0b-506415f8bbfc /              ext4    noatime    0 1
tmpfs                                     /tmp           tmpfs   defaults,noatime,mode=1777 0 0
UUID=26dd3e5e-4ab7-46ab-8d1a-9bc6dbc67699  /media/Storage  auto  nosuid,nodev,nofail,x-gvfs-show  0  2

```

