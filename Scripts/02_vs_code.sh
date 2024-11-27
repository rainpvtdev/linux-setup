
# ----------------------------------------
# Install Visual Studio Code
# ----------------------------------------
echo "Checking for Visual Studio Code..."
if command -v code >/dev/null 2>&1; then
    echo "Visual Studio Code is already installed. Skipping installation."
else
    echo "Installing Visual Studio Code..."
    if ! (
        wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg &&
        sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/packages.microsoft.gpg &&
        sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' &&
        sudo apt update &&
        sudo apt install -y code &&
        rm packages.microsoft.gpg
    ); then
        echo "Failed to install Visual Studio Code."
    fi
fi