#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"

if [ ! -d "$DOTFILES_DIR" ]; then
  echo "Error: Dotfiles directory '$DOTFILES_DIR' not found!"
  exit 1
fi

TARGET_DIR="$HOME"

if ! command -v stow &> /dev/null; then
  echo "Error: stow is not installed. Please install stow and try again."
  exit 1
fi

for package in $(ls -d $DOTFILES_DIR/*/); do
  package_name=$(basename $package)
  echo "Stowing '$package_name' to the target directory '$TARGET_DIR'..."
  stow --target="$TARGET_DIR" "$package_name"
done

echo "Dotfiles installation complete!"
