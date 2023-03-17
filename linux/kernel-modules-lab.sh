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

