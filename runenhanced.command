#!/bin/bash

# Run container
docker run -it --rm -v ~/Desktop:/app/Desktop youtube_dl_enhanced "$@"
