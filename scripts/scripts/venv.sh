#!/bin/bash

# Get the current directory name
CURRENT_DIR=$(basename ***REMOVED***$PWD***REMOVED***)
VENV_DIR=***REMOVED***./.venv_$CURRENT_DIR***REMOVED***

# Check if Python is installed
if ! command -v python3 &>/dev/null; then
    echo ***REMOVED***Error: Python3 is not installed or not in PATH.***REMOVED***
    exit 1
***REMOVED***

# Check if the virtual environment exists, create it if it doesn't
if [ ! -d ***REMOVED***$VENV_DIR***REMOVED*** ]; then
    echo ***REMOVED***Virtual environment not found. Creating one for the current directory: $VENV_DIR***REMOVED***
    python3 -m venv ***REMOVED***$VENV_DIR***REMOVED***
    if [ $? -ne 0 ]; then
        echo ***REMOVED***Error: Failed to create virtual environment.***REMOVED***
        exit 1
    ***REMOVED***
***REMOVED***

# Source the virtual environment
if [ -f ***REMOVED***$VENV_DIR/bin/activate***REMOVED*** ]; then
    source ***REMOVED***$VENV_DIR/bin/activate***REMOVED***
    echo ***REMOVED***Virtual environment activated: $VENV_DIR***REMOVED***
***REMOVED***
    echo ***REMOVED***Error: Activate script not found in $VENV_DIR/bin/***REMOVED***
    exit 1
***REMOVED***

