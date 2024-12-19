#!/bin/bash

# Run container
docker run -it --rm \
  -v /:/host/Macintosh_HD \  # Mount entire file system
  -v ~/Desktop/YT_Downloads:/app/Desktop/YT_Downloads \  # Mount Desktop folder
   youtube_dl_enhanced "$@"
