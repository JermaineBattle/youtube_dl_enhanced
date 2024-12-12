# Use the official Python image as the base
FROM python:3.9-slim

# Set working directory in the container
WORKDIR /app

# Copy application files to the container
COPY . .

# Prepare Virtual ENV
RUN python -m venv .env && \
    . .env/bin/activate && \
    pip install --no-cache-dir -r requirements.txt

# Make the script executable
RUN chmod +x youtube_dl_extreme.py

# Default command to run your application
ENTRYPOINT ["./youtube_dl_extreme.py"]