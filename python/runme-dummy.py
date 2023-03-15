import datetime
import time
import os
import sys

# Dummy runmy script to pring timestamp once in awhile

log_file_path = "/log/timestamp.log"

while True:
    current_time = datetime.datetime.utcnow()
    current_time_formatted = current_time.strftime("%Y-%m-%d %H:%M:%S")
    try:
        with open(log_file_path, "a") as log_file:
            log_file.write(current_time_formatted + " UTC\n")
    except IOError:
        print(f"Error: Unable to access file {log_file_path}")
        sys.exit(1)
    time.sleep(60)
