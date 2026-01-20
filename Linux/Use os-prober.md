To use os-prober for detecting other operating systems and adding them to your GRUB bootloader menu, follow these key steps:

### What os-prober Does
os-prober scans all disks and partitions for other operating systems (like Windows or another Linux distro) by temporarily mounting them in read-only mode. It is usually used with GRUB to automatically create boot entries for found OS installations.[1][2][4]

### How to Use os-prober

1. **Install os-prober (if needed):**
   - On Debian/Ubuntu: `sudo apt install os-prober`
   - On Arch/Manjaro: `sudo pacman -S os-prober`
   
2. **Enable os-prober in GRUB:**
   - Edit `/etc/default/grub` and add or set:
     ```
     GRUB_DISABLE_OS_PROBER=false
     ```
     By default, newer distributions disable os-prober for security reasons, so this step ensures GRUB will use it.[2][4][7]

3. **Detect Other Operating Systems:**
   - Run:
     ```
     sudo os-prober
     ```
     This command will list detected OSes. If you don’t see expected results, manually mount the partition containing the OS root filesystem and rerun the command.[3][4][1]

4. **Update GRUB Configuration:**
   - Regenerate your GRUB config so detected OSes are added to the boot menu:
     ```
     sudo update-grub
     ```
     or on some systems:
     ```
     sudo grub-mkconfig -o /boot/grub/grub.cfg
     ```
     Afterward, reboot to see the new boot menu entries.[4][2]

### Common Issues & Tips
- If os-prober does not detect a system, manually mount its root partition before running update-grub.[1][4]
- For Windows installations, ensure the NTFS-3G driver is installed and use:
  ```
  sudo mount -t ntfs-3g /dev/sdXY /mnt
  ```
  Replace `/dev/sdXY` with the correct partition identifier.[4]
- The os-prober method mounts partitions as root, which has inherent risks and security implications.[2][1]

### Summary Table

| Step                | Command/Action                       | Purpose                 |
|---------------------|--------------------------------------|-------------------------|
| Install os-prober   | `sudo apt install os-prober`         | Ensure os-prober exists [2][3]|
| Enable in GRUB      | Edit `/etc/default/grub`             | Make GRUB use os-prober [2][4]|
| Run detection       | `sudo os-prober`                     | List other OSes         [2][3]|
| Update GRUB menu    | `sudo update-grub` or `grub-mkconfig`| Add detected OSes to menu [2][4]|

Using os-prober in this way helps maintain a multi-boot environment and is essential for dual-boot setups.[3][1][2][4]

[1](https://www.umutsagir.com/solution-to-os-prober-not-finding-other-operating-systems-windows-linux/)
[2](https://www.baeldung.com/linux/grub-bootloader-add-new-os)
[3](https://forum.endeavouros.com/t/update-grub-and-os-prober-not-working/19147)
[4](https://plug-world.com/posts/grub-and-os-prober-in-arch-linux/)
[5](https://ubuntu-mate.community/t/enable-os-prober-dual-boot/27106)
[6](https://bbs.archlinux.org/viewtopic.php?id=282294)
[7](https://www.reddit.com/r/linuxquestions/comments/ubeyg6/how_to_add_any_os_to_grub_menu/)
[8](https://discourse.ubuntu.com/t/os-prober-from-22-04-doesnt-see-25-04-installation/57519)
[9](https://forums.bunsenlabs.org/viewtopic.php?id=2958)
[10](https://www.youtube.com/watch?v=I9J_nNlqZ7Q)
