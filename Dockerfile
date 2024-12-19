# Use the official Python image as the base
FROM python:3.9-slim

# Set working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy application files to the container
COPY . .

# Install dependencies
RUN python -m venv .env && \
    .env/bin/pip install --upgrade pip && \
    .env/bin/pip install --no-cache-dir youtube-dl yt-dlp && \
    .env/bin/pip install --no-cache-dir -r requirements.txt

# Make the script executable
RUN chmod +x youtube_dl_enhanced.py

# Default command to run your application
ENTRYPOINT ["./youtube_dl_enhanced.py"]