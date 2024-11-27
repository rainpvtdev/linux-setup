
# ----------------------------------------
# Install Mongodb
# ----------------------------------------
echo "Checking for Mongodb..."
if command -v mongod >/dev/null 2>&1; then
    echo "Mongodb is already installed. Skipping installation."
else
    echo "Installing Mongod..."
    if ! (
        curl -fsSL https://pgp.mongodb.com/server-7.0.asc | sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor &&
        echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list &&
        sudo apt -y update && sudo apt install -y mongodb-org && sudo systemctl daemon-reload && sudo systemctl enable mongod && sudo systemctl restart mongod
    ) then
        echo "Failed to install mongod."
    fi
fi