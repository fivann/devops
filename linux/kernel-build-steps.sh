# Compiling a Linux Kernel (Ubuntu)
# In this lab, we are tasked with compiling a new kernel image that will be used for all of the servers in our data center. 
# To accomplish this, we will need to enable the deb-src URIs to allow the kernel source to be downloaded. 
# Once the kernel source has been downloaded (ensure that it is downloaded to the /usr/src directory for consistency), 
# we will need to install any dependencies that are necessary for configuring and compiling the kernel. 
# We will exclude both the Distributed Replicated Block Device (DRBD) support and the Packet writing on CD/DVD media. 
# Once these configuration changes have been made, we'll compile a new compressed kernel image using the bzImage target.

######################################################

# Before We Begin

# To get started, we need to log into our terminal using the provided credentials. 
# Once logged in, we need to use sudo to become the root user so that we can complete this lab.

# Enable Source URIs for apt Repositories
# The first thing we need to do is to enable the source URIs for our repositories:

# Open the sources.list file in /etc/apt/:
vim /etc/apt/sources.list

# Here, uncomment the deb-src URIs manually or by substitution using:
:%s/# deb-src/deb-src/g

# Use :wq! to save the changes.

# Resynchronize the package index files:
apt-get update

###############################################################

# Install dependencies
# With our source URIs in place, we need to install the dependencies needed:

# Install additional dependencies using the apt-get command:
apt-get install -y make gcc libncurses5-dev dpkg-dev build-essential bison flex libssl-dev libelf-dev

###############################################################

# Download the Kernel Source Tree
# Next, we need to download our kernel source tree to the /usr/src directory as follows:

# Switch to the /usr/src directory:
cd /usr/src/

# Download the kernel source tree:
apt-get install -y linux-source kernel-package

# Select the following option:
# keep the local versions currently installed

###############################################################

# Update the Kernel Configuration
# Now we need to update our kernel's configuration:

# Use ll to see the kernel versions present. Note the kernel number that appears in white. 
# We will use just the linux-aws_x.xx.x, nothing past those first four numbers.

# Switch to the kernel source tree directory and extract the archive:
cd /usr/src/linux-source-[kernel_version]
tar jxvf linux-source-[kernel_version].tar.bz2
mv linux-source-[kernel_version]/* .
rm -rf ./linux-source-[kernel_version]/

# Get the nececssary packages
apt-get build-dep -y linux-source
mkdir debian/stamps

# Update the kernel configuration:
cp /boot/config-$(uname -r) .config
yes '' | make oldconfig
make menuconfig

# Navigate to Device Drivers using the arrow keys and hit Enter, then highlight Block devices and hit Enter again.

# Using the “N” key, exclude the following two drivers by highlighting the space before them and selecting N:
#     DRBD Distributed Replicated Block Device support
#     Packet writing on CD/DVD media (DEPRECATED)

# Exit the menu, and when prompted, select Yes to save your configuration changes.

# Prepare to compile the Kernel:
make clean

########################################################################

# Compile the Kernel Image
# With everything ready, it's time to compile the kernel image:

# Create the compressed kernel image by calling the bzImage target:
make bzImage

# Note: This can take 15-20 minutes to complete

# We get back a message saying our image is ready. To double-check that the image was created, 
# use ll to list the image at arch/x86/boot/bzImage.
# As soon as we get confirmation that the image exists, it means we're good to go.
