
#!/bin/bash

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "Please run this script as root."
  exit 1
fi

echo "Clearing unused RAM and freeing up memory..."

# Display memory usage before clearing
echo "Memory usage before clearing:"
free -h

# Clear the page cache
echo 1 > /proc/sys/vm/drop_caches

# Clear dentries and inodes
echo 2 > /proc/sys/vm/drop_caches

# Clear page cache, dentries, and inodes
echo 3 > /proc/sys/vm/drop_caches

# Sync to avoid data loss
sync

# Display memory usage after clearing
echo "Memory usage after clearing:"
free -h

echo "RAM has been cleared successfully!"
