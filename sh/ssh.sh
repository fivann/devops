# ssh: 
# This command is used to start a new SSH session. 
# The syntax is 
ssh [user@]hostname [command]
# If you omit the command, you will be dropped into a shell on the remote system.

# scp: 
# This command is used to copy files between two systems over SSH. 
# The syntax is 
scp [options] source_file destination_file
# For example, 
scp file.txt user@remotehost:/path/to/destination will 
# copy the file to the remote host.

# sftp: 
# This command is used to securely transfer files between two systems over SSH. 
# It provides a similar interface to FTP, but with the added security of encryption. The syntax is 
sftp [user@]hostname.

# ssh-keygen: 
# This command is used to generate SSH key pairs. 
# These keys can be used to authenticate with remote systems without having to enter a password. The syntax is 
ssh-keygen [options]

# ssh-copy-id: 
# This command is used to copy your public SSH key to a remote system's authorized_keys file. 
# This allows you to authenticate with the remote system without having to enter a password. The syntax is 
ssh-copy-id [user@]hostname

# sshfs: 
# This command is used to mount a remote file system over SSH. 
# This allows you to access files on a remote system as if they were on your local system. The syntax is 
sshfs [user@]hostname:/remote/path /local/path.

# ssh-agent: 
# This command is used to manage SSH keys in memory. 
# This allows you to enter your passphrase once and use your SSH key for multiple SSH sessions. The syntax is 
ssh-agent [options]

# ssh-add: 
# This command is used to add your SSH key to the ssh-agent. The syntax is 
ssh-add [options]

# ssh-keyscan: 
# This command is used to get the SSH host key of a remote system. The syntax is 
ssh-keyscan [options] [hostname]

# sshfs: 
# This command is used to mount a remote file system over SSH. 
# This allows you to access files on a remote system as if they were on your local system. 
# The syntax is 
sshfs [user@]hostname:/remote/path /local/path.

# These commands can help you to connect to and work with remote systems over SSH. 
# With these commands, you can securely transfer files, mount remote file systems, and manage your SSH keys.

########################################################################################################################

# Here are five examples of using scp command to securely copy files between two systems over SSH:

# Copy a file from the local system to a remote system:
scp /path/to/local/file.txt user@remotehost:/path/to/destination

# This command will copy the file "file.txt" from the local system to the remote system at "/path/to/destination".

# Copy a file from a remote system to the local system:
scp user@remotehost:/path/to/remote/file.txt /path/to/destination

# This command will copy the file "file.txt" from the remote system to the local system at "/path/to/destination".

# Copy a directory from the local system to a remote system:
scp -r /path/to/local/directory user@remotehost:/path/to/destination

# This command will copy the entire directory "directory" from the local system to the remote system at "/path/to/destination".

# Copy a directory from a remote system to the local system:
scp -r user@remotehost:/path/to/remote/directory /path/to/destination

# This command will copy the entire directory "directory" from the remote system to the local system at "/path/to/destination".

# Copy a file from one remote system to another remote system via the local system:
scp user1@remotehost1:/path/to/file.txt user2@remotehost2:/path/to/destination

# This command will copy the file "file.txt" from the remote system at "remotehost1" to the remote system at "remotehost2" via the local system.


