
# ----------------------------------------
# Install Google Chrome
# ----------------------------------------
echo "Checking for Google Chrome..."
if command -v google-chrome >/dev/null 2>&1; then
    echo "Google Chrome is already installed. Skipping installation."
else
    echo "Installing Google Chrome..."
    if ! (
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
        sudo apt install -y ./google-chrome-stable_current_amd64.deb &&
        rm google-chrome-stable_current_amd64.deb
    ); then
        echo "Failed to install Google Chrome."
    fi
fi