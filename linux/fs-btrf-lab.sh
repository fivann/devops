# # Creating Btrfs Subvolumes and Snapshots
# In this lab, we are tasked with setting up a btrfs filesystem, creating subvolumes for administrators and normal users, 
# increasing the storage capacity of the existing backups file system, and creating some snapshots of an existing subvolume.

# First, we will need to create a btrfs filesystem using the following devices: /dev/xvdf1, /dev/xvdg1, and /dev/xvdj1. 
# This file system should be mounted on /mnt/data, and an entry should be added to /etc/fstab using the default options 
# to ensure that it is mounted on boot. Two subvolumes should be created on this file system at /mnt/data/user and 
# /mnt/data/admin and should be mounted on /mnt/user and /mnt/admin respectively. To ensure that they are mounted on boot, 
# an entry for each of these should be added to /etc/fstab.

# A btrfs filesystem has been created on /mnt/backup that needs the overall space to be increased. Expand this volume by 
# adding the /dev/xvdj2 device to the btrfs pool for that file system. Once added, balance the pool by spreading out 
# the block groups across all devices. Finally, create two snapshots of the subvolume /mnt/backup/user_data. 
# The first should be a normal snapshot created at /mnt/backup/user_data_snap, and the second should be a read-only snapshot 
# created at /mnt/backup/user_data_snap_ro.

# Note: The UUIDs of the filesystems will change with each attempt.

##########################################################################################

# Create a btrfs Filesystem
# Create a btrfs filesystem based on the information provided in the instructions:

# View the current files that are mounted with lsblk -f. These are the files we'll be working with.
# Create a btrfs filesystem using /dev/xvdf1, /dev/xvdg1, and /dev/xvdj1:
mkfs -t btrfs /dev/xvdf1 /dev/xvdg1 /dev/xvdj1

# Use ll /mnt/data/ to make sure our total is 0, as we haven't added any items.
# Review the UUID for our items using blkid.
# Copy the main UUID for any of our three items, as they are all the same.
# Mount the btrfs filesystem on /mnt/data:
mount -t btrfs /dev/xvdg1 /mnt/data

# Check that the mount worked correctly with df -h.
# Use a text editor (for our example, we're using vim) to open /etc/fstab:
vim /etc/fstab

# Add the following entry under the first instance of the UUID:
UUID=filesystem_UUID /mnt/data btrfs defaults 0 0

# Save and quit the file with :wq.

##########################################################################################

# Create two Subvolumes
# Create two subvolumes for /mnt/data based on the information provided in the instructions:

# Create the user and admin subvolumes in the /mnt/data filesystem:
btrfs subvolume create /mnt/data/user
btrfs subvolume create /mnt/data/admin

# Check that the creation was successful using btrfs subvolume list /mnt/data.
# Mount the admin subvolume at /mnt/admin and the user subvolume at /mnt/user:
mount -t btrfs -o subvol=user /dev/xvdg1 /mnt/user
mount -t btrfs -o subvol=admin /dev/xvdg1 /mnt/admin

# Use a text editor (for our example, we use vim) to open /etc/fstab
vim /etc/fstab

# Add the following entries for /mnt/user and /mnt/admin:
UUID=filesystem_UUID       /mnt/user       btrfs   subvol=user,defaults    0 0
UUID=filesystem_UUID       /mnt/admin      btrfs   subvol=admin,defaults   0 0

# Save and quit the file.

##########################################################################################

# Add a Device to the Filesystem
# Add the /dev/xvdj2 device to the filesystem mounted on /mnt/backup:

# Use lsblk -f to see all the items that are the fstype of btrfs. Note that we need to change xvdj2.
# Add /dev/xvdj2 to the filesystem mounted on /mnt/backup using the btrfs command:
btrfs device add /dev/xvdj2 /mnt/backup

# Note: If you cannot see the btrfs filesystem on xvdj2 when using lksblk -f after adding it to the filesystem, 
# run the command partprobe /dev/xvdj2 to re-read the partition table. It should work within several seconds after this

##########################################################################################

# Balance the filesystem to spread block groups across all devices:
btrfs balance start --full-balance /mnt/backup

##########################################################################################

# Create two Snapshots
# Create two snapshots of /mnt/backup/user_data based on the information provided in the instructions:

# Create a snapshot called user_data_snap from the user_data volume:
btrfs subvolume snapshot /mnt/backup/user_data/ /mnt/backup/user_data_snap

# Create a read-only snapshot called user_data_snap_ro from the user_data volume:
btrfs subvolume snapshot -r /mnt/backup/user_data/ /mnt/backup/user_data_snap_ro

# Check the snapshots using btrfs subvolume list /mnt/backup

##########################################################################################
