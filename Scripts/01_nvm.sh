
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
        fi
    fi
fi