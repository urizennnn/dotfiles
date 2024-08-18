
#!/bin/bash

# Function to install packages from a list file using a specified command
install_plugins() {
    local file=$1
    local cmd=$2
    
    if [[ -f "$file" ]]; then
        while IFS= read -r plugin; do
            # Skip empty lines and comments
            [[ -z "$plugin" || "$plugin" =~ ^# ]] && continue
            
            echo "Installing $plugin using $cmd..."
            $cmd "$plugin"
        done < "$file"
    else
        echo "File $file not found!"
    fi
}

# Install plugins using brew from plugins-brew.txt
install_plugins "plugins-brew.txt" "brew install"

# Install plugins using yay from plugins-yay.txt
install_plugins "plugins-yay.txt" "yay -S"

# Install plugins using pacman from plugins.txt
install_plugins "plugins.txt" "sudo pacman -S --noconfirm"

echo "All plugins installed!"
