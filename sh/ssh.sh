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
It provides a similar interface to FTP, but with the added security of encryption. The syntax is 
sftp [user@]hostname.

ssh-keygen: This command is used to generate SSH key pairs. 
These keys can be used to authenticate with remote systems without having to enter a password. The syntax is ssh-keygen [options].

ssh-copy-id: 
This command is used to copy your public SSH key to a remote system's authorized_keys file. 
This allows you to authenticate with the remote system without having to enter a password. The syntax is ssh-copy-id [user@]hostname.

sshfs: 
This command is used to mount a remote file system over SSH. 
This allows you to access files on a remote system as if they were on your local system. 
The syntax is sshfs [user@]hostname:/remote/path /local/path.

ssh-agent: 
This command is used to manage SSH keys in memory. 
This allows you to enter your passphrase once and use your SSH key for multiple SSH sessions. 
The syntax is ssh-agent [options].

ssh-add: 
This command is used to add your SSH key to the ssh-agent. 
The syntax is ssh-add [options].

ssh-keyscan: 
This command is used to get the SSH host key of a remote system. 
The syntax is ssh-keyscan [options] [hostname].

# sshfs: 
# This command is used to mount a remote file system over SSH. 
# This allows you to access files on a remote system as if they were on your local system. 
# The syntax is 
sshfs [user@]hostname:/remote/path /local/path.

These commands can help you to connect to and work with remote systems over SSH. 
With these commands, you can securely transfer files, mount remote file systems, and manage your SSH keys.

