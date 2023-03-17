# Working with Kernel Modules

# Introduction
# The Linux system provides a framework for loadable modules which can add or remove certain 
# functionality without the need for a restart. In this lab, you will be tasked with installing 
# and removing kernel modules, as well as displaying additional information about them.

# Logging In

# Use the credentials provided on the hands-on lab overview page, and log in as cloud_user. 
# Then become root once you're in with a quick sudo -i.

#################################################################

# Get a Count of the Current Installed Modules and Save It to /root/current_count.txt
# In order to display all the loaded modules run this:

lsmod

# If we want to save a count of all the loaded modules to /root/current_count.txt, we can add to that command and redirect output:

lsmod | wc -l > /root/current_count.txt

#################################################################

# Remove the target_core_mod Module and All Its Dependencies
# To remove the target_core_module, we'd run:

modprobe -r target_cor_mod

# But when we do that, we get an error saying that the module is in use. Let's check to see what's using it:

lsmod | grep target_core_mod

# We can see that iscsi_target_mod is what's using it, so we'll have to remove that first 
# (the v option we're using will display additional information about what modprobe is doing):

modprobe -rv iscsi_target_mod

# Validate the modules have been removed:

lsmod | grep target

This should show that the module is no longer in memory.


#################################################################

# Install the nfsd Module
# Install the nfsd module using the modprobe command 
# (again, -v option will display additional information about what modprobe is doing):

modprobe -v nfsd

# Validate that the module was loaded:

lsmod | grep nfsd

#################################################################

# Display the Dependencies for the nfsd Module and Save the Names to /root/dependencies.txt
# Display information for the nfsd module:

modinfo nsfd

# In that output, we can see dependencies that this module has. Let's save that depends line out to /root/dependencies.txt:

modinfo nfsd | grep depends > /root/dependencies.txt

# Get a Final Count of the Modules and Save It to /root/updated_count.txt
# Our module count has changed, so let's update the /root/updated_count.txt file so that it's accurate:

lsmod | wc -l > /root/updated_count.txt

#################################################################
#################################################################
#################################################################


# Modifying Kernel Parameters

# Introduction
# The Linux kernel provides a wide array of parameters that can alter how the system behaves. 
# # In this lab, you will be tasked with modifying specific parameters for the current session, 
# and ensuring that these changes will persist through a reboot.

# The Scenario
# You work as a system reliability engineer for a large company which has data centers in several locations around the world. 
# As part of your responsibilities, you help to ensure that systems run efficiently and are not vulnerable to exploitation. 
# One of the hosts that you are responsible for requires some modifications to the kernel parameters, 
# to bring it in line with the others. First, the swappiness will need to be changed to a value of 10, down from 80, 
# so that the swap space is used less aggressively (which is causing some sluggish performance on the host).

# Next, the ICMP echo parameters will need to be updated. The host is currently denying all ICMP echo requests,
# which must be changed in order to provide some needed functionality on the network. By allowing ICMP echo requests, 
# we can become vulnerable to certain exploits. To prevent this, the ICMP broadcast request should be disabled. 
# Finally, IP forwarding should be enabled to allow the host to act as a router on the network.

# Additional Information:

# sysctl configurations should not be added to the main sysctl.conf file. A separate .conf file should be added 
# for each of the configurations in /etc/sysctl.d/ (see below for naming convention).
# For swappiness, the configuration file should be called 60-swap.conf
# For ICMP echo requests, the configuration file should be called 60-icmp.conf
# For IP forwarding, the configuration should be called 60-ip.conf
# All tasks should be performed as the root user.

#################################################################

# Logging In

# Use the credentials provided on the hands-on lab overview page, and log in as cloud_user. Then become root with 
sudo -i

#################################################################

# Modify the Swappiness Parameter to Equal 10 for the Current Session
# First, let's see what swappiness is currently set to:

sysctl -a | grep swappiness

# We could also have run cat /proc/sys/vm/swappiness.
# Now let's use sysctl to change the swappiness value to 10:

sysctl -w vm.swappiness=10

Check to make sure the new setting is in effect with either of those first two commands we ran.

#################################################################

# Ensure That the Changes Made to the Swappiness Parameter Will Persist through a Reboot
# Change to the sysctl directory:

cd /etc/sysctl.d

# Now create a file in there, 60-swap.conf, with the following contents:

vm.swappiness = 10

# This can be done with a text editor or through the command line:

echo "vm.swappiness = 10" > /etc/sysctl.d/60-swap.conf

#################################################################

# Disable icmp_echo_ignore_all and Enable icmp_echo_ignore_broadcast for the Current Session
# Before we change anything, let's check to see what things are set to now:

sysctl -a | grep icmp_echo

# We could also check by changing directories:

cd /proc/sys/net/ipv4

# Then we'd have to read a couple of files:

cat icmp_echo_ignore_all
cat icmp_echo_ignore_broadcasts

# Those will show 1 and 0, respectively.

# We need to change those, so first let's disable icmp_echo_ignore_all using the sysctl command:

sysctl -w net.ipv4.icmp_echo_ignore_all=0

# Now we can enable icmp_echo_ignore_broadcasts:

sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=1

# Run sysctl -a | grep icmp_echo again to check whether or not our changes were made.

#################################################################

# Ensure That the Changes Made to icmp_echo_ignore_all and icmp_echo_ignore_broadcast Persist through a Reboot
# Let's make those changes permanent. Create a file in /etc/sysctl.d/ called 60-icmp.conf with the following system variables:

icmp_echo_ignore_all = 0
icmp_echo_ignore_broadcasts = 1

# This can be done with a text editor or from the command line using the echo command:

echo -e 'icmp_echo_ignore_all = 0\nicmp_echo_ignore_broadcasts = 1' > /etc/sysctl.d/60-icmp.conf

# If we want to check our work, we can run cat /etc/sysctl.d/60-icmp.conf.

#################################################################

# Enable ip_forward for the Current Session
# We should still be sitting in the /proc/sys/net/ipv4 directory. Check the current ip_forward setting with this:

cat ip_forward

# It's currently set to 0, so let's enable ip_forward using the sysctl command:

sysctl -w net.ipv4.ip_forward=1

#################################################################

# Ensure That the Changes Made to ip_forward will Persist through a Reboot
# Let's make this setting permanent. Create a file in /etc/sysctl.d/ called 60-ip.conf with the following text:

net.ipv4.ip_forward = 1

# This can be done with a text editor or from the command line:

echo "net.ipv4.ip_forward = 1" > /etc/sysctl.d/60-ip.conf

If we run an ll /etc/sysctl.d/, we should see all three files that we just created. 
All of our commands looked good, so these settings should be persistent after a reboot. 

