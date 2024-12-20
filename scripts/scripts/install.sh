#!/bin/bash

DOTFILES_DIR=***REMOVED***$HOME/dot***REMOVED***les***REMOVED***

if [ ! -d ***REMOVED***$DOTFILES_DIR***REMOVED*** ]; then
  echo ***REMOVED***Error: Dot***REMOVED***les directory '$DOTFILES_DIR' not found!***REMOVED***
  exit 1
***REMOVED***

TARGET_DIR=***REMOVED***$HOME***REMOVED***

if ! command -v stow &> /dev/null; then
  echo ***REMOVED***Error: stow is not installed. Please install stow and try again.***REMOVED***
  exit 1
***REMOVED***

for package in $(ls -d $DOTFILES_DIR/*/); do
  package_name=$(basename $package)
  echo ***REMOVED***Stowing '$package_name' to the target directory '$TARGET_DIR'...***REMOVED***
  stow --target=***REMOVED***$TARGET_DIR***REMOVED*** ***REMOVED***$package_name***REMOVED***
done

echo ***REMOVED***Dot***REMOVED***les installation complete!***REMOVED***
