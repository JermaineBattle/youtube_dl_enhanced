#!/bin/bash

# Path to the Docker configuration file
DOCKER_CONFIG="$HOME/.docker/config.json"

# Plugin directory path
PLUGIN_DIR="/opt/homebrew/lib/docker/cli-plugins"

# Ensure the Docker config directory exists
mkdir -p "$(dirname "$DOCKER_CONFIG")"

# Check if the config file exists
if [[ ! -f "$DOCKER_CONFIG" ]]; then
    # Create a new config file with the cliPluginsExtraDirs section
    echo "Creating Docker config.json with cliPluginsExtraDirs..."
    cat <<EOF > "$DOCKER_CONFIG"
{
    "cliPluginsExtraDirs": [
        "$PLUGIN_DIR"
    ]
}
EOF
else
    # Check if cliPluginsExtraDirs already exists in the config
    if grep -q '"cliPluginsExtraDirs"' "$DOCKER_CONFIG"; then
        echo "cliPluginsExtraDirs already exists in config.json. No changes made."
    else
        # Add cliPluginsExtraDirs to the existing config
        echo "Adding cliPluginsExtraDirs to existing config.json..."
        jq '. + {"cliPluginsExtraDirs": ["'"$PLUGIN_DIR"'"]}' "$DOCKER_CONFIG" > "$DOCKER_CONFIG.tmp" && mv "$DOCKER_CONFIG.tmp" "$DOCKER_CONFIG"
    fi
fi

# Display the updated config.json
echo "Updated Docker config.json:"
cat "$DOCKER_CONFIG"

export DOCKER_BUILDKIT=1
echo 'export DOCKER_BUILDKIT=1' >> ~/.zshrc
source ~/.zshrc
