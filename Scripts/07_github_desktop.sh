
# ----------------------------------------
# Install GitHub Desktop
# ----------------------------------------
echo "Checking for GitHub Desktop..."
if command -v github-desktop >/dev/null 2>&1; then
    echo "GitHub Desktop is already installed. Skipping installation."
else
    echo "Installing GitHub Desktop..."
    if ! (
        wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null &&
        sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list' &&
        sudo apt update && sudo apt install github-desktop
    ); then
        echo "Failed to install GitHub Desktop."
    fi
fi
