#!/bin/bash

# Pull latest git
echo Pulling latest version of youtube_dl_enhanced...
git stash
git pull origin main

# Run container
docker run -it --rm youtube_dl_enhanced "$@"