# Configure /etc/fstab to Persistently Mount a File System

#############################################################################

# Introduction
# Learning to create file systems and persistently mount them across reboots is an essential skill for Linux administrators. 
# In this lab, we format two new system disks and create filesystems on the newly-created disk partitions. 
# Then we create the directories for the mount points and configure /etc/fstab to persistently mount the file systems 
# so they are available on system startup.

# Scenario
# The database team at ABC Company has requested that a 2 GB, read-only file system be created and mounted as /dbadmin. 
# The web team has also requested that a 2 GB file system be created and mounted as /www.

# To complete this lab, create the /dbadmin directory and persistently mount it as read-only. Then create and persistently 
# mount the /www directory with the default options.

# Please use the lab environment since the Cloud Playground isn't configured for this exercise. 

#############################################################################

sudo -i

# Format xvdb
# List the available disks on the system.

lsblk

# Create the xvdb partition.

fdisk /dev/xvdb

# Enter n for new.
# Enter p for primary.
# Press enter for the default values for all other fields until reaching Command (m for help):
# Enter w to write the changes.

# Verify the new partition has been created.

lsblk

#############################################################################

# Create the File System and Directory for dbadmin

# Create the file system.

mkfs.xfs /dev/xvdb1

# Create the directory for the mount point.

mkdir /dbadmin

# Configure xvdb1 to Be Persistently Mounted

# Get the UUID for xvdb1. Copy this to the clipboard. It will be referred to as XVDB1_UUID throughout the remainder of this guide.

blkid /dev/xvdb1

# Open /etc/fstab for editing.

vim /etc/fstab

# Add the following at the end of the file on a new line. Remember to replace XVDB1_UUID with the UUID copied in a previous step.

UUID:XVDB1_UUID		/dbadmin	xfs	ro,defaults	0	0

# Save the changes and exit the editor.

#############################################################################

# Mount the file systems.
mount -a

# Verify the presence of the file system.
df -h

# Navigate to the directory.
cd /dbadmin

# Verify that the directory is read-only. This step should fail.
touch test

# Return to the root directory.
cd /

#############################################################################

# Format xvdc

# List the available disks on the system.
lsblk

# Create the xvdc partition.
fdisk /dev/xvdc

# Enter n for new.
# Enter p for primary.
# Press enter for the default values for all other fields until reaching Command (m for help):
# Enter w to write the changes.

#############################################################################

# Create the File System and Directory for www
# Create the file system.
mkfs.xfs /dev/xvdc1

# Create the directory for the mount point.
mkdir /www

#############################################################################

# Configure xvdc1 to Be Persistently Mounted
# Get the UUID for xvdc1. Copy this to the clipboard. It will be referred to as XVDC1_UUID throughout the remainder of this guide.
blkid /dev/xvdc1

# Open /etc/fstab for editing.
vim /etc/fstab

# Add the following at the end of the file on a new line. Remember to replace XVDC1_UUID with the UUID copied in a previous step.
UUID:XVDC1_UUID		/www	xfs defaults	0	0

# Save the changes and exit the editor.

#############################################################################

# Mount the file systems.
mount -a

# Verify the presence of the file system.
df -h

#############################################################################

