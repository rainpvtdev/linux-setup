#!/bin/bash

failed_installations=()

echo "Updating system..."
if ! sudo apt update && sudo apt upgrade -y; then
    echo "Failed to update system."
    failed_installations+=("System Update")
fi

echo "Installing common dependencies..."
if ! sudo apt install -y wget curl gnupg gnupg2 ca-certificates lsb-release apt-transport-https software-properties-common git libgconf-2-4 libxss1 libnss3; then
    echo "Failed to install common dependencies."
    failed_installations+=("Common Dependencies")
fi

./script/01_nvm.sh
./script/02_vs_code.sh
./script/03_sublime_text.sh
./script/04_chrome.sh
./script/05_supertrack.sh
./script/06_mattermost.sh
./script/07_github_desktop.sh
./script/08_mongodb_compass.sh
./script/09_xamp.sh
./script/10_meld.sh
./script/11_postman.sh
./script/12_mongodb.sh

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

echo "Mongodb version:"
if command -v mongod >/dev/null 2>&1; then
    mongod --version
else
    echo "Mongodb is not installed."
    failed_installations+=("Mongodb")
fi

echo "Postman version:"
if command -v postman >/dev/null 2>&1; then
else
    echo "Postman is not installed."
    failed_installations+=("Postman")
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
