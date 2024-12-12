#!/bin/bash

# Download/Unpack ffmpeg/ffprobe
wget -O .env/ffmpeg.7z https://evermeet.cx/ffmpeg/ffmpeg-118022-gca889b1328.7z
7z x .env/ffmpeg.7z -o.env/bin/
wget -O .env/ffprobe.7z https://evermeet.cx/ffmpeg/ffprobe-118022-gca889b1328.7z
7z x .env/ffprobe.7z -o.env/bin/

# Remove zips
rm .env/ffmpeg.7z
rm .env/ffprobe.7z