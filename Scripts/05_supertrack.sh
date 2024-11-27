

# ----------------------------------------
# Install Supertrack
# ----------------------------------------
echo "Checking for Supertrack..."
if command -v super-track >/dev/null 2>&1; then
    echo "Supertrack is already installed. Skipping installation."
else
    echo "Installing super-track..."
    if ! (
        sudo snap install super-track && echo -e "[Desktop Entry]\nType=Application\nVersion=1.0\nName=super-track\nComment=super-track startup script\nExec=/snap/bin/super-track\nStartupNotify=false\nTerminal=false" > ~/.config/autostart/super-track.desktop
    ); then
        echo "Failed to install super-track."
    fi
fi