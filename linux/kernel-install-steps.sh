# Installing a New Linux Kernel (Ubuntu)
# Change is a necessary part of life, and it is no different when it comes to the Linux Kernel. 
# As improvements and security updates are made, new versions of the kernel will be released. 
# As a Linux administrator, it is important to be able to upgrade your kernel or install kernels that will meet specific needs. 
# In this lab, we are tasked with installing a kernel and generating a new initramfs image.

# The Scenario
# You work for a small tech company, and, as one of the lead system administrators, you are responsible 
# for ensuring that all of the backend Linux servers are up to date with the latest security and kernel updates. 
# This week, a critical kernel update was released, and you have been tasked with upgrading all the Linux servers 
# to the latest version. Before that can be done en masse, you need to test out the new kernel to ensure that 
# it does not cause any issues on the servers. So, you will be performing a test update on one of your servers 
# to make certain that the process runs smoothly.

# For this test, you will be using the kernel image in the /home/cloud_user directory named bzImage. 
# First, you will need to make copies of the current kernel and initramfs images, just in case you need to revert back. 
# Then you need to move the new kernel image to be in place of the old one (the new kernel image should have 
# the same name as the old one). Once you have added the kernel image, a new initramfs must be generated 
# (this should also have the same name as the previous initramfs image).

# Logging In

# Use the SSH credentials provided on the hands-on lab overview page to log in as cloud_user. 
# All of the lab's tasks should be performed as the root user though, so run a quick sudo -i as soon as you're in.

# Back up the Existing Kernel and initramfs Images (the Backups Should End in .bkp)
# First, we'll get into the /boot directory:

cd /boot

# Validate the current kernel version by running uname -r.

# Back up the existing kernel and initramfs images with the mv command:

mv initrd.img-[version]-aws initrd.img-[version]-aws.bkp
mv vmlinuz-[version]-aws vmlinuz-[version]-aws.bkp

# Note that [version] is what uname -r put out.

##############################################################################

# Install the New Kernel Image Located in the /home/cloud_user Directory

# The new image is called bzImage, and is sitting in the /home/cloud_user directory. 
# Move it to the boot directory (and ensure that it is named the same as your existing kernel image was):
mv /home/cloud_user/bzImage /boot/vmlinuz-[version]-aws

# Update the permissions to match the other kernel images:
chmod 600 vmlinuz-[version]-aws

##############################################################################

# Generate a New initramfs Image
# Generate the new initramfs image using the mkinitramfs command (and ensure that it is named 
# the same as the existing initramfs image): mkinitramfs -o /boot/initrd.img-[kernel_version]-aws [kernel_version]

