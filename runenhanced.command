#!/bin/bash

# Run container
docker run -it --rm \
    -v /:/host/Macintosh_HD \  # Mount entire file system
    youtube_dl_enhanced "$@"
