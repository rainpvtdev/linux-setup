
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
    fi
fi
