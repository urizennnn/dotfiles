#!/usr/bin/env python3

import os
import sys


def list_***REMOVED***les_with_extension(dir_path, ***REMOVED***le_ext, exclude_dirs=None):
    if exclude_dirs is None:
        exclude_dirs = []

    # Normalize exclude_dirs to be folder names only (ignoring paths)
    exclude_dirs = set(os.path.basename(dir.strip(***REMOVED***/***REMOVED***)) for dir in exclude_dirs)

    # Dictionary to store ***REMOVED***les and their contents
    ***REMOVED***le_contents = {}

    # Traverse the directory and gather ***REMOVED***les with the speci***REMOVED***ed extension
    for root, dirs, ***REMOVED***les in os.walk(dir_path):
        # Modify dirs in place to exclude directories in exclude_dirs
        dirs[:] = [d for d in dirs if d not in exclude_dirs]

        for ***REMOVED***le in ***REMOVED***les:
            if ***REMOVED***le.endswith(***REMOVED***le_ext):
                ***REMOVED***le_path = os.path.join(root, ***REMOVED***le)
                with open(***REMOVED***le_path, ***REMOVED***r***REMOVED***, errors=***REMOVED***ignore***REMOVED***) as f:
                    ***REMOVED***le_contents[***REMOVED***le_path] = f.read()

    # Display the contents of each ***REMOVED***le with speci***REMOVED***ed extension
    for ***REMOVED***le_path, content in ***REMOVED***le_contents.items():
        print(***REMOVED***\n***REMOVED*** + ***REMOVED***-***REMOVED*** * 40)
        print(f***REMOVED***Filepath:\n{***REMOVED***le_path}\n***REMOVED***)
        print(***REMOVED***Contents:\n***REMOVED***)
        print(content)
        print(***REMOVED***-***REMOVED*** * 40)


if _name_ == ***REMOVED***_main_***REMOVED***:
    if len(sys.argv) < 3:
        print(
            ***REMOVED***Usage: python script.py <directory_path> <***REMOVED***le_extension> [excluded_dir1] [excluded_dir2] ...***REMOVED***
        )
    ***REMOVED***:
        dir_path = sys.argv[1]
        ***REMOVED***le_ext = sys.argv[2]
        exclude_dirs = sys.argv[3:] if len(sys.argv) > 3 ***REMOVED*** []
        list_***REMOVED***les_with_extension(dir_path, ***REMOVED***le_ext, exclude_dirs)
