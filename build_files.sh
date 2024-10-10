#!/bin/bash

echo "Activating virtual environment..."
if [ -f /vercel/path0/django_venv/bin/activate ]; then
  source /vercel/path0/django_venv/bin/activate
else
  echo "Virtual environment not found"
  exit 1
fi

echo "Installing dependencies..."
pip install -r requirements.txt || { echo "pip install failed"; exit 1; }

echo "Collecting static files..."
python3.9 manage.py collectstatic --noinput || { echo "collectstatic failed"; exit 1; }

echo "Build script completed successfully."
