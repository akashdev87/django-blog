#!/usr/bin/env bash

# Download Tailwind CLI
curl -o tailwindcss -L https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-x64
chmod +x tailwindcss

# Build Tailwind CSS
./tailwindcss -i ./mysite/static/src/input.css -o ./static/css/style.css

# Install Python dependencies
pip install -r requirements.txt

# Apply Django migrations (important!)
python manage.py migrate

# Optional: collect static files for production
python manage.py collectstatic --noinput

# Create superuser (ONLY if it doesn't exist)
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.filter(username='admin').exists() or User.objects.create_superuser('admin', 'admin@example.com', 'adminpass')" | python manage.py shell
    