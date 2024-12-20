
#!/bin/bash

# Check if the script is run as root
if [ ***REMOVED***$(id -u)***REMOVED*** -ne 0 ]; then
  echo ***REMOVED***Please run this script as root.***REMOVED***
  exit 1
***REMOVED***

echo ***REMOVED***Clearing unused RAM and freeing up memory...***REMOVED***

# Display memory usage before clearing
echo ***REMOVED***Memory usage before clearing:***REMOVED***
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
echo ***REMOVED***Memory usage after clearing:***REMOVED***
free -h

echo ***REMOVED***RAM has been cleared successfully!***REMOVED***
