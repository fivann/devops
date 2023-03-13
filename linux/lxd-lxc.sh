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
