#!/usr/bin/env bash

# Download Tailwind CLI for Linux (Render runs Linux)
curl -o tailwindcss -L https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-x64
chmod +x tailwindcss

# Build Tailwind CSS
./tailwindcss -i ./mysite/static/src/input.css -o ./static/css/style.css

# Install dependencies
pip install -r requirements.txt

# Run migrations
python manage.py migrate

# Collect static files
python manage.py collectstatic --noinput

# Create superuser (only if it doesn't exist)
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.filter(username='admin').exists() or User.objects.create_superuser('admin', 'admin@example.com', 'adminpass')" | python manage.py shell
