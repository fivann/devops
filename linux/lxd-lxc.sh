# LXD
lxc launch <image> <name>: Launches a new container with the specified image and name.
lxc list: Lists all running containers.
lxc info <name>: Shows information about the specified container.
lxc exec <name> <command>: Runs a command inside the specified container.
lxc stop <name>: Stops the specified container.
lxc delete <name>: Deletes the specified container.
lxc image list: Lists all available images.
lxc image copy <remote>:<image> local:: Copies an image from a remote server to the local server.
lxc network list: Lists all available networks.
lxc network create <name> <type>: Creates a new network with the specified name and type.
lxc config show <name>: Shows the configuration of the specified container.

# LXC
lxc remote list: Lists containers
lxc-create -t <template> -n <name>: Creates a new container with the specified template and name.
lxc-ls: Lists all running containers.
lxc-info -n <name>: Shows information about the specified container.
lxc-attach -n <name> -- <command>: Runs a command inside the specified container.
lxc-stop -n <name>: Stops the specified container.
lxc-destroy -n <name>: Deletes the specified container.
lxc-ls --fancy: Lists all running containers with detailed information.
lxc-snapshot -n <name> <snapshot-name>: Creates a snapshot of the specified container.
lxc-start -n <name> -d: Starts the specified container in the background.
lxc-console -n <name>: Attaches to the console of the specified container.
lxc-cgroup -n <name> memory.limit_in_bytes <value>: Sets the memory limit for the specified container.

# Note that some commands may differ between LXD and LXC, as LXD is a newer, 
# higher-level tool that provides a more user-friendly interface to LXC. 
# However, both tools are compatible with each other and can be used together as needed.


# Installing LXC/LXD

# Determine which Linux distribution your server is running:

cat /etc/issue
# Install lxd and lxd-client:

sudo apt install lxd lxd-client 
# When prompted, enter the password provided on the lab page and hit Enter.

# Initialize LXD:

sudo lxd init

# Accept the defaults for each of the prompts, except for configuring IPv6. Select No when prompted to set up an IPv6 subnet.

# Create Your First Container
# Create a container using Alpine 3.14 named my-alpine:

sudo lxc launch images:alpine/3.14 my-alpine

# List your containers:

sudo lxc list 

# Connect to a Container
# Execute an ash shell in your my-alpine container:

sudo lxc exec my-alpine -- /bin/ash

# Create a file named hello.txt:

echo hello world! > hello.txt

# Type ls to see the file, or (optionally) type cat hello.txt to see the content of the file .



