#!/bin/bash

# Load the nfs module
echo "nfs" >> /etc/modules-load.d/nfs.conf

# Set the max_session_slots parameter to 128
echo "options nfs max_session_slots=128" > /etc/modprobe.d/nfs.conf

# Load the module with the new parameter
modprobe nfs

# Print a message to indicate that the configuration is complete
echo "Configuration complete. The nfs module is now loaded with max_session_slots=128."

