#!/usr/bin/env bash
# exit on error
set -o errexit

poetry install
poetry lock

pip install requirements.txt
python manage.py collectstatic --no-input
python manage.py migrate

daphne -b 0.0.0.0 -p 8001 barisca.asgi:application