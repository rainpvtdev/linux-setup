
# ----------------------------------------
# Install Sublime Text
# ----------------------------------------
echo "Checking for Sublime Text..."
if command -v subl >/dev/null 2>&1; then
    echo "Sublime Text is already installed. Skipping installation."
else
    echo "Installing Sublime Text..."
    if ! (
        wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo gpg --dearmor -o /usr/share/keyrings/sublimehq-archive-keyring.gpg &&
        echo "deb [signed-by=/usr/share/keyrings/sublimehq-archive-keyring.gpg] https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list &&
        sudo apt update &&
        sudo apt install -y sublime-text
    ); then
        echo "Failed to install Sublime Text."
    fi
fi