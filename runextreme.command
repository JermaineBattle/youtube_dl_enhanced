#!/bin/bash


# brew install colima
# colima start
# brew install docker
# echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
# source ~/.bashrc
# brew link docker

# # Install Docker
# # brew install --cask docker
# # ./docker_install.sh "$@"

# # Start Docker
# open -a Docker
# sudo chown $USER:staff /var/run/docker.sock
# sudo chmod 660 /var/run/docker.sock

# # Ensure Docker is installed and available
# docker build -t youtube_dl_extreme .  # Build the Docker image

# Run the container with arguments
docker run -it --rm youtube_dl_extreme "$@"