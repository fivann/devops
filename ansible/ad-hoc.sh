# 10 examples of useful Ansible ad-hoc commands:

# Ping all hosts in the inventory:

ansible all -m ping

# This command will ping all hosts in the inventory to ensure that they are reachable.

# Check the uptime of all hosts in the inventory:

ansible all -a "uptime"

# This command will check the uptime of all hosts in the inventory by executing the uptime command on each host.

# Retrieve information about the network interfaces on all hosts in the inventory:

ansible all -m shell -a "ip addr show"

# This command will retrieve information about the network interfaces on all hosts in the inventory by executing the ip addr show command on each host.

# Install the nginx package on all hosts in the inventory:

ansible all -m apt -a "name=nginx state=present"

# This command will install the nginx package on all hosts in the inventory using the apt module.

# Restart the httpd service on all hosts in the inventory:

ansible all -m service -a "name=httpd state=restarted"

# This command will restart the httpd service on all hosts in the inventory using the service module.

# Retrieve the disk usage information for the /var directory on all hosts in the inventory:

ansible all -m shell -a "du -h /var"

# This command will retrieve the disk usage information for the /var directory on all hosts 
# in the inventory by executing the du command on each host.

# Retrieve the contents of the /etc/hosts file on all hosts in the inventory:

ansible all -m shell -a "cat /etc/hosts"

# This command will retrieve the contents of the /etc/hosts file on all hosts in the inventory by executing the cat command on each host.

# Retrieve the status of the ssh service on all hosts in the inventory:

ansible all -m shell -a "systemctl status ssh"

# This command will retrieve the status of the ssh service on all hosts in the inventory by executing the systemctl command on each host.

# Create a new user named testuser with a home directory of /home/testuser on all hosts in the inventory:

ansible all -m user -a "name=testuser home=/home/testuser"

# This command will create a new user named testuser with a home directory of /home/testuser on all hosts in the inventory using the user module.

# Retrieve the contents of the /var/log/syslog file on all hosts in the inventory:

ansible all -m shell -a "tail -n 100 /var/log/syslog"

# This command will retrieve the last 100 lines of the /var/log/syslog file on all hosts 
# in the inventory by executing the tail command on each host.
