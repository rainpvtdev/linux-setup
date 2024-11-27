
# ----------------------------------------
# Install Meld
# ----------------------------------------
echo "Checking for Meld..."
if command -v meld >/dev/null 2>&1; then
    echo "Meld is already installed. Skipping installation."
else
    echo "Installing Meld..."
    if ! sudo apt install -y meld; then
        echo "Failed to install Meld."
    fi
fi