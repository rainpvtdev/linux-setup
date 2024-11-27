

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
    fi
fi