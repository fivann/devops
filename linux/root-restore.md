If you have lost the root password on a Linux system, there are several methods you can use to restore it:

Boot into Single-User Mode
You can boot into single-user mode, which will give you root access to the system without requiring a password. From there, you can reset the root password. The process to boot into single-user mode may vary depending on the Linux distribution, but generally, you can follow these steps:

Restart the system
When the GRUB menu appears, press the "e" key to edit the boot configuration
Find the line that starts with "linux" or "linux16" and add "single" or "init=/bin/bash" at the end of the line
Press "Ctrl+X" to boot the system in single-user mode or press "F10" to boot with the modified configuration
Once you are in single-user mode, you can use the passwd command to reset the root password.

Boot from Live CD/USB
You can boot the system from a Live CD/USB, which will give you access to the file system of the installed system. From there, you can chroot into the installed system and use the passwd command to reset the root password. The process to boot from a Live CD/USB may vary depending on the Linux distribution, but generally, you can follow these steps:

Boot the system from a Live CD/USB
Open a terminal and become root
Mount the root partition of the installed system to a directory, e.g. mount /dev/sda1 /mnt
Chroot into the mounted system, e.g. chroot /mnt
Use the passwd command to reset the root password
Use a password reset tool
There are several password reset tools available that can reset the root password without requiring you to boot into single-user mode or from a Live CD/USB. These tools work by modifying the password hash stored in the system's password file. Some examples of password reset tools are chntpw, Offline NT Password and Registry Editor (ONTP&RE), and Ophcrack.

It's important to note that password reset tools should be used with caution, as they can potentially cause data loss or system damage if not used properly.

In summary, if you have lost the root password on a Linux system, you can try booting into single-user mode, booting from a Live CD/USB and chrooting into the installed system, or using a password reset tool to restore the root password.

