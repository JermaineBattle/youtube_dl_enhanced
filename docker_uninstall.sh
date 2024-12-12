# Stop Colima
colima stop

# Uninstall Colima
brew uninstall colima

# Remove configs
rm -rf ~/.colima

# Stop Docker
pkill Docker

# Uninstall Docker
brew uninstall docker

# Uninstall Docker Desktop (safety net)
brew uninstall --cask docker

# Unlink Docker 
brew unlink docker

# Uninstall buildx
brew uninstall docker-buildx

# Remove Docker binaries and related files
rm -rf /usr/local/bin/docker*
rm -rf ~/.docker
rm -rf /var/run/docker.sock

# Remove PATH modifications from .bashrc
sed -i '' '/export PATH=\$PATH:\/usr\/local\/bin/d' ~/.bashrc
source ~/.bashrc

# Verify
docker --version || echo "Docker CLI uninstalled successfully."
colima status || echo "Colima uninstalled successfully."
ps aux | grep -i docker || echo "No Docker processes running."
