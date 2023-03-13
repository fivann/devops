#### cpu: 
This cgroup allows you to control CPU usage and prioritization for processes running on the system.

#### memory: 
This cgroup allows you to control memory usage and limits for processes running on the system.

#### blkio: 
This cgroup allows you to control input/output access and limits for processes accessing block devices (e.g. hard drives).

#### cpuset: 
This cgroup allows you to control CPU and memory affinity for processes running on the system.

#### devices: 
This cgroup allows you to control access to devices for processes running on the system.

#### net_cls: 
This cgroup allows you to tag network packets generated by processes running on the system.

#### net_prio: 
This cgroup allows you to prioritize network traffic generated by processes running on the system.

#### perf_event: 
This cgroup allows you to track performance events for processes running on the system.

#### hugetlb: 
This cgroup allows you to control usage of huge pages by processes running on the system.

#### freezer: 
This cgroup allows you to freeze and unfreeze processes running on the system.

#### systemd: 
This cgroup allows you to manage systemd services running on the system.

#### pids: 
This cgroup allows you to control the maximum number of processes that can be created by a user or group.

These cgroups are organized under the /sys/fs/cgroup directory and can be managed using the cgcreate, cgexec, cgclassify, and cgdelete commands.



#### cgcreate: 
This command is used to create a new control group (cgroup) with specific parameters. Here are some examples:

a. Create a new cgroup named "mygroup" in the "cpu" cgroup hierarchy:

sudo cgcreate -g cpu:mygroup
b. Create a new cgroup named "web" in the "net_cls" cgroup hierarchy:


sudo cgcreate -g net_cls:web
c. Create a new cgroup named "mygroup" in the "memory" cgroup hierarchy with a memory limit of 512 MB:

lua
Copy code
sudo cgcreate -g memory:mygroup --memory.limit_in_bytes=536870912

#### cgexec: 
This command is used to execute a command or process within a specific cgroup. Here are some examples:

a. Execute the "nginx" process within the "web" cgroup:
```
sudo cgexec -g net_cls:web nginx
```
b. Execute the "stress" command within the "mygroup" cgroup with a memory limit of 256 MB:
```
sudo cgexec -g memory:mygroup --memory.limit_in_bytes=268435456 stress --vm-bytes 256M --vm-keep -m 1
```
c. Execute the "rsync" command within the "mygroup" cgroup with a CPU limit of 50%:
```
sudo cgexec -g cpu:mygroup --cpu-shares=512 rsync -avz source/ destination/
```

#### cgclassify: 
This command is used to move an existing process into a specific cgroup. Here are some examples:

a. Move the "nginx" process to the "web" cgroup:
```
sudo cgclassify -g net_cls:web $(pidof nginx)
```
b. Move the "rsync" process to the "mygroup" cgroup:
```
sudo cgclassify -g cpu:mygroup $(pidof rsync)
```
c. Move the "stress" process to the "mygroup" cgroup:
```
sudo cgclassify -g memory:mygroup $(pidof stress)
```

#### cgdelete: 
This command is used to delete an existing cgroup. Here are some examples:

a. Delete the "web" cgroup:
```
sudo cgdelete -g net_cls:web
```
b. Delete the "mygroup" cgroup from the "memory" cgroup hierarchy:
```
sudo cgdelete -g memory:mygroup
```
c. Delete the "mygroup" cgroup from the "cpu" cgroup hierarchy:
```
sudo cgdelete -g cpu:mygroup
```
