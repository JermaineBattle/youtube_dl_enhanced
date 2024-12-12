#!/bin/bash

# Define variables
DOCKER_DMG_URL="https://desktop.docker.com/mac/main/amd64/Docker.dmg"
DOCKER_DMG_NAME="Docker.dmg"
DOCKER_VOLUME="/Volumes/Docker"
DOCKER_APP_PATH="/Applications/Docker.app"
DOCKER_SETTINGS_DIR="$HOME/Library/Group Containers/group.com.docker"
DOCKER_SETTINGS_FILE="$DOCKER_SETTINGS_DIR/settings.json"

# Step 1: Download Docker Desktop
echo "Downloading Docker Desktop..."
curl -o "$DOCKER_DMG_NAME" "$DOCKER_DMG_URL"

# Step 2: Mount the DMG
echo "Mounting Docker DMG..."
hdiutil attach "$DOCKER_DMG_NAME" -quiet

# Step 3: Copy Docker to Applications
echo "Installing Docker Desktop..."
sudo cp -R "$DOCKER_VOLUME/Docker.app" "$DOCKER_APP_PATH"

# Step 4: Unmount the DMG
echo "Unmounting Docker DMG..."
hdiutil detach "$DOCKER_VOLUME" -quiet

# Step 5: Accept the EULA
echo "Accepting Docker EULA..."
mkdir -p "$DOCKER_SETTINGS_DIR"
echo '{"EulaAccepted": true}' > "$DOCKER_SETTINGS_FILE"

# Step 6: Launch Docker Desktop
echo "Launching Docker Desktop..."
open "$DOCKER_APP_PATH"

# Step 7: Wait for Docker to Start
echo "Waiting for Docker to start..."
while ! docker system info > /dev/null 2>&1; do
    sleep 5
    echo "Docker is still starting..."
done

echo "Docker Desktop is now running."

# Step 8: Cleanup
echo "Cleaning up installation files..."
rm -f "$DOCKER_DMG_NAME"

echo "Docker Desktop installation completed successfully!"
