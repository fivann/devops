#!/bin/sh

# nullify all logs older than 5 days and larger than 100mb
find /var/log -name "*.log" -size +100M -mtime +5 -exec truncate -s 0 {} \;

# find last 10 errors in log file
tail -n 10 /path/to/your/file.log | grep "error"
