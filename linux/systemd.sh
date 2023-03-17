Identify the Target to Use to Determine if the Network Is Online

List the contents of /usr/lib/systemd/system/network*:

ls /usr/lib/systemd/system/network*
We'll see a number of targets we might be able to use. Among them, network-online.target seems like the best bet.

Run the following:

man 7 systemd.special
Search for network-online.target in the man page by typing:

/network-online
We'll see there's an entry about the network-online.target as well, and that looks like the right thing.

Press q to get back to the command prompt.

Write the Custom Service File

Change directory:

cd /etc/systemd/system

Create custom.service:

vim custom.service

Enter the following:

[Unit]
Description=Custom Service
Wants=network-online.target
After=network-online.target

[Service]
Type=forking
ExecStart=/usr/bin/emacs --daemon
ExecStop=/usr/bin/emacsclient --eval "(kill-emacs)"

[Install]
WantedBy=default.target
Save and exit the file by pressing Escape followed by :wq.

Start the service:

systemctl start custom.service
Check its status:

systemctl status custom.service
We should see it's running.


Additional Resources
Note: Please give the lab server time to finish provisioning before attempting a connection via ssh.

You've been tasked with writing a service file for a piece of software called emacs.

The command to start it is:

emacs --daemon
The command to stop it is:

emacsclient --eval "(kill-emacs)"
The emacs software will fork a process and then exit.

The software should not start until the network is online.

########################################################

Working with Systemd Mount Units
In this hands-on lab, we will create systemd mount and automount units. We will create the two new mount units on our host.

The first mount unit should comply with the following:
    File system:/dev/xvdg1
    Mounted on /mnt/data
    Filesystem: xfs
    Description: "Data mount"
    Should be wanted by the multi-user.target

The second mount should comply with the following:
    File system: /dev/xvdg2
    Mounted on /mnt/backup
    Filesystem:ext4
    Mounted as read-only.
    Description: "Backup mount"
    Should be wanted by the multi-user.target.

The file system should comply with the following:
    Automatically mounted using an automount unit
    An idle timeout of 10 minutes
    Description: "Automount backup directory”
    Should be wanted by the multi-user.target.

Note:
    Creat all unit files in /etc/systemd/system
    The UUIDs of the filesystems will change with each attempt
    
########################################################


Before We Begin

To get started, we need to log in to our Linux server using the provided credentials. Make sure to become the root user once logged in.

Create a Unit File for the Data Mount
Create a unit file for the data mount based on the information provided in the instructions and ensure that it is started and enabled:

First, we need to change our directory to the system directory using cd /etc/systemd/system.
Run lsblk -f to obtain the UUID for xvdg1 xfs for use in the file.
Create a unit file in /etc/systemd/system named mnt-data.mount. For our example, we're using vim:
vim mnt-data.mount
Enter the following into the file:
[Unit]
Description=Data mount

[Mount]
What=/dev/disk/by-uuid/Filesystem_UUID
Where=/mnt/data
Type=xfs
Options=defaults

[Install]
WantedBy=multi-user.target
Save and quit with :wq.
Update the systemd manager configuration to include the new unit file:
systemctl daemon-reload

Start and enable the mnt-data.mount unit:
systemctl enable mnt-data.mount --now

Create a Unit File for the Backup Mount
Create a unit file for the backup mount:

Create a mountpoint for mnt-backup.mount at /mnt/backup:
mkdir /mnt/backup

Use lsblk -f and coppy the UUID for xvdg2 ext4 for the mnt-backup.mount file.
Create a unit file in /etc/systemd/system named mnt-backup.mount using vim: vim mnt-backup.mount
Enter the following contents:
[Unit]
Description=Backup mount

[Mount]
What=/dev/disk/by-uuid/Filesystem_UUID
Where=/mnt/backup
Type=ext4
Options=ro

[Install]
WantedBy=multi-user.target
Save and quit.
Update the systemd manager configuration to include a new unit file:
systemctl daemon-reload

Create an Automount Unit File
Create an automount unit file for mnt-backup.mount based on the information provided:

Create a unit file in /etc/systemd/system named mnt-backup.automount using vim: vim mnt-backup.automount.
Enter the following contents:
[Unit]
Description=Automount backup directory

[Automount]
Where=/mnt/backup
TimeoutIdleSec=600

[Install]
WantedBy=multi-user.target
Save and quit.
Update the systemd manager configuration to include the new unit file:
systemctl daemon-reload

Start and enable the mnt-backup.automount unit:
systemctl enable mnt-backup.automount --now

Check that the status is running:
systemctl status mnt-backup.automount
Conclusion
Congratulations! You've completed the lab!
