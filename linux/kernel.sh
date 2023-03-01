# There are many Linux kernel tweaks that can be used to optimize performance, improve security, or customize the behavior of the system. 
# Here are some of the most common and useful ones, along with examples of how to use them:

# Swappiness - This setting controls how often the kernel swaps memory between RAM and swap space. 
# By default, it is set to 60, which means the kernel will start swapping when the RAM usage is around 40%. 
# This can be adjusted to optimize performance or reduce wear on SSDs. For example, to set the swappiness to 10:
sudo sysctl vm.swappiness=10

# TCP keepalive - This setting controls how often the kernel sends keepalive messages to maintain TCP connections. 
# By default, it is set to 7200 seconds (2 hours), which can lead to long delays in detecting and recovering from lost connections. 
# For example, to set the keepalive interval to 60 seconds:
sudo sysctl net.ipv4.tcp_keepalive_time=60

# File system tuning - There are several settings that can be adjusted to optimize the performance of the file system, 
# such as the number of inodes, the file system block size, and the disk read-ahead buffer size. For example, 
# to set the read-ahead buffer size to 64KB:
sudo blockdev --setra 64 /dev/sda1

# Transparent huge pages - This feature allows the kernel to use large memory pages to reduce memory fragmentation 
# and improve performance. For example, to disable transparent huge pages:
sudo echo never > /sys/kernel/mm/transparent_hugepage/enabled

# CPU scheduler - The kernel's CPU scheduler determines how CPU time is allocated to processes. 
# There are several scheduler algorithms available, each with its own trade-offs between fairness, throughput, and responsiveness. 
# For example, to set the scheduler to the Completely Fair Scheduler:
sudo echo cfq > /sys/block/sda/queue/scheduler

# These are just a few examples of the many Linux kernel tweaks that can be used to customize the behavior of the system. 
# It's important to note that some tweaks may have unintended consequences or cause instability, 
# so it's recommended to test them thoroughly before deploying them in production environments.

10 more examples of Linux kernel tweaks that can be useful:

# IO Scheduler - The IO scheduler determines how the kernel handles IO requests from the storage devices. 
# There are several IO schedulers available, such as the CFQ (Completely Fair Queuing) and the Deadline scheduler. 
# For example, to set the CFQ scheduler:
sudo echo cfq > /sys/block/sda/queue/scheduler

# TCP Congestion Control Algorithm - This setting controls how the kernel responds to congestion on the network. 
# There are several congestion control algorithms available, such as CUBIC and BBR. For example, to use the BBR algorithm:
sudo sysctl net.ipv4.tcp_congestion_control=bbr

# Kernel Same-page Merging (KSM) - This feature allows the kernel to merge identical memory pages to reduce memory usage. 
# For example, to enable KSM:
sudo echo 1 > /sys/kernel/mm/ksm/run

# TCP Fast Open (TFO) - This feature allows the kernel to send data in the SYN packet during the TCP handshake, 
# which can reduce latency and improve performance. For example, to enable TFO:
sudo echo 3 > /proc/sys/net/ipv4/tcp_fastopen

# Real-time scheduling - This setting allows certain processes to be scheduled with real-time priority, 
# which can improve responsiveness for certain applications. For example, to set the scheduling policy for a process to SCHED_FIFO:
sudo chrt -f -p 99 <pid>

# Kernel Virtual Machine (KVM) tuning - There are several settings that can be adjusted to optimize the performance of KVM, 
# such as the number of virtual CPUs and the amount of memory allocated to each virtual machine. F
# or example, to set the number of virtual CPUs to 4:
sudo virsh edit <vm-name>

# Add or modify the <vcpu> tag to set the number of virtual CPUs

# Memory management - There are several settings that can be adjusted to optimize the kernel's memory management, 
# such as the page cache size and the maximum number of file handles. For example, to increase the maximum number of file handles:
sudo sysctl fs.file-max=100000

# Kernel module tuning - There are several settings that can be adjusted to optimize the behavior of kernel modules, such as 
# the maximum size of the kernel stack and the maximum number of kernel threads. For example, to increase the maximum size of the kernel stack:
sudo sysctl kernel.stack_size_max=16384

# Network tuning - There are several settings that can be adjusted to optimize the performance of the network stack, 
# such as the size of the receive buffer and the maximum number of sockets. For example, to increase the size of the receive buffer:
sudo sysctl net.core.rmem_max=262144

# Security hardening - There are several settings that can be adjusted to improve the security of the system, 
# such as disabling certain system calls and enabling Address Space Layout Randomization (ASLR). For example, to enable ASLR:
sudo sysctl kernel.randomize_va_space=2

