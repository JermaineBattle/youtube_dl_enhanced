#!/bin/bash

# Download/Unpack ffmpeg/ffprobe
wget -O .env/bin/ffmpeg.7z https://evermeet.cx/ffmpeg/ffmpeg-118022-gca889b1328.7z
7z x .env/bin/ffmpeg.7z -o.env/bin/
wget -O .env/bin/ffprobe.7z https://evermeet.cx/ffmpeg/ffprobe-118022-gca889b1328.7z
7z x .env/bin/ffprobe.7z -o.env/bin/

# Remove zips
rm .env/bin/ffmpeg.7z
rm .env/bin/ffprobe.7z