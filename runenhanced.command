#!/bin/bash

# Run container
docker run -it --rm -v /:/host/Macintosh_HD youtube_dl_enhanced "$@"
