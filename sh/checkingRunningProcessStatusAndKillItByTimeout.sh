#!/bin/bash

timeout=1800 # 30 minutes in seconds
start_time=$(date +%s)

# Run the checkbackups command
checkbackups &

while true; do
    status=$(checkbackups -s)

    if [ "$status" == "failed" ]; then
        echo "failed!"
        exit 1
    elif [ "$status" == "done" ]; then
        echo "done!"
        exit 0
    elif [ "$status" == "running" ]; then
        current_time=$(date +%s)
        if [ $((current_time - start_time)) -gt $timeout ]; then
            echo "timeout, terminating"
            pkill checkbackups
            exit 1
        fi
    fi

    sleep 1
done

# This script will run an infinite loop and check the status of the "checkbackups" command every second. 
# If the status is "failed", it will display the message "failed!" and exit with a non-zero exit code. If the status is "done", 
# it will display the message "done!" and exit with a zero exit code. 
# If the status is "running", the script will check if the command has been running for more than 30 minutes (1800 seconds) and if so, 
# it will display the message "timeout, terminating" and kill the "checkbackups" process using the pkill command.
