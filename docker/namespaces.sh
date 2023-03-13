lsns -t [type] | sort -k 4

# Replace [type] with the namespace type you want to list 
# (e.g. ipc, mnt, net, pid, user, uts). 
# The lsns command lists all namespaces of the specified 
# type and the sort command sorts the output by the fourth 
# column, which contains the namespace type.

# For example, to list all network namespaces sorted by type, you can use the following command:

lsns -t net | sort -k 4

