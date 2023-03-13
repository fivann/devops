#!/bin/bash

# Define the default target directory for the libraries
target_dir="/home/user/lib64"

# Parse command line arguments
while getopts "b:u:" opt; do
  case $opt in
    b)
      binary=$OPTARG
      ;;
    u)
      username=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

# Check if binary and username are set
if [ -z "$binary" ] || [ -z "$username" ]; then
  echo "Usage: $0 -b <binary file> -u <username>"
  exit 1
fi

# Extract the list of libraries used by the binary
libs=$(ldd $binary | awk '{print $3}' | grep -v '^$')

# Create the target directory for the libraries
mkdir -p $target_dir

# Copy each library to the target directory
for lib in $libs; do
  cp $lib $target_dir
done

# Set ownership and permissions for the target directory
chown -R $username:$username $target_dir
chmod -R 755 $target_dir


# The updated script includes a command line argument parser that uses getopts to parse the -b and -u options. 
# The script checks if these options are set, and prints the usage message if they are missing. 
# The target_dir variable is set to the default value, but can be overridden by editing the script. 
# Finally, the ownership and permissions of the target directory are set to the specified username.

