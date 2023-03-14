## Storage drivers

Docker supports different storage drivers that provide the underlying mechanism for managing the storage of images and containers. Here's an overview of the different storage drivers:

### aufs: 
The aufs (Advanced Multi-Layered Unification File System) driver is the oldest and most widely used storage driver in Docker. It is stable and provides good performance, but it has some limitations, such as being unable to run on some newer Linux kernels.

### overlay2: 
The overlay2 driver is the recommended storage driver for Docker on newer Linux kernels. It is more modern and provides better performance and stability than aufs, and supports features such as copy-on-write (COW) and incremental builds.

### devicemapper: 
The devicemapper driver provides block-level storage management for Docker. It can be slower than other storage drivers and requires more configuration, but it can provide better isolation and security for container data.

### btrfs: 
The btrfs (B-tree file system) driver provides a COW filesystem that supports snapshots and rollback capabilities. It is less commonly used than other drivers, but can provide good performance and flexibility in certain use cases.

### zfs: 
The zfs (Zettabyte File System) driver provides advanced storage features such as snapshots, clones, and compression. It requires more configuration and setup than other drivers, but can provide high levels of data integrity and protection.

### vfs:
The vfs (Virtual File System) driver is the simplest storage driver and is mostly used for testing and development. It is not recommended for production use, as it has poor performance and does not support many features.

When choosing a storage driver, you should consider factors such as performance, stability, and the features that are most important to your use case. In general, the overlay2 driver is the recommended choice for most users, as it provides good performance and stability on modern Linux kernels.

```
>>> docker info | grep Driver
```


When you install Docker on a machine, a default storage driver will be used based on the operating system and kernel version. However, you can also specify a different storage driver if needed. Here's how to set up a Docker storage driver:

Check the current storage driver: You can check the current storage driver by running the following command:
```
docker info | grep -i 'storage driver'
```
This will display the current storage driver being used.

Choose a new storage driver: Based on your needs and the system requirements, you can choose a new storage driver that suits your needs. You can choose from the available drivers, such as aufs, overlay2, devicemapper, btrfs, and zfs.

Configure the storage driver: To configure the new storage driver, you need to edit the Docker daemon configuration file, which is usually located at /etc/docker/daemon.json. If the file doesn't exist, create it.

Set the storage driver: In the configuration file, add the following line to specify the new storage driver:
```
{
    "storage-driver": "<driver-name>"
}
```
Replace <driver-name> with the name of the storage driver you want to use, such as aufs, overlay2, devicemapper, btrfs, or zfs.

Restart Docker: After making the changes to the configuration file, restart Docker to apply the new configuration. You can use the following command to restart Docker:
```
sudo systemctl restart docker
```
After restarting, Docker should be using the new storage driver.

Note that changing the storage driver may result in data loss, so it is important to backup any important data before making changes. Additionally, not all storage drivers are supported on all operating systems, so make sure to check the documentation and compatibility before making any changes.
  
  
## Logging dirvers
    
In Docker, a logging driver is a plugin that defines how the container logs are collected and where they are sent. By default, Docker sends container logs to the standard output and standard error streams. However, using logging drivers, you can send the logs to other destinations like a file, a syslog daemon, a remote logging service, or an external logging system.

Docker supports several logging drivers, including:

#### json-file: 
This driver writes container logs to a JSON-formatted file on the host file system.

#### syslog: 
    This driver sends container logs to the syslog daemon on the host.

#### journald: 
This driver sends container logs to the systemd-journald service on the host.

#### fluentd: 
This driver sends container logs to a Fluentd logging system.

#### awslogs: 
This driver sends container logs to Amazon CloudWatch Logs.

#### gelf: 
This driver sends container logs to a Graylog Extended Log Format (GELF) server.

To specify a logging driver for a container, you can use the "--log-driver" option with the "docker run" command, followed by the name of the logging driver. For example, "docker run --log-driver=syslog myimage" specifies the syslog logging driver for the container. You can also specify additional options for the logging driver using the "--log-opt" option.



