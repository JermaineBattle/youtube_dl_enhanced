#!/bin/bash

# Pull latest git
echo Pulling latest version of youtube_dl_enhanced...
git stash
git pull origin main

# Run container
docker run -it --rm -v ~/Desktop/YT_Downloads:/app/Desktop youtube_dl_enhanced "$@"
