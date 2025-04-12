#!/usr/bin/env bash

# Download Tailwind CLI for Linux (Render runs Linux)
curl -o tailwindcss -L https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-x64
chmod +x tailwindcss

# Build Tailwind CSS
./tailwindcss -i ./mysite/static/src/input.css -o ./static/css/style.css

# Collect Django static files
python manage.py collectstatic --noinput
