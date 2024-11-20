#!/bin/bash

failed_installations=()

echo "Updating system..."
if ! sudo apt update && sudo apt upgrade -y; then
    echo "Failed to update system."
    failed_installations+=("System Update")
fi

echo "Installing common dependencies..."
if ! sudo apt install -y wget curl gnupg2 ca-certificates lsb-release apt-transport-https software-properties-common git libgconf-2-4 libxss1 libnss3; then
    echo "Failed to install common dependencies."
    failed_installations+=("Common Dependencies")
fi

# ----------------------------------------
# Install Node Version Manager (nvm)
# ----------------------------------------
echo "Checking for Node Version Manager (nvm)..."
if command -v nvm >/dev/null 2>&1 || [ -d "$HOME/.nvm" ]; then
    echo "nvm is already installed. Skipping installation."
else
    echo "Installing Node Version Manager (nvm)..."
    if ! curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash; then
        echo "Failed to install nvm."
        failed_installations+=("Node Version Manager (nvm)")
    else
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        if ! nvm install --lts; then
            echo "Failed to install Node.js via nvm."
            failed_installations+=("Node.js (via nvm)")
        fi
    fi
fi

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
        failed_installations+=("Visual Studio Code")
    fi
fi

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
        failed_installations+=("Sublime Text")
    fi
fi

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
        failed_installations+=("Google Chrome")
    fi
fi

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
        failed_installations+=("super-track")
    fi
fi

# ----------------------------------------
# Install Mattermost
# ----------------------------------------
echo "Checking for mattermost-desktop..."
if command -v /home/rain/Documents/mattermost-desktop-5.6.0-linux-x64/mattermost-desktop >/dev/null 2>&1; then
    echo "mattermost-desktop is already installed. Skipping installation."
else
    echo "Installing mattermost-desktop..."
    if ! (
        cd /home/rain/Documents &&
        wget https://github.com/rainpvtdev/linux-setup/releases/download/Files/mattermost-desktop-5.6.0-linux-x64.tar &&
        tar -xf mattermost-desktop-5.6.0-linux-x64.tar && echo -e "[Desktop Entry]\nType=Application\nVersion=1.0\nName=mattermost-desktop\nComment=mattermost-desktop startup script\nExec=/home/rain/Documents/mattermost-desktop-5.6.0-linux-x64/mattermost-desktop\nStartupNotify=false\nTerminal=false" > ~/.config/autostart/mattermost-desktop.desktop &&
        chmod +x ~/.config/autostart/mattermost-desktop.desktop &&
        cd /home/rain
    ); then
        echo "Failed to install mattermost-desktop."
        failed_installations+=("mattermost-desktop")
    fi
fi

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
        failed_installations+=("GitHub Desktop")
    fi
fi

# ----------------------------------------
# Install MongoDB Compass
# ----------------------------------------
echo "Checking for MongoDB Compass..."
if command -v mongodb-compass >/dev/null 2>&1; then
    echo "MongoDB Compass is already installed. Skipping installation."
else
    echo "Installing MongoDB Compass..."
    if ! (
        COMPASS_URL=https://downloads.mongodb.com/compass/mongodb-compass_1.44.3_amd64.deb &&
        wget ${COMPASS_URL} &&
        COMPASS_DEB=mongodb-compass_1.44.3_amd64.deb &&
        sudo apt install -y ./${COMPASS_DEB} &&
        apt-get install -f && 
        rm ${COMPASS_DEB}
    ); then
        echo "Failed to install MongoDB Compass."
        failed_installations+=("MongoDB Compass")
    fi
fi

# ----------------------------------------
# Install XAMPP
# ----------------------------------------
echo "Checking for XAMPP..."
if [ -d "/opt/lampp" ]; then
    echo "XAMPP is already installed. Skipping installation."
else
    echo "Installing XAMPP..."
    if ! (
        XAMPP_VERSION="7.3.33-0" &&
        wget https://github.com/rainpvtdev/linux-setup/releases/download/Files/xampp-linux-x64-${XAMPP_VERSION}-installer.run &&
        chmod +x xampp-linux-x64-${XAMPP_VERSION}-installer.run &&
        sudo ./xampp-linux-x64-${XAMPP_VERSION}-installer.run && # --mode unattended &&
        rm xampp-linux-x64-${XAMPP_VERSION}-installer.run
    ); then
        echo "Failed to install XAMPP."
        failed_installations+=("XAMPP")
    fi
fi

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
        failed_installations+=("Meld")
    fi
fi

sudo apt -y update && sudo apt -y upgrade

# ----------------------------------------
# Verify installations
# ----------------------------------------
echo "Verifying installations..."

echo "nvm version:"
if command -v nvm >/dev/null 2>&1 || [ -d "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    nvm --version
else
    echo "nvm is not installed."
    failed_installations+=("Node Version Manager (nvm)")
fi

echo "Node.js version:"
if command -v node >/dev/null 2>&1; then
    node --version
else
    echo "Node.js is not installed."
    failed_installations+=("Node.js")
fi

echo "Visual Studio Code version:"
if command -v code >/dev/null 2>&1; then
    code --version
else
    echo "Visual Studio Code is not installed."
    failed_installations+=("Visual Studio Code")
fi

echo "Sublime Text version:"
if command -v subl >/dev/null 2>&1; then
    subl --version
else
    echo "Sublime Text is not installed."
    failed_installations+=("Sublime Text")
fi

echo "Google Chrome version:"
if command -v google-chrome >/dev/null 2>&1; then
    google-chrome --version
else
    echo "Google Chrome is not installed."
    failed_installations+=("Google Chrome")
fi


echo "Mattermost Desktop version:"
if command -v /home/rain/Documents/mattermost-desktop-5.6.0-linux-x64/mattermost-desktop >/dev/null 2>&1; then
    /home/rain/Documents/mattermost-desktop-5.6.0-linux-x64/mattermost-desktop --version
else
    echo "mattermost-desktop is not installed."
    failed_installations+=("mattermost-desktop")
fi

echo "GitHub Desktop version:"
if command -v github-desktop >/dev/null 2>&1; then
    github-desktop --version
else
    echo "GitHub Desktop is not installed."
    failed_installations+=("GitHub Desktop")
fi

echo "MongoDB Compass version:"
if command -v mongodb-compass >/dev/null 2>&1; then
    mongodb-compass --version
else
    echo "MongoDB Compass is not installed."
    failed_installations+=("MongoDB Compass")
fi

echo "XAMPP installation directory:"
if [ -d "/opt/lampp" ]; then
    echo "XAMPP is installed in /opt/lampp"
else
    echo "XAMPP is not installed."
    failed_installations+=("XAMPP")
fi

echo "Meld version:"
if command -v meld >/dev/null 2>&1; then
    meld --version
else
    echo "Meld is not installed."
    failed_installations+=("Meld")
fi

# ----------------------------------------
# Report failed installations
# ----------------------------------------
if [ ${#failed_installations[@]} -ne 0 ]; then
    echo -e "\nThe following installations failed or are missing:"
    for item in "${failed_installations[@]}"; do
        echo "- $item"
    done
else
    echo -e "\nAll installations completed successfully."
fi
