#!/bin/bash

# Run container
docker run -it --rm -v /:/host/Macintosh_HD -e USER=$(whoami)  youtube_dl_enhanced "$@"
