#!/bin/bash

# Get the current directory name
CURRENT_DIR=$(basename "$PWD")
VENV_DIR="./.venv_$CURRENT_DIR"

# Check if Python is installed
if ! command -v python3 &>/dev/null; then
    echo "Error: Python3 is not installed or not in PATH."
    exit 1
fi

# Check if the virtual environment exists, create it if it doesn't
if [ ! -d "$VENV_DIR" ]; then
    echo "Virtual environment not found. Creating one for the current directory: $VENV_DIR"
    python3 -m venv "$VENV_DIR"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create virtual environment."
        exit 1
    fi
fi

# Source the virtual environment
if [ -f "$VENV_DIR/bin/activate" ]; then
    source "$VENV_DIR/bin/activate"
    echo "Virtual environment activated: $VENV_DIR"
else
    echo "Error: Activate script not found in $VENV_DIR/bin/"
    exit 1
fi

