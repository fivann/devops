lsns -t [type] | sort -k 4

# Replace [type] with the namespace type you want to list 
# (e.g. ipc, mnt, net, pid, user, uts). 
# The lsns command lists all namespaces of the specified 
# type and the sort command sorts the output by the fourth 
# column, which contains the namespace type.

# For example, to list all network namespaces sorted by type, you can use the following command:

lsns -t net | sort -k 4

##################################################################################################
# COOL EXAMPLES
##################################################################################################

# Network isolation: 
# Use network namespaces to create isolated network environments for different applications, services, or users. 
# This can help improve security and prevent network interference between different parts of the system.

# Create a new network namespace
sudo ip netns add mynamespace
# View the list of network namespaces
sudo ip netns list
# Execute a command inside a network namespace
sudo ip netns exec mynamespace ping google.com

##################################################################################################

# Process isolation: 
# Use PID namespaces to isolate processes running on the system. 
# This can help prevent processes from accessing resources they shouldn't have access to and improve security.

# Create a new PID namespace
sudo unshare --pid --fork
# View the PID namespace ID
echo $$

##################################################################################################

# Mount namespace: 
# Use mount namespaces to create isolated file system environments for different applications, services, or users. 
# This can help prevent file system interference and improve security.

# Create a new mount namespace
sudo unshare --mount --fork
# View the mount namespace ID
echo $$

##################################################################################################

# User namespace: 
# Use user namespaces to create isolated user environments for different applications, services, or users.

# Create a new user namespace
sudo unshare --user --fork
# View the user namespace ID
echo $$

##################################################################################################

# Namespace sharing: 
# Use namespace sharing to allow multiple processes or users to share the same namespace.

# Share a network namespace with another process
sudo ip netns add mynamespace
sudo ip netns exec mynamespace bash
sudo ip netns exec mynamespace -- sudo ip netns exec mynamespace2 ping google.com

##################################################################################################

# Namespace migration: 
# Use namespace migration to move a process or user from one namespace to another.

# Move a process to a new PID namespace
sudo unshare --pid --fork
sudo echo $$
sudo nsenter --pid --target $PID_OF_NEW_NAMESPACE
sudo echo $$

##################################################################################################

# Namespace unsharing: 
# Use namespace unsharing to remove a process or user from a namespace.

# Remove a process from a PID namespace
sudo unshare --pid --fork
sudo echo $$
sudo nsenter --pid --target $$

##################################################################################################

# Namespace cleanup: 
# Use namespace cleanup to remove any leftover namespaces after a process has finished running.

# Cleanup any leftover namespaces
sudo ip netns delete mynamespace
sudo umount /mnt/myfilesystem
sudo unshare --mount --fork
sudo echo $$
sudo nsenter --mount=/proc/$$/mounts -- umount /mnt/myfilesystem

##################################################################################################

# Namespace monitoring: 
# Use namespace monitoring to keep track of which namespaces are currently in use on the system.

# Monitor namespace usage
sudo watch -n1 "ip netns list; ps aux --forest --pid=1 -o pid,user,pidns,netns"

##################################################################################################

# Namespace automation: 
# Use namespace automation to automatically create and manage namespaces 
# for different applications, services, or users.

# Automate namespace creation for different users
sudo bash -c "for user in user1 user2 user3; do ip netns add ${user}_ns; chown ${user} /var/run/netns/${user}_ns; done"



