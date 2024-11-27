
# ----------------------------------------
# Install Postman
# ----------------------------------------
echo "Checking for Postman..."
if command -v postman >/dev/null 2>&1; then
    echo "Postman is already installed. Skipping installation."
else
    echo "Installing Postman..."
    if ! snap install -v postman; then
        echo "Failed to install Postman."
    fi
fi