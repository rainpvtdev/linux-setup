
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
    fi
fi